#!/usr/bin/perl

$|=1;
$count = 0;
$pid = $$;
while (<>) {
	chomp $_;
	if ($_ =~ /(.*\.jpg)/i || $_ =~ /(.*\.png)/i || $_ =~ /(.*\.gif)/i ) {
		$url = $1;
		print "http://scratch.russfrank.us/~russfrank/hackny/cat.php?i=$url\n";
	} else {
		print "$_\n";;
	}
	$count++;
}
