/* GNU TalkFilters
   Copyright (C) 1998-2003 Free Software Foundation, Inc.

   This file is part of GNU Talkfilters

   GNU Talkfilters is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   GNU Talkfilters is distributed in the hope that it will be amusing,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with GNU Talkfilters; see the file COPYING.  If not, write to
   the Free Software Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.
*/

/* --- System Headers --- */

#include <stdio.h>
#include <ctype.h>
#include <stdlib.h>

/* --- Local Headers --- */

/* --- Macros --- */

#define DFL_WIDTH 78
#define MIN_WIDTH 10

#include "getopt.h"

#define HELP_OPTION 0
#define VERSION_OPTION 1

#define USAGE "%s: Usage: %s [-w width] [--help --version]\n"
#define VERSION "GNU wrap v1.3"

static const struct option options[] = { { "help", 0, NULL, 0  },
                                         { "version", 0, NULL, 0 },
                                         { NULL, 0, NULL, 0 } };

/* --- Functions --- */

int main(int argc, char **argv)
{
  char *wbuf = (char *)malloc((DFL_WIDTH + 1) * sizeof(char)), *wp = wbuf,
    prevc = 0, errf = 0;
  int c, wl = 0, ll = 0, width = DFL_WIDTH, option_index;
  extern char *optarg;

  while((c = getopt_long(argc, argv, "w:", options, &option_index)) != EOF)
  {
    switch(c)
    {
      case 'w':
        width = atoi(optarg);
        if(width < MIN_WIDTH)
        {
          fprintf(stderr,
                  "%s: Width must be at least %i (defaulting to %i)\n",
                  *argv, MIN_WIDTH, DFL_WIDTH);
          width = DFL_WIDTH;
        }
        break;

      case 0:
        if(option_index == HELP_OPTION)
          fprintf(stderr, USAGE, *argv, *argv);
        else if(option_index == VERSION_OPTION)
        {
          fputs(VERSION, stderr);
          fputc('\n', stderr);
        }
        exit(EXIT_SUCCESS);
        break;

      default:
        errf++;
    }
  }

  if(errf)
  {
    fprintf(stderr, USAGE, *argv, *argv);
    free(wbuf);
    exit(EXIT_FAILURE);
  }

  /* now do the actual formatting */

  while((c = getchar()) != EOF)
  {
    if(!isspace(c))
    {
      if(wl < width)
      {
        *wp = (char)c;
        wl++, wp++;
      }
      else /* word is full, so output it */
      {
        *wp = 0;
        putchar('\n');
        fputs(wbuf, stdout);
        putchar(c);
        putchar('\n');
        wp = wbuf, ll = wl = 0;
      }
    }
    else /* isspace(c) */
    {
      if(prevc == '\n')
      {
        if(prevc == '\n' && c == '\n')
          ll = 0, putchar('\n'), putchar('\n');
        else if(ll > 0) ll++;
      }
      else if(wl && ((ll + wl + (ll > 0)) <= width))
      {
        *wp = 0;
        if(ll) putchar(' '), ll++;
        fputs(wbuf, stdout);
        ll += wl;
        wl = 0, wp = wbuf;
      }
      else if(wl)
      {
        *wp = 0;
        putchar('\n');
        fputs(wbuf, stdout);
        ll = wl;
        wl = 0, wp = wbuf;
      }
    }
    prevc = c;
  }
  /* if text remains in word buffer, process it */

  if(wl)
  {
    *wp = 0;
    if((ll + wl + (ll > 0)) <= width)
    {
      if(ll) putchar(' ');
    }
    else putchar('\n');
    fputs(wbuf, stdout);
  }
  putchar('\n');
  free(wbuf);
  exit(EXIT_SUCCESS);
}

/* end of source file */
