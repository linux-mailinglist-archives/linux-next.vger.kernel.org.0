Return-Path: <linux-next+bounces-7281-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B39DAAEEC95
	for <lists+linux-next@lfdr.de>; Tue,  1 Jul 2025 04:55:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2380117F11B
	for <lists+linux-next@lfdr.de>; Tue,  1 Jul 2025 02:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51D3B1C84BB;
	Tue,  1 Jul 2025 02:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="FpuHPM3r"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9291DC994;
	Tue,  1 Jul 2025 02:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751338491; cv=none; b=Wpty+U4J0ulAnEfftaUMahzX7jBORKHi0DFFr2Cm5NxOIsOTTmdagOJda2FbgjfKxoK1nYyqP3+5Bmua2Y0erj3bemPkovnLR/iJcb8LHbunZy8A4FHB7GFAREkHcLeO2v6ZyxLB5QdoUa3gcux0wcKh4JB/DLn6dszKnmv1Lgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751338491; c=relaxed/simple;
	bh=eQYqZanp1+0cz4tdDGtBDDBURJ7rHoHHwXTXqhHkC+c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=PhUU1WQpCL0gcUebqxmvvXmfI48r/H07reJ4RUcMVIudBXV6xF4X648PBO1B8kka7LzhxdLNkEjl0JSqm0HZ1eWvB1B0af4ytAeAmBA4JJB/9EfFxdFAuxG+qrS4WP30UPFn80kYW/BVeqqHhzYcNmehnnbm2sNK1Hi2e2dQnSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=FpuHPM3r; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751338485;
	bh=8H83yHfRrbf5zi697ri7SFzbYByjJS69qvdoGlr+Nq0=;
	h=Date:From:To:Cc:Subject:From;
	b=FpuHPM3rvYswBkPOfqFlopaAvtSTld3Ek60bbB2fy9MT5jYzX47k1XtTD/tsKNg1L
	 nnxcFoEcqdWXGwU5IX+PzCYscxKSFAd7XXvNVCC0PLE3jnaj4EGWOcuYgH8KS/k3jy
	 ADRatq8um6T6vNh6XHO5UdvuxqzCLxn6517XnI0CEwv0DvKPSsIiisaxKhrSu5vLZJ
	 i0D5uowaiYPH/bjRoMPz+rFZ/oP/nlgNOHN7YDX7T72jXJK8aJmnaqCS/oajeC2OJR
	 zSFL4vpQ2qerodtrR43IsrBxGtI6fiLO0rfAYCXgixEVJPcDk++Q4XTDV2fbXt7nNq
	 lmsa5HozSV0rw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bWSLD5blTz4xQW;
	Tue,  1 Jul 2025 12:54:44 +1000 (AEST)
Date: Tue, 1 Jul 2025 12:54:43 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Alex Deucher <alexander.deucher@amd.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm-misc tree with Linus' tree
Message-ID: <20250701125443.5ba945e2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yktaNDk/jMXm7v/uSa6bko+";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/yktaNDk/jMXm7v/uSa6bko+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c

between commit:

  ebe43542702c ("drm/amdgpu: switch job hw_fence to amdgpu_fence")

from Linus' tree and commit:

  d0c35c84dcfa ("drm/amdgpu: remove job parameter from amdgpu_fence_emit()")

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

--Sig_/yktaNDk/jMXm7v/uSa6bko+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhjTfMACgkQAVBC80lX
0GyIhgf6AkxBodfHE5vqHrdf1UpY3jtfgk1lGuFf3BnmSSMP7yIUT+zGAcDrl1L3
DBr2pJiI8IaTwXY+pn3FWWXiWHVn69p3zClg5Ul211R/r7BJiLVRB/E9zeqVrC8x
sSeGb/4RNAa9PkeoX2/NpZgcNzD4WMI2vk01pJFV4NFcmqA/qKIrUCK/GvCLZUmm
oadi9e80ZnP9i8myjKmLbTRfaFAOArrVrVwSatb96snQsp7SimsKlLg3EMPg+Ev8
1UP5AcJWJqITcGubf1JhebrlB18QkfjKzbgPx0Lqz9+/6DpKLw7inYoF/PB4uIhM
BiHgxlVnhAWQs/tBGQqdjTUxM7UrMw==
=pSo5
-----END PGP SIGNATURE-----

--Sig_/yktaNDk/jMXm7v/uSa6bko+--

