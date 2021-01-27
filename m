Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EE6230591B
	for <lists+linux-next@lfdr.de>; Wed, 27 Jan 2021 12:03:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236395AbhA0LC6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Jan 2021 06:02:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20020 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236307AbhA0LBK (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 27 Jan 2021 06:01:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611745171;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5A0EToVhBBszKqdbfzh8W7kjpz9ghiAtpMLuYPLvA1A=;
        b=AlUWuXWS8+GgqcTkJaJ2IfuIM34SJHTciXJjOF54fckmHUy50v5VpJUfoatzXcZ0Q7IqF9
        GqE8uSBXAGYsQ1skSozxKgrUXv4/uB8FgLlunpe/FRpVZEJr7lEhpnEoGtTlHsgoW+vsV5
        xCO2DFS7qC5k5JrA/16XE7q96+cyKzQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-49-XohAPOHkMBqUn1UhhgAlJQ-1; Wed, 27 Jan 2021 05:59:26 -0500
X-MC-Unique: XohAPOHkMBqUn1UhhgAlJQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C100F100F341;
        Wed, 27 Jan 2021 10:59:24 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-115-23.rdu2.redhat.com [10.10.115.23])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 294D85D9DD;
        Wed, 27 Jan 2021 10:59:23 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20210127215101.2ed0a5ae@canb.auug.org.au>
References: <20210127215101.2ed0a5ae@canb.auug.org.au>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     dhowells@redhat.com,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the notifications tree with the pidfd tree
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3058202.1611745162.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date:   Wed, 27 Jan 2021 10:59:22 +0000
Message-ID: <3058203.1611745162@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

#!/usr/bin/perl -w
#
# This script can be used to add, remove, rename and renumber system calls=
 in
# the kernel sources and resolve simple git conflicts when a branch carryi=
ng
# new system calls is merged into another that also has new system calls w=
ith
# conflicting numbers.
#
# Usage:
#
#  ./scripts/syscall-manage.pl --add <name> [--compat]
#
#	Add a new system call, giving it the specified name and allocating it
#	the next number, bumping __NR_syscalls.  If --compat is specified, then
#	__SC_COMP() will be used in lieu of __SYSCALL() and the script will
#	attempt to emit appropriate compatibility lines into the tables.
#
#  ./scripts/syscall-manage.pl --rm <name>
#
#	Remove the system call with the specified name, decrementing
#	__NR_syscalls if it was the final one.
#
#  ./scripts/syscall-manage.pl --rename <name> <new_name>
#
#	Rename the system call with the specified name to the new name.
#
#  ./scripts/syscall-manage.pl --renumber
#
#	Renumber the system calls between 424 and __NR_syscalls to remove any
#	holes and update __NR_syscalls.
#
#  ./scripts/syscall-manage.pl --resolve
#
#	Resolve simple git conflicts across all system call table files
#	resulting from one branch being merged into another where both branches
#	add system calls with conflicting numbers.  The new syscalls are
#	renumbered, __NR_syscalls is updated and the conflict markers and any
#	extra definition of __NR_syscalls are removed.
#
use strict;

#
# List of files that need to be altered and their insertion patterns
#
my $master =3D "include/uapi/asm-generic/unistd.h";
my $sys_ni =3D "kernel/sys_ni.c";
my @tables =3D (
    { file	=3D> "arch/alpha/kernel/syscalls/syscall.tbl",
      pattern	=3D> "%NUM common %NAME sys_%NAME",
      num_offset =3D> 110 },
    { file	=3D> "arch/arm/tools/syscall.tbl",
      pattern	=3D> "%NUM common %NAME sys_%NAME" },
    { file	=3D> "arch/ia64/kernel/syscalls/syscall.tbl",
      pattern	=3D> "%NUM common %NAME sys_%NAME" },
    { file	=3D> "arch/m68k/kernel/syscalls/syscall.tbl",
      pattern	=3D> "%NUM common %NAME sys_%NAME" },
    { file	=3D> "arch/microblaze/kernel/syscalls/syscall.tbl",
      pattern	=3D> "%NUM common %NAME sys_%NAME" },
    { file	=3D> "arch/mips/kernel/syscalls/syscall_n32.tbl",
      pattern	=3D> "%NUM n32 %NAME sys_%NAME",
      compat	=3D> 0 },
    { file	=3D> "arch/mips/kernel/syscalls/syscall_n32.tbl",
      pattern	=3D> "%NUM n32 %NAME compat_sys_%NAME",
      compat	=3D> 1 },
    { file	=3D> "arch/mips/kernel/syscalls/syscall_n64.tbl",
      pattern	=3D> "%NUM n64 %NAME sys_%NAME" },
    { file	=3D> "arch/mips/kernel/syscalls/syscall_o32.tbl",
      pattern	=3D> "%NUM o32 %NAME sys_%NAME",
      compat	=3D> 0 },
    { file	=3D> "arch/mips/kernel/syscalls/syscall_o32.tbl",
      pattern	=3D> "%NUM o32 %NAME sys_%NAME compat_sys_%NAME",
      compat	=3D> 1 },
    { file	=3D> "arch/parisc/kernel/syscalls/syscall.tbl",
      pattern	=3D> "%NUM common %NAME sys_%NAME",
      compat	=3D> 0 },
    { file	=3D> "arch/parisc/kernel/syscalls/syscall.tbl",
      pattern	=3D> "%NUM common %NAME compat_sys_%NAME",
      compat	=3D> 1 },
    { file	=3D> "arch/powerpc/kernel/syscalls/syscall.tbl",
      pattern	=3D> "%NUM common %NAME sys_%NAME",
      compat	=3D> 0 },
    { file	=3D> "arch/powerpc/kernel/syscalls/syscall.tbl",
      pattern	=3D> "%NUM common %NAME sys_%NAME compat_sys_%NAME",
      compat	=3D> 1 },
    { file	=3D> "arch/s390/kernel/syscalls/syscall.tbl",
      pattern	=3D> "%NUM common %NAME sys_%NAME sys_%NAME",
      widths	=3D> [ 8, 8, 24, 32, 32],
      compat	=3D> 0 },
    { file	=3D> "arch/s390/kernel/syscalls/syscall.tbl",
      pattern	=3D> "%NUM common %NAME sys_%NAME compat_sys_%NAME",
      widths	=3D> [ 8, 8, 24, 32, 32],
      compat	=3D> 1 },
    { file	=3D> "arch/sh/kernel/syscalls/syscall.tbl",
      pattern	=3D> "%NUM common %NAME sys_%NAME" },
    { file	=3D> "arch/sparc/kernel/syscalls/syscall.tbl",
      pattern	=3D> "%NUM common %NAME sys_%NAME",
      compat	=3D> 0 },
    { file	=3D> "arch/sparc/kernel/syscalls/syscall.tbl",
      pattern	=3D> "%NUM common %NAME sys_%NAME compat_sys_%NAME",
      compat	=3D> 1 },
    { file	=3D> "arch/x86/entry/syscalls/syscall_32.tbl",
      pattern	=3D> "%NUM i386 %NAME sys_%NAME __ia32_sys_%NAME",
      widths	=3D> [ 8, 8, 24, 32, 32],
      compat	=3D> 0 },
    { file	=3D> "arch/x86/entry/syscalls/syscall_32.tbl",
      pattern	=3D> "%NUM i386 %NAME sys_%NAME __ia32_compat_sys_%NAME",
      widths	=3D> [ 8, 8, 24, 32, 32],
      compat	=3D> 1 },
    { file	=3D> "arch/x86/entry/syscalls/syscall_64.tbl",
      pattern	=3D> "%NUM common %NAME __x64_sys_%NAME",
      widths	=3D> [ 8, 8, 24, 32, 32] },
    { file	=3D> "arch/xtensa/kernel/syscalls/syscall.tbl",
      pattern	=3D> "%NUM common %NAME sys_%NAME" },
    #{ file	=3D> "tools/perf/arch/powerpc/entry/syscalls/syscall.tbl",
    #  pattern	=3D> "%NUM common %NAME sys_%NAME" },
    #{ file	=3D> "tools/perf/arch/s390/entry/syscalls/syscall.tbl",
    #  pattern	=3D> "%NUM common %NAME sys_%NAME sys_%NAME" },
    #{ file	=3D> "tools/perf/arch/x86/entry/syscalls/syscall_64.tbl",
    #  pattern	=3D> "%NUM common %NAME __x64_sys_%NAME" },
    );

my $common_base =3D 424;

#
# Helpers
#
sub read_file($)
{
    my ($file) =3D @_;
    my @lines;

    open(FD, "<" . "$file") || die $file;
    while (<FD>) {
	chomp($_);
	push @lines, $_;
    }
    close(FD) || die $file;
    return \@lines;
}

sub write_file($$)
{
    my ($file, $lines) =3D @_;

    print "Writing $file\n";
    open(FD, ">" . "$file") || die $file;
    print FD $_, "\n" foreach(@{$lines});
    close(FD) || die $file;
}

##########################################################################=
#####
#
# Add a new syscall to the master list and return the syscall number alloc=
ated.
#
##########################################################################=
#####
sub add_to_master($$)
{
    my ($name, $compat) =3D @_;
    my $f =3D $master;
    my $lines =3D read_file($f);
    my $num =3D -1;
    my $nr =3D -1;
    my $i;
    my $j =3D -1;

    for ($i =3D 0; $i <=3D $#{$lines}; $i++) {
	my $l =3D $lines->[$i];
	if ($l =3D~ /^#define\s+__NR_syscalls\s+([0-9]+)/) {
	    die "$f:$i: Multiple __NR_syscalls definitions\n" if ($nr !=3D -1);
	    $nr =3D $1;
	    $j =3D $i;
	}

	if ($l =3D~ /^#define\s+__NR_([a-zA-Z0-9_]+)\s+([0-9]+)/) {
	    if ($1 eq $name) {
		die "$f:$i: Syscall multiply defined (", $num, ")\n" if ($num !=3D -1);
		print STDERR "$f:$i: Syscall already exists (", $2, ")\n";
		$num =3D $2;
	    }
	}
    }

    die "$f: error: Can't find __NR_syscalls\n" if ($nr =3D=3D -1);

    if ($num =3D=3D -1) {
	# Update the last syscall number
	$num =3D $nr;
	print "Allocating syscall number ", $num, "\n";
	$lines->[$j] =3D "#define __NR_syscalls " . ($nr + 1);

	# Rewind to the last syscall number definition
	while ($j--, $j >=3D 0 && $lines->[$j] eq "") {}
	die "$f:$j: error: Expecting #undef __NR_syscalls\n"
	    unless ($lines->[$j] =3D~ /^#undef\s+__NR_syscalls/);
	while ($j--, $j >=3D 0 && $lines->[$j] eq "") {}
	die "$f:%j: error: Expecting __SYSCALL or __SC_COMP\n"
	    unless ($lines->[$j] =3D~ /^(__SYSCALL|__SC_COMP|__SC_3264|__SC_COMP_=
3264)/);
	if ($lines->[$j - 1] =3D~ /^#define __NR_([a-zA-Z0-9_]+) ([0-9]+)/) {
	    die "$f:$j: error: Incorrect syscall number ($2 !=3D $num)\n"
		if ($2 !=3D $num - 1);
	} else {
	    die "$f:$j: error: Expecting #define __NR_*\n";
	}
	$j++;

	# Insert the new syscall number
	if ($compat =3D=3D 0) {
	    splice(@{$lines}, $j, 0,
		   ( "#define __NR_$name $num",
		     "__SYSCALL(__NR_$name, sys_$name)" ));
	} elsif ($compat =3D=3D 1) {
	    splice(@{$lines}, $j, 0,
		   ( "#define __NR_$name $num",
		     "__SC_COMP(__NR_$name, sys_$name, compat_sys_$name)" ));
	} else {
	    die;
	}

	write_file($f, $lines);
    }

    return $num;
}

##########################################################################=
#####
#
# Add tabs to a string to pad it out
#
##########################################################################=
#####
sub tab_to($$)
{
    my ($s, $width) =3D @_;

    if ($width =3D=3D 8) {
	return $s . "\t";
    } elsif ($width =3D=3D 16) {
	return $s . "\t" if (length($s) > 7);
	return $s . "\t\t";
    } elsif ($width =3D=3D 24) {
	return $s . "\t" if (length($s) > 15);
	return $s . "\t\t" if (length($s) > 7);
	return $s . "\t\t\t";
    } elsif ($width =3D=3D 32) {
	return $s . "\t" if (length($s) > 23);
	return $s . "\t\t" if (length($s) > 15);
	return $s . "\t\t\t" if (length($s) > 7);
	return $s . "\t\t\t\t";
    } else {
	die "Width $width\n";
    }
}

##########################################################################=
#####
#
# Tabulate a table line appropriately.
#
##########################################################################=
#####
sub tabulate($$)
{
    my ($l, $widths) =3D @_;
    my @bits =3D split(/\s+/, $l);

    my $rl =3D tab_to($bits[0], $widths->[0]);	# Syscall number
    $rl .=3D tab_to($bits[1], $widths->[1]);	# Syscall type
    $rl .=3D tab_to($bits[2], $widths->[2]);	# Syscall name

    # Add the syscall handlers
    if ($#bits =3D=3D 3) {
	$rl .=3D $bits[3];
    } elsif ($#bits =3D=3D 4) {
	$rl .=3D tab_to($bits[3], $widths->[3]);
	$rl .=3D $bits[4];
    } elsif ($#bits =3D=3D 5) {
	$rl .=3D tab_to($bits[3], $widths->[4]);
	$rl .=3D tab_to($bits[4], $widths->[5]);
	$rl .=3D $bits[5];
    } else {
	die "Too many handlers\n";
    }
}

##########################################################################=
#####
#
# Add a new syscall to a syscall.tbl file.
#
##########################################################################=
#####
sub add_to_table($$$)
{
    my ($name, $num, $table) =3D @_;
    my $f =3D $table->{file};
    my $pattern =3D $table->{pattern};
    my $widths =3D $table->{widths} ? $table->{widths} : [ 8, 8, 32, 32, 3=
2 ];
    my $lines =3D read_file($f);
    my $i;
    my $j =3D -1;

    $num +=3D $table->{num_offset} if (exists $table->{num_offset});

    for ($i =3D 0; $i <=3D $#{$lines}; $i++) {
	my $l =3D $lines->[$i];
	my @bits =3D split(/\s+/, $l);
	next if ($#bits =3D=3D -1);
	if ($bits[0] eq $num - 1) {
	    die "$f:$i: Duplicate syscall ", $num - 1, "\n" if $j !=3D -1;
	    $j =3D $i;
	}
	if ($bits[0] eq $num) {
	    if ($bits[2] eq $name) {
		print STDERR "$f:$i: Ignoring already-added syscall ", $num, "\n";
		return;
	    }
	    die "$f:$i: Conflicting syscall ", $num, "\n";
	}
    }

    die "$f: error: Can't find syscall ", $num - 1, "\n" if ($j =3D=3D -1)=
;

    $pattern =3D~ s/%NAME/$name/g;
    $pattern =3D~ s/%NUM/$num/g;
    $pattern =3D tabulate($pattern, $widths);

    # Insert the new syscall entry after the preceding one.
    splice(@{$lines}, $j + 1, 0, ( $pattern ));

    write_file($f, $lines);
}

##########################################################################=
#####
#
# Remove a syscall from the master list.
#
##########################################################################=
#####
sub remove_from_master($)
{
    my ($name) =3D @_;
    my $f =3D $master;
    my $lines =3D read_file($f);
    my $num =3D -1;
    my $nr =3D -1;
    my $i;
    my $i_nr =3D -1;
    my $i_num =3D -1;
    my $c =3D 1;

    for ($i =3D 0; $i <=3D $#{$lines}; $i++) {
	my $l =3D $lines->[$i];
	if ($l =3D~ /^#define\s+__NR_syscalls\s+([0-9]+)/) {
	    die "$f:$i: Multiple __NR_syscalls definitions\n" if ($nr !=3D -1);
	    $nr =3D $1;
	    $i_nr =3D $i;
	}

	if ($l =3D~ /^#define\s+__NR_([a-zA-Z0-9_]+)\s+([0-9]+)/) {
	    if ($1 eq $name) {
		if ($num !=3D -1) {
		    print STDERR "$f:$i: Syscall multiply defined (", $num, ")\n"
		}
		$num =3D $2; # Remove the last instance only
		$i_num =3D $i;
	    }
	}
    }

    die "$f: error: Can't find __NR_syscalls\n" if ($i_nr =3D=3D -1);

    if ($i_num =3D=3D -1) {
	print "Syscall not found in unistd.h\n";
	return;
    }

    # If the syscall number is the last one, deallocate it
    if ($nr =3D=3D $num + 1) {
	print "Deallocating syscall number ", $num, "\n";
	$lines->[$i_nr] =3D "#define __NR_syscalls " . ($nr - 1);
    }

    # Remove the __SYSCALL or __SC_COMP line also
    if ($lines->[$i_num + 1] =3D~ /^(__SYSCALL|__SC_COMP|__SC_3264|__SC_CO=
MP_3264)[(]__NR_$name,/) {
	$c++;
	$c++ if ($lines->[$i_num + 1] =3D~ /\\$/);
    }

    splice(@{$lines}, $i_num, $c, ());
    write_file($f, $lines);
}

##########################################################################=
#####
#
# Remove a syscall from a syscall.tbl file.
#
##########################################################################=
#####
sub remove_from_table($$)
{
    my ($name, $table) =3D @_;
    my $f =3D $table->{file};
    my $lines =3D read_file($f);
    my $i;
    my $j =3D -1;

    for ($i =3D 0; $i <=3D $#{$lines}; $i++) {
	my $l =3D $lines->[$i];
	my @bits =3D split(/\s+/, $l);
	my $num =3D $bits[0];
	next if ($#bits < 2);

	if ($bits[2] eq $name) {
	    print STDERR "$f:$i: Duplicate syscall ", $num, "\n" if ($j !=3D -1);
	    $j =3D $i;
	}
    }

    if ($j =3D=3D -1) {
	print STDERR "$f: error: Can't find syscall ", $name, "\n";
	return;
    }

    # Remove the syscall entry
    splice(@{$lines}, $j, 1, ());

    write_file($f, $lines);
}

##########################################################################=
#####
#
# Remove a syscall from kernel/sys_ni.c
#
##########################################################################=
#####
sub remove_from_sys_ni($)
{
    my ($name) =3D @_;
    my $f =3D $sys_ni;
    my $lines =3D read_file($f);
    my $i;
    my $j =3D -1;

    for ($i =3D 0; $i <=3D $#{$lines}; $i++) {
	my $l =3D $lines->[$i];

	if ($l =3D~ /COND_SYSCALL[_A-Z]*[(]$name[)]/) {
	    if ($j =3D=3D -1) {
		$j =3D $i;
	    } else {
		print STDERR "$f:$i: Multiple COND_SYSCALLs\n";
	    }
	}
    }

    return if ($j =3D=3D -1);

    # Remove the COND_SYSCALL entry
    splice(@{$lines}, $j, 1, ());

    write_file($f, $lines);
}

##########################################################################=
#####
#
# Rename a syscall in the master list.
#
##########################################################################=
#####
sub rename_in_master($$)
{
    my ($name, $name2) =3D @_;
    my $f =3D $master;
    my $lines =3D read_file($f);
    my $num =3D -1;
    my $i;
    my $i_num =3D -1;

    for ($i =3D 0; $i <=3D $#{$lines}; $i++) {
	my $l =3D $lines->[$i];
	if ($l =3D~ /^#define\s+__NR_([a-zA-Z0-9_]+)\s+([0-9]+)/) {
	    if ($1 eq $name) {
		if ($num !=3D -1) {
		    print STDERR "$f:$i: Syscall multiply defined (", $num, ")\n"
		}
		$num =3D $2; # Rename the last instance only
		$i_num =3D $i;
	    }
	}
    }

    if ($i_num =3D=3D -1) {
	print "Syscall not found in unistd.h\n";
	return;
    }

    # Rename the __SYSCALL or __SC_COMP line also
    $lines->[$i_num] =3D~ s/$name/$name2/g;
    if ($lines->[$i_num + 1] =3D~ /^(__SYSCALL|__SC_COMP|__SC_3264|__SC_CO=
MP_3264)[(]__NR_$name,/) {
	$lines->[$i_num + 1] =3D~ s/$name/$name2/g;
	$lines->[$i_num + 2] =3D~ s/$name/$name2/g if ($lines->[$i_num + 1] =3D~ =
/\\$/);
    }

    write_file($f, $lines);
}

##########################################################################=
#####
#
# Rename a syscall in a syscall.tbl file.
#
##########################################################################=
#####
sub rename_in_table($$$)
{
    my ($name, $name2, $table) =3D @_;
    my $f =3D $table->{file};
    my $pattern =3D $table->{pattern};
    my $widths =3D $table->{widths} ? $table->{widths} : [ 8, 8, 32, 32, 3=
2 ];
    my $lines =3D read_file($f);
    my $i;
    my $j =3D -1;

    for ($i =3D 0; $i <=3D $#{$lines}; $i++) {
	my $l =3D $lines->[$i];
	my @bits =3D split(/\s+/, $l);
	my $num =3D $bits[0];
	next if ($#bits < 2);

	if ($bits[2] eq $name) {
	    print STDERR "$f:$i: Duplicate syscall ", $num, "\n" if ($j !=3D -1);
	    $j =3D $i;
	}
    }

    if ($j =3D=3D -1) {
	print STDERR "$f: error: Can't find syscall ", $name, "\n";
	return;
    }

    # Rename the syscall entry
    my $l =3D $lines->[$j];
    $l =3D~ s/$name/$name2/g;
    $lines->[$j] =3D $pattern =3D tabulate($l, $widths);

    write_file($f, $lines);
}

##########################################################################=
#####
#
# Rename a syscall in kernel/sys_ni.c
#
##########################################################################=
#####
sub rename_in_sys_ni($$)
{
    my ($name, $name2) =3D @_;
    my $f =3D $sys_ni;
    my $lines =3D read_file($f);
    my $changed =3D 0;
    my $i;

    for ($i =3D 0; $i <=3D $#{$lines}; $i++) {
	my $l =3D $lines->[$i];

	if ($l =3D~ /COND_SYSCALL[_A-Z]*[(]$name[)]/) {
	    $lines->[$i] =3D~ s/$name/$name2/;
	    $changed =3D 1;
	}
    }

    write_file($f, $lines) if ($changed);
}

##########################################################################=
#####
#
# Resolve git-conflicted syscalls in the master list.
#
##########################################################################=
#####
sub resolve_conflicts_in_master()
{
    my $f =3D $master;
    my $lines =3D read_file($f);
    my $nr =3D -1;
    my $i;
    my $i_nr =3D -1;
    my $begin =3D -1;
    my $mid =3D -1;
    my $end =3D -1;
    my $in_section =3D 0;
    my $nr_in_section =3D 0;
    my %conflict_list =3D ();

    for ($i =3D 0; $i <=3D $#{$lines}; $i++) {
	my $l =3D $lines->[$i];

	if ($l =3D~ /^#define\s+__NR_syscalls\s+([0-9]+)/) {
	    if ($in_section =3D=3D 0) {
		# Before '<<<<<<<'
		die "$f:$i: Multiple __NR_syscalls definitions\n[s=3D$in_section inr=3D$=
i_nr nis=3D$nr_in_section]\n"
		    unless ($i_nr =3D=3D -1);
		$nr =3D $1;
		$i_nr =3D $i;
		$nr_in_section =3D 4;
	    } elsif ($in_section =3D=3D 1 && $nr_in_section =3D=3D 0) {
		# After '<<<<<<<'
		$nr =3D $1;
		$i_nr =3D $i;
		$nr_in_section =3D 1;
	    } elsif ($in_section =3D=3D 2 && $nr_in_section =3D=3D 1) {
		# After '=3D=3D=3D=3D=3D=3D=3D'
		$i_nr =3D $i;
		$nr_in_section =3D 2;
	    } elsif ($in_section =3D=3D 3 && $nr_in_section =3D=3D 0) {
		# After '>>>>>>>'
		$nr =3D $1;
		$i_nr =3D $i;
		$nr_in_section =3D 3;
	    } else {
		die "$f:$i: Multiple __NR_syscalls definitions\n[s=3D$in_section inr=3D$=
i_nr nis=3D$nr_in_section]\n";
	    }
	    next;
	}
	next if ($in_section =3D=3D 3);

	if ($l =3D~ /^<<<<<<</) {
	    $begin =3D $i;
	    $in_section =3D 1;
	    next;
	}
	if ($l =3D~ /^=3D=3D=3D=3D=3D=3D=3D/) {
	    $mid =3D $i;
	    $in_section =3D 2;
	    next;
	}
	if ($l =3D~ /^>>>>>>>/) {
	    $end =3D $i;
	    $in_section =3D 3;
	    next;
	}
	next if ($in_section =3D=3D 0);
    }

    die "$f: error: Can't find __NR_syscalls\n" if ($i_nr =3D=3D -1);

    # Analyse the pre-merge syscalls.
    my $top =3D -1;
    my $stop =3D ($begin =3D=3D -1) ? $#{$lines} : $begin;
    for ($i =3D 0; $i < $stop; $i++) {
	my $l =3D $lines->[$i];

	if ($l =3D~ /^#define\s+__NR_([a-zA-Z0-9_]+)\s+([0-9]+)/) {
	    my $name =3D $1;
	    my $num =3D $2;
	    next if ($name eq "syscalls");
	    die "$f:$i: Redefinition of $name\n" if (exists($conflict_list{$name}=
));
	    die "$f:$i: Number regression\n" if ($num < $top);
	    $top =3D $num;
	    $conflict_list{$name} =3D $num;
	    #print "Keep __NR_", $name, " as ", $num, "\n";
	}
    }

    if ($in_section =3D=3D 0) {
	print "$f: Couldn't find section to be resolved\n";
	return \%conflict_list;
    }

    # Analyse what we're merging into.
    for ($i =3D $begin + 1; $i < $mid; $i++) {
	my $l =3D $lines->[$i];

	if ($l =3D~ /^#define\s+__NR_([a-zA-Z0-9_]+)\s+([0-9]+)/) {
	    my $name =3D $1;
	    my $num =3D $2;
	    next if ($name eq "syscalls");
	    die "$f:$i: Redefinition of $name\n" if (exists($conflict_list{$name}=
));
	    die "$f:$i: Number regression\n" if ($num < $top);
	    $top =3D $num;
	    $conflict_list{$name} =3D $num;
	    print "Keep __NR_", $name, " as ", $num, "\n";
	}
    }

    die "$f: Last number (", $top, ") different to limit-1 (", $nr - 1, ")=
\n"
	if ($top !=3D -1 && $top !=3D $nr - 1);

    # Renumber what we're merging in.
    for ($i =3D $mid + 1; $i < $end; $i++) {
	my $l =3D $lines->[$i];

	if ($l =3D~ /^#define\s+__NR_([a-zA-Z0-9_]+)\s+([0-9]+)/) {
	    my $name =3D $1;
	    my $num =3D $2;
	    next if ($name eq "syscalls");
	    if (exists($conflict_list{$name})) {
		warn "$f:$i: Definition of $name in both branches\n";
		# Remove the duplicate
		splice(@{$lines}, $i, 2, ());
		$end -=3D 2;
		$i--;
		next;
	    }
	    my $new =3D $nr;
	    $conflict_list{$name} =3D $new;
	    $l =3D~ s/(\s)$num/${1}$new/;
	    print "Reassign __NR_", $name, " to ", $new, "\n";
	    $lines->[$i] =3D $l;
	    $nr++;
	}
    }

    # Adjust __NR_syscalls
    if ($lines->[$i_nr] =3D~ /^#define\s+__NR_syscalls\s+([0-9]+)/) {
	my $num =3D $1;
	$lines->[$i_nr] =3D~ s/(\s)$num/${1}$nr/;
	print "__NR_syscalls set to $nr\n";
    }

    # Delete various bits, starting with the highest index and working tow=
ards
    # the lowest so as not to displace the higher indices.
    splice(@{$lines}, $end, 1, ());
    splice(@{$lines}, $mid, 1, ());
    for ($i =3D $mid - 1; $i > $begin; $i--) {
	my $l =3D $lines->[$i];

	splice(@{$lines}, $i, 1, ()) if ($l =3D~ /^#undef\s+__NR_syscalls\s*$/);
	splice(@{$lines}, $i, 1, ()) if ($l =3D~ /^#define\s+__NR_syscalls\s+([0-=
9]+)/);
	splice(@{$lines}, $i, 1, ()) if ($l =3D~ /^$/);
    }
    splice(@{$lines}, $begin, 1, ());

    write_file($f, $lines);

    return \%conflict_list;
}

##########################################################################=
#####
#
# Resolve git-conflicted syscalls in a syscall.tbl file.
#
##########################################################################=
#####
sub resolve_conflicts_in_table($$)
{
    my ($conflict_list, $table) =3D @_;
    my $f =3D $table->{file};
    my $lines =3D read_file($f);
    my $i;
    my $begin =3D -1;
    my $mid =3D -1;
    my $end =3D -1;
    my $in_section =3D 0;

    for ($i =3D 0; $i <=3D $#{$lines}; $i++) {
	my $l =3D $lines->[$i];

	if ($l =3D~ /^<<<<<<</) {
	    $begin =3D $i;
	    $in_section =3D 1;
	    next;
	}
	if ($l =3D~ /^=3D=3D=3D=3D=3D=3D=3D/) {
	    $mid =3D $i;
	    $in_section =3D 2;
	    next;
	}
	if ($l =3D~ /^>>>>>>>/) {
	    $end =3D $i;
	    $in_section =3D 3;
	    last;
	}
	next if ($in_section =3D=3D 0);
    }

    if ($in_section =3D=3D 0) {
	print "$f: Couldn't find section to be resolved\n";
	return;
    }

    my %used =3D ();
    for ($i =3D $begin + 1; $i < $mid; $i++) {
	my $l =3D $lines->[$i];
	next unless ($l =3D~ /^[0-9]/);
	my @bits =3D split(/\s+/, $l);
	my $num =3D $bits[0];
	my $name =3D $bits[2];
	next if ($#bits < 2);

	die "$f:$i: Undefined (my) syscall '", $name, "'\n"
	    unless (exists($conflict_list->{$name}));

	my $new =3D $conflict_list->{$name};
	$new +=3D $table->{num_offset} ? $table->{num_offset} : 0;
	die "$f:$i: Redefined (my) syscall '", $name, "'\n" if (exists($used{$nam=
e}));
	$used{$name} =3D 1;
	next if ($num =3D=3D $new);
    }

    for ($i =3D $mid + 1; $i < $end; $i++) {
	my $l =3D $lines->[$i];
	next unless ($l =3D~ /^[0-9]/);
	my @bits =3D split(/\s+/, $l);
	my $num =3D $bits[0];
	next if ($#bits < 2);
	my $name =3D $bits[2];

	die "$f:$i: Undefined (other) syscall '", $name, "'\n"
	    unless (exists($conflict_list->{$name}));

	my $new =3D $conflict_list->{$name};
	$new +=3D $table->{num_offset} ? $table->{num_offset} : 0;
	if (exists($used{$name})) {
	    warn "$f:$i: Redefined (other) syscall '", $name, "'\n";
	    splice(@{$lines}, $i, 1, ());
	    $i--;
	    $end--;
	    next;
	}
	$used{$name} =3D 1;
	next if ($num =3D=3D $new);
	$lines->[$i] =3D~ s/^$num/$new/;
    }

    # Delete the git markers, starting with the highest index and working
    # towards the lowest so as not to displace the higher indices.
    splice(@{$lines}, $end, 1, ());
    splice(@{$lines}, $mid, 1, ());
    splice(@{$lines}, $begin, 1, ());

    #print $_, "\n" foreach (@{$lines});
    #exit(88);
    =

    write_file($f, $lines);
}

##########################################################################=
#####
#
# Renumber the syscall numbers in the master list that are between 424 and
# __NR_syscalls and reduce __NR_syscalls.
#
##########################################################################=
#####
sub renumber_master()
{
    my $f =3D $master;
    my $lines =3D read_file($f);
    my $nr =3D -1;
    my $next =3D $common_base;
    my $i;
    my $i_nr =3D -1;
    my %num_list =3D ();

    # Find the __NR_syscalls value.
    for ($i =3D 0; $i <=3D $#{$lines}; $i++) {
	my $l =3D $lines->[$i];
	if ($l =3D~ /^#define\s+__NR_syscalls\s+([0-9]+)/) {
	    die "$f:$i: Redefinition of __NR_syscalls\n" if ($i_nr !=3D -1);
	    $nr =3D $1;
	    $i_nr =3D $i;
	}
    }
    die "$f: error: Can't find __NR_syscalls\n" if ($i_nr =3D=3D -1);

    # Renumber the definitions.
    for ($i =3D 0; $i <=3D $#{$lines}; $i++) {
	my $l =3D $lines->[$i];
	if ($l =3D~ /^#define\s+__NR_([a-zA-Z0-9_]+)\s+([0-9]+)/) {
	    my $name =3D $1;
	    my $num =3D $2;

	    next if ($num < $common_base || $num >=3D $nr);
	    if ($num !=3D $next) {
		print "Renumber ", $name, " from ", $num, " to ", $next, "\n";
		$lines->[$i] =3D~ s/(\s)$num/${1}$next/;
		$num_list{$name} =3D $next;
	    }

	    $next++;
	}
    }

    # Adjust __NR_syscalls
    $lines->[$i_nr] =3D~ s/(\s)$nr/${1}$next/;
    print "__NR_syscalls set to $next\n";

    write_file($f, $lines);
    return \%num_list;
}

##########################################################################=
#####
#
# Renumber the syscall numbers in a syscall.tbl file to match the master.
#
##########################################################################=
#####
sub renumber_table($$)
{
    my ($num_list, $table) =3D @_;
    my $f =3D $table->{file};
    my $lines =3D read_file($f);
    my $i;

    for ($i =3D 0; $i <=3D $#{$lines}; $i++) {
	my $l =3D $lines->[$i];
	my @bits =3D split(/\s+/, $l);
	next if ($#bits < 2);
	my $num =3D $bits[0];
	my $name =3D $bits[2];

	next unless (exists($num_list->{$name}));
	my $new =3D $num_list->{$name};
	$new +=3D $table->{num_offset} ? $table->{num_offset} : 0;
	next if ($num eq $new);

	$lines->[$i] =3D~ s/^$num/$new/;
    }

    write_file($f, $lines);
}

##########################################################################=
#####
#
# Change a syscall in a syscall.tbl file.
#
##########################################################################=
#####
sub change_in_table($$$)
{
    my ($name, $to_id, $table) =3D @_;
    my $f =3D $table->{file};
    my $pattern =3D $table->{pattern};
    my $widths =3D $table->{widths} ? $table->{widths} : [ 8, 8, 32, 32, 3=
2 ];
    my $old_id =3D "";
    my $lines =3D read_file($f);
    my $i;
    my $j =3D -1;

    for ($i =3D 0; $i <=3D $#{$lines}; $i++) {
	my $l =3D $lines->[$i];
	my @bits =3D split(/\s+/, $l);
	next if ($#bits < 2);
	my $num =3D $bits[0];

	if ($bits[2] eq $name) {
	    print STDERR "$f:$i: Duplicate syscall ", $num, "\n" if ($j !=3D -1);
	    $j =3D $i;
	    $old_id =3D $bits[0];
	}
    }

    if ($j =3D=3D -1) {
	print STDERR "$f: error: Can't find syscall ", $name, "\n";
	return;
    }

    if ($old_id eq "") {
	print STDERR "$f: error: Can't find syscall number ", $name, "\n";
	return;
    }

    # Rename the syscall entry
    my $l =3D $lines->[$j];
    $l =3D~ s/^$old_id/$to_id/g;
    $lines->[$j] =3D $pattern =3D tabulate($l, $widths);

    write_file($f, $lines);
}

##########################################################################=
#####
#
# Decide what to do based on the script parameters
#
##########################################################################=
#####
sub format_error()
{
    print("Format: syscall-manage.pl --add <name> [--compat]\n");
    print("                          --change <name> <to-id>\n");
    print("                          --rm <name>\n");
    print("                          --rename <name>\n");
    print("                          --renumber\n");
    print("                          --resolve\n");
    exit(2);
}

format_error() if ($#ARGV < 0);

if ($ARGV[0] eq "--add") {
    format_error() if ($#ARGV < 1);

    my $name =3D $ARGV[1];
    my $compat =3D 0;
    $compat =3D 1 if ($#ARGV =3D=3D 2 && $ARGV[2] eq "--compat");

    my $num =3D add_to_master($name, $compat);
    foreach my $table (@tables) {
	next if (exists($table->{compat}) && $compat !=3D $table->{compat});
	add_to_table($name, $num, $table);
    }
} elsif ($ARGV[0] eq "--change") {
    format_error() if ($#ARGV < 2);

    my $name =3D $ARGV[1];
    my $to_id =3D $ARGV[2];
    foreach (@tables) {
	change_in_table($name, $to_id, $_);
    }
} elsif ($ARGV[0] eq "--rm") {
    format_error() if ($#ARGV < 1);

    my $name =3D $ARGV[1];
    remove_from_master($name);
    foreach (@tables) {
	remove_from_table($name, $_);
    }
    remove_from_sys_ni($name);
} elsif ($ARGV[0] eq "--rename") {
    format_error() if ($#ARGV < 2);

    my $name =3D $ARGV[1];
    my $name2 =3D $ARGV[2];
    rename_in_master($name, $name2);
    foreach (@tables) {
	rename_in_table($name, $name2, $_);
    }
    rename_in_sys_ni($name, $name2);
} elsif ($ARGV[0] eq "--resolve") {
    my $conflict_list =3D resolve_conflicts_in_master();
    foreach (@tables) {
	resolve_conflicts_in_table($conflict_list, $_);
    }
} elsif ($ARGV[0] eq "--renumber") {
    my $num_list =3D renumber_master();
    foreach (@tables) {
	renumber_table($num_list, $_);
    }
} else {
    format_error();
}

