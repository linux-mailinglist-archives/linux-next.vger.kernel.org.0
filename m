Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70FE518532A
	for <lists+linux-next@lfdr.de>; Sat, 14 Mar 2020 01:10:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbgCNAKE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 13 Mar 2020 20:10:04 -0400
Received: from ozlabs.org ([203.11.71.1]:58345 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726534AbgCNAKE (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 13 Mar 2020 20:10:04 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48fNHF1kNzz9sPJ;
        Sat, 14 Mar 2020 11:10:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1584144601;
        bh=T91XHMl+ZOPJKGof4hB+jxJrqw22lmyD6ou55Lz8oHs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=UFnJrZOtOgcKsjnYHMMoIAREiArNDIah6KBnInIX7IE1V48LWTTFebUE77qvvOdAc
         8WJAPk+pJqD8IUjgcPhlKhO01mCQcO6nLs9LEwfmvw3Pxr7Q/14Mjx/yQgtck1mqHd
         evgGvm0daIq3ZebfVuzzUKb57WnnXPMtsCTM/mKwlBN1os7lpkV9J57oZbNBIzJO6h
         9yvEq4Xtwi1lodLWrFBe30/5pfr805FG5wEJQuzypJwn8RNPLFx/m7z3xm19i19COB
         ObuiYi0Fb6tW9p9nw9Oouu8WjIX/F8wHRi55r/YnPiaTiD6YYz4fi8odA2h0op/eUu
         Tc5Mc1f2Bw0jg==
Date:   Sat, 14 Mar 2020 11:09:54 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Baoquan He <bhe@redhat.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
Message-ID: <20200314110954.580b58dd@canb.auug.org.au>
In-Reply-To: <20200313125627.GA8518@MiWiFi-R3L-srv>
References: <20200313214214.4d2e2af6@canb.auug.org.au>
        <20200313125627.GA8518@MiWiFi-R3L-srv>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/a5h5Lps4mlmLnYpyZaSyDtQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/a5h5Lps4mlmLnYpyZaSyDtQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Baoquan,

On Fri, 13 Mar 2020 20:56:27 +0800 Baoquan He <bhe@redhat.com> wrote:
>
> I made below change, but I can't triger these warnings. Could you try
> below patch, see if it's works?

I needed to add "ARCH=3Dx86_64" to the "make allnoconfig" command line
(and the subsequent "make") otherwise I get a 32 bit build.

> From 9be668f1e30b6bb4ed5f4a07e7d3bb76d3f58f35 Mon Sep 17 00:00:00 2001
> From: Baoquan He <bhe@redhat.com>
> Date: Fri, 13 Mar 2020 20:25:54 +0800
> Subject: [PATCH] mm/sparse.c: fix the building warning with !SPARSEMEM
>=20
> Stephen reported below warnings are seen with allnoconfig on x86_64.
> Fix it by making those dummy functions sub-section map handling visible
> with CONFIG_SPARSEMEM enabled.
>=20
> mm/sparse.c:311:12: warning: 'fill_subsection_map' defined but not used [=
-Wunused-function]
>   311 | static int fill_subsection_map(unsigned long pfn, unsigned long n=
r_pages)
>       |            ^~~~~~~~~~~~~~~~~~~
> mm/sparse.c:306:13: warning: 'is_subsection_map_empty' defined but not us=
ed [-Wunused-function]
>   306 | static bool is_subsection_map_empty(struct mem_section *ms)
>       |             ^~~~~~~~~~~~~~~~~~~~~~~
> mm/sparse.c:301:12: warning: 'clear_subsection_map' defined but not used =
[-Wunused-function]
>   301 | static int clear_subsection_map(unsigned long pfn, unsigned long =
nr_pages)
>       |            ^~~~~~~~~~~~~~~~~~~~
>=20
> Signed-off-by: Baoquan He <bhe@redhat.com>
> ---
>  mm/sparse.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/mm/sparse.c b/mm/sparse.c
> index 362018e82e22..9e08d118719f 100644
> --- a/mm/sparse.c
> +++ b/mm/sparse.c
> @@ -293,7 +293,7 @@ static int fill_subsection_map(unsigned long pfn, uns=
igned long nr_pages)
> =20
>  	return rc;
>  }
> -#else
> +#elif defined(CONFIG_SPARSEMEM)
>  void __init subsection_map_init(unsigned long pfn, unsigned long nr_page=
s)
>  {
>  }

This didn't make any difference as CONFIG_SPARSEMEM is set for the
x86_64 allnoconfig build.

--=20
Cheers,
Stephen Rothwell

--Sig_/a5h5Lps4mlmLnYpyZaSyDtQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5sINIACgkQAVBC80lX
0Gz+Xgf+OUITkPZ+BRZ8jb3n3lyWYz2nibo99W9+r1lIY92Zel/LYe5JiHkXOv1r
BXqZjRpJ6XI8jjfKyHukrFOJmRS24QqY9PCy2ldlndc6jSaRgyyD3XfPxzCiyMco
BZHtDMAQY72ASshviO+3x6RlPcjhEEdxgA6f12G+hj/yvyjiXfO9/y98fkL9jjHR
Z+PYonV5sVDCRtz7QeRh5OXEmTWgkp3ikNAYHFxNxw9PGcAyy6CwHCZ5GjIJsGC2
zEF5/fGAEBBhJesPT13/HSdKdDVBA1cswvVfbzDSetj7cLnOu/zFyZoeqwmPXiPN
rF7hJvRoq0Fg+OMb5sDnatxqUl4MvA==
=kktS
-----END PGP SIGNATURE-----

--Sig_/a5h5Lps4mlmLnYpyZaSyDtQ--
