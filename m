Return-Path: <linux-next+bounces-5465-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A44A3794A
	for <lists+linux-next@lfdr.de>; Mon, 17 Feb 2025 01:52:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7599188CCEF
	for <lists+linux-next@lfdr.de>; Mon, 17 Feb 2025 00:52:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 986EB79D2;
	Mon, 17 Feb 2025 00:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="nEbQoif5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461762E406;
	Mon, 17 Feb 2025 00:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739753567; cv=none; b=rKfQZu2wCtxhWiEB30+trzi1S6k6bBFviwdroOmbFzNRPURJecwu246cVFpRMTdQthi5KzyyUMoRc/EpK7cFiDMwclUuE8emmqW3H8JyzwcKU3PxjZGmwjGSUT+CQ4jMMQ7Fz36r0nSFUyorvMmBqtSWe2JvOsQ8TQRSYcNY6YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739753567; c=relaxed/simple;
	bh=23HkDlUD5mWGcE7aphZBBSvEXupw+3Tg4P9qdnisVXo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=aOl6mBHHufeJxl8kOoZCLolbyxL25orC5RygX4ti1VxcbTJEmiN/F4T4U4f/TTNy7acibYQ4XRTcEThnswFrfUiN5KcLxxBUZJDFz82i97AzXFPVw+7OFK3/lvv5uD+r5a3SZ+jYKwgxDE+bjMmI0Lz8kTdxzUzUG3BuyxNIBWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=nEbQoif5; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1739753556;
	bh=KSGXX34I/Tc3wWb6KX2w22KlpznNooZZpfVa6bYJsVY=;
	h=Date:From:To:Cc:Subject:From;
	b=nEbQoif5EH05HtDuvc1hsjRpKytrdOkBUEBr1Ns45Ciqa+vO5AV7lacI/2N9UKQdr
	 UMSjrjCzEbYBiVfzTWn8MV2KpuBR2SRc2WA3gC6P7uTP7d17CfiXs0NL82gIOZ/a9k
	 KMbQiYTvE1GYjpX4UEZW78/XSCkMVgy8RljPpt4vGyP1AOeXHeTQXM+6SQE3UJABgZ
	 9u5OLmhauuA6Xup0fiZO+bSlDEP1HeCu2LSGLzdbM6jx1FZDjLay8/9Gpa09zRtihe
	 6ja5XwpZSb775p1Rakg/ozc1oxS7mI6kY4iSFEr2y3nt7fPAzsT2iaZm7+n6SuMXXF
	 9wLw5l+9Q4z8g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Yx3z72dDlz4wd0;
	Mon, 17 Feb 2025 11:52:35 +1100 (AEDT)
Date: Mon, 17 Feb 2025 11:52:34 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0?=
 =?UTF-8?B?csO2bQ==?= <thomas.hellstrom@linux.intel.com>, Simona Vetter
 <simona.vetter@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, DRM XE List
 <intel-xe@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm-xe tree with the drm-intel tree
Message-ID: <20250217115234.2a39f6f6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tw6MrVy0Q0E2fmCziLv3ENH";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/tw6MrVy0Q0E2fmCziLv3ENH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  drivers/gpu/drm/xe/display/xe_display.c

between commit:

  1b242ceec536 ("drm/i915/audio: convert to struct intel_display")

from the drm-intel tree and commit:

  8b3f09fb44a3 ("drm/xe: Fix xe_display_fini() calls")

from the drm-xe tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/xe/display/xe_display.c
index 96ba9595bf2a,ac0804726e55..000000000000
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@@ -175,13 -167,12 +167,12 @@@ static void xe_display_fini(void *arg
  	struct xe_device *xe =3D arg;
  	struct intel_display *display =3D &xe->display;
 =20
- 	if (!xe->info.probe_display)
- 		return;
-=20
- 	intel_display_driver_remove_nogem(display);
+ 	intel_hpd_poll_fini(xe);
+ 	intel_hdcp_component_fini(display);
 -	intel_audio_deinit(xe);
++	intel_audio_deinit(display);
  }
 =20
- int xe_display_init_noaccel(struct xe_device *xe)
+ int xe_display_init(struct xe_device *xe)
  {
  	struct intel_display *display =3D &xe->display;
  	int err;

--Sig_/tw6MrVy0Q0E2fmCziLv3ENH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeyiFIACgkQAVBC80lX
0GzL1ggAo+OeYfjyyiHMzQ3ZSGfI/lm9zmEyNu6cpWZ39+hfUIvhM/s5vcD6Y+Oa
YYO57LmJnDl/SZA6XedYD9CoSw+174FkLZ/vGG2D25oa9EbM/CWISk0eV3cRvmE/
eNO6DZ+BNxFf3nXOXo4jAXpcBEhiFSvIEbOepj/rdyeiTirDfKtK1CscGpPq4Y5M
24KMpsrG8cR9jJBJS1YaPV+vL4IW+VryIn0x5hU2c182U6F+D3CO8GPCmGJFfkFF
aaQ+k6beygNSv2SI8Ia9uivnOl7GojBPEYVzGLrhMIMWZGLsqkwzqHX0yjomi65Y
dqButjZ1dX7eL9ChjeVPq/wQwRqpyQ==
=UgYb
-----END PGP SIGNATURE-----

--Sig_/tw6MrVy0Q0E2fmCziLv3ENH--

