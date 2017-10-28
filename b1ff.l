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
 
For the information of some:
 
B1FF is a fictitious person who is "new" on the 'net.
 
You can recognize his posts by:
 
  He always SHOUTS as he types.
 
  He sometimes spells FONET1KLEE (phonetically) the rest of the time, he  
    just misspells words or punctuates them incorrectly.
 
  He shortens some words (presumably for ease in typing)
   like '4' for 'for' or 'four'
   like '2' for 'two' or 'to' or 'too'
   like '&' for 'and'
   like 'U' for 'you' or 'ewe'
   like 'R' for 'are'
   like 'C' for 'sea' or 'see'
  
He can't see the difference between certain letters
       like '1' and 'i'
    or like '0' and 'o'
    or like '5' and 's'
    or like '2' and 'z'
 
  His speech is peppered with profanity.
 
  He never uses only one '!' or '?' when '!!!!!!!!' or '????!!!!' will do.
 
  He never uses the apostrophe (') and always uses the double quote (")
     instead.
 
  I have some vague memory of B1FF being mentioned in the New Hackers
dictionary, but I can't verify the validity of this.
 
  I can't even validate that his full name is NELSON 0TB1FF , but it sounds
correct.

Here's the promised and long-awaited 'b1ff.x' English->B1FF converter
that everyone's been clamoring for. I made a few small changes since the
last version and made sure that it compiled correctly.
 
To compile this, save it to the file 'b1ff.x' and execute the following
two commands:
	lex b1ff.x
	cc -o B1ff lex.yy.c -ll
 
Note that the flags on cc should be in that order. You'll end up with the
executable 'B1ff' (if you call it 'biff' with a lowercase 'b' you'll
conflict with the biff mail-checking program). 
 
Send me any bugs or patches; I'm good friends with B1FF and since this is 
the first program he's ever posted to the net, he wants to know if you
have any problems. 
 
mdw

 
B1FF.X by Matt Welsh (mdw@tc.cornell.edu) +1 607 253 2737
modified and improved by David Whitten 

*/

%option prefix="b1ff_yy"
%option outfile="lex.yy.c"
%option noyywrap

%e 3000
%p 6000
%n 1000
%k 500
%a 4000
%o 15000

%{

#include "common.h"
#include "talkfilters.h"

#define YY_DECL int yylex(gtf_databuf_t *buf)

%}

BW   [ \t]
EW   [ \t.,;!?]
WC   [A-Za-z']
NW   [^A-Za-z']
EOT  \4
 
%s INW NIW
 
%%

\<(\/)?[A-Za-z][^\>]*\>      gtf_echo(); /* don't damage HTML tags */

\\[^ \n]+	  gtf_echo(); 
{NW}		  BEGIN NIW; gtf_echo();
"..."             { BEGIN NIW; gtf_printf(gtf_random(2) ? "...C00L HUH!?! "
		    : "...!! "); }
"."/{NW}	  BEGIN NIW; gtf_printf(gtf_random(2) ? "." : "!!" );
".\""             BEGIN NIW; gtf_printf(gtf_random(2) ? "!!!\"" : "!1!!\"" );
"!"$              BEGIN NIW; gtf_printf("!!!!!!!!!!1");
"!"+/{NW}         BEGIN NIW; gtf_printf("!1!");
"?"/{NW}          BEGIN NIW; gtf_printf("\?\?!!");
":)"              BEGIN NIW; gtf_printf(";-)!!! ");
"8)"              BEGIN NIW; gtf_printf(";-)!!! ");
":*)"             BEGIN NIW; gtf_printf(";-)!!!!  ");
":-)"             BEGIN NIW; gtf_printf(";-)!!!!  ");
'		  BEGIN NIW; gtf_printf("\"");

ove               BEGIN INW; gtf_printf("UV ");
move		  BEGIN INW; gtf_printf("MOOV");
ea                BEGIN INW; gtf_printf("EE");
ies		  BEGIN INW; gtf_printf("YS");
please            BEGIN INW; gtf_printf("PLEEZ!");
Please            BEGIN INW; gtf_printf("PLEEZ");
Thanks		  BEGIN INW; gtf_printf("THANX!!");
thanks            BEGIN INW; gtf_printf("THANX");
[Ee]nough         BEGIN INW; gtf_printf("ENUF");
[Dd]oes           BEGIN INW; gtf_printf("DUZ");
[Ff]uck/{NW}      BEGIN INW; gtf_printf("FUCK !!!!!1 ");
<NIW>hell/{NW}    BEGIN INW; gtf_printf("FUCK!! ");
[Dd]amn           BEGIN INW; gtf_printf("FUCK!! ");
[Ss]hit           BEGIN INW; gtf_printf("FUCK!! ");
<NIW>Hell/{NW}    BEGIN INW; gtf_printf("FUCK!! ");
<NIW>dick/{NW}    BEGIN INW; gtf_printf("FUCK!! ");
<NIW>Dick/{NW}    BEGIN INW; gtf_printf("FUCK!! ");
<NIW>mad/{NW}     BEGIN INW; gtf_printf("PISSED 0FF!!!1! ");
<NIW>Mad/{NW}     BEGIN INW; gtf_printf("PISSED 0FF!!!1! ");
ar/{NW}           BEGIN NIW; gtf_printf("RE");
are/{NW}          BEGIN INW; gtf_printf("R");
ain/{NW}          BEGIN NIW; gtf_printf("ANE");
before/{NW}	  BEGIN NIW; gtf_printf("B4");
for(e)?/{NW}	  BEGIN NIW; gtf_printf("4");
four/{NW}	  BEGIN NIW; gtf_printf("FORE ");
se(a|e)/{NW}	  BEGIN NIW; gtf_printf("C ");
to(o)?/{NW}	  BEGIN NIW; gtf_printf("2");
two/{NW}	  BEGIN NIW; gtf_printf("TO ");
one/{NW}	  BEGIN NIW; gtf_printf("1");
<INW>ould/{NW}    BEGIN NIW; gtf_printf("UD ");
ic/{NW}		  BEGIN NIW; gtf_printf("IK");
le/{NW}		  BEGIN NIW; gtf_printf("EL");
by/{NW}		  BEGIN NIW; gtf_printf("BUY");
buy/{NW}	  BEGIN NIW; gtf_printf("BY");
bye/{NW}	  BEGIN NIW; gtf_printf("BY");
e/{NW}		  { BEGIN NIW; gtf_printf(gtf_random(2) ? "E"
		    : (gtf_random(2) ? "E" : "3")); }
ewe|you           BEGIN INW; gtf_printf("U");
your              BEGIN INW; gtf_printf("YOU'RE");
the(y')?re        BEGIN INW; gtf_printf("THARE");
cause             BEGIN INW; gtf_printf("CUZ");
<INW>or           BEGIN INW; gtf_printf(gtf_random(2) ? "OR" : "ER");
and               BEGIN INW; gtf_printf("&");
biff              BEGIN INW; gtf_printf("B1FFSTER!!!!!");
BIFF|Biff         BEGIN INW; gtf_printf("B1FFSTERE!!!1!");
tion              BEGIN INW; gtf_printf("SHUN");
good|cool         BEGIN INW; gtf_printf("C00L!!!");
computer          BEGIN INW; gtf_printf("C-64");
software|program  BEGIN INW; gtf_printf("WAREZ!1!!");
gal|girl|woman	  BEGIN INW; gtf_printf("BAB3");
boy|dude|Mr|Man   BEGIN INW; gtf_printf("D00D");
man/{NW}          BEGIN INW; gtf_printf("D00D");
some              BEGIN INW; gtf_printf("SUM");

ll		  { BEGIN INW; gtf_printf(gtf_random(2) ? "LL"
                    : (gtf_random(2) ? "L" : "LLL")); }
nn                { BEGIN INW; gtf_printf(gtf_random(2) ? "NN"
                    : (gtf_random(2) ? "N" : "NNN")); }
oo                BEGIN INW; gtf_printf(gtf_random(2) ? "00" : "UU");
OO                BEGIN INW; gtf_printf(gtf_random(2) ? "00" : "UU");
ph                BEGIN INW; gtf_printf("F");
Ph                BEGIN INW; gtf_printf("F");

[a-hj-rt-y]	  BEGIN INW; gtf_printf("%c", toupper(*yytext));
i		  BEGIN INW; gtf_printf(gtf_random(2) ? "I" : "1");
I		  BEGIN INW; gtf_printf(gtf_random(2) ? "I" : "1");
s		  BEGIN INW; gtf_printf(gtf_random(2) ? "5" : "S");
S		  BEGIN INW; gtf_printf(gtf_random(2) ? "5" : "S");
z		  BEGIN INW; gtf_printf(gtf_random(2) ? "2" : "Z");

.		  BEGIN INW; gtf_echo();

{EOT}		  /* ignore trailing EOT character */
 
%%

#ifdef LIBRARY_MODE

int gtf_filter_b1ff(const char *input, char *buf, size_t bufsz)
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

int __gtf_filter_b1ff(const char *input, char *buf, size_t bufsz)
{
  return(gtf_filter_b1ff(input, buf, bufsz));
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
