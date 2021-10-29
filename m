Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3E0843F8D1
	for <lists+linux-next@lfdr.de>; Fri, 29 Oct 2021 10:28:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232351AbhJ2Iaf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 Oct 2021 04:30:35 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:42775 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232305AbhJ2Iaf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 29 Oct 2021 04:30:35 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HgbCn5VZXz4xbr;
        Fri, 29 Oct 2021 19:28:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635496086;
        bh=De9JvA6j/xXrH2FbGRYzoYiV3/7uXWBIoKU7i4Tml3I=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=F5NeP+/AotmCTr8tAY6QT3MfzbrgxqEshvrn3UbJvLHPjgtT9R/yOtjmFOLmEFbjj
         FbC9VmKErd4GlrGj172vvIbgnku6/sE9Fv99ZWegNbT5z9i8vwwZ85s4pA3jZiYDrS
         NyGfMbR3/RfJbGGrnf1pa0UQJz/dMbiDr1WJU4A67b3SarcU+Q0rs54tvJ1ZVNSE3Y
         4e7ldKe36Hg32kbQVNOADQerKhOtP5OlrFGRSwnMtJDW9QQp2Md+9oyKStLR1BJsVb
         UWyPAHcXe7QuCKVlsTNggdCjVGHWs+gF2jxNluMA45SRlyxaAoehZwuSIHQh6MKStG
         9c56hKQk6gBuw==
Date:   Fri, 29 Oct 2021 19:28:04 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Sterba <dsterba@suse.cz>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: build failure after merge of the btrfs tree
Message-ID: <20211029192804.497d7f13@canb.auug.org.au>
In-Reply-To: <20211027210924.22ef5881@canb.auug.org.au>
References: <20211027210924.22ef5881@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/J/GjfQUJEAm51ij2xXZvKy4";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/J/GjfQUJEAm51ij2xXZvKy4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 27 Oct 2021 21:09:24 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> [I am not sure why this error only popped up after I merged Andrew's
> patch set ...]
>=20
> After merging the btrfs tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> In file included from include/linux/string.h:253,
>                  from include/linux/bitmap.h:11,
>                  from include/linux/cpumask.h:12,
>                  from arch/x86/include/asm/cpumask.h:5,
>                  from arch/x86/include/asm/msr.h:11,
>                  from arch/x86/include/asm/processor.h:22,
>                  from arch/x86/include/asm/cpufeature.h:5,
>                  from arch/x86/include/asm/thread_info.h:53,
>                  from include/linux/thread_info.h:60,
>                  from arch/x86/include/asm/preempt.h:7,
>                  from include/linux/preempt.h:78,
>                  from include/linux/spinlock.h:55,
>                  from include/linux/wait.h:9,
>                  from include/linux/mempool.h:8,
>                  from include/linux/bio.h:8,
>                  from fs/btrfs/ioctl.c:7:
> In function 'memcpy',
>     inlined from '_btrfs_ioctl_send' at fs/btrfs/ioctl.c:4846:3:
> include/linux/fortify-string.h:219:4: error: call to '__write_overflow' d=
eclared with attribute error: detected write beyond size of object (1st par=
ameter)
>   219 |    __write_overflow();
>       |    ^~~~~~~~~~~~~~~~~~
>=20
> Caused by commit
>=20
>   c8d9cdfc766d ("btrfs: send: prepare for v2 protocol")
>=20
> This changes the "reserved" field of struct btrfs_ioctl_send_args from 4 =
u64's to 3, but the above memcpy is copying the "reserved" filed from a str=
uct btrfs_ioctl_send_args_32 (4 u64s) into it.
>=20
> All I could really do at this point was mark BTRFS_FS as BROKEN
> (TEST_KMOD selects BTRFS_FS):
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 27 Oct 2021 20:53:24 +1100
> Subject: [PATCH] make btrfs as BROKEN due to an inconsistent API change
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  fs/btrfs/Kconfig  | 1 +
>  lib/Kconfig.debug | 1 +
>  2 files changed, 2 insertions(+)
>=20
> diff --git a/fs/btrfs/Kconfig b/fs/btrfs/Kconfig
> index 520a0f6a7d9e..f7dd994a88af 100644
> --- a/fs/btrfs/Kconfig
> +++ b/fs/btrfs/Kconfig
> @@ -20,6 +20,7 @@ config BTRFS_FS
>  	select SRCU
>  	depends on !PPC_256K_PAGES	# powerpc
>  	depends on !PAGE_SIZE_256KB	# hexagon
> +	depends on BROKEN
> =20
>  	help
>  	  Btrfs is a general purpose copy-on-write filesystem with extents,
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 0104cafd403f..44a6df361016 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -2491,6 +2491,7 @@ config TEST_KMOD
>  	depends on m
>  	depends on NETDEVICES && NET_CORE && INET # for TUN
>  	depends on BLOCK
> +	depends on BROKEN
>  	select TEST_LKM
>  	select XFS_FS
>  	select TUN
> --=20
> 2.33.0

Ping?

--=20
Cheers,
Stephen Rothwell

--Sig_/J/GjfQUJEAm51ij2xXZvKy4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF7sJQACgkQAVBC80lX
0GzjBwf+JeoIQIlYmc3K0pAur5M8RLwAUaLbv64JcoXmnlxbBmW8dApO1McsVJ0I
6GB/CXF6zxWA+Z4xLE1zyoCEc6xZy8hZDHN4HCrGM9z7+VY9KyIqyeAz8vrFjGFs
LE1vphjv1HSNhVC+N1loMOKOD+8xk+m2IRCX+AWQza5QNrMmuN/aoSNDSXRl6rc7
KQtGupQIji8WPVgCEorYziElxNRbZu7qZ+KzgKiDBs7bTcTgHH1beAxBlMeUCxvz
hZjaU0GUzfwEmk5djQVp7+t+wkca1ElbwiLB6uJ9Wpr1x76L0Z/b/wIkVNxFz3Tq
9K0YbcQX0sJVWmXJxmo2oQTzNV8N0A==
=ErU+
-----END PGP SIGNATURE-----

--Sig_/J/GjfQUJEAm51ij2xXZvKy4--
