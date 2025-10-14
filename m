Return-Path: <linux-next+bounces-8591-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0A0BD956C
	for <lists+linux-next@lfdr.de>; Tue, 14 Oct 2025 14:29:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 909191927269
	for <lists+linux-next@lfdr.de>; Tue, 14 Oct 2025 12:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58C7E313554;
	Tue, 14 Oct 2025 12:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SxyDwdxr"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3181D31354C;
	Tue, 14 Oct 2025 12:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760444965; cv=none; b=IQ22cfzemOXAqDwmirL7lGC+2uEWHTy/lwWNKihWb16kt0MDw9zh2p7GniY+hRWc+GJUEaA6H87gvVw07z4CIqKDh0ro0JWM2o2fYdkCSuVL0+WzAxA4gT1bEiJZbF6/iIFyMQDilNcPHZ0ht16ZEx+KzOY+B5cFT3kLrG0TmIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760444965; c=relaxed/simple;
	bh=+dANSiTL0H12KnLe6qhjXfPuJ5JC6wEBsW+kIkDejso=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h2AIqClAML0xC/Gt86lc2WosEJqhJVksfX0MC8hJ4Nii1zzMIGBuwKiaUiLeMmghD/BgF5BHAmkuuabntgXb6yFYzfWxKX42LdlvSnSToUwmN5TOEZByLMyGhDOguclUgpqINqUjHaPc4JuHw+agu44VBZv9d/cSmyFdRF/11T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SxyDwdxr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0F43C4CEE7;
	Tue, 14 Oct 2025 12:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760444962;
	bh=+dANSiTL0H12KnLe6qhjXfPuJ5JC6wEBsW+kIkDejso=;
	h=Date:From:To:Cc:Subject:From;
	b=SxyDwdxrGZ6NkZCxsuj6pznUMaCnKl8ODTCENcX720rCW2u3ZLnIv3Qw/gXNQWBj6
	 jktdCyPsoVfffWFtKhGkj7AIuA2Hv8XWiQbmQM1p4M7+A1PFUYbAywis1joiotilAg
	 yAhH+dHVNwRgthJHR89hockSiwFIXlhEOsaCIKrM7j84rRiJIyda5kkOE0hMbnoCzW
	 kYEsM4aumNN0qdYWFzDEAvwSbepaGNU/nSnvF59DWwXPKgqR6qtOnCaKsdoz0ep1gT
	 +59eOAeCH0K788GMI7HSReJ+ish5YmRKCLc4w8+Ig6uQClk9XMLPoZNQD3u1VOYNea
	 P0ouqi6fYEy3w==
Date: Tue, 14 Oct 2025 13:29:17 +0100
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
Message-ID: <aO5CHSMNxGMZsUPd@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="R9j/QHozM9Mndnk6"
Content-Disposition: inline


--R9j/QHozM9Mndnk6
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
index b817ff44c0439,9c256a2805e40..0000000000000
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c

--R9j/QHozM9Mndnk6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjuQh0ACgkQJNaLcl1U
h9DCwAf8DToewlBYi1iWpDOvN0TRvqMkhHvzYDD7bYPTtcDpaf7pW5T/xDK4M5lG
DhQVdnVrlTOK0g7yz8NgSE4h8urwHoj0ovu0V5lo6IJ5U+rdAkjSNZVxXBHWRYnl
Iy8rPxWkzvdIETYk5090rwm1pbkA3edocday97Lja568kXyqWzjtTetyQzmnxVpn
IY0wi0Y30BR/HIs739NmOOwJL+lZtC69khvJ7lYhW38jBdV3hcAf5OVOoAyaSO4S
KNre4ceoLg3fBY/Ls+YR9QRjFQKbi8UkkuXIUzxgf4UIwOwJUB9cDqTfdGjn/kiC
8bqHz6veLrUIo73Rpe+N5xBIbTiXBA==
=w8mK
-----END PGP SIGNATURE-----

--R9j/QHozM9Mndnk6--

