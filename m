Return-Path: <linux-next+bounces-8871-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B085C390B4
	for <lists+linux-next@lfdr.de>; Thu, 06 Nov 2025 05:03:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0A3634E5012
	for <lists+linux-next@lfdr.de>; Thu,  6 Nov 2025 04:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBB8B29A1;
	Thu,  6 Nov 2025 04:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="g7rl9nkl"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800BD18EAB;
	Thu,  6 Nov 2025 04:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762401820; cv=none; b=sf9zX9e2sGjxZlzJUTpFQ2EiJISAphnZWlnoWuI2QCOVvjZTv6z/5hvDNc3zs5YU9m3JO0E9V27mYQwZG1pJXJhU5vDJKuPldt0sH0SjMyU4EeWS4wQPqFtJ5IRIj4N1o5QT2FlspNlt+fBgL/jcHR7uGm8+bU0aYaDw1hsZBaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762401820; c=relaxed/simple;
	bh=74aeNl9KFR92B32XRGmEhDk6VCDdsX6261a7gTnRfW0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VPaBCoIoIeb1ibjIeQTpbsF2PpvtBmOJlf758QWB4hazeIcBgRY2bCmULVGilIYqpBvjMp6mF0N4WHmJnARx2aerz5vZ9jVPHzWXn/mtCvLFq4eSZ88akB331RkP2uoNVvqDLa4n+GRtQWf000natQsF/0r1ANloNNFf33FkeMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=g7rl9nkl; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762401816;
	bh=MxNz/L0rje7ewxwZsDeWeF1j4mumoQiMm6BPPPH/si4=;
	h=Date:From:To:Cc:Subject:From;
	b=g7rl9nkl2zNSZHQkXkoUrSK09PDCtg0GZ5aDMeHwEDaqfGuNuuqI93DIas6a7GMxh
	 UPkJVLXnJ7eXtWDpPBB84cKyR+GwTQDDFvfqYUDtHDJrlZOBSxEpEe+kYjp5mzyNoB
	 S+v4uC/nVdx+A1+qtxr+qQZGMn9MCsLf/cbUwx61/oVdTxrUxhh1Zr548z4kK+4Lba
	 vH+LXKxdjY7FzdTbPvAqua4VccC/QNPJpHWHJ+oDHRGJXBnEN6HSSvWDxauuMcdXqI
	 afKldI/K528xPfRBBwbUUzNQ6uVt/75kLYsuqDKnRMgCiPAcNbz9RzuHAlrGKnYFS4
	 jQWa0SUuyQFew==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d27pc4Tmyz4wM2;
	Thu, 06 Nov 2025 15:03:36 +1100 (AEDT)
Date: Thu, 6 Nov 2025 15:03:36 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Alex Deucher <alexander.deucher@amd.com>, Timur =?UTF-8?B?S3Jpc3TDs2Y=?=
 <timur.kristof@gmail.com>, Wayne Lin <wayne.lin@amd.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the drm tree
Message-ID: <20251106150336.06290fad@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lmYtYl8vPG_Q31PyNryoIQF";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/lmYtYl8vPG_Q31PyNryoIQF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (htmldocs) produced
these warnings:

WARNING: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:7242 function pa=
rameter 'aconnector' not described in 'amdgpu_dm_connector_poll'
WARNING: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:7242 function pa=
rameter 'force' not described in 'amdgpu_dm_connector_poll'

Introduced by commit

  c4f3f114e73c ("drm/amd/display: Poll analog connectors (v3)")

--=20
Cheers,
Stephen Rothwell

--Sig_/lmYtYl8vPG_Q31PyNryoIQF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkMHhgACgkQAVBC80lX
0Gy8Igf7B1QGcTFDbjUlmKBL42JSpS1XWpESiTD/ohbmbeJvFDtOq4bI6I0Txtau
TvDEC9vazgbaZrp+awhtCd+np8QmkEHG2e7Fpq/vLWk0rCLeaYS0h63AZq+ge3Hr
mqrpkXdtDyRZInBVEgQtHG/c5XE2z9isdkdNEtNx3bgsNwB+FrZ/r1H7s21BA5vE
Kh3E7ofYqbc+RMkgoQU+un6miUa1Axr8PQF/GTYrLyrleUp7UP1epVB5EQokHZ/O
eWHOphuXp0gaHbozT/baQRSfTKeceaVW/AptiRF979S2l0YWZReL0e1PdQSmzgEt
0kJLZKPFI00LAgf7fH/OL6s0s8n/uQ==
=iFVU
-----END PGP SIGNATURE-----

--Sig_/lmYtYl8vPG_Q31PyNryoIQF--

