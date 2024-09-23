use strict;
use 5.10.0;

my $hot = 0;

while(<>){
	if (/^\t/ or /git pull/ or /rclone/){
		print;
		$hot = 1;
	}
	if ($hot and /Leaving directory/){
		$hot=0;
		print;
	}
}
say "## End logtest";
