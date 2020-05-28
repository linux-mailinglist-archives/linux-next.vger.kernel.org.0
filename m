Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF6681E5CBB
	for <lists+linux-next@lfdr.de>; Thu, 28 May 2020 12:11:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387646AbgE1KLI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 May 2020 06:11:08 -0400
Received: from ozlabs.org ([203.11.71.1]:57523 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387597AbgE1KLI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 28 May 2020 06:11:08 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49Xk493qnYz9sRY;
        Thu, 28 May 2020 20:11:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590660665;
        bh=yZu8pTsXoAWViGOtEIA+R1ZbKI/20ZYajI2a+UN95uY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=G3kqC6DxS1EStmmlfs8rzkQsmtMwNNcHsv3oSftU7flTgHf85kCQICF/fopP8sJfB
         7s3/NpBWc1Ik4nILKfPLty65ujK3RmYzEMOndeqkuPzLkfU1bZpepdGfKOjEWx0OFu
         y0izXMNkF/SMPHVsk3hNYYDGhtLS2ShSEhc5JrYsdKMZUQ2WWSCBKNQsr80bxlT/HF
         yLb7a03ITHz8b2ZVuEciBl4uLhoNm5gD5iX+ogQl8pcSaE5XRiqEi7demX6+7IKuXi
         hQCNtPX2qhgCsZksz4GSpVsDh5wAjET/lJrnhAQgCQtP6ZQCyBpMJcyxSqZQnNXHLC
         h7mziLt/fgbGw==
Date:   Thu, 28 May 2020 20:11:04 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     David Howells <dhowells@redhat.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: build warnings after merge of the fsinfo tree
Message-ID: <20200528201104.529e9bc5@canb.auug.org.au>
In-Reply-To: <20200528184017.503eeff1@canb.auug.org.au>
References: <20200528184017.503eeff1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4Z.oOHNM+uviI+HlVvjYIS8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/4Z.oOHNM+uviI+HlVvjYIS8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

This should have been the block tree, not the fsinfo tree, of course.

On Thu, 28 May 2020 18:40:17 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the fsinfo tree, today's linux-next build (x86_64
> allnoconfig) produced these warnings:
>=20
> In file included from kernel/sched/sched.h:39,
>                  from kernel/sched/loadavg.c:9:
> include/linux/blkdev.h:1895:41: warning: 'struct gendisk' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
>  1895 | unsigned long disk_start_io_acct(struct gendisk *disk, unsigned i=
nt sectors,
>       |                                         ^~~~~~~
> include/linux/blkdev.h:1897:30: warning: 'struct gendisk' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
>  1897 | void disk_end_io_acct(struct gendisk *disk, unsigned int op,
>       |                              ^~~~~~~
> In file included from fs/super.c:26:
> include/linux/blkdev.h:1895:41: warning: 'struct gendisk' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
>  1895 | unsigned long disk_start_io_acct(struct gendisk *disk, unsigned i=
nt sectors,
>       |                                         ^~~~~~~
> include/linux/blkdev.h:1897:30: warning: 'struct gendisk' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
>  1897 | void disk_end_io_acct(struct gendisk *disk, unsigned int op,
>       |                              ^~~~~~~
> In file included from kernel/sched/sched.h:39,
>                  from kernel/sched/clock.c:56:
> include/linux/blkdev.h:1895:41: warning: 'struct gendisk' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
>  1895 | unsigned long disk_start_io_acct(struct gendisk *disk, unsigned i=
nt sectors,
>       |                                         ^~~~~~~
> include/linux/blkdev.h:1897:30: warning: 'struct gendisk' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
>  1897 | void disk_end_io_acct(struct gendisk *disk, unsigned int op,
>       |                              ^~~~~~~
> In file included from kernel/sched/sched.h:39,
>                  from kernel/sched/idle.c:9:
> include/linux/blkdev.h:1895:41: warning: 'struct gendisk' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
>  1895 | unsigned long disk_start_io_acct(struct gendisk *disk, unsigned i=
nt sectors,
>       |                                         ^~~~~~~
> include/linux/blkdev.h:1897:30: warning: 'struct gendisk' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
>  1897 | void disk_end_io_acct(struct gendisk *disk, unsigned int op,
>       |                              ^~~~~~~
> In file included from kernel/sched/sched.h:39,
>                  from kernel/sched/cputime.c:5:
> include/linux/blkdev.h:1895:41: warning: 'struct gendisk' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
>  1895 | unsigned long disk_start_io_acct(struct gendisk *disk, unsigned i=
nt sectors,
>       |                                         ^~~~~~~
> include/linux/blkdev.h:1897:30: warning: 'struct gendisk' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
>  1897 | void disk_end_io_acct(struct gendisk *disk, unsigned int op,
>       |                              ^~~~~~~
> In file included from kernel/sched/sched.h:39,
>                  from kernel/sched/rt.c:6:
> include/linux/blkdev.h:1895:41: warning: 'struct gendisk' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
>  1895 | unsigned long disk_start_io_acct(struct gendisk *disk, unsigned i=
nt sectors,
>       |                                         ^~~~~~~
> include/linux/blkdev.h:1897:30: warning: 'struct gendisk' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
>  1897 | void disk_end_io_acct(struct gendisk *disk, unsigned int op,
>       |                              ^~~~~~~
> In file included from kernel/sched/sched.h:39,
>                  from kernel/sched/core.c:9:
> include/linux/blkdev.h:1895:41: warning: 'struct gendisk' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
>  1895 | unsigned long disk_start_io_acct(struct gendisk *disk, unsigned i=
nt sectors,
>       |                                         ^~~~~~~
> include/linux/blkdev.h:1897:30: warning: 'struct gendisk' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
>  1897 | void disk_end_io_acct(struct gendisk *disk, unsigned int op,
>       |                              ^~~~~~~
> In file included from kernel/sched/sched.h:39,
>                  from kernel/sched/swait.c:5:
> include/linux/blkdev.h:1895:41: warning: 'struct gendisk' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
>  1895 | unsigned long disk_start_io_acct(struct gendisk *disk, unsigned i=
nt sectors,
>       |                                         ^~~~~~~
> include/linux/blkdev.h:1897:30: warning: 'struct gendisk' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
>  1897 | void disk_end_io_acct(struct gendisk *disk, unsigned int op,
>       |                              ^~~~~~~
> In file included from kernel/sched/sched.h:39,
>                  from kernel/sched/wait_bit.c:5:
> include/linux/blkdev.h:1895:41: warning: 'struct gendisk' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
>  1895 | unsigned long disk_start_io_acct(struct gendisk *disk, unsigned i=
nt sectors,
>       |                                         ^~~~~~~
> include/linux/blkdev.h:1897:30: warning: 'struct gendisk' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
>  1897 | void disk_end_io_acct(struct gendisk *disk, unsigned int op,
>       |                              ^~~~~~~
> In file included from kernel/sched/sched.h:39,
>                  from kernel/sched/fair.c:23:
> include/linux/blkdev.h:1895:41: warning: 'struct gendisk' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
>  1895 | unsigned long disk_start_io_acct(struct gendisk *disk, unsigned i=
nt sectors,
>       |                                         ^~~~~~~
> include/linux/blkdev.h:1897:30: warning: 'struct gendisk' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
>  1897 | void disk_end_io_acct(struct gendisk *disk, unsigned int op,
>       |                              ^~~~~~~
> In file included from kernel/sched/sched.h:39,
>                  from kernel/sched/wait.c:7:
> include/linux/blkdev.h:1895:41: warning: 'struct gendisk' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
>  1895 | unsigned long disk_start_io_acct(struct gendisk *disk, unsigned i=
nt sectors,
>       |                                         ^~~~~~~
> include/linux/blkdev.h:1897:30: warning: 'struct gendisk' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
>  1897 | void disk_end_io_acct(struct gendisk *disk, unsigned int op,
>       |                              ^~~~~~~
> In file included from kernel/sched/sched.h:39,
>                  from kernel/sched/deadline.c:18:
> include/linux/blkdev.h:1895:41: warning: 'struct gendisk' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
>  1895 | unsigned long disk_start_io_acct(struct gendisk *disk, unsigned i=
nt sectors,
>       |                                         ^~~~~~~
> include/linux/blkdev.h:1897:30: warning: 'struct gendisk' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
>  1897 | void disk_end_io_acct(struct gendisk *disk, unsigned int op,
>       |                              ^~~~~~~
> In file included from kernel/sched/sched.h:39,
>                  from kernel/sched/completion.c:14:
> include/linux/blkdev.h:1895:41: warning: 'struct gendisk' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
>  1895 | unsigned long disk_start_io_acct(struct gendisk *disk, unsigned i=
nt sectors,
>       |                                         ^~~~~~~
> include/linux/blkdev.h:1897:30: warning: 'struct gendisk' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
>  1897 | void disk_end_io_acct(struct gendisk *disk, unsigned int op,
>       |                              ^~~~~~~
> In file included from fs/libfs.c:7:
> include/linux/blkdev.h:1895:41: warning: 'struct gendisk' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
>  1895 | unsigned long disk_start_io_acct(struct gendisk *disk, unsigned i=
nt sectors,
>       |                                         ^~~~~~~
> include/linux/blkdev.h:1897:30: warning: 'struct gendisk' declared inside=
 parameter list will not be visible outside of this definition or declarati=
on
>  1897 | void disk_end_io_acct(struct gendisk *disk, unsigned int op,
>       |                              ^~~~~~~
>=20
> Introduced by commit
>=20
>   956d510ee78c ("block: add disk/bio-based accounting helpers")

--=20
Cheers,
Stephen Rothwell

--Sig_/4Z.oOHNM+uviI+HlVvjYIS8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7PjjgACgkQAVBC80lX
0Gwc3wgAkIcB6H9vmuSMTq9SN0E+6uNnW1yMT4/HU6c5TVmcZnl2tBg3Sy0SP7UH
bFS/AR4WLXkECZDgBIis2UO3SqPiZ6r4YZ6wYGlFiy9vy/dbwPRdoSTTBWm/dmBy
CrlGVnHdAhwT8I+N7YexqLTd060pAK4zTIDxI7Z7VbuVn79nMKMGp5zeWNnUNIaT
yhnvXOYkdqfSOjTU6hPaIUeITUOICizXNeJ+P8TgnNfsi9i9njdT//PB7FH8V0sL
2hf2j/tmH5NgP6u2rVOD+ep+FwpVRxH5tdO45oCqgNHfq8qCSxsdWLDwGKywgWHv
491ElvRwYBovIoeXncar6h6iAdxYpQ==
=b6ZP
-----END PGP SIGNATURE-----

--Sig_/4Z.oOHNM+uviI+HlVvjYIS8--
