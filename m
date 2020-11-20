Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E3F22B9F5D
	for <lists+linux-next@lfdr.de>; Fri, 20 Nov 2020 01:40:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726118AbgKTAjh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 Nov 2020 19:39:37 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:39351 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725887AbgKTAjh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 19 Nov 2020 19:39:37 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ccd3R5vgvz9sSs;
        Fri, 20 Nov 2020 11:39:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1605832774;
        bh=1+WjOUA4F5ZE1pDdlXzmhPcAwOGwV6MU+1FBtuIHMDM=;
        h=Date:From:To:Cc:Subject:From;
        b=ERlRsuGopE/dQ1E2gEmM0jc4mEmV4pHkaE1Mha0nMAEZv4qjnXAjCTjfDw5HApw0a
         K4uL64jnu0cRxLEwGRBTyf2hssH5aZv7HdS3NE+imlJnF6snJAaKiC+rPTXJDR3ZxU
         hvPlbLpgAjJV3v6023kf7/8RHMdk3q0/8EdAuLZ/awAcUki3mQqZKYdmMAPihImebh
         7xuIXhzkMyhLOrD66R4rXQKBf31wIS9pbLALWoGHV0eesLluWn0umrUAV6yU+ThY1F
         pG2zleTHXg0QmqSTeKwhup5/Wn+Ho42qijb0tV3+P3+4zPieyi78/WwlmpaMhMvOnh
         DU+mEzirgAVMA==
Date:   Fri, 20 Nov 2020 11:39:29 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the nand tree
Message-ID: <20201120113929.0aff2f32@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1RyAPTvipMqWTJTaWUnvCaR";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/1RyAPTvipMqWTJTaWUnvCaR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the nand tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/mtd/maps/physmap-bt1-rom.c: In function 'bt1_rom_map_read':
drivers/mtd/maps/physmap-bt1-rom.c:39:10: warning: cast from pointer to int=
eger of different size [-Wpointer-to-int-cast]
   39 |  shift =3D (unsigned int)src & 0x3;
      |          ^
drivers/mtd/maps/physmap-bt1-rom.c: In function 'bt1_rom_map_copy_from':
drivers/mtd/maps/physmap-bt1-rom.c:78:10: warning: cast from pointer to int=
eger of different size [-Wpointer-to-int-cast]
   78 |  shift =3D (unsigned int)src & 0x3;
      |          ^

Introduced by commit

  69a75a1a47d8 ("mtd: physmap: physmap-bt1-rom: Fix __iomem addrspace remov=
al warning")

--=20
Cheers,
Stephen Rothwell

--Sig_/1RyAPTvipMqWTJTaWUnvCaR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+3EEEACgkQAVBC80lX
0GxfWwf/bxB7lnubHAeYPSmOOe6tLGS7Qh09wGUwy58jsVK/zQDbW5cZQ69yqTOt
oemGOxfvsg2JtUL+cFx7mRsWbqPNtN/PSeamzaqEM3JWnj3qnrUt6E7vsB05lq6l
ffVdZJf8e/rvicF3wjgww7tzSRNhimnQV1J6TDr028A47cuubXQAnhG5vnKHt4VM
a8yAK2rJ5fMHFwGvg9RN/0h9nI1Du1mzjkymeDrrjQvXGB5x7J9ZVJx21V++A8VL
91Nh9DRYRzqJ17a2kCy5Lbq6g79Y3J2DPrdPzK5JP5KC6dUlSg5mPjXnKQxx3rYR
BgeN6Nud/jhzLBCdzDCooenPrfHGjQ==
=F1x5
-----END PGP SIGNATURE-----

--Sig_/1RyAPTvipMqWTJTaWUnvCaR--
