Return-Path: <linux-next+bounces-8607-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED60BE3D2F
	for <lists+linux-next@lfdr.de>; Thu, 16 Oct 2025 15:56:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34A591882D4C
	for <lists+linux-next@lfdr.de>; Thu, 16 Oct 2025 13:57:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C41E32BF33;
	Thu, 16 Oct 2025 13:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bE7rEyBd"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63142224AED;
	Thu, 16 Oct 2025 13:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760623003; cv=none; b=Xy0kFF/yVny6MilksMWx3TAIw4S8Af6WrtE0YVXgaqmveyylzLEpjxZyLsCCly714u8KOC2R2rasxZiIrN5Rsu0f5p7W3FOQJqxqGF/L/y4XT2shyGUPtP8CgxHAwkvJ+wV+EFI73h1hLRTQ51nUDaKTxwLqvpLS9+abbKUV/RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760623003; c=relaxed/simple;
	bh=GRMrHfu8qqOJHXTQAvotFtKcTP9Xxjk2kf9bouP7CMc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jDV+6iM8gqcNT2vd23cHH/xmoU/o/MC+pRsOL/utR5ttKt9pKeBQ5Hz94muM4C34pi+TMmltTMqpQ6e6K6jJq7aOmd8Vbx/kjgyLHrueERf6Fn/J8bnA4KUZIu1Rf+jEQOwPEqqzvZrVvNJGwv+cqprmy6h8JrhcX4wOG6fOHDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bE7rEyBd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17CE2C4CEF1;
	Thu, 16 Oct 2025 13:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760623002;
	bh=GRMrHfu8qqOJHXTQAvotFtKcTP9Xxjk2kf9bouP7CMc=;
	h=Date:From:To:Cc:Subject:From;
	b=bE7rEyBdYOxlWsGO/dXqVV/CZ5ONu2lLjvBLlesHj8bEXI1S+Xeq84kJN9FMWzajR
	 oe19zMQe4HwiySUUDJ0YZvRk4VIUcoeyfrsMX+n36C90LkygwzD308tn6Xrqk58bH8
	 vtiATeiY8xiMzGMjzU6BPLuZpx/JdDil1OzFg5lGMxtXOmTxYb2/LgWRuqaSlhP1D9
	 FMF2682dwQE6EZoCIgWXeN8i9hjRB7juPSGEYoYDKpVPUxHZqB5HWEphFExUd+JHC6
	 vHIPTjjYVARx2hWudygfhdUuNlfxMinpaXqQpLQMwUrDIdlbfCtZf4MXplHb8aEM/G
	 lhk18FfgTQ5yg==
Date: Thu, 16 Oct 2025 14:56:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Simona Vetter <simona.vetter@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Intel Graphics <intel-gfx@lists.freedesktop.org>,
	DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: linux-next: manual merge of the drm-intel tree with the
 drm-intel-fixes tree
Message-ID: <aPD5lh67aWgLCzTl@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9iKBVB9RjFSWzKZi"
Content-Disposition: inline


--9iKBVB9RjFSWzKZi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/display/intel_fb.c

between commit:

  86af6b90e0556 ("drm/i915/fb: Fix the set_tiling vs. addfb race, again")

=66rom the drm-intel-fixes tree and commits:

  1d1e4ded21601 ("drm/i915/fb: Fix the set_tiling vs. addfb race, again")
  d76eeea515700 ("drm/i915/fb: Drop the 'fb' argument from intel_fb_bo_fram=
ebuffer_init()")

=66rom the drm-intel tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/i915/display/intel_fb.c
index b817ff44c0439,3958628c73e97..0000000000000
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@@ -2323,6 -2327,9 +2327,8 @@@ err_bo_framebuffer_fini
  	intel_fb_bo_framebuffer_fini(obj);
  err_frontbuffer_put:
  	intel_frontbuffer_put(intel_fb->frontbuffer);
+ err_free_panic:
+ 	kfree(intel_fb->panic);
 -
  	return ret;
  }
 =20

--9iKBVB9RjFSWzKZi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjw+ZUACgkQJNaLcl1U
h9A3Hwf+IHG/SVHPFaVvtxq01tpNJPB/TJCiHWBI4N2lFXEHpSo+u7I+Lt/opDdz
kpgqinlNOnUgY7ymhwW7ao0gTVaS1QMQfwdRvtSE3i6ZnIxFvMPHnNWPuwSkNG1H
hCIJ+6DPeXx8pWn22CYCYjEmc95V0xZMiQA4b7rMsmPiEyKGOo9S9qOaETC0eLJ5
PDiUHqn36KZFketdD73KMfS4AAEld9urZA9qqI5sf3DxOgvvSNooM8iqlFNIHxda
J5Y3854bIU/pcIBtr4a7VwqDEDYMOF98vXIAY9KO48BcYINJaVtJzZHsRJongoTh
c4b10c5Nr3zAxcwubMej8D2uPRZHbA==
=yC1O
-----END PGP SIGNATURE-----

--9iKBVB9RjFSWzKZi--

