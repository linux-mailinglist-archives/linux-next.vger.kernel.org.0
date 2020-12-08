Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3AEF2D209D
	for <lists+linux-next@lfdr.de>; Tue,  8 Dec 2020 03:16:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727686AbgLHCPd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Dec 2020 21:15:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727569AbgLHCPd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 7 Dec 2020 21:15:33 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47C13C061749;
        Mon,  7 Dec 2020 18:14:53 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CqkK50p8sz9s0b;
        Tue,  8 Dec 2020 13:14:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607393690;
        bh=K/7/U/OHT/aDPT77kGcX8Er+uSCe/nG3bVoy/X96xvc=;
        h=Date:From:To:Cc:Subject:From;
        b=IGpswxb88MRv3N/PLKlgBW9xlerkUlB0qb6MoSscUvAdybPcrDnuouHzVdlWBgJkG
         a8IIwZhNwE2ACVbU0PNeky5h6OANaGSf+TuvCynCFrywQWxZ4YrJAgH8hAVAdO3wA7
         2jImfOYhffOIBOnLFX/Q5FaSLb2RcBfVvS1mAF5VVv9qhGBlGJShrBwzisnanMPunp
         9yJYzykFnTvCNBTWKOug84gYpu8s2dZjLLw2M/OIqgk+H0gKP6rGvaZHHErH/ZlNgl
         zdHsfjw4LSb6OkfuYABa5eBfUzcmeaFrgA6tQxTa0h+TcE7WWytl+al7URcEfQCa25
         dOM1h66NrSDyg==
Date:   Tue, 8 Dec 2020 13:14:44 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Ramuthevar Vadivel Murugan 
        <vadivel.muruganx.ramuthevar@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the nand tree
Message-ID: <20201208131444.01fd11e5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2wiUo0vld+O5x2/6dZtiyY7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/2wiUo0vld+O5x2/6dZtiyY7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the nand tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/mtd/nand/raw/intel-nand-controller.c:17:10: fatal error: linux/mtd/=
nand_ecc.h: No such file or directory
   17 | #include <linux/mtd/nand_ecc.h>
      |          ^~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  613b6e4e3baa ("mtd: rawnand: Add NAND controller support on Intel LGM SoC=
")

I have used the nand tree from next-20201207 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/2wiUo0vld+O5x2/6dZtiyY7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/O4ZQACgkQAVBC80lX
0GwAiwf8DW2A+R9Cjas5xJf9qGCkWX3o9kNNYt50g1z2u6689+6PL8Wyq8kRFlhj
GhQfvomq6x5Qkemwc1YIjLO8IGsixTb0Rcbb0Z2tuuvO8KEmet1iDe8VYRITjHXS
PUpcDiUvTX5aZwZPOOCkBisv9KLCokb36tech4bMgBNx3O7dKgO/6PXtY83dRZtm
yp79QXHTOUS/KnyOvz4UifsHat1aLonYSNHRujPmiYVTsERMCxXE+nUhILDgzYhE
ffe8ZUNBCel/uZ1QgbmIG00aYNAKzc+5LBZRR+sMN3JvGje2xj/Ka8uE0dNfsGAy
RvyFEgHcwF4oq6tuMlUm1Ur+550M9A==
=qMK1
-----END PGP SIGNATURE-----

--Sig_/2wiUo0vld+O5x2/6dZtiyY7--
