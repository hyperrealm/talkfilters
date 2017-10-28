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
 * This is the w4r3z filter, written by Ian Johnston, reaper@muppetlabs.com.  
 * 
 * Copyright (C) 1998  Ian Johnston
 * 
 * GNU Talkfilters is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 * 
 * This software is distributed in the hope that it will be amusing,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this software; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 * or copies are available at the GNU website: http://www.gnu.org/
 *
 * Ian Johnston can be reached as reaper@speakeasy.org
 */

%option prefix="warez_yy"
%option outfile="lex.yy.c"
%option noyywrap
%option nounput

%e 2000
%p 5000
%n 1000
%k 500
%a 4000
%o 2000

BW	[ \t]
EW	[ \t.,;!?]
EOT	\4

%{

#include "common.h"
#include "talkfilters.h"

#define YY_DECL int yylex(gtf_databuf_t *buf)

static const char *a_array[] = {"4", "4", "4", "a", "a", "A", "@"};
#define A_LEN (sizeof(a_array) / sizeof(a_array[0]))
static const char *b_array[] = {"8", "b", "b", "B"};
#define B_LEN (sizeof(b_array) / sizeof(b_array[0]))
static const char *c_array[] = {"c", "c", "C", "k", "k" /*, "<" */};
#define C_LEN (sizeof(c_array) / sizeof(c_array[0]))
static const char *d_array[] = {"d", "d", "D", "|)"};
#define D_LEN (sizeof(d_array) / sizeof(d_array[0]))
static const char *e_array[] = {"3", "3", "3", "e", "E"};
#define E_LEN (sizeof(e_array) / sizeof(e_array[0]))
static const char *f_array[] = {"f", "f", "F", "ph", "ph"};
#define F_LEN (sizeof(f_array) / sizeof(f_array[0]))
static const char *g_array[] = {"6", "g", "g", "G"};
#define G_LEN (sizeof(g_array) / sizeof(g_array[0]))
static const char *h_array[] = {"h", "h", "H", "]-["};
#define H_LEN (sizeof(h_array) / sizeof(h_array[0]))
static const char *i_array[] = {"1", "i", "I", "!", "Y", "|"};
#define I_LEN (sizeof(i_array) / sizeof(i_array[0]))
static const char *j_array[] = {"j", "j", "J", ";"};
#define J_LEN (sizeof(j_array) / sizeof(j_array[0]))
static const char *k_array[] = {"k", "K", "c", "C"};
#define K_LEN (sizeof(k_array) / sizeof(k_array[0]))
static const char *l_array[] = {"1", "l", "l", "L"};
#define L_LEN (sizeof(l_array) / sizeof(l_array[0]))
static const char *m_array[] = {"m", "m", "M", "]\\/["};
#define M_LEN (sizeof(m_array) / sizeof(m_array[0]))
static const char *n_array[] = {"n", "n", "n", "n", "N", "N", "|\\|", "]\\[", "gn"};
#define N_LEN (sizeof(n_array) / sizeof(n_array[0]))
static const char *o_array[] = {"0", "o", "O", "()", "0", "0"};
#define O_LEN (sizeof(o_array) / sizeof(o_array[0]))
static const char *p_array[] = {"p", "P"};
#define P_LEN (sizeof(p_array) / sizeof(p_array[0]))
static const char *q_array[] = {"q", "Q"};
#define Q_LEN (sizeof(q_array) / sizeof(q_array[0]))
static const char *r_array[] = {"r", "R"};
#define R_LEN (sizeof(r_array) / sizeof(r_array[0]))
static const char *s_array[] = {"5", "z", "Z", "s", "S"};
#define S_LEN (sizeof(s_array) / sizeof(s_array[0]))
static const char *t_array[] = {"7", "t", "T"};
#define T_LEN (sizeof(t_array) / sizeof(t_array[0]))
static const char *u_array[] = {"u", "U"};
#define U_LEN (sizeof(u_array) / sizeof(u_array[0]))
static const char *v_array[] = {"v", "v", "V", "\\/"};
#define V_LEN (sizeof(v_array) / sizeof(v_array[0]))
static const char *w_array[] = {"w", "w", "W", "W", "\\/\\/"};
#define W_LEN (sizeof(w_array) / sizeof(w_array[0]))
static const char *x_array[] = {"x", "X", /*"><",*/ "kz" };
#define X_LEN (sizeof(x_array) / sizeof(x_array[0]))
static const char *y_array[] = {"y", "Y"};
#define Y_LEN (sizeof(y_array) / sizeof(y_array[0]))
static const char *z_array[] = {"s", "S", "z", "z", "Z"};
#define Z_LEN (sizeof(z_array) / sizeof(z_array[0]))

static const char *__warez_rand(const char **array, int length)
{
  int i = gtf_random(length);
  return(array[i]);
}

%}

%%

\<(\/)?[A-Za-z][^\>]*\>      gtf_echo(); /* don't damage HTML tags */

[aA]		gtf_puts(__warez_rand(a_array, A_LEN));
[bB]		gtf_puts(__warez_rand(b_array, B_LEN));
[cC]		gtf_puts(__warez_rand(c_array, C_LEN));
[dD]		gtf_puts(__warez_rand(d_array, D_LEN));
[eE]		gtf_puts(__warez_rand(e_array, E_LEN));
[fF]		gtf_puts(__warez_rand(f_array, F_LEN));
[gG]		gtf_puts(__warez_rand(g_array, G_LEN));
[hH]		gtf_puts(__warez_rand(h_array, H_LEN));
[iI]		gtf_puts(__warez_rand(i_array, I_LEN));
[jJ]		gtf_puts(__warez_rand(j_array, J_LEN));
[kK]		gtf_puts(__warez_rand(k_array, K_LEN));
[lL]		gtf_puts(__warez_rand(l_array, L_LEN));
[mM]		gtf_puts(__warez_rand(m_array, M_LEN));
[nN]		gtf_puts(__warez_rand(n_array, N_LEN));
[oO]		gtf_puts(__warez_rand(o_array, O_LEN));
[pP]		gtf_puts(__warez_rand(p_array, P_LEN));
[qQ]		gtf_puts(__warez_rand(q_array, Q_LEN));
[rR]		gtf_puts(__warez_rand(r_array, R_LEN));
[sS]		gtf_puts(__warez_rand(s_array, S_LEN));
[tT]		gtf_puts(__warez_rand(t_array, T_LEN));
[uU]		gtf_puts(__warez_rand(u_array, U_LEN));
[vV]		gtf_puts(__warez_rand(v_array, V_LEN));
[wW]		gtf_puts(__warez_rand(w_array, W_LEN));
[xX]		gtf_puts(__warez_rand(x_array, X_LEN));
[yY]		gtf_puts(__warez_rand(y_array, Y_LEN));
[zZ]		gtf_puts(__warez_rand(z_array, Z_LEN));
" the "		gtf_puts(" d4 ");
"The "		gtf_puts("D4 ");
" you"		gtf_puts(" j00");
You		gtf_puts("U");
" see"		gtf_puts(" C");
See		gtf_puts("c");
" are"		gtf_puts(" r");
Are		gtf_puts("R");
[Ss]mart	|
[Gg]ood		|
[Ee]xpert	|
[Tt]alented	|
[Ee]xperienced	gtf_puts("1337");
[Yy]our		gtf_puts_case("j00r");
[Hh]acker	|
[Pp]rogrammer	|
[Dd]eveloper    gtf_puts_case("h4x0r");
[Ee]lite	gtf_puts("31337");
[Pp]ornography	gtf_puts_case("pr0n");
[Pp]orn(o)?	gtf_puts_case("pr0n");
[Dd]ude		|
[Pp]erson	|
[Gg]uy		gtf_puts_case("d00d");
[Ss]oftware	gtf_puts_case("warez");
[Pp]irate	gtf_puts_case("piR8");
[Aa]pplications	gtf_puts_case("appz");
[Mm]usic	gtf_puts_case("mp3z");
"broke."	|
"crashed."	gtf_puts("g0t fux0red.");
[Ff]ucked	|
[Bb]roke(n)?	|
[Mm]alfunctioning |
[Bb]uggy	gtf_puts_case("fux0red");
[Ss]uckers      gtf_puts_case("sux0rz");

{EOT}		/* ignore trailing EOT character */
.		gtf_echo();
\n		gtf_puts("\n");

%%

#ifdef LIBRARY_MODE

int gtf_filter_warez(const char *input, char *buf, size_t bufsz)
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

int __gtf_filter_warez(const char *input, char *buf, size_t bufsz)
{
  return(gtf_filter_warez(input, buf, bufsz));
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
