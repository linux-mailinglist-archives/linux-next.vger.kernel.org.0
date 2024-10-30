Return-Path: <linux-next+bounces-4532-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 645469B5A80
	for <lists+linux-next@lfdr.de>; Wed, 30 Oct 2024 04:51:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1934A283A45
	for <lists+linux-next@lfdr.de>; Wed, 30 Oct 2024 03:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23290193432;
	Wed, 30 Oct 2024 03:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="aDn53dxU"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7B828F7;
	Wed, 30 Oct 2024 03:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730260305; cv=none; b=LpHZ45CQvQ0FWvqzjGLwMl1MTuzS8L+CVyOBJstlVNcBV9BE9jDWYkHuuD1IncJ536knsUU1rDm5HeYkDXi+azOLZxArXQyjo4kQEsUYlxd6izpDN8pjYrQsK7Nu5LczZ1mjAIPv7pta1H+z8XKnMyuFiv13QJX55bgay5APyEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730260305; c=relaxed/simple;
	bh=YYEdGyvHapdH6+urF5Oux0dkU/eP2cs22NvNSpI0yGM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=sQWudfZDJKIdcbemQZ9nG4JfRlMbk1+DXEZDPoSs7euOMtPujZYRFsKus8wAi4RCj9OAlrgSV/2zFJCMHx/jfM9JO6vB256926wksUpOdCcfcEHV1qxOSFvo7nI+j01c4mws6inngUsBc6o/xnlvKIgdJM1EOqKisJIyWYKkoq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=aDn53dxU; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730260296;
	bh=6wsNVS3QJIKHN/XDPgf/6Kmvha5nzhZNmINi0ham8RE=;
	h=Date:From:To:Cc:Subject:From;
	b=aDn53dxUOv4Ma6kz8AO3RM/wItWj2ZXeVfM0dTOyi/VivoO2tKDYRjRSsOo37lmjz
	 kS6yQkuVzP2mZ1IXgKpFCbZ6w2hSpDPRSCcdfOigyW2f54DLM5/i0LqolDnNUaikEG
	 v54HWoI76v6pvEoQ2jqNCD/na1VBto/bRBFnL4UKucHH/fi9MevQCMdiR18MJmNpo2
	 VLDasRyUrkHygC0a/WSz21obL9Yquma9vfFDLLs7Ioucdpy8sVZF1L2v4bEaGyjiVU
	 RoSH0Em4FQDMvr3TY+Kkp3T8UOLB6OXTEXaIRDPMbtI2FBBMURP+Fk0DmTu0UeEG7+
	 zFtmwAVuTarEQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XdY8R6FlKz4wb7;
	Wed, 30 Oct 2024 14:51:35 +1100 (AEDT)
Date: Wed, 30 Oct 2024 14:51:35 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Joerg Roedel <joro@8bytes.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Dave Airlie <airlied@redhat.com>
Cc: DRI <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the iommu tree
Message-ID: <20241030145135.7851a2ae@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fw2GqG3kOCLjZTUbllDNwjT";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/fw2GqG3kOCLjZTUbllDNwjT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in other trees as a different commits
(but the same patches):

  0c069019f33d ("media: nvidia: tegra: Use iommu_paging_domain_alloc()")
  ba1057ab5d01 ("drm/nouveau/tegra: Use iommu_paging_domain_alloc()")

These are commits

  bf7835facc09 ("drm/nouveau/tegra: Use iommu_paging_domain_alloc()")

in the drm tree and

  93ee2d7ce266 ("media: nvidia: tegra: Use iommu_paging_domain_alloc()")

in the v4l-dvb tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/fw2GqG3kOCLjZTUbllDNwjT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmchrUcACgkQAVBC80lX
0GxEGAf+MvQGB9j2ChxjLi3itY0LABtv+Cd3eQu5CQ0Xa3s3dXnHSsRCxizH83it
KAuZcG3NDSkHsNV1o78cgRLsKOfXR95lR7xuLlcVMaPEZtMYfJJUOpkHukIeXQAt
WxKyGdYk09ZOnyrDUyuJxY9mJxk7Kycx/ah1CXGSV4vV4QzfRbMsNse6YKGdTMHU
C73jOlfokuBtVF4DelUnipg1Kwg0FNNEih9ljDCfoJHGOMsNQEec3sBQQDAWiYm9
Dfbcur8kPJuAaTDtWaqMBPrPpIDgDSr6TFPswK0dU4SYSJ9AgWWysYn0hVrrVo9D
wjsmDEZBoq8njw+vDjDshA9e/daWKw==
=q/IT
-----END PGP SIGNATURE-----

--Sig_/fw2GqG3kOCLjZTUbllDNwjT--

