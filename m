Return-Path: <linux-next+bounces-6189-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92327A81A04
	for <lists+linux-next@lfdr.de>; Wed,  9 Apr 2025 02:46:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0CCD87B3906
	for <lists+linux-next@lfdr.de>; Wed,  9 Apr 2025 00:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57E21101C8;
	Wed,  9 Apr 2025 00:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="GVs/iIyO"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC9BAD23;
	Wed,  9 Apr 2025 00:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744159587; cv=none; b=qPYxJCscaFKE8NJcw/WQwSlolCVSVhHdfeR4eqUQzUy0ZQETA3GjlCOErK3MgrX/N2C451pybo3Ec9K3wzRqGJWrUqe28DwcJwUIFhcSN9LFcZyxDgmt+gW7kMmc/lm0WI6HzrtKYt7DioT+sIBQzvQ1JjVbQ7rMkuynGNcInao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744159587; c=relaxed/simple;
	bh=VEegv+//v+FiWfCVylTvGkPms6PLXgujy2So1iUu0rQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=bu8dP04zEc6JvIXGcVAg73PF4FVlKoCzhq8LuZ7HLpREgCwq//9yjaIVt6pq6H3wlnNpb1a3ATe8g/lZTs0UftsHKG+tI7r6gIIGRynZ8/IWVwQIroJdeI5PkYL47/DjlaDq5jJKOl0lJT8x/mtwi0wEqCpPgMVOhNCvelaJ+O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=GVs/iIyO; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744159580;
	bh=fj4z+jwqUz9HAkrp3iXCm4kGifaxbWJ+n8E7OIJrNTg=;
	h=Date:From:To:Cc:Subject:From;
	b=GVs/iIyOhOEWBjz5ExtZd4IasR1JkT8R/gCQdsUGwKlin6hZSq9Icrkp5fAgTtLqZ
	 n0rRjlZRdqtkL1OzHEz8vlzfN6WcQBzbyq57c9rs3Uu7hxrdagASkAtmP4OmTzvSgH
	 lt3uP/oEUASpzvsEY5fnK3lp/YFfDbRCtwXGXOjDxN57BElv/m72aphJXK5Mx86xFg
	 StnQ63YUB1Ru3O1QQHO60cn4OCyErDnqzNywNU6oIzPAPLW0J5ycZOn1ItKxpqSz2K
	 TqOODcOswJhftEr1svTCIbwe7eB/hTQ2xt7pijVykFKNSQmKOs5h/7pTPZceS0XkY9
	 vDLSt/7KkqvAw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZXPQN0qRcz4wbv;
	Wed,  9 Apr 2025 10:46:19 +1000 (AEST)
Date: Wed, 9 Apr 2025 10:46:18 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>
Subject: linux-next: manual merge of the drm-misc tree with the
 drm-misc-fixes tree
Message-ID: <20250409104618.55387b4b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YKIWsIhWe7WzZE3Mv8tAKKR";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/YKIWsIhWe7WzZE3Mv8tAKKR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  include/drm/drm_kunit_helpers.h

between commit:

  13c1d5f3a7fa ("drm/tests: helpers: Create kunit helper to destroy a drm_d=
isplay_mode")

from the drm-misc-fixes tree and commit:

  e4e3de631d14 ("drm/tests: helpers: Create new helper to enable output")

from the drm-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/drm/drm_kunit_helpers.h
index 1c62d1d4458c,1cda7281f300..000000000000
--- a/include/drm/drm_kunit_helpers.h
+++ b/include/drm/drm_kunit_helpers.h
@@@ -118,9 -119,13 +119,16 @@@ drm_kunit_helper_create_crtc(struct kun
  			     const struct drm_crtc_funcs *funcs,
  			     const struct drm_crtc_helper_funcs *helper_funcs);
 =20
+ int drm_kunit_helper_enable_crtc_connector(struct kunit *test,
+ 					   struct drm_device *drm,
+ 					   struct drm_crtc *crtc,
+ 					   struct drm_connector *connector,
+ 					   const struct drm_display_mode *mode,
+ 					   struct drm_modeset_acquire_ctx *ctx);
+=20
 +int drm_kunit_add_mode_destroy_action(struct kunit *test,
 +				      struct drm_display_mode *mode);
 +
  struct drm_display_mode *
  drm_kunit_display_mode_from_cea_vic(struct kunit *test, struct drm_device=
 *dev,
  				    u8 video_code);

--Sig_/YKIWsIhWe7WzZE3Mv8tAKKR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmf1w1oACgkQAVBC80lX
0Gx6JAf+JbuQC1niQEhpYqJHkvlr4X8gfepMRKYQ2dh3PQXJUIesnkZ8+3PvJsiZ
jxTgAGExYiH6gJVapSnVWPYke2D01Lz6cvEyr7OubrYgHPBWE7dkPsl4uMCtnE6N
Ln8QL8Z9M54TwR1evo69OKTcphdl0qjG9pwS8KcTap0ad+6NJegXoHc4WUMVm7NH
8Rvd3VCwwBxE3pzXVTVDw1UyB7t2EPcckgv1Q6wZVU3iJw3Z/LGzvrlk+x4uNoC1
U40SQS5vNhoX9wYfigBbBVy8sfVko6zdA6TcbcFbQyEFihCE8efSdvhHxXTlXxb2
YGIP/3gmWoUvEYceK66INaaS5HN/+w==
=La3O
-----END PGP SIGNATURE-----

--Sig_/YKIWsIhWe7WzZE3Mv8tAKKR--

