Return-Path: <linux-next+bounces-8502-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF3DBA3A51
	for <lists+linux-next@lfdr.de>; Fri, 26 Sep 2025 14:38:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0672E561A89
	for <lists+linux-next@lfdr.de>; Fri, 26 Sep 2025 12:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE1551E503D;
	Fri, 26 Sep 2025 12:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QHIYMopI"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20C32AD3D;
	Fri, 26 Sep 2025 12:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758890294; cv=none; b=PpwTVxoRjAjJ5OAUdXc5+gfETUlZGm1xxWn1e7N52y9peMLlZGdqqD+W4i9far8oEVRTN4HfNBsTmSzvWX0ebum7WICj31+BERBnNhdaHOaknIPu8b27lV4MyFANMIaG5VuJUhukvvpsEreXfwHhWK8p6hW5KKu8vmFDePs41Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758890294; c=relaxed/simple;
	bh=r3+KoqyxYaumJVlhxlnDPVZa+TxdsWD5Z5JBjgUvoI0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YeldrUYIftI9wZ85cQaG8zAN/is8x7DZCfiAQW5CjXf7z5pV+YEUf4pCYrhgRVffQ9PV2Kg3LZMZC6ZC+3k0ozAv4FNHkLQQFvcrpDcMDM9soqn89NJZR0MaTv1ifDqUKHUPgq8magYzPImak6iTU7RxLiV1uE6rF+z1J+3QhwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QHIYMopI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D88F1C4CEF4;
	Fri, 26 Sep 2025 12:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758890294;
	bh=r3+KoqyxYaumJVlhxlnDPVZa+TxdsWD5Z5JBjgUvoI0=;
	h=Date:From:To:Cc:Subject:From;
	b=QHIYMopIY+gQS3kKXdhPUcz8jiFap380Z47bFJf4Wcsa2aS+42YUndaWedYkYzlrf
	 CV/HFUf8GTdz9n71aIKN9b/HLv0R8cOdoWaeBzafCFW/xWWcu1CoG3VtYjoW1UH1uP
	 BHsXMaiRBVAzRqqWhuo+pjhsz8WUtGIB0oXF5rEJnW+LfEK370pksmtmQJ3nCYCHwT
	 3aPcTxMXYjjrx+cybuzwwk0T7gX3kX6cabrVzGh1dnYN6K6cpb1j/MaJSQAD7mFHUT
	 +swWShow5ORzYl5bGkTPauYF7RLBVZo7mpTQ1TQdylKB9sbD79T3mKi05h1jrtatZ5
	 I4wWfd/6gVCnA==
Date: Fri, 26 Sep 2025 13:38:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Michal Wajdeczko <michal.wajdeczko@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Zongyao Bai <zongyao.bai@intel.com>
Subject: linux-next: manual merge of the drm tree with the origin tree
Message-ID: <aNaJMgOnsuoBywwH@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dFuDA49CIsVn8cs8"
Content-Disposition: inline


--dFuDA49CIsVn8cs8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/xe/xe_device_sysfs.c

between commits:

  ff89a4d285c82 ("drm/xe/sysfs: Add cleanup action in xe_device_sysfs_init")
  500dad428e5b0 ("drm/xe/vf: Don't expose sysfs attributes not applicable f=
or VFs")

=66rom the origin tree and commits:

  1a869168d91f1 ("drm/xe/sysfs: Add cleanup action in xe_device_sysfs_init")
  a2d6223d224f3 ("drm/xe/vf: Don't expose sysfs attributes not applicable f=
or VFs")
  fb3c27a69c473 ("drm/xe/sysfs: Simplify sysfs registration")

=66rom the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/xe/xe_device_sysfs.c
index 927ee7991696b,c5151c86a98ae..0000000000000
--- a/drivers/gpu/drm/xe/xe_device_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_device_sysfs.c

--dFuDA49CIsVn8cs8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjWiTEACgkQJNaLcl1U
h9DEmAf9GQ01UWfutzagSRDip7bv0ShVJC/eCrs98dxllk20nSbahausZ6G5iyeT
mgV5iHrDbjNBJFDNZhCOgVtnvkzDyrLpZJfUhXWv2GIQu4DjyhjCshN8ZTa6SbtZ
1b4RF+xyDUsXM4BDgeCGTwVlD/Rdux4Ez4auHP/CDIjobAh2wOPjSQ3hn2Vut366
0QmAumcSwfZzBw47J/gtM6Xt+3L9gmluKLzO1BIfwBu2ki43yrBrUpUAzEIK68om
7KmvV1SGzSfyg+DX6BrBoahQ6VT0KT8JK2kGX8Eyz149P/9XFgqqWNumk3NH5fbk
wU4fACxLSr6CPkm4YbTOJ5iQarWVQQ==
=VETx
-----END PGP SIGNATURE-----

--dFuDA49CIsVn8cs8--

