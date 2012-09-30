#!/usr/bin/perl
use LWP::UserAgent; # This will cover all of them!
use URI::URL;
use HTTP::Request;
use Image::Size;

sub getImageSize {
	my $the_url = $_;

	my $hdrs = new HTTP::Headers(Accept => 'text/plain', UserAgent => 
		'MegaBrowser/1.0');

	my $url = new URI::URL($the_url);
	my $req = new HTTP::Request('GET', $url, $hdrs);
	my $ua = new LWP::UserAgent;
	my $resp = $ua->request($req);

	if ($resp->is_success) {

# If connection is successful the contents of the file
# read will now go into the variable $img
		$img = $resp->content;
	}
	else {

# If connection is not successful then make note of this	
		print $resp->message;
#$img = "socket_failure";
	}

	use Image::Size;
# Assume that &read_data gets data somewhere (WWW, etc.)
	my ($height, $width, $id) = imgsize(\$img);
	return  ($height, $width);

}

$|=1;
$count = 0;
$pid = $$;
while (<>) {
	chomp $_;
	if ($_ =~ /(.*\.jpg)/i || $_ =~ /(.*\.png)/i || $_ =~ /(.*\.gif)/i ) {
		$url = $1;
		($width, $height) = getImageSize($url);
		print "http://placekitten.com/$width/$height\n";
	} else {
		print "$_\n";;
	}
	$count++;
}
