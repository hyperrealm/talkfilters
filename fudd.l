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

%option prefix="fudd_yy"
%option outfile="lex.yy.c"
%option noyywrap

%e 2000
%p 5000
%n 1000
%k 500
%a 4000
%o 2000

BW [      ]
EW [      .,;!?]
EOT	\4

%{

#include "common.h"
#include "talkfilters.h"

#define YY_DECL int yylex(gtf_databuf_t *buf)

%}

%%

\<(\/)?[A-Za-z][^\>]*\>      gtf_echo(); /* don't damage HTML tags */

"r"         gtf_printf("w");
"l"         gtf_printf("w");
"qu"        gtf_printf("qw");
"th "       gtf_printf("f ");
"th"        gtf_printf("d");
"n."        gtf_printf("n, uh-hah-hah-hah. ");
"R"         gtf_printf("W");
"L"         gtf_printf("W");
"Qu"        gtf_printf("Qw");
"QU"        gtf_printf("QW");
"TH "       gtf_printf("F ");
"TH"        gtf_printf("D");
"Th"        gtf_printf("D");
"N."        gtf_printf("N, uh-hah-hah-hah. ");

{EOT}	    /* ignore trailing EOT character */
.	    gtf_echo();

%%

#ifdef LIBRARY_MODE

int gtf_filter_fudd(const char *input, char *buf, size_t bufsz)
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

int __gtf_filter_fudd(const char *input, char *buf, size_t bufsz)
{
  return(gtf_filter_fudd(input, buf, bufsz));
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
