#!/usr/local/bin/perl

#---------------------------------------------------------------------------
# Yank in and parse the stuff the browser sent us.
#---------------------------------------------------------------------------

$in = $ENV{'CONTENT_LENGTH'};

if($in == 0)
  {
    # No form input; so read query string instead
    
    $in = $ENV{'QUERY_STRING'};
  }
else
  {
    # Form input, so parse it.

    read(STDIN, $in, $ENV{'CONTENT_LENGTH'});     # grab the chunk of input
  }

$in =~ s/\+/ /g;                                  # convert +'s to spaces
$in =~ s/%(..)/pack("c", hex($1))/ge;           # expand escape codes
@vars = split('&', $in);

$text = substr($vars[0], index($vars[0], '=') + 1);
$filter = substr($vars[1], index($vars[1], '=') + 1);


print "Content-type: text/html\n\n";

print "<html><head><title>The GNU Talkfilters - Output</title></head>";

print "<body bgcolor=\"white\" fgcolor=\"black\">\n";

print "<hr>\n";

print "<pre>\n";

select((select(STDOUT), $| = 1)[0]);

open (FOUT, "| /usr/local/bin/$filter | /usr/local/bin/wrap");
print FOUT $text;
close FOUT;


print "</pre>\n";

print "<hr>\n";

print "</body></html>\n";

