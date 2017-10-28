# 

SUBDIRS = doc

filters = austro b1ff brooklyn chef cockney drawl dubya fudd funetak \
	jethro jive kraut pansy pirate postmodern redneck valspeak warez 

bin_PROGRAMS = $(filters) wrap

lib_LTLIBRARIES = libtalkfilters.la

# Versioning rules ( C:R:A )
# 1. Start with version 0:0:0.
# 2. If the library source code has changed at all, incremement R.
# 3. If any interfaces have been added, removed, or changed, increment C and
#    set R to 0.
# 4. If any interfaces have been added, increment A.
# 5. If any interfaces have been removed, set A to 0.
# For more info see page 27 of the GNU Libtool Manual.

VERINFO = -version-info 1:4:0

libtalkfilters_la_LDFLAGS = $(VERINFO) -no-undefined

commonsrc = common.c common.h getopt.c getopt1.c getopt.h

libsrc = talkfilters.c

libtalkfilters_la_CPPFLAGS = -DLIBRARY_MODE

if GNU_WIN

libtalkfilters_la_CPPFLAGS += -DTALKFILTERS_EXPORTS

endif

libtalkfilters_la_SOURCES = $(libsrc) $(commonsrc) \
	austro.l b1ff.l brooklyn.l chef.l cockney.l drawl.l dubya.l fudd.l \
	funetak.l jethro.l jive.l kraut.l pansy.l pirate.l postmodern.l \
	redneck.l valspeak.l warez.l

include_HEADERS = talkfilters.h

austro_SOURCES = austro.l $(commonsrc)

b1ff_SOURCES = b1ff.l $(commonsrc)

brooklyn_SOURCES = brooklyn.l $(commonsrc)

chef_SOURCES = chef.l $(commonsrc)

cockney_SOURCES = cockney.l $(commonsrc)

drawl_SOURCES = drawl.l $(commonsrc)

dubya_SOURCES = dubya.l $(commonsrc)

fudd_SOURCES = fudd.l $(commonsrc)

funetak_SOURCES = funetak.l $(commonsrc)

jethro_SOURCES = jethro.l $(commonsrc)

jive_SOURCES = jive.l $(commonsrc)

kraut_SOURCES = kraut.l $(commonsrc)

pansy_SOURCES = pansy.l $(commonsrc)

pirate_SOURCES = pirate.l $(commonsrc)

postmodern_SOURCES = postmodern.l $(commonsrc)

redneck_SOURCES = redneck.l $(commonsrc)

valspeak_SOURCES = valspeak.l $(commonsrc)

warez_SOURCES = warez.l $(commonsrc)

wrap_SOURCES = wrap.c $(commonsrc)

filter_man = talkfilters

man1_MANS = $(filter_man).man wrap.man

EXTRA_DIST = $(man1_MANS) *.vcproj *.sln win32/unistd.h

pkgconfigdir = $(libdir)/pkgconfig
pkgconfig_DATA = talkfilters.pc
