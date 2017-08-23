---
title: Perl
layout: page
collection: wiki
author: Brian Kohles
tags: wiki perl
categories: perl
---

## Convert Microsoft tick time to epoch

This does a simple conversion of Microsoft tick time into unix epoch.

Tick is the time that MS used to store many dates in Active Directory, such as last login and password last modified.

```perl
## tickToEpoch
sub tickToEpoch {
        my ($args) = @_;
        # arguments are passed in as a hashref in the format of;
        # $args->{timeintick}
 
        my $winTick = 10000000;
        my $secFromTickToEpoch = 11644473600;
 
        return ($args->{timeintick}/$winTick - $secFromTickToEpoch);
}
## /tickToEpoch
```

Formula from: [Stack Overflow](https://stackoverflow.com/questions/6161776/convert-windows-filetime-to-second-in-unix-linux#6161842)

## Passing data to subs

### Defining the sub
```
sub Test {
	my ($args) = @_;
	# aruments are passed in as a hashRef in the format of:
	# $args->{host} -- hostname to connect to
	# $args->{bindDn} -- bind DN (optional)
	
	return $item;
}
```
### Calling the sub
```
my $return = test({
    host => 'testHost.test.com',
});
```

## Read data from perl code instead of from file
```
while(<DATA>) {
        chomp();
        print "DATA LINE: $_;\n";
}

__DATA__
Line 1 item 1, Line 1 item 2
Line 2 item 1, Line 2 item 2
Line 3 item 1, Line 3 item 2
Line 4 item 1, Line 4 item 2
```

## create a hash from an array using map
```
my %currentServers = map { $_ => 1 } @{$currentServers->{servers}};
```

# hashes
```
my %hash = (
	key => 'value',
	key2 => 'value2',
);
```

* Keys don't need to be quoted when using a fat arrow
* keys will return a list of all keys
* values will return a list of all values

## replace text in a bunch of files one liner

```
perl -pi -e 's/about news\.$/about selling advertising space\./' file*
-p              loop and swallow the files, and print default.
-i              edit the files in-place
-e              do the command
```

## Create a spinner to show that something is running
```
my @spinner = qw( | / - \ );

$|=1;
for my $major(0..15) {
        my $spin_cnt=0;
        for (1..4) {
                print $major." ".$spinner[$spin_cnt]."\r";
                $spin_cnt++;
                sleep 15;
        }
}
$|=0;
```

## create regex "objects"
```
#!/usr/bin/perl -w

use strict;

my @find = (
        qr/cat/i,
        qr/dog/i
);

my @strings = ('cat','dog','bear','badger bear','dog cat');

foreach my $string (@strings) {
        print "STRING:$string;\n";
        foreach my $find (@find) {
                print "MATCH:$find;\n" if ($string =~ /$find/);
        }
}
```

## use a regex to separate a string into multiple strings (leaves the original string unaffected.
```
my ($date, $time) = $dateTime =~ /(^\d{4}-\d{2}-\d{2})-(\d\d)/m;
```

## modify @INC at runtime
```
Use "perl -I /path/to/library" to add a path to @INC @ runtime.
```

## creating Arrays of Arrays and referencing them
```
my @AoA = ( [1,2,3],[4,5,6] ); # creates an Array of Arrays
	# the curved brackets make the grouping into a list directly.
print $AoA[1][0]; # retrieve the values directly.

my $ref_to_AoA = [ [1,2,3], [4,5.6] ]; # create a reference to an Array of Arrays
	# the square brackets make the grouping into a referenced list.
print $ref_to_AoA->[1][0]; # retrieve the values through dereferencing
```

## Indenting text while using heredoc
```
 	# all in one
		(my $VAR = <<HERE_TARGET) =~ s/^\s+//gm;
			your text
			goes here
		HERE_TARGET
```
