Return-Path: <linux-next+bounces-5602-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03516A48F1A
	for <lists+linux-next@lfdr.de>; Fri, 28 Feb 2025 04:27:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D37803AFC2F
	for <lists+linux-next@lfdr.de>; Fri, 28 Feb 2025 03:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B16615A87C;
	Fri, 28 Feb 2025 03:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="DgJFafhq"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5E91494DF;
	Fri, 28 Feb 2025 03:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740713248; cv=none; b=ChhHFYp94KaefrjKJt83K5a2W3WRUTzB6Rd7ciFbv/qcDFq5dfQvzBNmfDfFJq46CpWg/CYt4DEJ4nRM8qOW0Tp7eIO44KJ7/Joaf+3iT7GkfU27+dTJqPexdzy0fRoyjNIFvM2CrZSF2qxY2tUw18nmf9muvEcXajBWk+F4F6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740713248; c=relaxed/simple;
	bh=+6c2jVkZPlClNzy7JrCrTdviK5n1QQ4QFQ9dhnvqxrA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=uStlnB/63Yn8Xt/u8bbcnruCsppwo7OCmaMjZPFlbKbwhwkR34eFXvoP1MUNAilIZKyM0aKCWkm7d89VWH7gycq2SwgqsMZMxdwXtwWqYyu9NV9owuEofyFKcqwQHDbTqdCBPt+ZmrSGoRJWz7aQxLHnH9O6/2TCewl50lZ1GZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=DgJFafhq; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740713241;
	bh=+vkTQWZvrTkY3NHMs6bF+Gg5uGq6JZsOy6k++k+VoSg=;
	h=Date:From:To:Cc:Subject:From;
	b=DgJFafhqp0Tf0b5/Msn3Owfmet/yhAk5TYr71a2rAGC4AkM/SvEjLSLN7btYm0aag
	 s/nueTsTg9C3spXsZPofCfJJZgJxgJsAJB3Q6I4S+W3ysNNAzpQ0mZlKIDo51iTXPX
	 3Z0Vt833ll3ejmM7ESBSRNmVBDwpbzynO7krCH8E11E7hyhr91QwDpN2UYwxamWX+w
	 nY6J942tg0HWzUQpIN28+7c7dQPY31bQheRpRwTmaZTQoYhXMmQfSeFuyrpIf952EG
	 FrGGlBYivoTAO8SRRXgXaDQ2ZWojC8mr3WDaFlEHrYJE7MC5Gdi/mQ0oPOTQOfoduV
	 3Ktt/tqvkjedA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z3ttc5H3dz4wcD;
	Fri, 28 Feb 2025 14:27:19 +1100 (AEDT)
Date: Fri, 28 Feb 2025 14:27:18 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0?=
 =?UTF-8?B?csO2bQ==?= <thomas.hellstrom@linux.intel.com>, Dave Airlie
 <airlied@redhat.com>
Cc: DRI <dri-devel@lists.freedesktop.org>, DRM XE List
 <intel-xe@lists.freedesktop.org>, Jani Nikula <jani.nikula@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm-xe tree with the drm tree
Message-ID: <20250228142718.22d73660@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mRNMB9qxAl_F7qe05VE6zJz";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/mRNMB9qxAl_F7qe05VE6zJz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  drivers/gpu/drm/xe/display/xe_display.c

between commit:

  1b242ceec536 ("drm/i915/audio: convert to struct intel_display")

from the drm tree and commit:

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
index 02a413a07382,279b786d64dc..000000000000
--- a/drivers/gpu/drm/xe/display/xe_display.c
+++ b/drivers/gpu/drm/xe/display/xe_display.c
@@@ -169,7 -169,8 +169,8 @@@ static void xe_display_fini(void *arg
 =20
  	intel_hpd_poll_fini(xe);
  	intel_hdcp_component_fini(display);
 -	intel_audio_deinit(xe);
 +	intel_audio_deinit(display);
+ 	intel_display_driver_remove(display);
  }
 =20
  int xe_display_init(struct xe_device *xe)

--Sig_/mRNMB9qxAl_F7qe05VE6zJz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfBLRYACgkQAVBC80lX
0GwnWgf/anbPSw8zaLHQp0GtPQyCyrHG5NBHPw+8w4XhF95LRlCHLSTOfvtvdxji
pSMFuh8TDVbyEEJ1Q6agd/5szH5iIOoCkLI7iUC7MUR3U4EwFuze1siuBQUA/HsS
pSovjWGwXtjIUou7g4aUUr10ZfqiCwqAY913Gwex9fO+Uc8/JbJ9T4hFXq0deYoK
VzaZyVUxW0Kgpc7F+yZyfi1+edVqm9Z9QG3C6cOslpu52BVNVWShsuNsELbjS2b3
ZXkle4q7J9rpFxcaVbPa5DNOcPdtrm9VQRgf8IP21TmBexBGg9mefN53m+ejqU3e
K4Pi5MBxeHW+1x4HaDP88cz8wOOJmQ==
=ZoYa
-----END PGP SIGNATURE-----

--Sig_/mRNMB9qxAl_F7qe05VE6zJz--

