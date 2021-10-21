Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D53B3435B5B
	for <lists+linux-next@lfdr.de>; Thu, 21 Oct 2021 09:08:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbhJUHKY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Oct 2021 03:10:24 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:42437 "EHLO
        gandalf.ozlabs.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231137AbhJUHKX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 21 Oct 2021 03:10:23 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HZdqB5T9xz4xbZ;
        Thu, 21 Oct 2021 18:08:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1634800087;
        bh=eTLqwREw6sl0U0jZ/4nQbCKAYx/Y3ATjV+xwhXOlsq4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Myz4De16LDwmkqaBe249HAVCyxOPdOJuoT6BqWy8eGqlzyR/H6PiKYJrIljrbn+53
         o0hM9p6Aiicx6jhiwCZd/4EFDTxj4C/pi4CUuhL4oYNqm6hCJSeP/2M/V5XtbGSxgF
         UHvBhlpAKGauouk3otR+1Ghh2zV7sNa2kS5ArS3t2L4gg1bUjdZsDrdfLB1XLMKXkh
         v3frnPtWwJO09pRbO4bE6X7vKAXAHw1qTHFhSuGpJ488kZgRLh+dM26mlZZVaedt1x
         EvvSS1Xs5zMkVGePs3nPY2JY/fLuOBHC4VQ1m0oYZDCjEYi4cV/gnsNQKPFnR6f/RD
         K1bUJwBskVkHA==
Date:   Thu, 21 Oct 2021 18:08:05 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>
Cc:     Yang Shi <shy828301@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20211021180805.137314f0@canb.auug.org.au>
In-Reply-To: <20211021174303.3710b295@canb.auug.org.au>
References: <20211021174303.3710b295@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DmbGPuq6yIOXCw7v0NakPbK";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/DmbGPuq6yIOXCw7v0NakPbK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 21 Oct 2021 17:43:03 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the akpm-current tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>=20
> In file included from include/linux/mmzone.h:22,
>                  from include/linux/gfp.h:6,
>                  from include/linux/xarray.h:14,
>                  from include/linux/radix-tree.h:19,
>                  from include/linux/fs.h:15,
>                  from include/linux/compat.h:17,
>                  from arch/powerpc/kernel/asm-offsets.c:12:
> include/linux/page-flags.h:806:29: error: macro "PAGEFLAG_FALSE" requires=
 2 arguments, but only 1 given
>   806 | PAGEFLAG_FALSE(HasHWPoisoned)
>       |                             ^
> include/linux/page-flags.h:411: note: macro "PAGEFLAG_FALSE" defined here
>   411 | #define PAGEFLAG_FALSE(uname, lname) TESTPAGEFLAG_FALSE(uname, ln=
ame) \
>       |=20
> include/linux/page-flags.h:807:32: error: macro "TESTSCFLAG_FALSE" requir=
es 2 arguments, but only 1 given
>   807 |  TESTSCFLAG_FALSE(HasHWPoisoned)
>       |                                ^
> include/linux/page-flags.h:414: note: macro "TESTSCFLAG_FALSE" defined he=
re
>   414 | #define TESTSCFLAG_FALSE(uname, lname)     \
>       |=20
> include/linux/page-flags.h:806:1: error: unknown type name 'PAGEFLAG_FALS=
E'
>   806 | PAGEFLAG_FALSE(HasHWPoisoned)
>       | ^~~~~~~~~~~~~~
> include/linux/page-flags.h:807:18: error: expected ';' before 'static'
>   807 |  TESTSCFLAG_FALSE(HasHWPoisoned)
>       |                  ^
>       |                  ;
> ......
>   815 | static inline bool is_page_hwpoison(struct page *page)
>       | ~~~~~~           =20
>=20
> Caused by commit
>=20
>   e95de3e8d811 ("mm: filemap: check if THP has hwpoisoned subpage for PMD=
 page fault")
>=20
> interacting with commit
>=20
>   d389a4a81155 ("mm: Add folio flag manipulation functions")
>=20
> from the folio tree.
>=20
> I have applied the following merge fix patch for today.
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 21 Oct 2021 17:32:36 +1100
> Subject: [PATCH] fix up for "mm: Add folio flag manipulation functions"
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  include/linux/page-flags.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
> index 867b4bb3c336..80b33404ad1f 100644
> --- a/include/linux/page-flags.h
> +++ b/include/linux/page-flags.h
> @@ -803,8 +803,8 @@ PAGEFLAG_FALSE(DoubleMap, double_map)
>  PAGEFLAG(HasHWPoisoned, has_hwpoisoned, PF_SECOND)
>  	TESTSCFLAG(HasHWPoisoned, has_hwpoisoned, PF_SECOND)
>  #else
> -PAGEFLAG_FALSE(HasHWPoisoned)
> -	TESTSCFLAG_FALSE(HasHWPoisoned)
> +PAGEFLAG_FALSE(HasHWPoisoned, hashwpoisoned)
> +	TESTSCFLAG_FALSE(HasHWPoisoned, hashwpoisoned)
>  #endif
> =20
>  /*
> --=20
> 2.33.0

So, I then discovered patch

mm-filemap-check-if-thp-has-hwpoisoned-subpage-for-pmd-page-fault-vs-folios=
.patch

which conflicted with my merge resolution.  I will use that tomorrow instea=
d.

--=20
Cheers,
Stephen Rothwell

--Sig_/DmbGPuq6yIOXCw7v0NakPbK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFxEdUACgkQAVBC80lX
0Gw3gAf/aaryGY+XIJzKKrw+4QVZbkB4vG8O+4oBxxJ6Rxe26z6ejRKUqxcPG78e
CEWY9gsZN7Kcec1oo3r2sp41MbGQDys7dlY6dIZrZ7WN3v0OqIdVYnpfyb76qdXx
SYUPlB25mzKeHM9ncbTGor6mSZWnO4CQM7Fo+eoijgDI0HAV44U1Sx7jrtaJduKA
jPDAHDKOmYZm/RKySpra5grWEbbrnmfo2MIS+wD3rJYsNfxUVHkLGQ4lzq6xuwa1
VW3vtX9cH1ovrEwABuQYZ3YCpvQEfMFNclanrjbb6XIpXhxsT/jLuOYsqPtaXGQD
qpROQPy52ad9w4doZoPHw40jEhZdiw==
=S3Ef
-----END PGP SIGNATURE-----

--Sig_/DmbGPuq6yIOXCw7v0NakPbK--
