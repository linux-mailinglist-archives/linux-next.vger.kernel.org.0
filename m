Return-Path: <linux-next+bounces-5186-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3581DA0FE1D
	for <lists+linux-next@lfdr.de>; Tue, 14 Jan 2025 02:30:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5078D169930
	for <lists+linux-next@lfdr.de>; Tue, 14 Jan 2025 01:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E6BA22540A;
	Tue, 14 Jan 2025 01:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Or1VNnSW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A804502F;
	Tue, 14 Jan 2025 01:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736818241; cv=none; b=WvJdP+CvbKT/vBfLUoZsi0RSXH7Jq+ql/ZQOchknYc9x1AemB+9in3JAg9XhG6eqDPm8GbdNwktnOozg+FB9TK+QErBxX2O7Amuptm1b9vcLD0UZbbL0XW3QTtPyiONbaQn6aT5//wIga5jqJQ4ubyWPSdtxeqPa6WKg2JFMw9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736818241; c=relaxed/simple;
	bh=jwW29DEHrVPtu3GS2M1ExyzyXiYx0h2TruQWI1GL9q4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=aABAcrTIwpauPTCpNiZw6E1i5+YiyORr4Dgc6icVfFudRPRaHrCQh36BoUrwBBW8GJSgpZsnzGCzjoptHZZqAc/GBfhGUTu76fOoFjSd0IFTQSBoTIX+b5GscgnehIUFDNHFXet5B0qze04JgqTXfiCmHDwWzDCkR0pjQdZorX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Or1VNnSW; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736818223;
	bh=uq4TdeSTT+OI1UyCzrbwriLkWC75e1mMtOZYuBwrIKA=;
	h=Date:From:To:Cc:Subject:From;
	b=Or1VNnSWjVecmiH7X0VYBn5IiBAw4na56uh2EN+m2O4Lirah7/H9MG+OUvBoyN51f
	 A1/cMIcDBiQLM6Y2jW2ltt+HYuffVYSrPn1HCck6b0P8NjVNUYJJ/lmFv5wHSUTMGS
	 gEFXmVUxmWAN/MmlwukaYyl3niGV16odhCQkScmTCXiFL2w3vJ0ywWtIgQPghbYr4L
	 SBvFbDYyNZhecRtzCywGX/+cdX/D74tz8o2ixloyJbh4BzH+9Co7EqUnkiDo29viPb
	 EyLZlvywLmpUZ6Qn6cj66v6XzzVgH0BKVxAtR3oefWFRhOHnu7Q6311kqQ9HI5Uzbl
	 tU8SzxLMvWH9w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YXBQQ6t17z4wp0;
	Tue, 14 Jan 2025 12:30:22 +1100 (AEDT)
Date: Tue, 14 Jan 2025 12:30:28 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm tree with the drm-misc-fixes
 tree
Message-ID: <20250114123028.67761865@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Xxx123I3QZ8_DDv4mUPmxfO";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Xxx123I3QZ8_DDv4mUPmxfO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/display/drm_bridge_connector.c

between commit:

  1bd1562d3522 ("drm/bridge-connector: Sync supported_formats with computed=
 ycbcr_420_allowed")

from the drm-misc-fixes tree and commit:

  0beba3f9d366 ("drm/bridge: connector: add support for HDMI codec framewor=
k")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/display/drm_bridge_connector.c
index 3a5a4f92c979,32108307de66..000000000000
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@@ -460,9 -596,8 +596,11 @@@ struct drm_connector *drm_bridge_connec
  		return ERR_PTR(-EINVAL);
 =20
  	if (bridge_connector->bridge_hdmi) {
 +		if (!connector->ycbcr_420_allowed)
 +			supported_formats &=3D ~BIT(HDMI_COLORSPACE_YUV420);
 +
+ 		bridge =3D bridge_connector->bridge_hdmi;
+=20
  		ret =3D drmm_connector_hdmi_init(drm, connector,
  					       bridge_connector->bridge_hdmi->vendor,
  					       bridge_connector->bridge_hdmi->product,

--Sig_/Xxx123I3QZ8_DDv4mUPmxfO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeFvjQACgkQAVBC80lX
0GwvzQf8DvWQGTTDWj9o6J5uhESCy7Uz/Af+xkRfutHgKookbd8CtcFECpwG3YYo
mCwDmF1eKjIaymRDOP5yaeWmJ8FYRpcsvwSwCPl2/Lt9984LwxzTazAyehVWStRz
hButypZwbfcJ/6czOyAA1vfP280i5miFw9YWqrWsoQgDbTa4ueyH4ISy/hZEKuQ6
zuUalowKE3+kOH6PPuV/lcTWQd48s/wKG/IvXnFxDIiN2+IphWGifVJbQJniVia6
FivbIaUpEy3dVGbgmzy3hQ+2Cwzzo2l0yakePIWO8XZMo0dj/AiIHLH4o3HH1Scm
fgPsh1rQun9pV90GljCTRcsTJ0A1tw==
=ZojV
-----END PGP SIGNATURE-----

--Sig_/Xxx123I3QZ8_DDv4mUPmxfO--

