Return-Path: <linux-next+bounces-5918-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1626AA6B41E
	for <lists+linux-next@lfdr.de>; Fri, 21 Mar 2025 06:47:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 939EA3B67E2
	for <lists+linux-next@lfdr.de>; Fri, 21 Mar 2025 05:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8B3B1E98F9;
	Fri, 21 Mar 2025 05:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="bWYByzfU"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9931DE4CC;
	Fri, 21 Mar 2025 05:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742536029; cv=none; b=PvIUY1kNaN3CPVD1SioBeinp/uwbnUFmN0UM6s3h12Xn7RvBpzaAQCbmVHJ53Ec98UXwTYa1YPb2LDS4uCtO5UW3HbeigmBaKTeOJrJEJYt0lPV82oJQ2SwMV7y1844cWW8kl2GxrHm8FB0t8/V3/oW9jDCPpz6aoFga1y9yofo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742536029; c=relaxed/simple;
	bh=NKtbqf6lFezlXMtA+N4DCNTwnUPZLO2yGFkpji4jYwI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=TTu6bYNoeHUr498LHNdvru277Hmnu9/YQFj8lh6mDLvoA6u+HDcIqHqxZIvMlHo/NYSUARHDD8nF5hD4L8A00lz9ZmFwtoKQOigRCQJRm5WTVryUEutFDyg0Ib/PkHf0dir8F1uF9qOTZvea2D2XFCsc/pf7j/NoNtpCbNMpTDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=bWYByzfU; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742536021;
	bh=kONGa4+m4ViE0+PqSESHgF9ovmATMkDBLka3oGpfSwc=;
	h=Date:From:To:Cc:Subject:From;
	b=bWYByzfU2c/r3hPFLSROCmSnZycKsJeYcJ8cBT/XfPWdAirRyQUlZhmLCi9xbkFsp
	 ufTqCL6snx3UinFSMuPa2lORmncRYK2wWHwL1ap7ZM3533485yOTB6nm0teabDaWBz
	 Oud1ucGjTS7/dyofbilTZddEQfVnn58va8BXCUm4ysqep48w3YCk7u0c8S6WOobomz
	 g4LxOtr9a4lqLm1iyYqPKbed4HmB/4PA1zVTxicX9mPYQWLLmO1MFd9+J3LPR5RzbQ
	 XaMntEBr2b1UXsq7guAW7X0pu2H1U7xFhw6IqtxQ85ClR/y6HiNzyLoaub+igpMDqb
	 6dlBPXzNJnRcQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZJs055jJWz4wnp;
	Fri, 21 Mar 2025 16:47:01 +1100 (AEDT)
Date: Fri, 21 Mar 2025 16:47:00 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Bart Van Assche <bvanassche@acm.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>
Subject: linux-next: manual merge of the scsi-mkp tree with Linus' tree
Message-ID: <20250321164700.477efe5c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_h7qjKGPRcrCgADM0q+in6u";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/_h7qjKGPRcrCgADM0q+in6u
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the scsi-mkp tree got a conflict in:

  drivers/ufs/core/ufshcd.c

between commit:

  fe06b7c07f3f ("scsi: ufs: core: Set default runtime/system PM levels befo=
re ufshcd_hba_init()")

from Linus' tree and commit:

  20b97acc4caf ("scsi: ufs: core: Fix a race condition related to device co=
mmands")

from the scsi-mkp tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/ufs/core/ufshcd.c
index 0534390c2a35,3288a7da73dc..000000000000
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@@ -10475,21 -10460,8 +10460,23 @@@ int ufshcd_init(struct ufs_hba *hba, vo
  	 */
  	spin_lock_init(&hba->clk_gating.lock);
 =20
 +	/*
 +	 * Set the default power management level for runtime and system PM.
 +	 * Host controller drivers can override them in their
 +	 * 'ufs_hba_variant_ops::init' callback.
 +	 *
 +	 * Default power saving mode is to keep UFS link in Hibern8 state
 +	 * and UFS device in sleep state.
 +	 */
 +	hba->rpm_lvl =3D ufs_get_desired_pm_lvl_for_dev_link_state(
 +						UFS_SLEEP_PWR_MODE,
 +						UIC_LINK_HIBERN8_STATE);
 +	hba->spm_lvl =3D ufs_get_desired_pm_lvl_for_dev_link_state(
 +						UFS_SLEEP_PWR_MODE,
 +						UIC_LINK_HIBERN8_STATE);
 +
+ 	init_completion(&hba->dev_cmd.complete);
+=20
  	err =3D ufshcd_hba_init(hba);
  	if (err)
  		goto out_error;

--Sig_/_h7qjKGPRcrCgADM0q+in6u
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfc/VQACgkQAVBC80lX
0Gy5BQgAng9v6BA+b2BvyDzhWrUYlc41SsIRuvt1TIK05YyQ97chJ0wuzC8seqvH
adc0H+LZUrwO8oWLjgyFiCxPPwikjQ0M8TlvAsmyXgYbHZVQ+/lf7FXsPNRWjAKL
XIu2c29XTpYLsxdnAzJsgjVZ1ScnzQR0euQreJlP2EdOtt9KsYTEtPa0aXuOCWlK
Ja9NyocgiPtpA33rHc7wccMH6wmQtdibFV7+HZNF85oOSz2wITfLFoNGzl2CVv85
IXkppOae04AQzbmq0f9EYk0qj7lNuOqLNaNYPEDlyPk6RkG1Dq7X5tKu6PqNh7Ih
0j8aaGq3V5CjOT00rNYKdh+6QxvP1Q==
=fO4Z
-----END PGP SIGNATURE-----

--Sig_/_h7qjKGPRcrCgADM0q+in6u--

