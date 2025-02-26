Return-Path: <linux-next+bounces-5570-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 200F0A45205
	for <lists+linux-next@lfdr.de>; Wed, 26 Feb 2025 02:13:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 433BB3B0D92
	for <lists+linux-next@lfdr.de>; Wed, 26 Feb 2025 01:12:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6D341547C9;
	Wed, 26 Feb 2025 01:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kKAVD3Oh"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41FA42A9D;
	Wed, 26 Feb 2025 01:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740532383; cv=none; b=aP7/zVmIs0AjExR2cReG077vTm0IHo7lSbCaFAk73xVhWLP0+evf2w5ipTAviVDNwB8qRhVarWeKiW6qlf0BNa1npDJH0NAigmXp0zTmyjNrtl4eqeHOqutQdsI2iQs7HrYytoY4h3AWNDH1DgHTjrWI+C+NUvpPIS0/zKDigyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740532383; c=relaxed/simple;
	bh=zetUxpGMOkYJ2B079iT8UtsD8aTPfXFub6plWFRuslM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jXZAk3d/RqWwOEUFEtN4t/l3/FTKxRcWUfhpFqEwxjP8Mogau13o+vPCBIY1FU743Y2J8neoUegwnOQj0LniJDRUjgDkf5TzzGs+QmrFZFJ1XnRnaehGxYIlI7VjtKBflKdpeT75Y9ZOVTwYPRPqZ4WpgOUemgk0I8oOlPh8uM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=kKAVD3Oh; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740532369;
	bh=8+YF4WFZgfiQeCGthkw8NzPmGBGE8t9U5bXWZoc+C7U=;
	h=Date:From:To:Cc:Subject:From;
	b=kKAVD3OhFHtQ8oFLbHcD73XfYGgflGP/aKxegtq0e76Kuf1zKXZGaS/Ua7athnf1R
	 9pXfkgXY08K9Qu8lfgZ4j1BfiQHmW9hvW8rA/y7EVbc3a+GHdJsGf8Ve2ms0tmauwO
	 n5u5UKg6FXAdLrTZoQw5+NJXRqOZKytzLgAzeBid5eBD36Ttw2vzea18OqF53CV7Vi
	 UZAIAZbNAxZ7zrxNbickkrnqs+RX/vyRIHS+qDJZlrMERWJ7tABbFjrfZj3chmNbAm
	 YmpXqVIUQQhU8oBIWZH1WRfR5Hh2B+FOOpW0qIaus5e1mGyXGd7oeu5IepB+jPlhnY
	 98mPA0E759ZNw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z2c0J3p1Tz4wby;
	Wed, 26 Feb 2025 12:12:48 +1100 (AEDT)
Date: Wed, 26 Feb 2025 12:12:47 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0?=
 =?UTF-8?B?csO2bQ==?= <thomas.hellstrom@linux.intel.com>, Simona Vetter
 <simona.vetter@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, DRM XE List
 <intel-xe@lists.freedesktop.org>, Jani Nikula <jani.nikula@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm-xe tree with the drm-intel tree
Message-ID: <20250226121247.5d4d43ea@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5dYl3dOer8ymvTSJleQOLRX";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/5dYl3dOer8ymvTSJleQOLRX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  drivers/gpu/drm/xe/display/xe_display.c

between commit:

  1b242ceec536 ("drm/i915/audio: convert to struct intel_display")

from the drm-intel tree and commit:

  d41d048043c4 ("drm/xe/display: Drop xe_display_driver_remove()")

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
index 96ba9595bf2a,279b786d64dc..000000000000
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@@ -175,13 -167,13 +167,13 @@@ static void xe_display_fini(void *arg
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
+ 	intel_display_driver_remove(display);
  }
 =20
- int xe_display_init_noaccel(struct xe_device *xe)
+ int xe_display_init(struct xe_device *xe)
  {
  	struct intel_display *display =3D &xe->display;
  	int err;

--Sig_/5dYl3dOer8ymvTSJleQOLRX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAme+ao8ACgkQAVBC80lX
0GyzjAgAhMsX12+KJ9Pz5WUx3MZjo03zVhsxWhEdZhiV/mKvcujnV1x4uqK2yDAj
q2wofMf/8RRM1Q9BFQyOLR372ub2HYPQo2iilFEs3oz4Tjxi2PQh+WOQFh2z+U5P
Lcnf77BTtBVotegeVab/S4O+sN/Fi1GyUK+bZwrVhNzOkF0FVlnnFE2vcjAFVf9N
t2BEjYO5SW4zh6Xyumkdbwj82CBzzes7hLvM4uPaHHU9r4mT8Xlpc0qXrsXAI65f
ybIaWNegoxKEdi8shzlGIt2n0HRq1y6nz3vGwByc05faRceq5eZDP6+m7EpX6c+X
ik6l6dspLndWee1A22W+w+ggbjCgIg==
=XG4Q
-----END PGP SIGNATURE-----

--Sig_/5dYl3dOer8ymvTSJleQOLRX--

