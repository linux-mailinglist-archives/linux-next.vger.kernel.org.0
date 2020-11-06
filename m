Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C99892A8E61
	for <lists+linux-next@lfdr.de>; Fri,  6 Nov 2020 05:31:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725830AbgKFEbo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 5 Nov 2020 23:31:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725616AbgKFEbo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 5 Nov 2020 23:31:44 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42063C0613CF;
        Thu,  5 Nov 2020 20:31:44 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CS6sm2q3Hz9sPB;
        Fri,  6 Nov 2020 15:31:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1604637101;
        bh=/qnSqxlseB0z4p99jsg13j0kBVQxIFFGSTzw4zhXShU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=RFM8DSNokqGpEjZoNo2ajcWH8NM0oht7IKcWwNv/rwXjfOe92FfR2tX2PzoJDgQ++
         pGVKNtDBQDX+/4w+cK6PKyDcMg0PNJVZ6r/MOgtdhQUSkFUrBD/m410JAtS2mWR9em
         T/Z4Mq4z5X+rE1yeBtSUs3q414VHXmx9QePdQTuGhqtqwi9zAweGMlF5j44cLnwjQo
         meKDOiVpJMw5BoJsLPn6QAKPr7PMy7IEhK3hWxyDbdPVf09bZVu3X9/aGGI/O34iG3
         /urfBJzmTOrGT3lEL7FfGc9TYmK9Dip7/nha+RVWjXjVycvFXUzxXlBFoLUr2uC1qO
         nRYzblU+TlPSA==
Date:   Fri, 6 Nov 2020 15:31:38 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the nand tree
Message-ID: <20201106153138.38725a6b@canb.auug.org.au>
In-Reply-To: <20201103173739.0071761a@canb.auug.org.au>
References: <20201103173739.0071761a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6FuwPobJEyejat9d5oE92P6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/6FuwPobJEyejat9d5oE92P6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 3 Nov 2020 17:37:39 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>=20
> After merging the nand tree, today's linux-next build (htmldocs)
> produced these warnings:
>=20
> Error: Cannot open file drivers/mtd/nand/raw/nand_ecc.c
> Error: Cannot open file drivers/mtd/nand/raw/nand_ecc.c
>=20
> Caused by commit
>=20
>   5c859c18150b ("mtd: nand: ecc-hamming: Move Hamming code to the generic=
 NAND layer")
>=20
> Tha sbove file is referred to in:
>=20
> Documentation/driver-api/mtd/nand_ecc.rst
> Documentation/driver-api/mtdnand.rst

I am still getting the above warnings.
--=20
Cheers,
Stephen Rothwell

--Sig_/6FuwPobJEyejat9d5oE92P6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+k0asACgkQAVBC80lX
0GxhFQf/fZMTUADTsv1p+2rtJpMTXHNrKRhNo/6ltrGh6qvncRLIT/APfOda8x8C
Tb4r4m3cBvobMpt0auBW9Aff3i0MuUEqRVEcc6UW3z+b5AZIzSWMp0LmWeEC1FiX
1uH0HaY/Bdqs7BZDmadz48X+HGP6nDsKb3oq/JpCOOwi+EuJBtSz4Z5f96Qy9mJi
CZg5d0CRyCaDt58VYL/Gq9FWXH48M7bpLZ+E0vbP/GzagUu54zxVxY9yn6wL6UML
lpy11qQFQzWlfgzyw0DMZ1pvF0bke1f5UrPFdmvLHycN55bj+GEKH8+6YTaReW71
ZeTCiA9YUE5LnEWHUF805BBg8B9BLQ==
=8Ce/
-----END PGP SIGNATURE-----

--Sig_/6FuwPobJEyejat9d5oE92P6--
