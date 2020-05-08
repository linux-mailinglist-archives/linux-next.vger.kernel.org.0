Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7F561CA165
	for <lists+linux-next@lfdr.de>; Fri,  8 May 2020 05:10:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbgEHDKc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 7 May 2020 23:10:32 -0400
Received: from ozlabs.org ([203.11.71.1]:36255 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726612AbgEHDKb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 7 May 2020 23:10:31 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49JFh45cbdz9sRY;
        Fri,  8 May 2020 13:10:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588907428;
        bh=niAFkCDFUWU8bNNlk/GpX+YycgHtD7mi19C++Wn1zFg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=DwG7V98RxJdmtwioeVrJhmVsTnTQfvW/O8tK8P5eYB0HRbS26HovCoOPJ9ZN1/pWJ
         LV57v+hNVrb8UFj2a2UIGVz9lrWJY+KfbALxGgNqyQeU7Ct45GgKxMWq69gbSoQjYP
         U6eZrnHR85sfDtlAzFWhXbEJjef6w0Xkqr6ZESekuFpEbaPnFR94OFICSRxLj3suv1
         0iXCSe6CoDtcPaeFfLG3P03vOfwFXDNFVRgdcldmexNGdDwAZtojlqu6xk1lJpLsor
         TOV2I5fZgw3rYbUIEIJdtFMTvI2cu6XWcaasdPWtlBOzHKsaikIyQpXMzXL8829SWA
         8b8FAPQZ5qFCw==
Date:   Fri, 8 May 2020 13:10:26 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ira Weiny <ira.weiny@intel.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Message-ID: <20200508131026.1183a1a9@canb.auug.org.au>
In-Reply-To: <20200507190808.c6cdd5ffd68d0a154ef8ff18@linux-foundation.org>
References: <20200507221721.0330271c@canb.auug.org.au>
        <20200508114338.02d2b843@canb.auug.org.au>
        <20200507190808.c6cdd5ffd68d0a154ef8ff18@linux-foundation.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/48//veJn5ALVzWUoDuO5H=8";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/48//veJn5ALVzWUoDuO5H=8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Thu, 7 May 2020 19:08:08 -0700 Andrew Morton <akpm@linux-foundation.org>=
 wrote:
>=20
> This?  It's based on Ira's v3 series but should work.
>=20
>=20
> From: Andrew Morton <akpm@linux-foundation.org>
> Subject: arch-kunmap-remove-duplicate-kunmap-implementations-fix
>=20
> fix CONFIG_HIGHMEM=3Dn build on various architectures
>=20
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: Ira Weiny <ira.weiny@intel.com>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> ---
>=20
>  include/linux/highmem.h |    5 +++++
>  1 file changed, 5 insertions(+)
>=20
> --- a/include/linux/highmem.h~arch-kunmap-remove-duplicate-kunmap-impleme=
ntations-fix
> +++ a/include/linux/highmem.h
> @@ -53,6 +53,7 @@ static inline void *kmap(struct page *pa
>  }
> =20
>  void kunmap_high(struct page *page);
> +
>  static inline void kunmap(struct page *page)
>  {
>  	might_sleep();
> @@ -111,6 +112,10 @@ static inline void *kmap(struct page *pa
>  	return page_address(page);
>  }
> =20
> +static inline void kunmap_high(struct page *page)
> +{
> +}
> +
>  static inline void kunmap(struct page *page)
>  {
>  }
> _
>=20

Thanks, I have added that to linux-next today.

--=20
Cheers,
Stephen Rothwell

--Sig_/48//veJn5ALVzWUoDuO5H=8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl60zaIACgkQAVBC80lX
0Gxgcgf9ENVRpVk26C/3TgBRabX0ohwenD/NoMHtpO+6bjGhhauR1TDD3jvf2FZo
tBl6rQmOCeemq6BWZ1VJpDPDRpvb3tIDFwpmRgwWOgcgYxcXmjdjHB0cUDR6Xhwg
LRw2LiDirHROXVbozXe3wpHskf1ZBUO4Y5nlqFUO8HOKNolvzGkI0dchOdOXzU4O
9rYxg292twhTLBC5GjEbePGZnqXy87/GfGGFhu5hgT1b9BP05k9j6Qsvk2KUDbYH
iFLcFJogrOKBQDWrqHbR+FNvjjDUfJeP4ZzojsnRJsSjK54HMdGDvrHnk4BKnnBU
839WmRu7euzjEWuLekBbw1F/omojxA==
=5ggu
-----END PGP SIGNATURE-----

--Sig_/48//veJn5ALVzWUoDuO5H=8--
