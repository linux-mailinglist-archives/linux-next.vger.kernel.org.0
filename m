Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 073D0346A8D
	for <lists+linux-next@lfdr.de>; Tue, 23 Mar 2021 21:59:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233434AbhCWU7Q (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Mar 2021 16:59:16 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:45563 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233444AbhCWU65 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 23 Mar 2021 16:58:57 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4F4kHd6R4Zz9sTD;
        Wed, 24 Mar 2021 07:58:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1616533134;
        bh=bVyFiTvUSdKsFHvI8SczURssxLVt9YFCmvLDxVBeI2A=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=stQYMbisBU14c4s4nHzPJao2DVVqHuLW6kkYUVTa0Wgq553WxLyaQ5/mbQ85jmKxN
         oPgGOBfPO5FWOQd3wRo/Lsbt6pZyuRfImj4EPHHgA0NNIVxt69sRatLPVUeyVls7hA
         Vcf76JtocDZiMkqoBJJW50P6UOuuQB4eXPKzFquTNQqbcd3MH6oppLCx0bqEkaEHxB
         FFsf3jvJFdlOOBhT7W8/h0ssrfcIEwN/rred1FOvdMvd1tJzTM1FRh591XQM1PNqID
         DZjQsjxRb4E+uFDrmKk4PzJQG85yhlwmgI3YoicjSJjTrVEUngBGO8dIlpj6iVvdvu
         n2EcK2S4p7osg==
Date:   Wed, 24 Mar 2021 07:58:52 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Nicholas Piggin <npiggin@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20210324075852.4ed75c39@canb.auug.org.au>
In-Reply-To: <20210318205607.63aebcc6@canb.auug.org.au>
References: <20210318205607.63aebcc6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iC04kSRvKVuu7EF9MubqHwc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/iC04kSRvKVuu7EF9MubqHwc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 18 Mar 2021 20:56:07 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> After merging the akpm-current tree, today's linux-next build (sparc
> defconfig) failed like this:
>=20
> In file included from arch/sparc/include/asm/pgtable_32.h:25:0,
>                  from arch/sparc/include/asm/pgtable.h:7,
>                  from include/linux/pgtable.h:6,
>                  from include/linux/mm.h:33,
>                  from mm/vmalloc.c:12:
> mm/vmalloc.c: In function 'vmalloc_to_page':
> include/asm-generic/pgtable-nopud.h:51:27: error: implicit declaration of=
 function 'pud_page'; did you mean 'put_page'? [-Werror=3Dimplicit-function=
-declaration]
>  #define p4d_page(p4d)    (pud_page((pud_t){ p4d }))
>                            ^
> mm/vmalloc.c:643:10: note: in expansion of macro 'p4d_page'
>    return p4d_page(*p4d) + ((addr & ~P4D_MASK) >> PAGE_SHIFT);
>           ^~~~~~~~
> mm/vmalloc.c:643:25: warning: return makes pointer from integer without a=
 cast [-Wint-conversion]
>    return p4d_page(*p4d) + ((addr & ~P4D_MASK) >> PAGE_SHIFT);
> mm/vmalloc.c:651:25: warning: return makes pointer from integer without a=
 cast [-Wint-conversion]
>    return pud_page(*pud) + ((addr & ~PUD_MASK) >> PAGE_SHIFT);
>           ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>=20
> Caused by commit
>=20
>   70d18d470920 ("mm/vmalloc: fix HUGE_VMAP regression by enabling huge pa=
ges in vmalloc_to_page")
>=20
> I have applied the following hack path for today (hopefully someone can
> come up with something better):
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 18 Mar 2021 18:32:58 +1100
> Subject: [PATCH] hack to make SPARC32 build
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  mm/vmalloc.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 57b7f62d25a7..96444d64129a 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -640,7 +640,11 @@ struct page *vmalloc_to_page(const void *vmalloc_add=
r)
>  	if (p4d_none(*p4d))
>  		return NULL;
>  	if (p4d_leaf(*p4d))
> +#ifdef CONFIG_SPARC32
> +		return NULL;
> +#else
>  		return p4d_page(*p4d) + ((addr & ~P4D_MASK) >> PAGE_SHIFT);
> +#endif
>  	if (WARN_ON_ONCE(p4d_bad(*p4d)))
>  		return NULL;
> =20
> @@ -648,7 +652,11 @@ struct page *vmalloc_to_page(const void *vmalloc_add=
r)
>  	if (pud_none(*pud))
>  		return NULL;
>  	if (pud_leaf(*pud))
> +#ifdef CONFIG_SPARC32
> +		return NULL;
> +#else
>  		return pud_page(*pud) + ((addr & ~PUD_MASK) >> PAGE_SHIFT);
> +#endif
>  	if (WARN_ON_ONCE(pud_bad(*pud)))
>  		return NULL;
> =20
> --=20
> 2.30.0

I am still applying this hack.
--=20
Cheers,
Stephen Rothwell

--Sig_/iC04kSRvKVuu7EF9MubqHwc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBaVowACgkQAVBC80lX
0GxNLwf/SqZb1sEecOp4jSmuXPC03vpJKSEQVB6g5YOX+Beg4kznJcSKtYG/fsoC
odgzhuYX2HjPgSqehS3+xoWCJs9AFTI0QMQ8wkecr4LmW+AFyTxNwPOViLiGpPrH
jI1c/BGQxCzjs51/uZQOjE3VKUvu2AFYRRQ9gpEX0OxHO4GqnFLOblWhytVRRRFP
NRCA6aQSSC2Nf+rB9dDejfWVyPk8+dcsvuNx9m1UuRDceFZ7FbGDwW/XF84uXBgL
JgW17JmtVkEDXhJtIaKWNymWeLbLJ4XZyNkPZ762pDmAxInEWnly35KgkMD4oLur
IK/U4XrabYP9gvdy1kkzNW+k4YLzwA==
=BiOi
-----END PGP SIGNATURE-----

--Sig_/iC04kSRvKVuu7EF9MubqHwc--
