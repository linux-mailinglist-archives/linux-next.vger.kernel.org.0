Return-Path: <linux-next+bounces-6948-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4E3AC602F
	for <lists+linux-next@lfdr.de>; Wed, 28 May 2025 05:43:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CE951BA6A03
	for <lists+linux-next@lfdr.de>; Wed, 28 May 2025 03:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43E4919DF7A;
	Wed, 28 May 2025 03:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Zgri1TEO"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C121862;
	Wed, 28 May 2025 03:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748403780; cv=none; b=MQyC+aI/fSswz273+xWdRFSV2KG6RoYXxCggk8e6mxD7VRsBQghaPttRqjPujPwrw1H7QB2qYlJv3QTyIhjDdt5PE5BenZYQhUSLNqYLxD+Gqd53gk93EX57ynroGt7458CAFsdehCIWjaBm3kmDr+bNnM/efv/VCbizmUwh0Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748403780; c=relaxed/simple;
	bh=Zg0DZNrwitSl/n0hseg+21IkKpSV5T7pOnr7xxvxdkc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=f5c4SWmMctnkNY2F+MsRUWpmvYDjdb2ttDA/a3VdhfVPvMGc8sKmvbIsEjckl9ErwWuYDQbRUhQ0+4B4x+e5tPMdoZ63M8XnIOA5SklMfVsypUdIpQi82he4HTxlbVpAYxYlJ84BppDcZS+PS6fP/KkwqkJfdR3SCWQd9a7o7Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Zgri1TEO; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1748403767;
	bh=MGDuOBsfAlgtlbAEWuBMIzWBp6a6wwZq+g6OTJlOhIo=;
	h=Date:From:To:Cc:Subject:From;
	b=Zgri1TEOvoDPdwDGthf+Z8jI2M1m8llQOnVY6HL3uvudR5/Dyjiq3Kqvr82ymHECI
	 4iXaVSGZaV1IkFEaK2HlBABIma3QbSiJjx53L29uNNVa7YCC8+9Xd581+z3hfSz7Za
	 aEY1lGBn2ZbC2GwUuPBzXPBpDbdrvqaubmjsn6XR+JHSJ0gHQoxl71UCp1gUqT4I2G
	 f9hWkF3pd760EBt1wOqyjlVtTxlslY+KcvzmYXJDW1GoYr1hjg0f8Ep0Z8ROjFVMli
	 A9JwnrNf3cAD21xOwua7ac5EAU2uXSecIiBz5E1AQPI2IYa4/xOXI1Sm+PvF+0CORA
	 S9k4NLCoyWmjg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b6b1L2jfvz4wbY;
	Wed, 28 May 2025 13:42:46 +1000 (AEST)
Date: Wed, 28 May 2025 13:42:45 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20250528134245.13dc84aa@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0_VI8LUXh34fY2LlG9kQc+A";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/0_VI8LUXh34fY2LlG9kQc+A
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/gpu/drm/bridge/analogix/analogix_dp_core.c: In function 'analogix_d=
p_probe':
drivers/gpu/drm/bridge/analogix/analogix_dp_core.c:1589:17: error: label 'e=
rr_disable_clk' used but not defined
 1589 |                 goto err_disable_clk;
      |                 ^~~~

Caused by commit

  6579a03e68ff ("drm/bridge: analogix_dp: Remove the unnecessary calls to c=
lk_disable_unprepare() during probing")

I have used the drm-misc tree from next-20250527 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/0_VI8LUXh34fY2LlG9kQc+A
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmg2hjUACgkQAVBC80lX
0Gwjnwf/VASeIuNNaFP1605TXc/eqU61v6ft0LRhMS5JcZB0tQIrRfMEzEC3FwGY
O0uuTBeEisovgWO0ZKuRVI384qsn/b2vI1tC6rWRrNBf02aavrjBF6skUzATINVR
l4brLu9+ut7bsYe0I5Fhk5jWVhlrz1Fz/coPl1uhdRHhwYpl81UsWesr1OQBxRa/
ogZUQA4MXfmdYzsfUvw+TOzzOUetokuztji1P9wpm2TOYCbwQgGD01y4UfmKF5SJ
FAUgR9pcAGHdFgT3RWbO0FMNOnZ5Zqy+5EdRvmNlxr3ZM5oGfAb12LuG0B4MGonO
X4ht8BKZLM3zvF0L12QLPBFANUjlLw==
=f02C
-----END PGP SIGNATURE-----

--Sig_/0_VI8LUXh34fY2LlG9kQc+A--

