Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47A3D2FCB0B
	for <lists+linux-next@lfdr.de>; Wed, 20 Jan 2021 07:43:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728424AbhATGUu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 Jan 2021 01:20:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728240AbhATGUH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 20 Jan 2021 01:20:07 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F12E1C061575;
        Tue, 19 Jan 2021 22:19:26 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DLFjQ0bvCz9sVy;
        Wed, 20 Jan 2021 17:19:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611123565;
        bh=r5xVdPO4m7P2mwJrkoTxUEM32+9FIwPonFrWByCzuA8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=KAHh3o2AHr4brWlCRKaGN8txAMIMhed1/wQ0dWloOwrpwnf1XuOQIvbscJUow9coI
         yfC1kfHxRaIcEs5W83j51aKc8TX068bKgdurtwOI9Mu2lfJELyH/Q89Ny6i2gw6jsq
         yg2r0HATDS7q9/ZQumBnf3Iu5i36TmG1/N3sRBtHqmVvt69M/pkdID7UBvJY1WTaAx
         Er2Qxt2FJRWNg0xPS8mUG6dY03A/fblEup9/4j59MDBRcbCkTv3h0BiikCl2bhGP1O
         XFtzV6X751noNHQMO9MgW06eyvCN3r2aNmu1bEbyBWtKz2FuQ+2EixZbQ/Nuni3+RK
         46kkbYNwhHj+w==
Date:   Wed, 20 Jan 2021 17:19:21 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Heiko Carstens <hca@linux.ibm.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Minchan Kim <minchan@kernel.org>,
        Willem de Bruijn <willemb@google.com>,
        YueHaibing <yuehaibing@huawei.com>
Subject: Re: linux-next: manual merge of the notifications tree with Linus'
 tree
Message-ID: <20210120171921.11d9d463@canb.auug.org.au>
In-Reply-To: <20201221120209.5c5cb5d8@canb.auug.org.au>
References: <20201221120209.5c5cb5d8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/F_LbjlTpWuHb8oUDvSHydok";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/F_LbjlTpWuHb8oUDvSHydok
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi David,

On Mon, 21 Dec 2020 12:02:09 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi all,
>=20
> Today's linux-next merge of the notifications tree got conflicts in:
>=20
>   arch/alpha/kernel/syscalls/syscall.tbl
>   arch/arm/tools/syscall.tbl
>   arch/arm64/include/asm/unistd.h
>   arch/arm64/include/asm/unistd32.h
>   arch/ia64/kernel/syscalls/syscall.tbl
>   arch/m68k/kernel/syscalls/syscall.tbl
>   arch/microblaze/kernel/syscalls/syscall.tbl
>   arch/mips/kernel/syscalls/syscall_n32.tbl
>   arch/mips/kernel/syscalls/syscall_n64.tbl
>   arch/mips/kernel/syscalls/syscall_o32.tbl
>   arch/parisc/kernel/syscalls/syscall.tbl
>   arch/powerpc/kernel/syscalls/syscall.tbl
>   arch/s390/kernel/syscalls/syscall.tbl
>   arch/sh/kernel/syscalls/syscall.tbl
>   arch/sparc/kernel/syscalls/syscall.tbl
>   arch/x86/entry/syscalls/syscall_32.tbl
>   arch/x86/entry/syscalls/syscall_64.tbl
>   arch/xtensa/kernel/syscalls/syscall.tbl
>   include/uapi/asm-generic/unistd.h
>=20
> between commits:
>=20
>   b0a0c2615f6f ("epoll: wire up syscall epoll_pwait2")
>   450f68e2425e ("epoll: fix compat syscall wire up of epoll_pwait2")
>   ecb8ac8b1f14 ("mm/madvise: introduce process_madvise() syscall: an exte=
rnal memory hinting API")
>=20
> from Linus' tree and commit:
>=20
>   4cd92d064cb0 ("watch_queue: Implement mount topology and attribute chan=
ge notifications")
>=20
> from the notifications tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> If this is not submitted to Linus during this merge window, please
> either drop it from your linux-next included branch, or at least fix it
> up wrt to the sate of Linus' tree.

How are you going with this?

--=20
Cheers,
Stephen Rothwell

--Sig_/F_LbjlTpWuHb8oUDvSHydok
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAHy2kACgkQAVBC80lX
0GyBeAf/SUwFQX6naVdoMVsMXmXYAieE6h7oWn5x/oKN0iT+WtSvIaTD5bbbdsiR
B615ASysYOTXdx4QUMh12AnxnetIb6unVAv3Bqy01ykOAyCebHlnFnmiAuA5PbtZ
M6sGPrFU8Hid0G3O+2hkDZVJPrDmb6RTXEp8nxSFv+0LMSSF7c31KM850OGc+EGE
/KATq8CuA4rGG0d3El7DjF7W6B96VB9+Z20FuBWUSTCRJHGSH6aZn9QmqwiSYPeE
Gd/YcE/BBTA865o6l4C53mvv5jKUgYJGqDeHG0vg5vnOQ32Bkx5gjmdKMvXTpN/W
9MWYwMCDx1SJx/4JjSLq4gSWva5skQ==
=KIJd
-----END PGP SIGNATURE-----

--Sig_/F_LbjlTpWuHb8oUDvSHydok--
