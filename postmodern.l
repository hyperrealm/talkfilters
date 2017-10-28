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
Postmodern feminazi talk
Postmodern "feminazi" type talk suitable for writing college papers for 
various humanities type classes
*/

%option prefix="postmodern_yy"
%option outfile="lex.yy.c"
%option noyywrap

%a 3000
%e 3000
%p 5000
%n 3000

%{

#include "common.h"
#include "talkfilters.h"

#define YY_DECL int yylex(gtf_databuf_t *buf)

%}

WB      [\n\t ]
WC	[A-Za-z'0-9]
NW	[^A-Za-z'0-9]
EOT	\4

%%

\<(\/)?[A-Za-z][^\>]*\>      gtf_echo(); /* don't damage HTML tags */

[Ww]e/{NW}	 gtf_puts_case("the dysfunctional group");
[Tt]hing/{NW}	 gtf_puts_case("phallic-symbol-like weapon");
[Hh]elp/{NW}	 gtf_puts_case("assault");
[Ss]ex/{NW}	 gtf_puts_case("rape");
[Ll]ove/{NW}	 gtf_puts_case("male domination");
[Mm]an/{NW}	 gtf_puts_case("the occuppying patriarch");
[Ii]t/{NW}	 gtf_puts_case("the semiotic object");
[Hh]im/{NW}	 gtf_puts_case("Foucault");
[Hh]er/{NW}	 gtf_puts_case("her postfeminist");
[Tt]hat/{NW}	 gtf_puts_case("that deconstructed");
[Nn]ew/{NW}	 gtf_puts_case("postmodern");
[Ss]elf/{NW}	 gtf_puts_case("inner child");
[Ii]n/{NW}	 gtf_puts_case("in the penetrated space of");
[Bb]lack/{NW}	 gtf_puts_case("postcolonialist");
[Ii]s/{NW}	 gtf_puts_case("is semiotically");
[Ww]as/{NW}	 gtf_puts_case("was semiotically");
[Ww]hite/{NW}	 gtf_puts_case("fascist ruling class");
[Aa]lways/{NW}	 gtf_puts_case("always control");
[Tt]hin/{NW}	 gtf_puts_case("think genderization");
[Nn]ever/{NW}	 gtf_puts_case("never empower");
[Ss]mall/{NW}	 gtf_puts_case("male-superior doctrine");
[Ll]arge/{NW}	 gtf_puts_case("nymphomanial");
[Gg]ood/{NW}	 gtf_puts_case("subliminated homosexuality type");
[Bb]ad/{NW}	 gtf_puts_case("absolutist");
[Ff]ree/{NW}	 gtf_puts_case("synergism");
[Gg]et/{NW}	 gtf_puts_case("acquire intersubjectivity");
[Ee]ven/{NW}	 gtf_puts_case("even Jean-Paul Sartre and");
[Ff]or/{NW}	 gtf_puts_case("for reevalution of Manichaeanism and");
[Ss]he/{NW}	 gtf_puts_case("Susan Faludi");
[Hh]e/{NW}	 gtf_puts_case("Ted Kennedy");
[Cc]ame/{NW}	 gtf_puts_case("subjugated");
[Ff]emale/{NW}	 gtf_puts_case("lesbian");
[Mm]ale/{NW}	 gtf_puts_case("paternalistic mutilator");
[Mm]oney/{NW}	 gtf_puts_case("power");
[Pp]ower/{NW}	 gtf_puts_case("mimetic process");
[Dd]aughter/{NW} gtf_puts_case("donna clitoridea");
[Ss]on/{NW}	 gtf_puts_case("chauvinistic male");
[Mm]y/{NW}	 gtf_puts_case("the objective");
[Ff]orm/{NW}	 gtf_puts_case("implicit lyrical form");
[Ss]tory/{NW}	 gtf_puts_case("mythos");
[Aa]pproach/{NW} gtf_puts_case("seduction-rape");
[Aa]sk/{NW}	 gtf_puts_case("empower");
[Hh]appy/{NW}	 gtf_puts_case("polarized");
[Ww]ords/{NW}	 gtf_puts_case("logos");
[Ww]ord/{NW}	 gtf_puts_case("logo");
[Oo]ld/{NW}	 gtf_puts_case("counter poetical");
[Mm]ade/{NW}	 gtf_puts_case("self-defined");
[Bb]elief/{NW}	 gtf_puts_case("penis envy");
[Ii]dea/{NW}	 gtf_puts_case("motif");
[Tt]hought/{NW}	 gtf_puts_case("formalised image of");

.                gtf_echo();
\n               gtf_echo();
{EOT}		 /* ignore trailing EOT character */

%%

#ifdef LIBRARY_MODE

int gtf_filter_postmodern(const char *input, char *buf, size_t bufsz)
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

int __gtf_filter_postmodern(const char *input, char *buf, size_t bufsz)
{
  return(gtf_filter_postmodern(input, buf, bufsz));
}

#else /* LIBRARY_MODE */

int main(int argc, char **argv)
  {
  gtf_parse_args();

  yylex(NULL);

  return(EXIT_SUCCESS);
  }

#endif /* LIBRARY_MODE */

/* end of source file */
