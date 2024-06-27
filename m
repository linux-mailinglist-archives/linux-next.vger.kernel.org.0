Return-Path: <linux-next+bounces-2692-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5F291AA8C
	for <lists+linux-next@lfdr.de>; Thu, 27 Jun 2024 17:09:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DCE2284BBE
	for <lists+linux-next@lfdr.de>; Thu, 27 Jun 2024 15:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26BCC197A96;
	Thu, 27 Jun 2024 15:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AFNSSQXQ"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EB2197A76;
	Thu, 27 Jun 2024 15:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719500939; cv=none; b=MhaoV2YKxSB3qRhBDn98uQhZcepUawXStHQmIuZdZpsxsEZqXQ8MDYnshM+kxJpREfGLT5HT2mcABq9j3gpcGMyIZjUQYlVGyMzumsvqD3X4P2d0/zEI4K6PwumdiHimRhwnHiwwK8SNe4C9GR49Dt4EVIZRIp+FyYftEyAXCMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719500939; c=relaxed/simple;
	bh=LVxAoDPFGgZta/AMaaDggih53NHmLZ1I0pcsnqXUfSI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ic3GMgfAqn2G9JdQudurdY3OFp16E9HTyeW+Q1+kbqIQOGmRXDxOuBj2qXwG+T4smOCZcN6936D6DqEQYrbD9Ri87ZHhyeJ4OECcJt8D/ft0s1qIoD+Lpn7BY+Q10NBBjy3hnhIfJniT5DCGwjjpEf7zdv7A5psn24WzQQJ7znA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AFNSSQXQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01736C2BBFC;
	Thu, 27 Jun 2024 15:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719500938;
	bh=LVxAoDPFGgZta/AMaaDggih53NHmLZ1I0pcsnqXUfSI=;
	h=Date:From:To:Cc:Subject:From;
	b=AFNSSQXQU826EGPSnt8hDGS3yM7ebJ5j6lmsLr+XfXCKcBq29So9Be86QF9u/C6lr
	 2xl/GOdZ/yvleIuyz9nmJ1KRJpQ6X4wpaPBxQAlDn3Os7Y/PMu+KbTyFmp1d/K8m7G
	 e15tA01aP9bBg4kR2sf6o333KycCuUtu4XbmCK2dTp45ZtYhDBN0qC7pTu37A/28VH
	 dvSiuvfEy1hhRAM5xZBNQqY1vYYVCKpdgiMaeHGgDHtKa7p+YxmdCudE6Ih+hBqUam
	 p9pXUS5dRBmijM8Z/O+bxAWvEq7bc1kZ/Dp49BTeHUYBlqNsJ1rqG4XtSNYXu4wVJH
	 UXQV/FNn9NPeQ==
Date: Thu, 27 Jun 2024 16:08:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Lijo Lazar <lijo.lazar@amd.com>, Li Ma <li.ma@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm tree with the drm-fixes tree
Message-ID: <Zn2Ahpv6za3ef3LT@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BZArcoZlnFggJHEH"
Content-Disposition: inline


--BZArcoZlnFggJHEH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h

between commit:

  c223376b3019a ("drm/amd/swsmu: add MALL init support workaround for smu_v=
14_0_1")

=66rom the drm-fixes tree and commit:

  ec41bdd82e9b0 ("drm/amd/pm: Update PMFW messages for SMUv13.0.6")

=66rom the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h
index 2e32b085824ae,12a7b0634ed56..0000000000000
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_types.h
@@@ -272,7 -272,8 +272,8 @@@
  	__SMU_DUMMY_MAP(SetSoftMinVpe), \
  	__SMU_DUMMY_MAP(GetMetricsVersion), \
  	__SMU_DUMMY_MAP(EnableUCLKShadow), \
 -	__SMU_DUMMY_MAP(RmaDueToBadPageThreshold),\
 +	__SMU_DUMMY_MAP(RmaDueToBadPageThreshold), \
+ 	__SMU_DUMMY_MAP(SelectPstatePolicy), \
  	__SMU_DUMMY_MAP(MALLPowerController), \
  	__SMU_DUMMY_MAP(MALLPowerState),
 =20

--BZArcoZlnFggJHEH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ9gIUACgkQJNaLcl1U
h9B9+Af9HWLP9pwG99gRcjfbXtQXiTDTWOqY06cYsdplVD4imfZ8+fVA5i3eFuPW
nwKu3JTVbVFgB8PRq9mc6HKEAQCfatz+YMMlL911tbENXkeRor5VO65PrKP257G0
2yD1xGUyLRjacEJrC0CsvmqgZO6xhGbW/j5e+b5bJgZZHxfEOEkHzQj5/O0aoMQ6
Rd+69PBpIO8DkEoOZH0RfwpAKJp+rVfpHayqzIS3GXQNVrzQ3fQrcAXLEVzrp98e
EclOk5R/SiQ6z3kpyTgC1YwhSh53JSxsoxdhJnmYrksMBGBKFN6WRT5PJad2s+yS
zRj4RptDV6O/2+Mpe1mhEqbMvifNxw==
=1q1J
-----END PGP SIGNATURE-----

--BZArcoZlnFggJHEH--

