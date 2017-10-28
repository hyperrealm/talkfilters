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

/* static char version[] = "funetak. v1.2. Eclipse Enterprises"; */

%option prefix="funetak_yy"
%option outfile="lex.yy.c"
%option noyywrap

%e 2000
%p 6000
%n 1000
%k 500
%a 4000
%o 2000

%{

#include "common.h"
#include "talkfilters.h"

#define YY_DECL int yylex(gtf_databuf_t *buf)

%}

WB      [\n\t ]
WC	[A-Za-z'0-9]
NW	[^A-Za-z'0-9]
EOT	\4

%s NIW INW

%%

<NIW,INITIAL>{

\<(\/)?[A-Za-z][^\>]*\>      gtf_echo(); /* don't damage HTML tags */

[Aa]nybody/{NW}		gtf_puts_case("uni boodi");
[Aa]re/{NW}		gtf_puts_case("ure");
[Aa]sshole/{NW}		gtf_puts_case("uss hool");
[Aa]t/{NW}		gtf_puts_case("et");
[Bb]y/{NW}		gtf_puts_case("bi");
[Cc]ould/{NW}		gtf_puts_case("cud");
[Ee]mpty/{NW}		gtf_puts_case("umpti");
[Ee]yes/{NW}		gtf_puts_case("i's");
[Ff]actory/{NW}		gtf_puts_case("fuctawri");
[Ff]ile			gtf_puts_case("fuel"); BEGIN(INW);
[Ff]rom/{NW}		gtf_puts_case("frum");
[Ff]uck			gtf_puts_case("fak"); BEGIN(INW);
[Gg]oing/{NW}		gtf_puts_case("go en");
[Gg]uess/{NW}		gtf_puts_case("gus");
[Hh]eap/{NW}		gtf_puts_case("hup");
[Hh]ere/{NW}		gtf_puts_case("hear");
[Hh]ope/{NW}		gtf_puts_case("hup");
[Ii]'m/{NW}		gtf_puts_case("eye em");
[Ii]f/{NW}		gtf_puts_case("uf");
[Jj]unk/{NW}		gtf_puts_case("joonk");
[Jj]ust/{NW}		gtf_puts_case("juzst");
[Nn]ut/{NW}		gtf_puts_case("noot");
[Oo]ut			gtf_puts_case("ut"); BEGIN(INW);
[Pp]ocket/{NW}		gtf_puts_case("puket");
[Rr]ide/{NW}		gtf_puts_case("wide");
[Rr]un			gtf_puts_case("wun"); BEGIN(INW);
[Ss]aw/{NW}		gtf_puts_case("sor");
[Ss]ay			gtf_puts_case("sa"); BEGIN(INW);
[Ss]elling/{NW}		gtf_puts_case("sulen");
[Ss]hit/{NW}		gtf_puts_case("shiet");
[Ss]hould		{ if(gtf_random(4))
			    gtf_puts_case("sud");
			  else
			    gtf_puts_case("shud");
			  BEGIN(INW);
			}
[Ss]traight		gtf_puts_case("stwait"); BEGIN(INW);
[Ss]unset/{NW}		gtf_puts_case("soon sut");
[Tt]hough/{NW}		gtf_puts_case("tho");
[Tt]rans		gtf_puts_case("twains"); BEGIN(INW);
[Tt]wo/{NW}		gtf_puts_case("to");
[Uu]p			gtf_puts_case("oop"); BEGIN(INW);
[Wh]ich			gtf_puts_case("wutch"); BEGIN(INW);
[Ww]ould		gtf_puts_case("wud"); BEGIN(INW);
[Yy]our			gtf_puts_case("ur"); BEGIN(INW);
[Ii]/{NW}		gtf_puts_case("em");
[Aa]/{NW}		gtf_puts_case("ar");
[Aa]bout/{NW}		gtf_puts_case("abut");
[Aa]ll/{NW}		gtf_puts_case("awl");
[Aa]l(l)?right/{NW}	gtf_puts_case("awl wight");
[Aa]m/{NW}		gtf_puts_case("um");
[Aa]nd/{NW}		gtf_puts_case("en");
[Aa]ren't/{NW}		gtf_puts_case("r ent");
[Aa]void/{NW}		gtf_puts_case("av void");
[Bb]e/{NW}		gtf_puts_case("b");
[Bb]oy			gtf_puts_case("boi"); BEGIN(INW);
[Bb]rackets/{NW}	gtf_puts_case("bruketz");
[Bb]ut			gtf_puts_case("bot"); BEGIN(INW);
[Cc]an/{NW}		gtf_puts_case("kun");
[Cc]an't{NW}		{ if(gtf_random(4))
			    gtf_puts_case("car ent");
			  else
			    gtf_puts_case("kunt");
			}
[Cc]onver		gtf_puts_case("cunvur"); BEGIN(INW);
[Cc]ool/{NW}		gtf_puts_case("kewl");
[Cc]os			gtf_puts_case("cuz"); BEGIN(INW);
[Dd]ay			gtf_puts_case("di"); BEGIN(INW);
[Dd]id			gtf_puts_case("ded"); BEGIN(INW);
[Dd]o			gtf_puts_case("dew"); BEGIN(INW);
[Dd]oes			{ if (gtf_random(3)) gtf_puts_case("dus");
			  else gtf_puts_case("duz");
			  BEGIN(INW); }
[Dd]ude/{NW}		gtf_puts_case("do ed");
[Ee]nglish/{NW}		gtf_puts_case("unglush");
[Ff]ilter/{NW}		gtf_puts_case("felt her");
[Ff]irst/{NW}		gtf_puts_case("fuzt");
[Ff]ixed/{NW}		gtf_puts_case("fuckzed");
[Ff]ools/{NW}		gtf_puts_case("fulz");
[Ff]or  |
[Ff]our			gtf_puts_case("vor"); BEGIN(INW);
[Gg]etting/{NW}		gtf_puts_case("gut en");
[Gg]et			gtf_puts_case("gut"); BEGIN(INW);
[Gg]onna/{NW}		{ if(gtf_random(2))
			    gtf_puts_case("gun nar");
			  else
			    gtf_puts_case("gunna");
			}
[Gg]ood			gtf_puts_case("gud"); BEGIN(INW);
[Hh]as			gtf_puts_case("huz"); BEGIN(INW);
[Hh]mm/{NW}		gtf_puts_case("humm");
[Hh]ow			gtf_puts_case("huw"); BEGIN(INW);
[Hh]undred/{NW}		gtf_puts_case("hundrud");
[Ii]n			gtf_puts_case("un"); BEGIN(INW);
[Ii]s			{ if(gtf_random(5))
			    gtf_puts_case("ez");
			  else
			    gtf_puts_case("uz");
			  BEGIN(INW);
			}
[Ii]t/{NW}		{ if(gtf_random(5))
			    gtf_puts_case("et");
			  else
			    gtf_puts_case("ut");
			}
[Ii]ts/{NW}		gtf_puts_case("etz");
[Ll]ame/{NW}		{ if(gtf_random(7))
			    gtf_puts_case("lye em");
			  else
			    gtf_puts_case("lyem");
			}
[Ll]ibrary/{NW}		gtf_puts_case("wibwari");
[Ll]ots/{NW}		gtf_puts_case("wuntz");
[Mm]ake			gtf_puts_case("muk"); BEGIN(INW);
[Mm]e/{NW}		gtf_puts_case("mi");
[Mm]ore/{NW}		gtf_puts_case("mur");
[Mm]uch/{NW}		gtf_puts_case("mutch");
[Mm]y/{NW}		gtf_puts_case("mi");
[Nn]eed			gtf_puts_case("nud"); BEGIN(INW);
[Nn]one			gtf_puts_case("noon"); BEGIN(INW);
[Nn]ot			gtf_puts_case("nut"); BEGIN(INW);
[Nn]umerics		gtf_puts_case("numerekz");
[Oo]f			gtf_puts_case("uf"); BEGIN(INW);
[Oo]ne/{NW}		gtf_puts_case("wun");
[Oo]nly/{NW}		gtf_puts_case("own we");
[Oo]ther		gtf_puts_case("udder"); BEGIN(INW);
[Pp]eople/{NW}		gtf_puts_case("poopel");
[Pp]eoples/{NW}		gtf_puts_case("poopelz");
[Pp]roblem		gtf_puts_case("prublim"); BEGIN(INW);
[Rr]ead			gtf_puts_case("wed"); BEGIN(INW);
[Rr]ule/{NW}		gtf_puts_case("wul");
[Ss]o/{NW}		gtf_puts_case("zo");
[Ss]ort/{NW}		gtf_puts_case("surt");
[Ss]orting/{NW}		gtf_puts_case("surten");
[Tt]alk			gtf_puts_case("tak"); BEGIN(INW);
[Tt]hat/{NW}		{ if(gtf_random(4))
			    gtf_puts_case("dat");
			  else
			    gtf_puts_case("dut");
			}
[Tt]he/{NW}		gtf_puts_case("da");
[Tt]here		gtf_puts_case("der"); BEGIN(INW);
[Tt]hink		gtf_puts_case("tunk"); BEGIN(INW);
[Tt]his/{NW}		{ if(gtf_random(2) == 0)
			    gtf_puts_case("des");
			  else if(gtf_random(3) == 0)
			    gtf_puts_case("dis");
			  else if(gtf_random(3) == 0)
			    gtf_puts_case("dus");
			  else gtf_puts_case("duz");
			}
[Tt]ime			gtf_puts_case("tym"); BEGIN(INW);
[Tt]o			gtf_puts_case("two"); BEGIN(INW);
[Tt]oday/{NW}		gtf_puts_case("tow di");
[Tt]otally/{NW}		gtf_puts_case("toate awli");
[Tt]raffic/{NW}		gtf_puts_case("twufak");
[Tt]ranslator/{NW}	gtf_puts_case("twunz waiter");
[Tt]wenty/{NW}		gtf_puts_case("twunti");
[Tt]imes/{NW}		gtf_puts_case("tymz");
[Ww]asn't/{NW}		gtf_puts_case("wuz ent");
[Ww]hat			gtf_puts_case("wut"); BEGIN(INW);
[Ww]ill			gtf_puts_case("wul"); BEGIN(INW);
[Ww]ith			gtf_puts_case("wif"); BEGIN(INW);
[Ww]ord/{NW}		gtf_puts_case("wud");
[Ww]ords/{NW}		gtf_puts_case("wudz");
[Ww]rite/{NW}		gtf_puts_case("wyt");
[Yy]ou/{NW}		gtf_puts_case("ewe");
[Zz]appy/{NW}		gtf_puts_case("zipi");

{WC}			{ BEGIN(INW); gtf_echo(); }

}

<INW>{

i/{NW}			gtf_puts_case("eye"); BEGIN(NIW);
[Pp]hone/{NW}		gtf_puts_case("fune"); BEGIN(NIW);

}

{EOT}			/* ignore trailing EOT character */
.			gtf_echo();
\n			gtf_echo();

%%

/*
 */

#ifdef LIBRARY_MODE

int gtf_filter_funetak(const char *input, char *buf, size_t bufsz)
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

int __gtf_filter_funetak(const char *input, char *buf, size_t bufsz)
{
  return(gtf_filter_funetak(input, buf, bufsz));
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
