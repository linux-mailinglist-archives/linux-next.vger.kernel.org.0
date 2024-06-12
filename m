Return-Path: <linux-next+bounces-2523-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4F09049E2
	for <lists+linux-next@lfdr.de>; Wed, 12 Jun 2024 06:12:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 433251C22F82
	for <lists+linux-next@lfdr.de>; Wed, 12 Jun 2024 04:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BB041F92F;
	Wed, 12 Jun 2024 04:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="MFKiELrB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59B8257D;
	Wed, 12 Jun 2024 04:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718165565; cv=none; b=V80iQbmPCLyocXOJJgxCq/+9GSWFTIuPfjxc1aF5b1vWejNth/Uvq546G/dQv3JMUXbSxXCS8Dw/lYsTncTQ0aVG1iG9j+5Bowm28JtP/vt5e8H6gTjdGCDElJT4HEQlH2Egwffwu6YNGCi2XtFomH+9m0WRO+FnNBbEQrsNDC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718165565; c=relaxed/simple;
	bh=z0HXs/dWY2Rct7KeFzt8JvycnssOhi03jSkN4HkU8rU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ETLTrwRBHe5hE7oUPCd+OOkI1RJ3TQPL01dWbeBQUs8klkDHyUgbJWWqiFgTmG5fiSmwTqBek/4zdJrFfvLt168jdc1zKG0ImZHARFGYpUrgXDhiEE2X50S6MoFdnhqn2rebgTyQ9IGEJ0IyfilKPSxidilL/qWG50KoUVasI4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=MFKiELrB; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1718165560;
	bh=9ZFs9kPnbsyJlJHuZTpWlbYutjebMjdcPR6NsGP867s=;
	h=Date:From:To:Cc:Subject:From;
	b=MFKiELrBw+18mcbwASGU9x+vIxbhtb6tfULSNb7dFbLbaaom+nGdGJWwmZcT9E12O
	 GwemrVq47ex4domIUIZLCWI7XLmoPPjAtWZ8LYWQudSSWppWo5zKXzx9i1muvODIeK
	 25RoB9cP5K+3iw95KwxrPo9b2bO//+YGW8zqzBOWGuHPNbAWYkHkal8Kd4vP1+LkIM
	 /TNj21aQNvTQoT5/HHRyI4sxAZGB8RiAj7Qzek+sRrOA3IAXWNrjGAi5XoS9WOUEBB
	 +YcW9/voUUxjSZdxDCWcJIghtwVTb5Qn6WgUkcT2M4p4jzlLKZg8CgpKsQc/2a0q4Z
	 1gV9BUa3MAwNQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VzXFN2mVmz4w2P;
	Wed, 12 Jun 2024 14:12:40 +1000 (AEST)
Date: Wed, 12 Jun 2024 14:12:39 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>, Suraj Kandpal
 <suraj.kandpal@intel.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-intel tree
Message-ID: <20240612141239.141ce8cc@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.vbPo1=wII9KCPpenjrUXFl";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/.vbPo1=wII9KCPpenjrUXFl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-intel tree, today's linux-next build (i386
defconfig) failed like this:

x86_64-linux-gnu-ld: drivers/gpu/drm/i915/display/intel_vrr.o: in function =
`intel_vrr_compute_config':
intel_vrr.c:(.text+0x4e4): undefined reference to `__udivdi3'

Caused by commit

  1676ecd303ac ("drm/i915: Compute CMRR and calculate vtotal")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/.vbPo1=wII9KCPpenjrUXFl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZpIDcACgkQAVBC80lX
0GzmZgf/WRH/KEgcppZo+Klh5uGzWYf340VlANrW37r9HaPEdpoT2+2sYkAGcqQY
R883y5nxFokZkRee3mRVZ4Lksdz9s8WRowvQdoOmBj7WHcljxCbhjscPQ0XVbMPy
XCUQuxoA8n/CEG62clXPTA0ssin1J6dtP5CrFbMhgT68F8to7zHue8Wr0c7i4Pfx
3sf7RVkia03hYTsNaIUSD/XZNZaUoDKfkKOMDW0+F3O0D8S4zk1qLn0WzqWx/0k5
vbjp9yu/gEA2Lt+JLfZfK5N9LmxCgQ6vNZCb4HtXPhOILP/OcWe1XwcKcgiWJfv9
iLbjMAWSjq/mKXIq6HTyzzcfk9Yolw==
=kVkc
-----END PGP SIGNATURE-----

--Sig_/.vbPo1=wII9KCPpenjrUXFl--

