Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15E162DA153
	for <lists+linux-next@lfdr.de>; Mon, 14 Dec 2020 21:18:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502934AbgLNUR4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Dec 2020 15:17:56 -0500
Received: from ozlabs.org ([203.11.71.1]:52253 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2503137AbgLNURt (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 14 Dec 2020 15:17:49 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cvt364hHFz9sSC;
        Tue, 15 Dec 2020 07:17:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607977027;
        bh=xAQjEWZYRy/0ACS8i64gbqRXnwwQuolLHTU6ZvyQSDI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=AOUMOU8BsVSrcTv4iAFNPdodd9Tk/wDrE+7mSg1zrEEngR42QHKmpPjjPaHrUJxQk
         855ty+pyTtFovm7PAgjNsOPV5vLNMxB5J8J9C/QRGzW2+GuYwyIq4/S9C9ZdgVp4dL
         z/4U/HAcnaqpDyPQf5rPIYoaYfh1aNkGxtshwY5GbMn25SOLZZTckKjVYahmhK5oFj
         ihHbpXdw1u73QYLFvJ2AYDnKmsqaYm/hlWCdymc6Z6vKVe2DrN/aLvje02vz8Mq7Ip
         m0EQdWRB3nTrri7jy8fwnl5jC9y27AZ1viKqhwPH2x/ltPYTplditD4puShKenU+lM
         6jv9WX5OsXipA==
Date:   Tue, 15 Dec 2020 07:17:05 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: linux-next: manual merge of the block tree with the arm64 tree
Message-ID: <20201215071705.09df4f1a@canb.auug.org.au>
In-Reply-To: <20201203142530.4d962ea5@canb.auug.org.au>
References: <20201203142530.4d962ea5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4eAMd=wntc8LGknjiIt36yx";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/4eAMd=wntc8LGknjiIt36yx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 3 Dec 2020 14:25:30 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the block tree got a conflict in:
>=20
>   arch/arm64/include/asm/thread_info.h
>=20
> between commit:
>=20
>   b5a5a01d8e9a ("arm64: uaccess: remove addr_limit_user_check()")
>=20
> from the arm64 tree and commit:
>=20
>   192caabd4dd9 ("arm64: add support for TIF_NOTIFY_SIGNAL")
>=20
> from the block tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc arch/arm64/include/asm/thread_info.h
> index 015beafe58f5,cdcf307764aa..000000000000
> --- a/arch/arm64/include/asm/thread_info.h
> +++ b/arch/arm64/include/asm/thread_info.h
> @@@ -63,7 -66,9 +63,8 @@@ void arch_release_task_struct(struct ta
>   #define TIF_NOTIFY_RESUME	2	/* callback before returning to user */
>   #define TIF_FOREIGN_FPSTATE	3	/* CPU's FP state is not current's */
>   #define TIF_UPROBE		4	/* uprobe breakpoint or singlestep */
> - #define TIF_MTE_ASYNC_FAULT	5	/* MTE Asynchronous Tag Check Fault */
>  -#define TIF_FSCHECK		5	/* Check FS is USER_DS on return */
> ++#define TIF_NOTIFY_SIGNAL	5	/* signal notifications exist */
> + #define TIF_MTE_ASYNC_FAULT	6	/* MTE Asynchronous Tag Check Fault */
>  -#define TIF_NOTIFY_SIGNAL	7	/* signal notifications exist */
>   #define TIF_SYSCALL_TRACE	8	/* syscall trace active */
>   #define TIF_SYSCALL_AUDIT	9	/* syscall auditing */
>   #define TIF_SYSCALL_TRACEPOINT	10	/* syscall tracepoint for ftrace */
> @@@ -96,7 -103,8 +98,8 @@@
>  =20
>   #define _TIF_WORK_MASK		(_TIF_NEED_RESCHED | _TIF_SIGPENDING | \
>   				 _TIF_NOTIFY_RESUME | _TIF_FOREIGN_FPSTATE | \
> - 				 _TIF_UPROBE | _TIF_MTE_ASYNC_FAULT)
>  -				 _TIF_UPROBE | _TIF_FSCHECK | _TIF_MTE_ASYNC_FAULT | \
> ++				 _TIF_UPROBE | _TIF_MTE_ASYNC_FAULT | \
> + 				 _TIF_NOTIFY_SIGNAL)
>  =20
>   #define _TIF_SYSCALL_WORK	(_TIF_SYSCALL_TRACE | _TIF_SYSCALL_AUDIT | \
>   				 _TIF_SYSCALL_TRACEPOINT | _TIF_SECCOMP | \

Just a reminder that this conflict still exists.

--=20
Cheers,
Stephen Rothwell

--Sig_/4eAMd=wntc8LGknjiIt36yx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/XyEEACgkQAVBC80lX
0GxjSAf/RnqycqI23zexQq10ZD9Z35PYnc3Befoq0cNqAGBQnwolXfhlLWACLOuT
z2HE89HiKtuDrNhMtAL+cwlhz6dHUj0/MknnxCd/LBPR5/hBlr5vsCHZjV3g3MFy
K2XzV8yVXCCqG6XmjJPJGKjWGRGqJu+zLrOzvDOZ/ALoZw7EkaegRn8dyJA6HBfZ
eJnFmO3Sniu5yqlSbBfACkq7capFE0m2Lc4RdVfvgC5nEiE5fsiz32WkDH5zEYZc
P544j7/SLkpu9n8B7fl5bhID5qCEUMrJAH6pP39yRLIV6JnkpjtY9zyvqWIB7eXS
JqyI94qJBqhLaznEBkg9mmesXS0BzQ==
=p304
-----END PGP SIGNATURE-----

--Sig_/4eAMd=wntc8LGknjiIt36yx--
