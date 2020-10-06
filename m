Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7988528432B
	for <lists+linux-next@lfdr.de>; Tue,  6 Oct 2020 02:08:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbgJFAIv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 5 Oct 2020 20:08:51 -0400
Received: from ozlabs.org ([203.11.71.1]:49745 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725865AbgJFAIv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 5 Oct 2020 20:08:51 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4C4yVd330Wz9sSs;
        Tue,  6 Oct 2020 11:08:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1601942928;
        bh=8/G4k1AhpaI3x7ulpXF06ldBMVaQ3b/ceWYFxO5ARfs=;
        h=Date:From:To:Cc:Subject:From;
        b=FIKnc5FhquoZST/IJh957E++MiJlPbJgsQNV5AFb57GM2PqGu6ulNzb4XVm27W1Xp
         ESnbgMsuYHV2F4s8Uu82O+2cGSXtM0Eipx1l2hfyxrauR2XDt8R1BYm2Qf6sGJYoAF
         CK7peDmcEu4F6F8+duES6MH0xCSzottbRUH0zaAZzOW6cxjw/4M+gFwDFDIXZiPDaD
         Qs1i4S+aQYQ0bEvrSwch3TKqGxQEIDfH4+xDCwJ1Okmws5fPw7EmyJysWARDIdN8rB
         3eF4PvkHYyVWiDXtHelEs/aHQedVwvex8zHW1AxS+HWq1JX9CyzHRLlVSqt442IN2g
         88eLYctp+T89Q==
Date:   Tue, 6 Oct 2020 11:08:38 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Christoph Hellwig <hch@lst.de>
Cc:     Fabio Estevam <festevam@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Shawn Guo <shawnguo@kernel.org>
Subject: linux-next: manual merge of the arm-soc tree with the dma-mapping
 tree
Message-ID: <20201006110838.6d541a9c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gfo.BtVJY1h44s3o7MEuMtj";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/gfo.BtVJY1h44s3o7MEuMtj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm-soc tree got a conflict in:

  arch/arm/mach-imx/mach-imx27_visstrim_m10.c

between commit:

  f47e22d65d08 ("dma-mapping: split <linux/dma-mapping.h>")

from the dma-mapping tree and commit:

  879c0e5e0ac7 ("ARM: imx: Remove i.MX27 board files")

from the arm-soc tree.

I fixed it up (I just removed the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/gfo.BtVJY1h44s3o7MEuMtj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl97tYYACgkQAVBC80lX
0GxpEgf/UY3S5NBMEVgQBRCqa2yN4Z5KKHooa2VkcZPCgN6gjOgJWVukZ1pnPRmB
8JZ7b3eCdc66hF4x6Sy5TGcptoL9N6rrJQV5jP2/hH+ex1bmiHUhPXXqMhL5mIZq
dAlNdmS9qHaKltrCpwm4ZE67LxIM1l8b3mZAcs0Fgt1TiU4R/g0KacRtxKgm4/tB
xkM8vfcOe0HuNztvUOwJkj6T2pDsRQQYT8q8BB6GmGs18yvOtyksVyfZIU3PGEgd
GQdugEU2cYM4HCJrfDK+jNOS66f0lzUIHv5zof7XC5C1aSUSHEfOnsK7GXI0yit1
hpmu1ZxPNMYK/lCkGa65OWCw6r0w2w==
=BYOI
-----END PGP SIGNATURE-----

--Sig_/gfo.BtVJY1h44s3o7MEuMtj--
