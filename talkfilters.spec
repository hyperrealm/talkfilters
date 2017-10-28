Name:           talkfilters
Version:        2.3.9
Release:        0
Epoch:          0
Summary:        This group of filters serves no utilitarian purpose but is nonetheless quite amusing and hence should be maintained for posterity

Group:          Applications/Text
License:        GPL
URL:            http://www.hyperrealm.com/
Source0:        %{name}-%{version}.tar.gz
#Patch common.h to include the 'standards'
Patch0:         talkfilters-2.3.9_patch0
#Patch talkfilters.h to include the 'standards'
Patch1:         talkfilters-2.3.9_patch1
#Patch Makefile.am so we don't do anything with the old gaim plugin
Patch2:         talkfilters-2.3.9_patch2
#Patch Makefile.am so there's no symlinked man pages
Patch3:         talkfilters-2.3.9_patch3
BuildRoot:      %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)

BuildRequires:  glibc-devel
Requires:       glibc

%description
The GNU Talk Filters are filter programs that convert ordinary English text into text that mimics a stereotyped or otherwise humorous dialect. These filters have been in the public domain for many years, but now for the first time they are provided as a single integrated package. The filters include austro, b1ff, brooklyn, chef, cockney, drawl, dubya, fudd, funetak, jethro, jive, kraut, pansy, pirate, postmodern, redneck, valspeak, and warez. Each program reads from standard input and writes to standard output. This version of the package also provides the filters as a C library, so they can be easily embedded in other programs.

%prep
%setup -q
%patch0 -p1
%patch1 -p1
%patch2 -p1
%patch3 -p1


%build
#in the dist, mandir=${PREFIX}/man, which isn't good
%configure --mandir=%{_mandir}
make %{?_smp_mflags}


%install
rm -rf $RPM_BUILD_ROOT
make install DESTDIR=$RPM_BUILD_ROOT


%clean
rm -rf $RPM_BUILD_ROOT


%files
%defattr(-,root,root,-)
%doc AUTHORS ChangeLog README
%{_bindir}/*
%{_includedir}/talkfilters.h
%{_libdir}/libtalkfilters*.so*
%{_libdir}/libtalkfilters.la
%{_libdir}/libtalkfilters.a
%{_mandir}/*/*
%{_infodir}/talkfilters.info.gz



%changelog
* Sun Nov 20 2005 Peter Lawler <bleeter@users.sf.net>
- Initial Spec File
