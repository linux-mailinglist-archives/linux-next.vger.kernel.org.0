Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7610F3A7484
	for <lists+linux-next@lfdr.de>; Tue, 15 Jun 2021 05:00:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230028AbhFODCI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Jun 2021 23:02:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229986AbhFODCH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 14 Jun 2021 23:02:07 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B79EC061574;
        Mon, 14 Jun 2021 20:00:04 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G3tN03g1fz9sWD;
        Tue, 15 Jun 2021 13:00:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1623726002;
        bh=Od/yztOJULwCdd2G/2AaBDDaOv4wMM8/zgHyGQR/+iA=;
        h=Date:From:To:Cc:Subject:From;
        b=Ec06KDhyM9RcNN32K+ql4ITT5Vxbh3/2XCUP4JRBar2Fggg68A8p7JJiAl1ymZW8D
         z4oSp/7tcBtY+Vijt9H4UpvInVEOdWTGTqE0ofZ8u+eZK+7Cnk/Mx8R5vioNq2wSas
         9SIIxuXf5ytm+fO/OTdd3mYLiQwTVQ3P/NbvdoIdk53TMdTRPblnShX6NoPPj2xjuI
         Rxe442a5cJSoP+00zp7QwkLtpX4YAs0UV/Q8hNU7s2LcZpohun76gTbS5ULnbm1eFX
         yXU+WN4JOlBkwe+a24nbjJSpI6gwXER2N6WkEgj5SjGF9JM5tgMJoMZES784aiF901
         roIVa9uwtM8Eg==
Date:   Tue, 15 Jun 2021 12:59:58 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Rob Herring <robherring2@gmail.com>,
        Richard Weinberger <richard.weinberger@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Rob Herring <robh@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: linux-next: manual merge of the devicetree tree with the mtd tree
Message-ID: <20210615125958.541c275c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YvI6qDAJClwRfkq.S3UNUGH";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/YvI6qDAJClwRfkq.S3UNUGH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the devicetree tree got a conflict in:

  Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt

between commit:

  6947ad674944 ("dt-bindings: mtd: Convert ti, am654-hbmc.txt to YAML schem=
a")

from the mtd tree and commit:

  9b358af7c818 ("dt-bindings: mux: Convert mux controller bindings to schem=
a")

from the devicetree tree.

I fixed it up (the latter removed the file, so I just did that) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/YvI6qDAJClwRfkq.S3UNUGH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDIF64ACgkQAVBC80lX
0GxmvQgAkn00bNPpJC4YkZbdEeASyVcXrxStIhfiaLUYlbGc/fWiCoPYOqPjEYnB
UK1ITRJ39aTJNGff9jI02hTXZHBIP2Fo81pMsljjH7MQ4AY1SlP8vP64uFIvOyBO
Gmuaj0nmjGimzX+2oDNNGE7Y27hei4Pvy8WpTR+iALLao6KbuWBTgZ4DqoCFleaI
jPjNT7XlMO4yWhWVUSMfAjtxhR5NFqhPr7kkixmI5iwLOumxB7RL9skku3ln2SDv
agTXAf6PpEJ0nS2LR8ADTVQ+jpxloC88F+GRDZeq9xheWVdDr3f78PcsUHFhifly
7vxLUen3kOQUye8wHVsL4Z/9njwByQ==
=swxV
-----END PGP SIGNATURE-----

--Sig_/YvI6qDAJClwRfkq.S3UNUGH--
