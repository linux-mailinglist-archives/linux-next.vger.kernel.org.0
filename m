Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D8F133F872
	for <lists+linux-next@lfdr.de>; Wed, 17 Mar 2021 19:50:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232968AbhCQSt4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Mar 2021 14:49:56 -0400
Received: from ozlabs.org ([203.11.71.1]:56865 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233096AbhCQSt2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 17 Mar 2021 14:49:28 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F0zj06YFLz9sRf;
        Thu, 18 Mar 2021 05:49:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1616006966;
        bh=3YibqA1xHA2sAmwBFSwc9tUZwMPpXSdzHgLDK8LQuSw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=mRCT+oxdp8PWEA1gdjx30QDjS1gYfqEbJ7vvUiqGKBYX+V4MzCvRWtwpPuWVh4BpO
         VEk9M1ZLWv0HeEa5GzOoCYU0Zg02f7i61KOCHVtW0EBElLsoW9T0RGd5b8ZHDKvuIN
         qZRh3/kGhMqciGNjoDbI/JlfxLkNO3H/1EaT7sLPWUSrtXT2EDCsurDwp6t6IkEZMA
         MdpWz3S6U0hxMwsyQcg07znuX2C3hXSmGsgSlwS0v3YD+8pND9q5Oem5TqnevkzBXt
         8wECxvQVT0aQ6KZtMd4eUxZSL4WcFgHiTWoY33JlThLXHPyzbcfVPWQKrb3TtQEznp
         rbf99LKXwGXYw==
Date:   Thu, 18 Mar 2021 05:49:21 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Borislav Petkov <bp@suse.de>
Cc:     Ian Rogers <irogers@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20210318054921.64c0fc75@canb.auug.org.au>
In-Reply-To: <20210317180236.GF32135@zn.tnic>
References: <20210317150858.02b1bbc8@canb.auug.org.au>
        <20210317105432.GA32135@zn.tnic>
        <CAP-5=fWKCtJq-9zd5A-XALJWNf8tsds44m-G07sc+kCUoXB8zg@mail.gmail.com>
        <20210317180236.GF32135@zn.tnic>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3aMHn__en4JByNqMqxiBDpy";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/3aMHn__en4JByNqMqxiBDpy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Borislav,

On Wed, 17 Mar 2021 19:02:36 +0100 Borislav Petkov <bp@suse.de> wrote:
>
> On Wed, Mar 17, 2021 at 09:22:15AM -0700, Ian Rogers wrote:
> > The <asm/emulate_prefix.h> path also needs fixing. With the following
> > I was able to build for arm64 and powerpc. =20
>=20
> Thanks, I've updated and added your Tested-by. I'll give sfr a chance to
> test and queue it tomorrow.
>=20
> ---
> From d242b2639a23ed03d9aed94cf05b99af5343d4e9 Mon Sep 17 00:00:00 2001
> From: Borislav Petkov <bp@suse.de>
> Date: Wed, 17 Mar 2021 11:33:04 +0100
> Subject: [PATCH] tools/insn: Restore the relative include paths for cross=
 building
>=20
> Building perf on ppc causes:
>=20
>   In file included from util/intel-pt-decoder/intel-pt-insn-decoder.c:15:
>   util/intel-pt-decoder/../../../arch/x86/lib/insn.c:14:10: fatal error: =
asm/inat.h: No such file or directory
>      14 | #include <asm/inat.h> /*__ignore_sync_check__ */
>         |          ^~~~~~~~~~~~
>=20
> Restore the relative include paths so that the compiler can find the
> headers.
>=20
> Fixes: 93281c4a9657 ("x86/insn: Add an insn_decode() API")
> Reported-by: Ian Rogers <irogers@google.com>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Borislav Petkov <bp@suse.de>
> Tested-by: Ian Rogers <irogers@google.com>
> ---
>  tools/arch/x86/lib/insn.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/tools/arch/x86/lib/insn.c b/tools/arch/x86/lib/insn.c
> index cd4dedde3265..c41f95815480 100644
> --- a/tools/arch/x86/lib/insn.c
> +++ b/tools/arch/x86/lib/insn.c
> @@ -11,13 +11,13 @@
>  #else
>  #include <string.h>
>  #endif
> -#include <asm/inat.h> /*__ignore_sync_check__ */
> -#include <asm/insn.h> /* __ignore_sync_check__ */
> +#include "../include/asm/inat.h" /* __ignore_sync_check__ */
> +#include "../include/asm/insn.h" /* __ignore_sync_check__ */
> =20
>  #include <linux/errno.h>
>  #include <linux/kconfig.h>
> =20
> -#include <asm/emulate_prefix.h> /* __ignore_sync_check__ */
> +#include "../include/asm/emulate_prefix.h" /* __ignore_sync_check__ */
> =20
>  #define leXX_to_cpu(t, r)						\
>  ({									\
> --=20
> 2.29.2

That fixes the powerpc build for me, thanks.
--=20
Cheers,
Stephen Rothwell

--Sig_/3aMHn__en4JByNqMqxiBDpy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBSTzEACgkQAVBC80lX
0GwbAwf7Bn3trYmkByVdzXCaOnhnSuTLVcZYkG6hDoZkxn5/sJy9EOh2vmCGmFVe
cDz9O+Gteo7686EOOpQQjT+k1urcjy5i5Md1hcJ9dXQqOeZYEDSfbMvT9mj22N5/
Ge2BXzca4NecZjD82rO2gktclTQxxwmcs9Uxlg5Ugdy95I6WliJgN8OFC62Qvo0w
5lFvBEDUgNiE+YLSJ+/b30JzOv7g28ju4qIvtiE7JQ7dokLW6uLVudR9UUcvqm7g
N8EQE7Ky/rF74k0ojHhl1j3RomTnnEkQhqif5+teLx80azXOdprGk01E3o+15iT4
8t/No8031egvnh/dRsNVnpZ6DC2C4g==
=mJHr
-----END PGP SIGNATURE-----

--Sig_/3aMHn__en4JByNqMqxiBDpy--
