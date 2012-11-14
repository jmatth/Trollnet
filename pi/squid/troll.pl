#!/usr/bin/perl

$|=1;
$count = 0;
$pid = $$;
while (<>) {
	chomp $_;
	if ($_ =~ /(.*\.jpg)/i || $_ =~ /(.*\.png)/i || $_ =~ /(.*\.gif)/i ) {
		$url = $1;
		print "http://yourdomain.com/path/to/troll.php?i=$url\n";
	} else {
		print "$_\n";;
	}
	$count++;
}
