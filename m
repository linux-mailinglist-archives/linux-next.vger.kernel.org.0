Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E4462D1EC5
	for <lists+linux-next@lfdr.de>; Tue,  8 Dec 2020 01:06:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728311AbgLHAFI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Dec 2020 19:05:08 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:38637 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728426AbgLHAFI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 7 Dec 2020 19:05:08 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CqgQR4Rhfz9sW0;
        Tue,  8 Dec 2020 11:04:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607385866;
        bh=19OrIeodFiMIQNQF+Sg6nJriKO1pUHSNuYeu7jcVYwU=;
        h=Date:From:To:Cc:Subject:From;
        b=S5ndaTCMWe8LZ4Y9MbkJj2Btd31XKWIW1/drGKuRNp7DM0Lfl8ry9NMpbX+EitFgo
         3Ns4nRa2BvVgX1UVFbHdq8ArCToB/aMekWs6pywJGMhcJRUEQRYQvbjpPoR6Gg0OkU
         8mPBeal+0ngnrovq3TnDGTaA4M7XO/SR1WAieYTO9C0TVGoOXyQi1m08gZt40KdFl4
         sIX8hfp+eXbvjE5wM42o5UWFnToe3iO9LDpQck1cIR14qLHAVjFeexAl0eLQjL0z9c
         MSTHarNskH6G50HDQx2E10H0UmaJbV9wHu1VR1VfflM5OV2ycH5T0leyxO5q9nd687
         Hkm+fZmbNDDuw==
Date:   Tue, 8 Dec 2020 11:04:13 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Martin Cerveny <m.cerveny@computer.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Maxime Ripard <maxime@cerno.tech>
Subject: linux-next: manual merge of the v4l-dvb tree with the arm-soc tree
Message-ID: <20201208110413.04400395@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/h7qdsitKTj5bCPYQb0am=ay";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/h7qdsitKTj5bCPYQb0am=ay
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the v4l-dvb tree got a conflict in:

  drivers/staging/media/sunxi/cedrus/cedrus.c

between commit:

  c6e95daab1cc ("media: cedrus: Remove the MBUS quirks")

from the arm-soc tree and commits:

  503dab0b8a56 ("media: cedrus: Register all codecs as capability")
  68b4a01f88af ("media: cedrus: Make VP8 codec as capability")

from the v4l-dvb tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/staging/media/sunxi/cedrus/cedrus.c
index d5fca10ea5b4,18d54f9fd715..000000000000
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@@ -522,7 -584,11 +584,10 @@@ static const struct cedrus_variant sun5
 =20
  static const struct cedrus_variant sun50i_h6_cedrus_variant =3D {
  	.capabilities	=3D CEDRUS_CAPABILITY_UNTILED |
- 			  CEDRUS_CAPABILITY_H265_DEC,
+ 			  CEDRUS_CAPABILITY_MPEG2_DEC |
+ 			  CEDRUS_CAPABILITY_H264_DEC |
+ 			  CEDRUS_CAPABILITY_H265_DEC |
+ 			  CEDRUS_CAPABILITY_VP8_DEC,
 -	.quirks		=3D CEDRUS_QUIRK_NO_DMA_OFFSET,
  	.mod_rate	=3D 600000000,
  };
 =20

--Sig_/h7qdsitKTj5bCPYQb0am=ay
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/Owv0ACgkQAVBC80lX
0Gy42wf+NAb0FeVZJwYwEqmiivZcxuhmfkdigRTuoeu8PN8wJvNOx1LScAT3KNOo
kCx0kDYjJxJqAb5AJST9FPjrAES4sqJlbJfbtCSfMEIltEPeT3hv3F0J1HnS2QMB
VKhDMXSySa4PTSsa3+UhyNkPRjcMoxDBBKK9fK8NDa5oKKgBL1x7xuslz039bXPk
usdiJa76LUUkNvPxsrXLOTYs1129k0eburfE8stiM23Lp3TypxbMlFHDsRGRGILH
ckD+EUCfdMh4CrRNQuVdPJ2gSlL0e5/BVMTbUHw3RDZ8rsFgr4jL5BCHVp/eSamx
gUoe+flkmz2PwEysn+k6ql5eBOi82g==
=XseB
-----END PGP SIGNATURE-----

--Sig_/h7qdsitKTj5bCPYQb0am=ay--
