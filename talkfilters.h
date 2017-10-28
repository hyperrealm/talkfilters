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

#ifndef __gnu_talkfilters_h
#define __gnu_talkfilters_h

#include <sys/types.h>

// DLL kludges

#if defined(_WIN32) || defined(__WIN32__) || defined(WIN32)
#if defined(TALKFILTERS_EXPORTS)
#define TALKFILTERS_API __declspec(dllexport)
#else // ! TALKFILTERS_EXPORTS
#define TALKFILTERS_API __declspec(dllimport)
#endif // TALKFILTERS_EXPORTS
#else // ! WIN32
#define TALKFILTERS_API
#endif // WIN32

#ifdef __cplusplus
extern "C" {
#endif

// filter lookup interface

typedef struct
  {
  char *name;
  char *desc;
  int (*filter)(const char *, char *, size_t);
  } gtf_filter_t;

extern TALKFILTERS_API int gtf_filter_count(void);

extern TALKFILTERS_API const gtf_filter_t *gtf_filter_list(void);

extern TALKFILTERS_API const gtf_filter_t *gtf_filter_lookup(const char *name);

// individual filters

extern TALKFILTERS_API int gtf_filter_austro(const char *input, char *buf,
                                             size_t bufsz);

extern TALKFILTERS_API int gtf_filter_b1ff(const char *input, char *buf,
                                           size_t bufsz);

extern TALKFILTERS_API int gtf_filter_brooklyn(const char *input, char *buf,
                                               size_t bufsz);

extern TALKFILTERS_API int gtf_filter_chef(const char *input, char *buf,
                                           size_t bufsz);

extern TALKFILTERS_API int gtf_filter_cockney(const char *input, char *buf,
                                              size_t bufsz);

extern TALKFILTERS_API int gtf_filter_drawl(const char *input, char *buf,
                                            size_t bufsz);

extern TALKFILTERS_API int gtf_filter_dubya(const char *input, char *buf,
                                            size_t bufsz);

extern TALKFILTERS_API int gtf_filter_fudd(const char *input, char *buf,
                                           size_t bufsz);

extern TALKFILTERS_API int gtf_filter_funetak(const char *input, char *buf,
                                              size_t bufsz);

extern TALKFILTERS_API int gtf_filter_jethro(const char *input, char *buf,
                                             size_t bufsz);

extern TALKFILTERS_API int gtf_filter_jive(const char *input, char *buf,
                                           size_t bufsz);

extern TALKFILTERS_API int gtf_filter_kraut(const char *input, char *buf,
                                            size_t bufsz);

extern TALKFILTERS_API int gtf_filter_pansy(const char *input, char *buf,
                                            size_t bufsz);

extern TALKFILTERS_API int gtf_filter_pirate(const char *input, char *buf,
                                             size_t bufsz);

extern TALKFILTERS_API int gtf_filter_postmodern(const char *input, char *buf,
                                                 size_t bufsz);

extern TALKFILTERS_API int gtf_filter_redneck(const char *input, char *buf,
                                              size_t bufsz);

extern TALKFILTERS_API int gtf_filter_valspeak(const char *input, char *buf,
                                               size_t bufsz);

extern TALKFILTERS_API int gtf_filter_warez(const char *input, char *buf,
                                            size_t bufsz);

#ifdef __cplusplus
};
#endif
  
#endif /* __gnu_talkfilters_h */
