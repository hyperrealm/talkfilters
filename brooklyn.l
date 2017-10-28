/* GNU Talkfilters
   Copyright (C) 1998-2003 Free Software Foundation, Inc.

   This file is part of GNU Talkfilters

   GNU Talkfilters is free software; you can redistribute it and/or
   modify it under the terms of the GNU General Public License as
   published by the Free Software Foundation; either version 2, or (at
   your option) any later version.

   This software is distributed in the hope that it will be amusing, but
   WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this software; see the file COPYING.  If not, write to the
   Free Software Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.
*/

/*
 *	Lex filter to transform plain English into Brooklyn English.
 *	No racial or societal slurs are intended.  For amusement only.
 *
 *	Copyright 1986 by Daniel Klein.
 *
 *	Reproduction permitted so long as this notice is retained.
 */

%option prefix="brooklyn_yy"
%option outfile="lex.yy.c"
%option noyywrap

WB      [\n\t ]
WC	[A-Za-z'0-9]
NW	[^A-Za-z'0-9]
EOT	\4

%s NIW INW

%{

#include "common.h"
#include "talkfilters.h"

#define YY_DECL int yylex(gtf_databuf_t *buf)

static const char *expletives[] = { "Okay?", "Right?", "Yuh got me so fahr?",
				    "Ya' dig?", "Yuh with me?" };
#define EXPLETIVES_LEN (sizeof(expletives) / sizeof(expletives[0]))

%}

%%

<NIW,INITIAL>{

\<(\/)?[A-Za-z][^\>]*\>              gtf_echo(); /* don't damage HTML tags */

[Nn]othing/{NW}			gtf_puts_case("nuttin'");
[Tt]hin				gtf_puts_case("tin"); BEGIN(INW);
[Tt]hir				gtf_puts_case("toi"); BEGIN(INW);
[Tt]he			        gtf_puts_case("de"); BEGIN(INW);
[Tt]hi				gtf_puts_case("di"); BEGIN(INW);
[Tt]hat/{NW}			gtf_puts_case("dat"); BEGIN(INW);
I'm{WB}going{WB}to/{NW}		gtf_puts_case("I'manna");
going{WB}to/{NW}		gtf_puts_case("gonna");
want{WB}to/{NW}			gtf_puts_case("wanna");
[Dd]id{WB}you{WB}/[eaiou]	gtf_puts_case("d'j");
[Dd]id{WB}you/{NW}		gtf_puts_case("d'ja");
[Hh]ow{WB}are{WB}you/{NW}	gtf_puts_case("howahrya");
[Yy]ou/{NW}			gtf_puts_case("yuh");
[Ww]ith				gtf_puts_case("wit'"); BEGIN(INW);
[Dd]on't/{NW}			gtf_puts_case("doan");
[Ss]tupid/{NW}			gtf_puts_case("stoopid");
[Uu]nder			gtf_puts_case("unner"); BEGIN(INW);
[Tt]o/{NW}			gtf_puts_case("tuh");
[Aa]ctual			gtf_puts_case("ackshul"); BEGIN(INW);
[Nn]egro/{NW}			gtf_puts_case("spade");
[Pp]uerto{WB}[Rr]ican/{NW}	gtf_puts_case("spic");
[Ii]talian/{NW}			gtf_puts_case("greaser");
[Jj]ewish/{NW}			gtf_puts_case("jew");
[Jj]ew/{NW}			gtf_puts_case("hebe");
[Ii]sn't/{NW}			gtf_puts_case("ain't");

{WC}			        { BEGIN(INW); gtf_echo(); }

}

<INW>{

[^Mm]mer/[^aeiouhrs]		gtf_puts_case("mmoi"); BEGIN(INW);
er/{NW}				gtf_puts_case("uh"); BEGIN(NIW);
[Ww]ord		|
[Hh]eard	|
[BbGgLlPpSs]urg	|
[CcHh][eu]r[ntv]		{ gtf_printf("%coi%c", yytext[0],
                                  yytext[yyleng-1]); }
[Oo]re/{NW}			gtf_puts_case("awh"); BEGIN(NIW);
[Oo]r				gtf_puts_case("awh");
[Oo]f				gtf_puts_case("uhv");
tion				gtf_puts_case("shun");
alk	|
our[st]	|
or[st]				gtf_printf("awh%c", yytext[yyleng-1]);
ause				gtf_puts_case("awze");
[Oo]ff				gtf_puts_case("awhf");
ing/{NW}			gtf_puts_case("in'"); BEGIN(NIW);
(l)?dn't/{NW}			gtf_puts_case("n't"); BEGIN(NIW);
t{WB}you/{NW}			gtf_puts_case("tcha"); BEGIN(NIW);
[ao]ther			{ gtf_printf("%cdder",
                                  yytext[0] == 'a' ? 'a' : 'u'); }
[a-z]":"			{ *(yytext+1) = ',';
				  gtf_printf("%s like, uhh:", yytext);
				  BEGIN(NIW); }
[a-z]"?"			{ *(yytext+1) = ',';
				  gtf_printf("%s or what?", yytext);
				  BEGIN(NIW); }
!				gtf_puts_case("!  Okay?"); BEGIN(NIW);
[a-z]"."			{ gtf_printf("%s %s", yytext,
				  expletives[gtf_random(EXPLETIVES_LEN)]); }

{NW}				BEGIN(NIW); unput(yytext[0]);

}

{EOT}			/* ignore trailing EOT character */
.			gtf_echo();

%%

/*
 */

#ifdef LIBRARY_MODE

int gtf_filter_brooklyn(const char *input, char *buf, size_t bufsz)
  {
  gtf_databuf_t buffer;
  YY_BUFFER_STATE _yybuf;

  gtf_strbuf_init(&buffer, buf, bufsz);
  _yybuf = yy_scan_string(input);
  yylex(&buffer);
  yy_delete_buffer(_yybuf);
  gtf_reset();

  return(buffer.overflow);
  }

int __gtf_filter_brooklyn(const char *input, char *buf, size_t bufsz)
{
  return(gtf_filter_brooklyn(input, buf, bufsz));
}

#else /* LIBRARY_MODE */

int main(int argc, char **argv)
{
  gtf_parse_args();
  gtf_random_seed();

  yylex(NULL);

  return(EXIT_SUCCESS);
}

#endif /* LIBRARY_MODE */

/* end of source file */
