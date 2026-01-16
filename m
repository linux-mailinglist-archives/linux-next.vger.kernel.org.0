Return-Path: <linux-next+bounces-9684-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC41D310FB
	for <lists+linux-next@lfdr.de>; Fri, 16 Jan 2026 13:27:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64C233049E0C
	for <lists+linux-next@lfdr.de>; Fri, 16 Jan 2026 12:27:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F19D1A0712;
	Fri, 16 Jan 2026 12:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sjEVUbK5"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B70D5464F;
	Fri, 16 Jan 2026 12:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768566429; cv=none; b=I21t7CEbCi8ME3AOkr+8UeLocVsO6+WWZh5XCfBGwdTo3Eihd5pjxsVFvFFkPD538Cp2iqxt1/E+nz2NBonHeTGotzCAcbdYtCOBx8jSOm/w0KYoXU19k2e9vjaSAKUIHWiR6gON4jExzb8VC5CBOFbtmtJQqfMCrVlIZC1ntkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768566429; c=relaxed/simple;
	bh=vJkeSZJDlEr+vcRKl28dC23myQ3tVLtBezbfmx5tv0w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WNAfWS8dUt8hP4bNjO7oM3hiC15w329yz7qlK1cQAWBHs3SdoFpk8j05xPNZ36gENKfnocy4TnPRiVREvwFvH3MEUEBo6hsiGI30SJzpE6RfFkN6f0SJYZ19l+Ru70Dgdmi0Ib63dpJGzJxtCjLI5vCz3rfeV1zgvr8BflIvtlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sjEVUbK5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E850C116C6;
	Fri, 16 Jan 2026 12:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768566429;
	bh=vJkeSZJDlEr+vcRKl28dC23myQ3tVLtBezbfmx5tv0w=;
	h=Date:From:To:Cc:Subject:From;
	b=sjEVUbK5eDLEe4biY+4NGGhlHFA98iurZRGtV+DNeL/raL5sk7aOeDNMrokB4OBma
	 HAX3MFbRTgbf/sjdivHjLSqEPhxKl/PueS7guXk/BxnGQRZEYPTscDwE9U8gCPVf7R
	 9yZ12kPfIV/2Nyl+b664QN+2uv0SkmG2ciSyYzvTsRW35CSZ4Su9m6+TwkOl+8VBg8
	 Ptq/I3n05m9yiB/TWn0vNFt4kl5oswevy9NnpbKuKsuXK2yjarqEKVDaiKRFjzcHnW
	 9r4GfaoGibN8jGvh0onJPm9mLgN9wTkmbG+ko+BuOpgYT7TH9nd/1wtVrcfeIsyohG
	 B2O3Uy5qA3UzA==
Date: Fri, 16 Jan 2026 12:27:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Many Fixes tags need work in the drm tree
Message-ID: <d681a658-cc84-48f5-beb6-2a327a355079@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7+0u+ZO/Jp49Ujmv"
Content-Disposition: inline
X-Cookie: I've only got 12 cards.


--7+0u+ZO/Jp49Ujmv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

  0288a345f19b2 ("drm/amd/amdgpu: Fix SMU warning during isp suspend-resume")
  155a748f14bc0 ("drm/amdgpu: always backup and reemit fences")
  16b5ad3195247 ("drm/pagemap, drm/xe: Ensure that the devmem allocation is idle before use")
  179176134b535 ("drm/amd/display: Check NULL before calling dac_load_detection")
  25314b453cf81 ("drm/amd/display: Apply e4479aecf658 to dml")
  563dfbefdf633 ("drm/amd/display: Reduce number of arguments of dcn30's CalculateWatermarksAndDRAMSpeedChangeSupport()")
  5c5189cf4b0cc ("drm/amd/pm: fix wrong pcie parameter on navi1x")
  72aee5f70ba47 ("drm/xe/svm: Fix a debug printout")
  7edb503fe4b6d ("drm/amd/pm: Disable MMIO access during SMU Mode 1 reset")
  a6ea0a430aca5 ("drm/amdgpu: Fix query for VPE block_type and ip_count")
  b20b3fc4210f8 ("drm/amd/display: Reduce number of arguments of dcn30's CalculatePrefetchSchedule()")
  b5179dbd1c147 ("drm/xe/guc: READ/WRITE_ONCE g2h_fence->done")
  bb5dfe2f5630c ("drm/amd/display: Add missing encoder setup to DACnEncoderControl")
  cdf6e4c0cdab1 ("drm/amd/display: Correct color depth for SelectCRTC_Source")
  dc135aa73561b ("drm/radeon: Remove __counted_by from ClockInfoArray.clockInfo[]")
  fb62a2067ca45 ("drm/amdgpu: don't reemit ring contents more than once")
In commit

  6ef93f62533e4 ("drm/amd/ras: Reduce stack usage in amdgpu_virt_ras_get_cper_records()")

Fixes tag

  Fixes:

has these problem(s):

  - No SHA1 recognised

Thanks,
Mark

--7+0u+ZO/Jp49Ujmv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlqLpgACgkQJNaLcl1U
h9BWPAf/Q7EP4eGa+ncZSWHO5QGAlejlRhP4IAQEHvxBOppaPOkFJoVdv89ghg9N
QRswzI89us4Q3S11vKTDQgAAGWsx2gkNHXF8qBpNMnnQd4PXYJIHgI8RHN00By5y
33KGQdgycXPynW2QvHnVo6hFrSlndr1/w63UbX1bYaxLRB2PCN2IDGe3nr/Rckeq
P6efd6bUfMIcic88owGtx6sglvWpMov4fkB0tLHXmHh4Jo0+JF5YTUdF2+OfP7tF
tk3RQ04ckmj1uv07qBGKaic+tU+blwqMcVgHqC3NcxmysH9nrIdMleGr4agcOrzk
FBeqZ+NFutugZ7DxFxeKCJzUHsqO3Q==
=+mjY
-----END PGP SIGNATURE-----

--7+0u+ZO/Jp49Ujmv--

