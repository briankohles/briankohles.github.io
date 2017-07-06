---
title: Perl
layout: wiki
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
