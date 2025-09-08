Return-Path: <linux-next+bounces-8216-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD85B483C5
	for <lists+linux-next@lfdr.de>; Mon,  8 Sep 2025 07:49:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 062203A760C
	for <lists+linux-next@lfdr.de>; Mon,  8 Sep 2025 05:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AE1D2264D9;
	Mon,  8 Sep 2025 05:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="P/OTpD7K"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB0322424E;
	Mon,  8 Sep 2025 05:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757310560; cv=none; b=RFnJuKK6YNpoBcEjeTGoJ3H7PKCPOYo9S16cbzllh+Cb9DYEyWpzznMVPBqqVU4LtmB8P1m9OQN/gnIy1LX1kL3qMMuWw7Kks7BZr5JuuQt1ivhgaRGNVcU0Dgqo7PxkjxyjOwIcmklMSlqa5zdut9cXhuLWv/yoEieTgvE4WrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757310560; c=relaxed/simple;
	bh=JfGuyfW9D0kKhiuy32plYogAVTDBUchlY+cnv/C3AhE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Ddz//zxt1JbNRgODHrLUafIoGtMd9oDA06kuwt4Fqm671qkf9WQiLS2gBqen0ImAlbfmzPEpwncQO8x86LKD4N90ax1Nuygs8rC4SyFVZx6zaEJ37CR9DjhgC0giDe1iVh970G1X5H+qU+jNC/j0RFLN8jTKEhzloP/vr6ZP8AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=P/OTpD7K; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1757310555;
	bh=u02UJ6ZXh3NmyEBtqPxpp2cMxmC0q9X+OV3aGctYjEg=;
	h=Date:From:To:Cc:Subject:From;
	b=P/OTpD7KrgvJ9gk0JlMAt2qEjr21n22+Kv1HHal1xqpa4utamE6CdEWtsn4+/O7KH
	 cICZK3ZzFU/Kj+O1i6RGQ62Jf432YCYY84up3p15aQm+R75SUBWy53B5B1sCT0fklj
	 WazGohXOCm9+jTSSw//vjxghUMlod/TVQl1zWW6RFNAoJ/eecrfiGI3esM5HCreNkM
	 xHt/VFPSq8Wjs4I5niewlDSOtDHYFM0M+dr1GS8540hemrWSn5jG10zyNu3Gb6ZG+g
	 +jSRFVp+TgdmoEtifZcxZVZkGVv6Wy5RVLEulF4H0ZtYBMns50VmUjmd10S6QOylke
	 HW63AAJrQMyFg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cKwxk3gTrz4w2S;
	Mon,  8 Sep 2025 15:49:14 +1000 (AEST)
Date: Mon, 8 Sep 2025 15:49:13 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>, Liam
 Girdwood <lgirdwood@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Nick Li <nick.li@foursemi.com>, Thomas
 Zimmermann <tzimmermann@suse.de>, Wig Cheng <onlywig@gmail.com>
Subject: linux-next: manual merge of the devicetree tree with the sound-asoc
 and drm-misc trees
Message-ID: <20250908154913.5fb9ae9c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OX4/p=OXFtBgv3h7kG9jnVV";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/OX4/p=OXFtBgv3h7kG9jnVV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the devicetree tree got a conflict in:

  Documentation/devicetree/bindings/vendor-prefixes.yaml

between commits:

  243167e96939 ("dt-bindings: vendor-prefixes: Add Shanghai FourSemi Semico=
nductor Co.,Ltd")
  09b26dce32f0 ("dt-bindings: vendor-prefixes: Add Mayqueen name")

from the sound-asoc and drm-misc trees and commit:

  4ed46073274a ("dt-bindings: vendor-prefixes: Add undocumented vendor pref=
ixes")

from the devicetree tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/devicetree/bindings/vendor-prefixes.yaml
index dcf82d972037,0f5273123650..000000000000
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@@ -560,8 -568,8 +576,10 @@@ patternProperties
      description: FocalTech Systems Co.,Ltd
    "^forlinx,.*":
      description: Baoding Forlinx Embedded Technology Co., Ltd.
 +  "^foursemi,.*":
 +    description: Shanghai FourSemi Semiconductor Co.,Ltd.
+   "^foxlink,.*":
+     description: Foxlink Group
    "^freebox,.*":
      description: Freebox SAS
    "^freecom,.*":
@@@ -943,8 -955,8 +967,10 @@@
      description: Maxim Integrated Products
    "^maxlinear,.*":
      description: MaxLinear Inc.
+   "^maxtor,.*":
+     description: Maxtor Corporation
 +  "^mayqueen,.*":
 +    description: Mayqueen Technologies Ltd.
    "^mbvl,.*":
      description: Mobiveil Inc.
    "^mcube,.*":

--Sig_/OX4/p=OXFtBgv3h7kG9jnVV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmi+blkACgkQAVBC80lX
0Gy9eQf/WAaQO4uhlb73zuSy+mJ47ng+u3d0GTkf3d4rXfReg1sNQnjrAbXf101b
/FwKmQe9Z/4a+/zjSxUj/Vmb/ns4V74C7++d0Wnw5f+FptyqW5Fwdcbpml3tJc3W
lK9UZCJFAKGSCCUhRayO/plqTaalUeWiLr5NQe9YrfAA6+KpxdrUvMWfCjJR5Alm
OPJRoo5n1Sy+Y/cFZ/Iluc2MUF9ARAaH49A6xPoBK+f2tAuOxJSnCBI+05eXEc2G
Jv2lo9gTA2Zlm+/O6I5NIpCIz9afEVgOTBlQvrHVTktU5C/XLtBcB2d6BCi7t6mB
ZbKUws7+hTkxIPhpqx+J+JX/5oU7+g==
=zHgE
-----END PGP SIGNATURE-----

--Sig_/OX4/p=OXFtBgv3h7kG9jnVV--

