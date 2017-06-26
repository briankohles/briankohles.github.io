#!/usr/bin/perl

use strict;

# newPost.pl <date (YYYY-MM-DD)> <title>

my $date = shift;
my $title = shift;

# validate input
if ($date eq '' || $title eq '') {
	print "Usage: ./newPost.pl <date (YYYY-MM-DD)> <title>\n";
	exit;
}
my $slug = $date.'-'.$title;
$slug =~ s/[\ \,]/_/g;
$slug =~ s/_+/_/g;

$slug = lc($slug);
#print "SLUG:$slug;\n";

my $baseDir = '/Users/brian/Documents/briankohles.github.io';
my $draft = $baseDir.'/_drafts/'.$slug.'.md';
print "creating: $draft\n";
my $images = $baseDir.'/assets/posts/'.$slug;
print "creating: $images\n";

# if the file doesn't already exist then create it
if (! -e $draft) {
	# create post file in drafts
	open(my $FILE, ">", $draft);

	# add all possible front matter
	print $FILE <<EOFRONT;
---
title: $title
author: Brian Kohles
categories: 
date: $date
layout: post
tags: 
link: 
youtubeid: 
---
EOFRONT
	close($draft);
} else {
	print "DRAFT: $draft already exists\n";
}

# create folder for images in assets directory
mkdir($images)
