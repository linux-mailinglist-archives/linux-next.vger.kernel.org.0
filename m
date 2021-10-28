Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF01243DAA8
	for <lists+linux-next@lfdr.de>; Thu, 28 Oct 2021 07:11:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbhJ1FNc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 Oct 2021 01:13:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229684AbhJ1FNa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 Oct 2021 01:13:30 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E05CEC061570;
        Wed, 27 Oct 2021 22:11:03 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hfttr1QpYz4xcB;
        Thu, 28 Oct 2021 16:10:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635397862;
        bh=iCeoh5MOSFMdmwhKeYS0ibGllhX3aH3QzBQP6pzBhoY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=J40O6eeaqN/OLSIGCrxOy1Mp/ylZen6N38yLptDiF2A4nYKMRUmV8ztC5ngsGp1Wv
         7NptxToKeieodjXsm4WY5HMmLfR9dlR8BXAyqkg3v39eugMxI8Dinmy/uDJvXSC0d5
         Na2bxVqS8WJfr1uq/G+pYGSoH93vDAyX/K6mrmXYdEaZwzYP5GnPFF2KIA4Yo+jidR
         5RxM8kaKxBRCAVCO/FsoIks+eedBfaZInNNyE5UsnmJFUnFZBVZEoJ+ImCn3de1zpz
         imWq4bVDU2Yjc47f4yqq0IwpTmbwJ1XS7N3roEVo4BNJWu8r+YZPu6FP1eMrl/M4e9
         AEd+oMj5jUN6g==
Date:   Thu, 28 Oct 2021 16:10:58 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Borislav Petkov <bp@suse.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20211028161058.39c0d199@canb.auug.org.au>
In-Reply-To: <20211025151144.552c60ca@canb.auug.org.au>
References: <20211025151144.552c60ca@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+ji0ctx9r/azHz.0qUscCCJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/+ji0ctx9r/azHz.0qUscCCJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 25 Oct 2021 15:11:44 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
>=20
> arch/x86/kernel/fpu/core.c: In function 'fpu_alloc_guest_fpstate':
> arch/x86/kernel/fpu/core.c:187:12: error: implicit declaration of functio=
n 'vzalloc'; did you mean 'kzalloc'? [-Werror=3Dimplicit-function-declarati=
on]
>   187 |  fpstate =3D vzalloc(size);
>       |            ^~~~~~~
>       |            kzalloc
> arch/x86/kernel/fpu/core.c:187:10: error: assignment to 'struct fpstate *=
' from 'int' makes pointer from integer without a cast [-Werror=3Dint-conve=
rsion]
>   187 |  fpstate =3D vzalloc(size);
>       |          ^
> arch/x86/kernel/fpu/core.c: In function 'fpu_free_guest_fpstate':
> arch/x86/kernel/fpu/core.c:212:2: error: implicit declaration of function=
 'vfree'; did you mean 'kfree'? [-Werror=3Dimplicit-function-declaration]
>   212 |  vfree(fps);
>       |  ^~~~~
>       |  kfree
> cc1: all warnings being treated as errors
>=20
> Caused by commit
>=20
>   69f6ed1d14c6 ("x86/fpu: Provide infrastructure for KVM FPU cleanup")
>=20
> I have applied the following patch for today (because it was quicker
> than using the tip tree from next-20211022).
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 25 Oct 2021 15:04:13 +1100
> Subject: [PATCH] x86/fpu: include vmalloc.h for vzalloc etc
>=20
> Fixes: 69f6ed1d14c6 ("x86/fpu: Provide infrastructure for KVM FPU cleanup=
")
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  arch/x86/kernel/fpu/core.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/x86/kernel/fpu/core.c b/arch/x86/kernel/fpu/core.c
> index 9c475e2efd4d..c55013fc82ab 100644
> --- a/arch/x86/kernel/fpu/core.c
> +++ b/arch/x86/kernel/fpu/core.c
> @@ -16,6 +16,7 @@
> =20
>  #include <linux/hardirq.h>
>  #include <linux/pkeys.h>
> +#include <linux/vmalloc.h>
> =20
>  #include "context.h"
>  #include "internal.h"
> --=20
> 2.33.0

This build failure has returned today :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/+ji0ctx9r/azHz.0qUscCCJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF6MOIACgkQAVBC80lX
0GzTAgf+Jckqrmc7Nh3L5M5lGLWfU4oKuwZsH/6A9KwF2NYdxVLtJdvT1nTu2GCa
ZonWuoC0j92bkHtnRLQyMtWElqJ6bTwpB8kLro9HOT3Y7uoiMFOVDaKFva0kgGz0
Fa7yRnPmuTBs1onBgw7KF/cc+BOO75z5qvC5dc+SQAK/tK/Wqc7ihg8mHnKL5RHW
9HqoaXHdH2EJRA/V2xG9kiyJTaHOm3FWORfaU6E+2MFhDuWQG2QkkTqa1cAj/EMf
WsExOCPm5L0++c/WjxvlFtOCRB5FRbEJp4lXuLDeV+LFG3i0sxUxi0eI0x8xgAE9
YwvJc9keManUTfdXsS7JiZtY/zjZ3g==
=kkli
-----END PGP SIGNATURE-----

--Sig_/+ji0ctx9r/azHz.0qUscCCJ--
