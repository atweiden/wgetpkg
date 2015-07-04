#!/usr/bin/perl
use strict;
use warnings;
use 5.022;
while (defined(my $pkg = shift(@ARGV)))
{
    chomp($pkg);
    system("wget", "https://aur4.archlinux.org/cgit/aur.git/snapshot/$pkg.tar.gz");
}
