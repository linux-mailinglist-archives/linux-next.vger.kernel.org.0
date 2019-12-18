Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC4D2123D1F
	for <lists+linux-next@lfdr.de>; Wed, 18 Dec 2019 03:30:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbfLRCa3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Dec 2019 21:30:29 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:50823 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726387AbfLRCa2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 17 Dec 2019 21:30:28 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47czWQ3VJpz9sR4;
        Wed, 18 Dec 2019 13:30:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1576636226;
        bh=rydmAAENH6ARfN+ThawgMJv/69AuxxIutVShBoiIVNc=;
        h=Date:From:To:Cc:Subject:From;
        b=urk9zjAYSIcGBvDNJNlbxUB1/JlNW4cnY45vYuTIN38gZv7dz/8RLIz9SkAFll3Mj
         wwIOeTiMQusAIpzjgsQJlvK/b9ofnDQrnVzLshc0i7DW/UTuIzCBWzk3iHI+ph2o0Z
         twxeQ7FBiZGZ7dwzj/8Cz1K8rF6jvxT0UZE0aEp3FPxCQi+ohEsgH/xNKhedGIhx1y
         WGSIN40UizASeZ0e7YZ6DlBJC+uTwXLZY4awtIfS1+XoiNyGOsJeGj1JOkAmeao0pZ
         BtPatoDHhpFdhqlybAY6rVtT+x6EeUU9SwWAkKt4rhpFcUbRE5UlxQM0HbV6/vxmVN
         aq/CNMAZ3DRYw==
Date:   Wed, 18 Dec 2019 13:30:25 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Christoph Hellwig <hch@lst.de>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: linux-next: manual merge of the akpm-current tree with the
 generic-ioremap tree
Message-ID: <20191218133025.15356802@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ryle1Bp7qSqGgl/eJzoKFm9";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ryle1Bp7qSqGgl/eJzoKFm9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/hexagon/include/asm/io.h

between commit:

  1188dd7d3fbd ("remove ioremap_nocache and devm_ioremap_nocache")

from the generic-ioremap tree and commit:

  a632c00ae02c ("hexagon: define ioremap_uc")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/hexagon/include/asm/io.h
index f42d9973e7d6,b0dbc3473172..000000000000
--- a/arch/hexagon/include/asm/io.h
+++ b/arch/hexagon/include/asm/io.h
@@@ -172,7 -172,10 +172,8 @@@ static inline void writel(u32 data, vol
  #define writel_relaxed __raw_writel
 =20
  void __iomem *ioremap(unsigned long phys_addr, unsigned long size);
 -#define ioremap_nocache ioremap
+ #define ioremap_uc(X, Y) ioremap((X), (Y))
 =20
 -
  #define __raw_writel writel
 =20
  static inline void memcpy_fromio(void *dst, const volatile void __iomem *=
src,

--Sig_/ryle1Bp7qSqGgl/eJzoKFm9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl35j0EACgkQAVBC80lX
0GxilAf/UX1SpeeXym4B3nQWzTuWDv0Aiw58h9iRb91x7Fz6NBFfIJmmRAVNWKw5
GMwhqaHGnZmdUyYe5YVYHlUkG5R1HsEe2awFBkT4j7TNGmDp1mVZ0pyLmKpTRXNd
LdrXr6kWxsbyJ07uQQH/Mr6oChOcIenabSUx/Cb8bwY+0JhR/c3EN2cYMf6iWzwv
zTwN5481v1RNQ31pb388e0l0cXj3MWL7uanhld4w8pmHy4/58vRAjTpYIodZfwVw
nXfb5+FkYCZ4S/oV6UJ1QIJuO12rRdAqJVhKGEt0zeCBsQlGgTmk5zUxg+yi4PEg
T+qgtY1H7axVDUpWME9UqcARj3zEuw==
=I8B4
-----END PGP SIGNATURE-----

--Sig_/ryle1Bp7qSqGgl/eJzoKFm9--
