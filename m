Return-Path: <linux-next+bounces-8872-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC212C390BD
	for <lists+linux-next@lfdr.de>; Thu, 06 Nov 2025 05:05:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54976189F2B2
	for <lists+linux-next@lfdr.de>; Thu,  6 Nov 2025 04:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCB481862A;
	Thu,  6 Nov 2025 04:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="i9jLbkWW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514B11FC8;
	Thu,  6 Nov 2025 04:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762401936; cv=none; b=acguZaY/HiDrjgJfyf5CSQesApm+B0lUOm92iO/617F3HQmz1VU1WA3iGDGG6DvavO5+PpfzNSfZ8aEga5mQ5Zn3T49HVORLEubwhee4zXVsHgWyaHQAwdbnHJI4kC1CGoGovnSehnI2rvbfasHN741WNIFW/ltC4MmjAi/+InM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762401936; c=relaxed/simple;
	bh=7MFnu1uco2QsQ4bGVBTq0ZIy4GyZ+sf96UtCLkQYZdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UeEQI3M4Uj1gi0W5g2KExbeiPLOKX5m8+TCGSErjGvHP/u2XLUF1xbgQtPcSNfK4lDpVGcyfDBC0XA9P5is4A3l/B1l6P56hIhNh4jCDJaFDkI4oDhlFJR/uEIFmAmodDLwysAuPOqGBvdyFJfUdjTdEBAgh/YwnqVHFnxfx0u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=i9jLbkWW; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762401932;
	bh=2Fpig3csZBsINCMTyYrR8XTaPg+0bt1jp7xHdKBUT4Q=;
	h=Date:From:To:Cc:Subject:From;
	b=i9jLbkWWPAzXDePD/X4LbVexKYrhfu7cfpIxRzA9yrIR4+IPAv65Vrm7D7kOWpLkC
	 WGcfYF4rBGWArwcNDj4sEXPrUnUgQzQFGemQUtheesx2cJQOxpUQVCDB2k3mJsTyXr
	 39TiZzSFqfvyIReiQH9XphCssdtHf+DFtOJ57z/XLuv3UynV5fpClegYT80eUcr+Tq
	 bbQChi2NJlQ+3sRGCm6glpRjLXHxYhJyevG23b/XfdvqnNaDu8WmzSDsVSdPJzbhlm
	 QCcLkSAYQRmn+ajxc2ZtQFs1MNg2LST0bHTX7haHqBEhiLqsWDec0IPzyqPmCUzvNa
	 MmE7WlbZ+F3zw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d27rr43hJz4wM7;
	Thu, 06 Nov 2025 15:05:32 +1100 (AEDT)
Date: Thu, 6 Nov 2025 15:05:32 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Alex Deucher <alexander.deucher@amd.com>, Timur =?UTF-8?B?S3Jpc3TDs2Y=?=
 <timur.kristof@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the drm tree
Message-ID: <20251106150532.2a269208@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QxQPfcBJt/bT31txa_C/5vb";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/QxQPfcBJt/bT31txa_C/5vb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (htmldocs) produced
these warnings:

WARNING: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:7309 function pa=
rameter 'connector' not described in 'amdgpu_dm_connector_detect'
WARNING: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:7309 function pa=
rameter 'force' not described in 'amdgpu_dm_connector_detect'

Introduced by commit

  8223a605744b ("drm/amd/display: Refactor amdgpu_dm_connector_detect (v2)")

--=20
Cheers,
Stephen Rothwell

--Sig_/QxQPfcBJt/bT31txa_C/5vb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkMHowACgkQAVBC80lX
0Gwf7gf9GttIYkJhQfAlQ/QcywiWpF64HnoM0J2YRPcNLc8O9lyyJeDLgFIS9ITw
8IbDvEl7MdOopn6V6qZpFw8ZojJjr1qixeB4c07NVbwYg1/rdW/r29vj1qeLeoqU
h+xASZbBWar9tfMtFfNvof3Jt/hRRHcL39jpqkKQfZOq36DEahUDhRnIZt5/zVTW
ec1F/7y3UTbW0AanGJ2Q4NxyQ1cMf9qwofj088ZcWcig3DLGGLC6nd7OpZZ9oh3P
k07ZVcqMz40rAXbImHBD8nbN/jLFPtx+CW1lCfv4nTCbAqKYiUPyMzVGsvK4ENqA
BHr09Ewl0uV5GoqL5Go77/LrICswPA==
=mX/v
-----END PGP SIGNATURE-----

--Sig_/QxQPfcBJt/bT31txa_C/5vb--

