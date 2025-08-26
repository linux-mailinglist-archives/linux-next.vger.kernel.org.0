Return-Path: <linux-next+bounces-8094-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD098B3510E
	for <lists+linux-next@lfdr.de>; Tue, 26 Aug 2025 03:39:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7774E3A5085
	for <lists+linux-next@lfdr.de>; Tue, 26 Aug 2025 01:39:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B90F192D68;
	Tue, 26 Aug 2025 01:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="mTZKQAIJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CBD946A;
	Tue, 26 Aug 2025 01:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756172394; cv=none; b=cMMnPR4IFkpBV1dgywuZJlLeh97Y1Vdh1R+Vgztns2r28EEHNDy9dPfSzNIF+41hQmwnw4VBExOmfCyBg/yhDItYaTTUHG0VnpMwbSm2jPlKt6zMkNsFTO9ryWqh8I2mLzjjZNGgG31VvmgudeOuiRqyA08BPvQiNDxOUrW64oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756172394; c=relaxed/simple;
	bh=jrQlkKZE0dhESTSEW37ZkFTrVuJlNHdto4PPk3MkFbU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=J/3g2cej83E5vqKdlsAShpc5rgMiEV8asoE/ougVqtFKUlO3OS+UJqXkPZoVqBd44iuG6c37RTMYl+nggeyA41Jyou01tdD5zeJmnJJ14pXxYfBBCr9HrnAC5I9hyfctnVaMJ24rP4FezwY0Nr5qWKNxqsstXQ0gEBDTQoJ3QQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=mTZKQAIJ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1756172382;
	bh=fihyC9cKLcW64xprbYrYeFAJIVxW7uXpfCV9ZLu4zxU=;
	h=Date:From:To:Cc:Subject:From;
	b=mTZKQAIJ3y4Mr1y0ojiCGTMxOULA2Wp5foJbkpDUi9gR7cZB9Ifj0kSP+/CmJLqjx
	 lUbpmXZzeRduhq8Ae6o2vgDrH0uKoBVOU/yxZI3CREFL7gW+mJkRnS0EeH8/81qk17
	 HxSyHQeoUI1DNtfZa7LrIH0Mrx/EAh2pHqTI8J5Hm4jFNNMtOvzzIODwHtxJj5lOOK
	 6mXcmDqnjsB8SLeEqtvJMcdVmpej0tVbApzQL7mK5pbcNoX+343fSHBfMwzw41nC8M
	 dXTzszkrBluGc8E+bkioiOWgXhRJMX2eLmmIPQd8mAj1X33cWatETEimdwpwBIirhT
	 7zMLvRLidjDRA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c9r1n2RRLz4wqR;
	Tue, 26 Aug 2025 11:39:41 +1000 (AEST)
Date: Tue, 26 Aug 2025 11:39:40 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>, Jai Luthra
 <jai.luthra@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Christian Brauner <brauner@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the v4l-dvb tree with Linus' tree
Message-ID: <20250826113940.52ee4ad7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uBVri_BmKkkPBWutV=PeV/X";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/uBVri_BmKkkPBWutV=PeV/X
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the v4l-dvb tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/media/platform/cadence/cdns-csi2rx.c:608:57: error: expected ')' be=
fore string constant
  608 | EXPORT_SYMBOL_GPL_FOR_MODULES(cdns_csi2rx_negotiate_ppc, "j721e-csi=
2rx");
      |                                                         ^~~~~~~~~~~=
~~~~
      |                                                         )

Caused by commit

  7b78fa862296 ("media: cadence: cdns-csi2rx: Support multiple pixels per c=
lock cycle")

interacting with commit

  6d3c3ca4c77e ("module: Rename EXPORT_SYMBOL_GPL_FOR_MODULES to EXPORT_SYM=
BOL_FOR_MODULES")

from Linus' tree (in v6.17-rc3).

I fixed it up (I applied the following merge fix patch) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 26 Aug 2025 11:12:42 +1000
Subject: [PATCH] fix up for "media: cadence: cdns-csi2rx: Support multiple
 pixels per clockcycle"

interacting with commit

  6d3c3ca4c77e ("module: Rename EXPORT_SYMBOL_GPL_FOR_MODULES to EXPORT_SYM=
BOL_FOR_MODULES")

from v6.17-rc3.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/media/platform/cadence/cdns-csi2rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/p=
latform/cadence/cdns-csi2rx.c
index 828b4ba4301d..8c19f125da3e 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -605,7 +605,7 @@ int cdns_csi2rx_negotiate_ppc(struct v4l2_subdev *subde=
v, unsigned int pad,
=20
 	return 0;
 }
-EXPORT_SYMBOL_GPL_FOR_MODULES(cdns_csi2rx_negotiate_ppc, "j721e-csi2rx");
+EXPORT_SYMBOL_FOR_MODULES(cdns_csi2rx_negotiate_ppc, "j721e-csi2rx");
=20
 static const struct v4l2_subdev_pad_ops csi2rx_pad_ops =3D {
 	.enum_mbus_code	=3D csi2rx_enum_mbus_code,
--=20
2.51.0

--=20
Cheers,
Stephen Rothwell

--Sig_/uBVri_BmKkkPBWutV=PeV/X
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmitEFwACgkQAVBC80lX
0Gz+tgf+IOP9NdAQPxayhIv08iT71F2+Z4Fw/b3MIRncZ3BcdFEV6ZMg6ZXjC31B
KDVishvmd1F5/GNmwpUIbUEcVViw/z+gFEXuMUo3YHcTv5fglQIno2aNfkJAWHoi
BGzYr970hciYOF95HNrCtyfvVK8PMkCnV24FvDK0+XWIwdxOBL00Lv5iGSbtONn1
9zY5POz/c+NqB+zvwEyTgvF1VIZ0SR2H4pcIaXDJQjvWsHqLF05CoA0Pcs2UyjWo
y+/bDzJMF8nnrsg9eRZ/aa/9F/Vwly5I8oTg1z/XDogptS629reZ0YbOi8gYMhif
b96tv2f+oKDIWDy7TnmG/HTDGLPd2w==
=30dP
-----END PGP SIGNATURE-----

--Sig_/uBVri_BmKkkPBWutV=PeV/X--

