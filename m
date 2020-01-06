Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2B5C130CDA
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2020 06:02:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726622AbgAFFCt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Jan 2020 00:02:49 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:38949 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726620AbgAFFCt (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 6 Jan 2020 00:02:49 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47rk0Q6QlKz9sR1;
        Mon,  6 Jan 2020 16:02:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1578286967;
        bh=D8EGVkxO374FrM+A+GsbiNGA5RKfYu9d6p/uLCeisrU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=MpCZXqGuSj+g0LztV6Y7gQFjOzPnliYDgywdYXew3R3qP48qqxhwOLkNfkFEMVex8
         2ifAxJPsDtPVxoX80NoqNo5MD+QS5UCpx87lin9sC6ssAbrMvNy8Gj+X8IZPBWW0Wg
         0V5UnWVjWzH5QZXpNJatK46r3E4/MxayRj8rZPck3X3PVmHbJMxoenH7sHeJVz9B9y
         SlhGMIGa2EbsEcro1Z3fd8u1Ra3A+Dv80y+RlEjjjpKZY6B4PcjaVaabn4EUTDVZvr
         nIwGNGvla9BFj0A2hhgqVObcHYwcitE0z38IsgBM4Mgc5LYx0V6z3N7e2eXI2mMD9v
         rUqygx6S0pdvg==
Date:   Mon, 6 Jan 2020 16:02:46 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 generic-ioremap tree
Message-ID: <20200106160246.0f6bd04c@canb.auug.org.au>
In-Reply-To: <20191218133025.15356802@canb.auug.org.au>
References: <20191218133025.15356802@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/s9_OHkIFGPCGxgx5UrvqmxK";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/s9_OHkIFGPCGxgx5UrvqmxK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 18 Dec 2019 13:30:25 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the akpm-current tree got a conflict in:
>=20
>   arch/hexagon/include/asm/io.h
>=20
> between commit:
>=20
>   1188dd7d3fbd ("remove ioremap_nocache and devm_ioremap_nocache")
>=20
> from the generic-ioremap tree and commit:
>=20
>   a632c00ae02c ("hexagon: define ioremap_uc")
>=20
> from the akpm-current tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc arch/hexagon/include/asm/io.h
> index f42d9973e7d6,b0dbc3473172..000000000000
> --- a/arch/hexagon/include/asm/io.h
> +++ b/arch/hexagon/include/asm/io.h
> @@@ -172,7 -172,10 +172,8 @@@ static inline void writel(u32 data, vol
>   #define writel_relaxed __raw_writel
>  =20
>   void __iomem *ioremap(unsigned long phys_addr, unsigned long size);
>  -#define ioremap_nocache ioremap
> + #define ioremap_uc(X, Y) ioremap((X), (Y))
>  =20
>  -
>   #define __raw_writel writel
>  =20
>   static inline void memcpy_fromio(void *dst, const volatile void __iomem=
 *src,

This is now a conflict between Linus' tree and the generic-ioremap tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/s9_OHkIFGPCGxgx5UrvqmxK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4Sv3YACgkQAVBC80lX
0GwPtQf/S2/piGuennunKVNnnQFWOAW8jA6/1iwtHTG4pMooPRz5wvsHL7Wsf4wj
P+NU7VHFbBsFl3kStQPbXGwyn6CDF4vAEHM/3u5YUuisprXZe9hty6iEoTVT5zpR
oORi6ebvhaAu3dVxBO+2mCRAUG/jlGUzBQ3rmkz/umaDry5c4uUiXMGtTTNBkBrS
rFnaBrNoMevAHm+mQ6eKPiektFJpMtLOk0qf/zVRJpfdv7eRpfxKy60XxTOih12e
UWf/2GRcCpLtjXkB1DBjPTr7jwCwggQzMvdB6YTGWMPHfIYelkuuWMa8K1QpzP+y
wpt8kHN3t7aW6fjjLwqi1EYHqilQsw==
=FmOI
-----END PGP SIGNATURE-----

--Sig_/s9_OHkIFGPCGxgx5UrvqmxK--
