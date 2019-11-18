Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29FE4FFE82
	for <lists+linux-next@lfdr.de>; Mon, 18 Nov 2019 07:30:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726414AbfKRGaZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Nov 2019 01:30:25 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:33169 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726347AbfKRGaZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 18 Nov 2019 01:30:25 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47GfG52fzWz9sPj;
        Mon, 18 Nov 2019 17:30:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1574058622;
        bh=kEivEeHUVNAOspt6MauwNZJf/9eV38NcNNwk1p75th4=;
        h=Date:From:To:Cc:Subject:From;
        b=l7i94oaMf9aHVAWx1RNmT2HeWDjailgMAtlzbaIcbi4GRKNyNFhmGwx89uq5075c7
         dvawXvgmbdihvpX52xbbOyIgoGa9KKoMxkkI0VS/CdNSXVbKQO5+iF+pWFqg+btnY6
         NxA2iuDmEp1htOhkl7k1/x72wHy6zT96QYu9nzwQj62A11+mZlilJBlalbrLaKdCZq
         ptMLIV0gIbrpvcoLY4mdBvFPTn1q8ZbdMbmtTd9EF67YOx04APpgpU88rR/MeISASe
         WxbJyN3kCC+1QApJOSUya1HJcXNBxfkmLhRlhVOjbKKNXbImT0p731HO2BUyhlHgkt
         y5UTWc4WrmrFg==
Date:   Mon, 18 Nov 2019 17:30:14 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christoph Hellwig <hch@lst.de>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul@pwsan.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the generic-ioremap tree with the
 risc-v tree
Message-ID: <20191118173014.654c20f6@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/z2k1D4ea03dgzDHHTadOUvw";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/z2k1D4ea03dgzDHHTadOUvw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the generic-ioremap tree got a conflict in:

  arch/riscv/mm/Makefile

between commit:

  e9987a5b2ad3 ("riscv: add nommu support")

from the risc-v tree and commit:

  38af57825313 ("riscv: use the generic ioremap code")

from the generic-ioremap tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/riscv/mm/Makefile
index 44ab8f28c3fa,b3a356c80c1f..000000000000
--- a/arch/riscv/mm/Makefile
+++ b/arch/riscv/mm/Makefile
@@@ -6,8 -6,8 +6,8 @@@ CFLAGS_REMOVE_init.o =3D -p
  endif
 =20
  obj-y +=3D init.o
 -obj-y +=3D fault.o
  obj-y +=3D extable.o
- obj-$(CONFIG_MMU) +=3D fault.o ioremap.o
++obj-$(CONFIG_MMU) +=3D fault.o
  obj-y +=3D cacheflush.o
  obj-y +=3D context.o
  obj-y +=3D sifive_l2_cache.o

--Sig_/z2k1D4ea03dgzDHHTadOUvw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3SOnYACgkQAVBC80lX
0GzIGQgAowMz9v7woeEzGZSQLSfp5ooLnhwd+6ISl4dQswNAmUGvM5e2xlhRZy/r
z16p9GkHEI2dq1ko2mYFKJW9P4B4eVNC6jupkqkNqF/4pZuQGz6hQfHvlQI91Gx3
llMfoRdtboSyPoyVKFNLO4mHXTRV8rDlJlyGQ53nN0Io5OkGnnmhpbTpxLYA4HGi
USHOSJgu/PF2gILFF/1tmwXFzKTtwcwkXrpFVvtYh9E38IT3Ofmjz6EeepZvEYJy
skOVWWMzUvU1y1m0eVms6To3C85D1CkquGOZygMK0YWgCxwzx/XqyFnrLU1QB8dE
oeSwsr8p5sroil+ZvnE0pNZODZoXCA==
=YmRO
-----END PGP SIGNATURE-----

--Sig_/z2k1D4ea03dgzDHHTadOUvw--
