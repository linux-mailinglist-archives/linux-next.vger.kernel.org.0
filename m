Return-Path: <linux-next+bounces-3584-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FAB96B196
	for <lists+linux-next@lfdr.de>; Wed,  4 Sep 2024 08:30:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC23C281612
	for <lists+linux-next@lfdr.de>; Wed,  4 Sep 2024 06:30:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D07E54BD4;
	Wed,  4 Sep 2024 06:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="MfnFYDnh"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E6FD2FB;
	Wed,  4 Sep 2024 06:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725431425; cv=none; b=AC05GMHOST2dxFKe6bNt5fjDw0JZZskNgDk3rF/oY05Mt5m8t06VpERH47I1y0kjlulHHs3KD53ZxwzVXp0AJ+8U3MFOooDS3E03CmcucpNBhZBDlemk9VLFTtMySKttk9yoilH/xywG1VOdz1f+d2YZKlxoC4cGLi+3rMLYVUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725431425; c=relaxed/simple;
	bh=ie1KJgbgWeaIntePrcrJmPJ4mJ1n8hijXhwA5ztfCnY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=enmWr9oe/iu4L+Pk+ZeES6s1DNw9BXORbHRt/0OOj6Vril1MfPgQUyNfjS/VyVGNB6Wm32kAx9dYBPFhbFdLC63qStHoCDd3m6XZTUoudAi+YFWCNy016icZ8Fek4LF6Wg0j/Z8YJqQFW62rKNIvjYHpuRBNJbRnEkoUMzCqjBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=MfnFYDnh; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725431419;
	bh=JGgIk/EiekwZAX0A7RvQM/XMomC9Q+y6SpRBDDwzKfY=;
	h=Date:From:To:Cc:Subject:From;
	b=MfnFYDnhyd05wDe6EwHfZN9jS7Zq1GPWTXdYkcxMya6T6D6u4J+pDYc7iVgA9GT+h
	 g/iqhjsZNvsbCdt0G4IOuKUPPVLI+USXgTuVhgiwvTWw++e3GHfkrmH/65IlW7HxbA
	 OjcgZKFLfXexFwbHCOF+G6/us6n7mE/ibdyJqo2QH3s6UO/ot/tq7PSncahy8DPSfo
	 Su5GUwzq6UMzc70cn+CJk7zmfy6+nB18wCmEt4zt+nZD+VwL+c478J+lz3ulkCxdoI
	 xW3BjiXx1OOmJAQIEwKhobsOSDUKQmQKl/Bh4VYMjW8/2ty6dgmQvAQ9Hgd2d0kccg
	 BqSedoDUU4CPQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WzCKR2z0zz4wb0;
	Wed,  4 Sep 2024 16:30:19 +1000 (AEST)
Date: Wed, 4 Sep 2024 16:30:18 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Maxime Ripard
 <mripard@kernel.org>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-misc-fixes tree
Message-ID: <20240904163018.214efaa7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5HyTQZioDubndSE4yOjw/8D";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/5HyTQZioDubndSE4yOjw/8D
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc-fixes tree, today's linux-next build (htmldocs)
produced this warning:

Error: Cannot open file drivers/gpu/drm/drm_bridge_connector.c

Introduced by commit

  9da7ec9b19d8 ("drm/bridge-connector: move to DRM_DISPLAY_HELPER module")

--=20
Cheers,
Stephen Rothwell

--Sig_/5HyTQZioDubndSE4yOjw/8D
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbX/noACgkQAVBC80lX
0Gw71Af/U8tOm4G12SSD3WRwgEEgCXPW8uJN48HMl/i9OgHwzXPXRFp5smIVHpOL
hKn7n/wB8xbKRe6nGmfENARWh9LHdSDLABrR8DYWUUs3yOLzMSnujpuGz3hIpTjA
OimdN0/GdmBPQsD/3K02ybAaLI+uDdR1NzOQs6QbfFk0pvvKIM252zq7bsVtlDpx
KYDAwEGHB0NkujENwrL1gD09kZZDStdx4VVw15RBivi4t5pgE5zC0H4Q3N/5t7jR
l5luvwacoZDASk4vMeVxKZuHPfULH46kMit2OLVDuAy6UZOmJ6MLd3fF+Ksqn6QJ
RA0ffY/DwWxB62m29AP7bjWEeJaJDQ==
=MFbq
-----END PGP SIGNATURE-----

--Sig_/5HyTQZioDubndSE4yOjw/8D--

