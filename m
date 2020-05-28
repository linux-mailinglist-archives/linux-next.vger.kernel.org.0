Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54B5A1E5B0B
	for <lists+linux-next@lfdr.de>; Thu, 28 May 2020 10:40:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727087AbgE1IkV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 May 2020 04:40:21 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:44361 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727073AbgE1IkU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 28 May 2020 04:40:20 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49Xh3Q3K6Hz9sSF;
        Thu, 28 May 2020 18:40:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590655218;
        bh=wO3NskDLpZeHuNtSC42KFVH0uq3U1oRYDbLRIkMPWRQ=;
        h=Date:From:To:Cc:Subject:From;
        b=t+d+xHOjVSdLqDDJYSZpk8/2E+5C3on4VKPdbOfJ/MtVhdcdUthImDhrhtSqsGKcf
         6vkoz3giFoIN8wTO/ACaST8FhuSZVkKWukrwAaAPHUTIIteAWG7c36qjM+ruhP6qmF
         S5RZpqJP3souYdeXDG5h50iG/RKPUs81kytUWE418M98P5atZptZ3s4rULQ3QZojxW
         sIxtPhXpQA5UHaSs+V3Hpv1fKhWXHMbpw4QidYSCY75E+AbgyFJXROO9wTFeYYDlB0
         fjiAj4RDrJ3Fouv3KK52mtoA8dBNhO1S4g1me6OTra2oPuWICDS/VCb7eQ8CHqjvBd
         dXk3NKikl14qg==
Date:   Thu, 28 May 2020 18:40:17 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>
Subject: linux-next: build warnings after merge of the fsinfo tree
Message-ID: <20200528184017.503eeff1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UTjhKZL0bHIhV5N+5c7j6Xj";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/UTjhKZL0bHIhV5N+5c7j6Xj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the fsinfo tree, today's linux-next build (x86_64
allnoconfig) produced these warnings:

In file included from kernel/sched/sched.h:39,
                 from kernel/sched/loadavg.c:9:
include/linux/blkdev.h:1895:41: warning: 'struct gendisk' declared inside p=
arameter list will not be visible outside of this definition or declaration
 1895 | unsigned long disk_start_io_acct(struct gendisk *disk, unsigned int=
 sectors,
      |                                         ^~~~~~~
include/linux/blkdev.h:1897:30: warning: 'struct gendisk' declared inside p=
arameter list will not be visible outside of this definition or declaration
 1897 | void disk_end_io_acct(struct gendisk *disk, unsigned int op,
      |                              ^~~~~~~
In file included from fs/super.c:26:
include/linux/blkdev.h:1895:41: warning: 'struct gendisk' declared inside p=
arameter list will not be visible outside of this definition or declaration
 1895 | unsigned long disk_start_io_acct(struct gendisk *disk, unsigned int=
 sectors,
      |                                         ^~~~~~~
include/linux/blkdev.h:1897:30: warning: 'struct gendisk' declared inside p=
arameter list will not be visible outside of this definition or declaration
 1897 | void disk_end_io_acct(struct gendisk *disk, unsigned int op,
      |                              ^~~~~~~
In file included from kernel/sched/sched.h:39,
                 from kernel/sched/clock.c:56:
include/linux/blkdev.h:1895:41: warning: 'struct gendisk' declared inside p=
arameter list will not be visible outside of this definition or declaration
 1895 | unsigned long disk_start_io_acct(struct gendisk *disk, unsigned int=
 sectors,
      |                                         ^~~~~~~
include/linux/blkdev.h:1897:30: warning: 'struct gendisk' declared inside p=
arameter list will not be visible outside of this definition or declaration
 1897 | void disk_end_io_acct(struct gendisk *disk, unsigned int op,
      |                              ^~~~~~~
In file included from kernel/sched/sched.h:39,
                 from kernel/sched/idle.c:9:
include/linux/blkdev.h:1895:41: warning: 'struct gendisk' declared inside p=
arameter list will not be visible outside of this definition or declaration
 1895 | unsigned long disk_start_io_acct(struct gendisk *disk, unsigned int=
 sectors,
      |                                         ^~~~~~~
include/linux/blkdev.h:1897:30: warning: 'struct gendisk' declared inside p=
arameter list will not be visible outside of this definition or declaration
 1897 | void disk_end_io_acct(struct gendisk *disk, unsigned int op,
      |                              ^~~~~~~
In file included from kernel/sched/sched.h:39,
                 from kernel/sched/cputime.c:5:
include/linux/blkdev.h:1895:41: warning: 'struct gendisk' declared inside p=
arameter list will not be visible outside of this definition or declaration
 1895 | unsigned long disk_start_io_acct(struct gendisk *disk, unsigned int=
 sectors,
      |                                         ^~~~~~~
include/linux/blkdev.h:1897:30: warning: 'struct gendisk' declared inside p=
arameter list will not be visible outside of this definition or declaration
 1897 | void disk_end_io_acct(struct gendisk *disk, unsigned int op,
      |                              ^~~~~~~
In file included from kernel/sched/sched.h:39,
                 from kernel/sched/rt.c:6:
include/linux/blkdev.h:1895:41: warning: 'struct gendisk' declared inside p=
arameter list will not be visible outside of this definition or declaration
 1895 | unsigned long disk_start_io_acct(struct gendisk *disk, unsigned int=
 sectors,
      |                                         ^~~~~~~
include/linux/blkdev.h:1897:30: warning: 'struct gendisk' declared inside p=
arameter list will not be visible outside of this definition or declaration
 1897 | void disk_end_io_acct(struct gendisk *disk, unsigned int op,
      |                              ^~~~~~~
In file included from kernel/sched/sched.h:39,
                 from kernel/sched/core.c:9:
include/linux/blkdev.h:1895:41: warning: 'struct gendisk' declared inside p=
arameter list will not be visible outside of this definition or declaration
 1895 | unsigned long disk_start_io_acct(struct gendisk *disk, unsigned int=
 sectors,
      |                                         ^~~~~~~
include/linux/blkdev.h:1897:30: warning: 'struct gendisk' declared inside p=
arameter list will not be visible outside of this definition or declaration
 1897 | void disk_end_io_acct(struct gendisk *disk, unsigned int op,
      |                              ^~~~~~~
In file included from kernel/sched/sched.h:39,
                 from kernel/sched/swait.c:5:
include/linux/blkdev.h:1895:41: warning: 'struct gendisk' declared inside p=
arameter list will not be visible outside of this definition or declaration
 1895 | unsigned long disk_start_io_acct(struct gendisk *disk, unsigned int=
 sectors,
      |                                         ^~~~~~~
include/linux/blkdev.h:1897:30: warning: 'struct gendisk' declared inside p=
arameter list will not be visible outside of this definition or declaration
 1897 | void disk_end_io_acct(struct gendisk *disk, unsigned int op,
      |                              ^~~~~~~
In file included from kernel/sched/sched.h:39,
                 from kernel/sched/wait_bit.c:5:
include/linux/blkdev.h:1895:41: warning: 'struct gendisk' declared inside p=
arameter list will not be visible outside of this definition or declaration
 1895 | unsigned long disk_start_io_acct(struct gendisk *disk, unsigned int=
 sectors,
      |                                         ^~~~~~~
include/linux/blkdev.h:1897:30: warning: 'struct gendisk' declared inside p=
arameter list will not be visible outside of this definition or declaration
 1897 | void disk_end_io_acct(struct gendisk *disk, unsigned int op,
      |                              ^~~~~~~
In file included from kernel/sched/sched.h:39,
                 from kernel/sched/fair.c:23:
include/linux/blkdev.h:1895:41: warning: 'struct gendisk' declared inside p=
arameter list will not be visible outside of this definition or declaration
 1895 | unsigned long disk_start_io_acct(struct gendisk *disk, unsigned int=
 sectors,
      |                                         ^~~~~~~
include/linux/blkdev.h:1897:30: warning: 'struct gendisk' declared inside p=
arameter list will not be visible outside of this definition or declaration
 1897 | void disk_end_io_acct(struct gendisk *disk, unsigned int op,
      |                              ^~~~~~~
In file included from kernel/sched/sched.h:39,
                 from kernel/sched/wait.c:7:
include/linux/blkdev.h:1895:41: warning: 'struct gendisk' declared inside p=
arameter list will not be visible outside of this definition or declaration
 1895 | unsigned long disk_start_io_acct(struct gendisk *disk, unsigned int=
 sectors,
      |                                         ^~~~~~~
include/linux/blkdev.h:1897:30: warning: 'struct gendisk' declared inside p=
arameter list will not be visible outside of this definition or declaration
 1897 | void disk_end_io_acct(struct gendisk *disk, unsigned int op,
      |                              ^~~~~~~
In file included from kernel/sched/sched.h:39,
                 from kernel/sched/deadline.c:18:
include/linux/blkdev.h:1895:41: warning: 'struct gendisk' declared inside p=
arameter list will not be visible outside of this definition or declaration
 1895 | unsigned long disk_start_io_acct(struct gendisk *disk, unsigned int=
 sectors,
      |                                         ^~~~~~~
include/linux/blkdev.h:1897:30: warning: 'struct gendisk' declared inside p=
arameter list will not be visible outside of this definition or declaration
 1897 | void disk_end_io_acct(struct gendisk *disk, unsigned int op,
      |                              ^~~~~~~
In file included from kernel/sched/sched.h:39,
                 from kernel/sched/completion.c:14:
include/linux/blkdev.h:1895:41: warning: 'struct gendisk' declared inside p=
arameter list will not be visible outside of this definition or declaration
 1895 | unsigned long disk_start_io_acct(struct gendisk *disk, unsigned int=
 sectors,
      |                                         ^~~~~~~
include/linux/blkdev.h:1897:30: warning: 'struct gendisk' declared inside p=
arameter list will not be visible outside of this definition or declaration
 1897 | void disk_end_io_acct(struct gendisk *disk, unsigned int op,
      |                              ^~~~~~~
In file included from fs/libfs.c:7:
include/linux/blkdev.h:1895:41: warning: 'struct gendisk' declared inside p=
arameter list will not be visible outside of this definition or declaration
 1895 | unsigned long disk_start_io_acct(struct gendisk *disk, unsigned int=
 sectors,
      |                                         ^~~~~~~
include/linux/blkdev.h:1897:30: warning: 'struct gendisk' declared inside p=
arameter list will not be visible outside of this definition or declaration
 1897 | void disk_end_io_acct(struct gendisk *disk, unsigned int op,
      |                              ^~~~~~~

Introduced by commit

  956d510ee78c ("block: add disk/bio-based accounting helpers")

--=20
Cheers,
Stephen Rothwell

--Sig_/UTjhKZL0bHIhV5N+5c7j6Xj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7PePEACgkQAVBC80lX
0GzMrQf/YF1YgzbAkk9eUnY3sy3/Vado4S6G4q7fdbgEbUPvLMMfkJfscjpjuG41
x3eNNpAHgsIUfsY4PqmN9/uIMW5jO0fBfJkavsHlieTlpKieARRDs7mkctvAuzRH
hQgZNgMKsD/IQ381u8/6nlT/cGTZnwcz5k33qmRvWR94DMfvimuBRKIAut5nrWY5
Mmd91WTr40UsxkA+ou/C1A/RWDZ2xEi4FLfgG2HCxfZU/kmKvjlSeWgHV7JHwOnN
VpjBWwW+tgv6ueHHvzqYejP+3EUw8UGOWTx6zJIz/sVrSuiBisabiuqtPoQOVsNM
QaVC3UiGdMin9FRD7xl1pClrzssb9g==
=Dd2x
-----END PGP SIGNATURE-----

--Sig_/UTjhKZL0bHIhV5N+5c7j6Xj--
