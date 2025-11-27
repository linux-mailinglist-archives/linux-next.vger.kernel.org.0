Return-Path: <linux-next+bounces-9241-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 368F6C8CC2D
	for <lists+linux-next@lfdr.de>; Thu, 27 Nov 2025 04:36:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2259B4E0F0E
	for <lists+linux-next@lfdr.de>; Thu, 27 Nov 2025 03:36:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADE6A29B799;
	Thu, 27 Nov 2025 03:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="cy04eAB1"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F55929D294;
	Thu, 27 Nov 2025 03:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764214601; cv=none; b=Ld7e0kNkMWYsALoZ4njakHuPyB4rax7YbA1PmsyGEqhlJRaJXVxE+XAqxKpTMV3C689e8lVP47T8XSfb2MwAXfT4zWnzgBjXM+KJCHpk5ot1TO56u6AWmOGmJp/i1zTd8tHq0CYzeYzwmKxrPWp5QdMGSf4ibJWZa5g7DqXShec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764214601; c=relaxed/simple;
	bh=EBC/qXljZGGCcOtBYCT2THOn5xAHRtBp2sdV5KFImEw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=CR4RQ6u/sgLyGdK9jY4EnYk9dHT0GcGCJQM3cSbP8mW9K2Hke8/u7sGWs/5a8PS89+ijcmKiJD8fei0T7I74Ve11T+/n72A8i7LPD4i3saWLYWfvYclHrY70dy/jMkcW6WANxIohsIMYTZGN+OWO/SAfD4Uw5/UIHy2GROo1sH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=cy04eAB1; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764214594;
	bh=0lVN18yOSj2aMyh06K7FhksqDAjcpVlAlRsTw5auiwE=;
	h=Date:From:To:Cc:Subject:From;
	b=cy04eAB1j4gpBBRPMW+oedwZU71ZYMYk6vB9Ek1QdZ86QadJ3WtFN62eM7Y2REppS
	 RVLihzGbNZnumioqT07khpj8SbmP46imvHQJjtrWfFiHzXQovfPC6gkjW04oz9msdg
	 r6QIkPV0AvjUtkRIuWCOfTk9hiz1Vh8QGurXMxObGympPv64LDbFHoPu/uDsaqwCUf
	 nthgODVdMQ6w+BLBJKRGhYb79DJkYAkdA01MbM0uhcaKSu5fX52jY4HJiAcrcjv3wO
	 KxvjgKPbaxF2cWhkTI/8U3hndUFtYOvMUFw9lPs46YuoA78LRGWvWRgnV2bLZ3es32
	 jDngD10eeU9AA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dH2Ck5LsBz4w9w;
	Thu, 27 Nov 2025 14:36:34 +1100 (AEDT)
Date: Thu, 27 Nov 2025 14:36:34 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jeff Layton <jlayton@kernel.org>, Ilya Dryomov <idryomov@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the ceph tree
Message-ID: <20251127143634.52a25df5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fRd=.bKGYD2/YZzrgTXCVf7";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/fRd=.bKGYD2/YZzrgTXCVf7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  62b08ccdf4f7 ("libceph: prevent potential out-of-bounds writes in handle_=
auth_session_key()")
  cfe243a92cb1 ("libceph: replace BUG_ON with bounds check for map->max_osd=
")
  7d734ad7b628 ("ceph: fix crash in process_v2_sparse_read() for encrypted =
directories")

are missing a Signed-off-by from their committers.

--=20
Cheers,
Stephen Rothwell

--Sig_/fRd=.bKGYD2/YZzrgTXCVf7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmknx0IACgkQAVBC80lX
0GzaRQf6A/KfzJ/fku2LfScNnqJwveTBaglAIhjl2BrPAZrzlsKYnNWzQbzaJ5AI
gKV3GUXFqvVQXcY6bvzldV4EjwBaMqr1McMiTm6fxZ5RtuUGdJ3YiFdeK51t7N7h
rxY89vJolB3/tGqsGp9KyDyll4G/3qV5NMlaYEpTHuBS5wkPyFaiLmHlpk3tLC20
audyAcR4GITl78ZUNSps2hopgFYrNLiweUy4waqTMFKjUY7CvQLZVlNVRrCEWlYN
FMU9vq7a46ykBL2QkkmiTXMY7TJmcv5XGEI6tWrLd8K0Ti3hdyj/SyNqligi/utZ
5N2d/baurVmyjAFMAEGNPJ9q0eRKRg==
=Rx/r
-----END PGP SIGNATURE-----

--Sig_/fRd=.bKGYD2/YZzrgTXCVf7--

