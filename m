Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9106A1D6DE0
	for <lists+linux-next@lfdr.de>; Mon, 18 May 2020 00:40:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbgEQWkg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 17 May 2020 18:40:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726559AbgEQWkf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 17 May 2020 18:40:35 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3C55C061A0C;
        Sun, 17 May 2020 15:40:35 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49QHCz1l3Hz9sT4;
        Mon, 18 May 2020 08:40:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589755233;
        bh=R8QgB48sur5ouO2wvK1u0Cj0Vv99np8NdTl5OyKWVL0=;
        h=Date:From:To:Cc:Subject:From;
        b=HemK8HfpzcrsQfqTQ1gUK/FvalwzHNoBfDsnWZ/g7NeE2zcXvWvXkE6e4kWQpIg3S
         +hT9+Er3qC6tvTbHusuDbD6SvZ78GXWPzPPGx3lYntYyrGv3yvuw5oSpiX9d+0Sjo9
         o6/ShsIETB+befT10Y+n5UviZ0kYAp2q53s6MuYdU4Z6it60twkfyLXZCG5rFE5INL
         7xXJb3l1P9mnAJ/XkAyuVN2Fc0UtCFPX8qB4YbjPE3FyaZQEC6fxBxHSUO3RjIoSFz
         tfS2oS0XYbH/rv1KzyLP5fcm/V27h5F60nIEfYvBNPR/mUOv51frW80v2jNrJ43eNH
         pAKkILPcJiaCQ==
Date:   Mon, 18 May 2020 08:40:21 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>
Subject: linux-next: build failure after merge of the mtd-fixes tree
Message-ID: <20200518084021.64cbf411@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3/_22vS8vdYTJ5KggnHK=KD";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/3/_22vS8vdYTJ5KggnHK=KD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mtd-fixes tree, today's linux-next build (x86_64
allmodconfig) failed like this:

/home/sfr/next/next/drivers/mtd/nand/spi/core.c: In function 'spinand_init':
/home/sfr/next/next/drivers/mtd/nand/spi/core.c:1093:26: error: 'struct nan=
d_device' has no member named 'ecc'
 1093 |  mtd->ecc_strength =3D nand->ecc.ctx.conf.strength;
      |                          ^~
/home/sfr/next/next/drivers/mtd/nand/spi/core.c:1094:27: error: 'struct nan=
d_device' has no member named 'ecc'
 1094 |  mtd->ecc_step_size =3D nand->ecc.ctx.conf.step_size;
      |                           ^~

Caused by commit

  d5baa0ec83de ("mtd: spinand: Propagate ECC information to the MTD structu=
re")

"This fix depends on recent changes and should not be backported as-is." ?

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/3/_22vS8vdYTJ5KggnHK=KD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7BvVUACgkQAVBC80lX
0GzgrQf/eq9OZSE/dsSjxN+w+qoHJmXwNrl8Q2RM8yKWpfFcHm+jG6CT++2/BRPk
l7ZrO/dhTV0Si3m3X2bKFYf7wErCFKD7UmAb1VJ6iTARTFXxJyzGokP4B2ZK0gy9
YvBtGrpUn9heBL7Ii1M/6JZm0m3eo4IsT2vBnn/GEfj3v173hJ5pBzT37kSz4kHx
9pdVJpFHUP7hQVpFkWGqGB8w3rmXrrYuqYkqyo3WPhYEkTy8F5iPcf04fW4DRuoq
zY08MOUBCg2+wMFPdVt9eogBzVTF6Q9igetER7/kBANEMFaMCkI4N2A8aus3kSAY
a/RrUMRM4Rg1y+pHPw8J5QuGVcv5Pw==
=Ajry
-----END PGP SIGNATURE-----

--Sig_/3/_22vS8vdYTJ5KggnHK=KD--
