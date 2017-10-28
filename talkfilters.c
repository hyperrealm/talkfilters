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

#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#include <stddef.h>
#ifdef HAVE_STRING_H
#include <string.h>
#endif

#include "talkfilters.h"

#ifdef WIN32
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#endif

#ifdef _MSC_VER
#pragma warning (disable: 4996)
#define strcasecmp stricmp
#endif

static const char *__gtf_version = "GNU Talkfilters v2.3.7";

extern int __gtf_filter_austro(const char *, char *, size_t);
extern int __gtf_filter_b1ff(const char *, char *, size_t);
extern int __gtf_filter_brooklyn(const char *, char *, size_t);
extern int __gtf_filter_chef(const char *, char *, size_t);
extern int __gtf_filter_cockney(const char *, char *, size_t);
extern int __gtf_filter_drawl(const char *, char *, size_t);
extern int __gtf_filter_dubya(const char *, char *, size_t);
extern int __gtf_filter_fudd(const char *, char *, size_t);
extern int __gtf_filter_funetak(const char *, char *, size_t);
extern int __gtf_filter_jethro(const char *, char *, size_t);
extern int __gtf_filter_jive(const char *, char *, size_t);
extern int __gtf_filter_kraut(const char *, char *, size_t);
extern int __gtf_filter_pansy(const char *, char *, size_t);
extern int __gtf_filter_pirate(const char *, char *, size_t);
extern int __gtf_filter_postmodern(const char *, char *, size_t);
extern int __gtf_filter_redneck(const char *, char *, size_t);
extern int __gtf_filter_valspeak(const char *, char *, size_t);
extern int __gtf_filter_warez(const char *, char *, size_t);

static gtf_filter_t __gtf_filters[] =
{
  { "austro",     "Austro",         __gtf_filter_austro     },
  { "b1ff",       "B1FF",           __gtf_filter_b1ff       },
  { "brooklyn",   "Brooklyn",       __gtf_filter_brooklyn   },
  { "chef",       "Swedish Chef",   __gtf_filter_chef       },
  { "cockney",    "London Cockney", __gtf_filter_cockney    },
  { "drawl",      "Southern Drawl", __gtf_filter_drawl      },
  { "dubya",      "George Dubya",   __gtf_filter_dubya      },
  { "fudd",       "Elmer Fudd",     __gtf_filter_fudd       },
  { "funetak",    "Funetak",        __gtf_filter_funetak    },
  { "jethro",     "Jethro",         __gtf_filter_jethro     },
  { "jive",       "Jive",           __gtf_filter_jive       },
  { "kraut",      "Kraut",          __gtf_filter_kraut      },
  { "pansy",      "Pansy",          __gtf_filter_pansy      },
  { "pirate",     "Pirate",         __gtf_filter_pirate     },
  { "postmodern", "Postmodernist",  __gtf_filter_postmodern },
  { "redneck",    "Redneck",        __gtf_filter_redneck    },
  { "valspeak",   "Valley Speak",   __gtf_filter_valspeak   },
  { "warez",      "Warez (H4x0r)",  __gtf_filter_warez      },
};

static int __gtf_filter_count = sizeof(__gtf_filters) / sizeof(gtf_filter_t);

/*
 */

#ifdef WIN32

BOOL WINAPI DllMain(HINSTANCE hinstDLL, DWORD fdwReason, LPVOID lpvReserved)
{
  return(TRUE);
}

#endif

/*
 */

int gtf_filter_count(void)
  {
  return(__gtf_filter_count);
  }

/*
 */

const gtf_filter_t *gtf_filter_list(void)
  {
  return(__gtf_filters);
  }

/*
 */

const gtf_filter_t *gtf_filter_lookup(const char *name)
  {
  int i;
  gtf_filter_t *f;

  for(i = 0, f = __gtf_filters; i < __gtf_filter_count; i++, f++)
    {
    if(!strcasecmp(f->name, name))
      return(f);
    }

  return(NULL);
  }

/* end of source file */
