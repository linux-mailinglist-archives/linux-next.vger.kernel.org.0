Return-Path: <linux-next+bounces-7598-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 561C7B08318
	for <lists+linux-next@lfdr.de>; Thu, 17 Jul 2025 04:47:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C43D4A5DE2
	for <lists+linux-next@lfdr.de>; Thu, 17 Jul 2025 02:47:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E327F7E107;
	Thu, 17 Jul 2025 02:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="i/sMf7ML"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C192D72606;
	Thu, 17 Jul 2025 02:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752720462; cv=none; b=FLyhEgwA67vk12IAHTo8azuVfbCNr9oqfQZTn5vKTeEQARfPWawGI2lih0cx/Nq84022/mxt+BzhQlZnHmSB4YlrI+cjyh7F9zuWGl/ckfcQDmtCjwWJQ3wG5MmpxYuKY4GOO0pkt2A4nlXTD5vWO36d/2a0+dfjl4r58LJNwvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752720462; c=relaxed/simple;
	bh=HOiurROfglfw1sPUaVuYlx1v3kpDucjMOZ7q9os/4xQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mcbBXdMRSn9R72L0OcYnnznsACC/HgbhLTuIBDQvQq8Iij/abatN0S8e6MmRBYqYuqi85J5fxfMA9FJ1pmcuIMuoLUdKv9CCIIBPalwcVuJJlupavgzcabe6zlHGtQHl94Ghqd5hq5ih/om/Mb/iV04QdLxYwplbISRvDofeqZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=i/sMf7ML; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752720334;
	bh=J1vTukhoZZsy+dM7+gF/ok/tMoxEtuRTVn5Sfcyx7Ss=;
	h=Date:From:To:Cc:Subject:From;
	b=i/sMf7MLCAhtAvTD5aFqQu0tiiWfLkjrr2Fc5y06A4hUf/din/y2xAq7LB2HLDvBz
	 V7ZtuQ6fu/GOMQWMWl+KpcLNS0Vo7qWQ7PhBqQ1HcsuaSV0oPgsLIletvniB5ZGgsc
	 8uQq3KNsm2E2axUOrQEjqm0x8SE2qIr7/373GcP2ftVygNKssCS3YtrbSieNyXPm1H
	 obON9LnHRQdcHqVe9sEgxUWPSkUIVgNHEBHxivJAAgXFL3KIiQtqLG5p9L6+mHSxAQ
	 01ECghxubuF7B7BUFTBiE8ghKKWxxHR54QyhtB9z1VDmUxTAUnoMvVwdqDpsSgva82
	 0Y3PA26H5B98Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bjHNB6z36z4x3d;
	Thu, 17 Jul 2025 12:45:30 +1000 (AEST)
Date: Thu, 17 Jul 2025 12:46:57 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>, Simona Vetter
 <simona.vetter@ffwll.ch>
Cc: Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?B?QW5kcsOp?= Almeida
 <andrealmeid@igalia.com>, Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the amdgpu tree with the drm-misc tree
Message-ID: <20250717124657.3e56c86c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jQUhQzpdIOaIPJrP0Mk09d3";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/jQUhQzpdIOaIPJrP0Mk09d3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c

between commit:

  667efb341917 ("drm/amdgpu: Fix lifetime of struct amdgpu_task_info after =
ring reset")

from the drm-misc tree and commit:

  77cc0da39c7c ("drm/amdgpu: track ring state associated with a fence")

from the amdgpu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index ec73cf3a9024,5cb7bf9420f7..000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@@ -90,8 -90,8 +90,8 @@@ static enum drm_gpu_sched_stat amdgpu_j
  	struct amdgpu_ring *ring =3D to_amdgpu_ring(s_job->sched);
  	struct amdgpu_job *job =3D to_amdgpu_job(s_job);
  	struct drm_wedge_task_info *info =3D NULL;
- 	struct amdgpu_task_info *ti =3D NULL;
  	struct amdgpu_device *adev =3D ring->adev;
 -	struct amdgpu_task_info *ti;
++	struct amdgpu_task_info *ti =3D NULL;
  	int idx, r;
 =20
  	if (!drm_dev_enter(adev_to_drm(adev), &idx)) {

--Sig_/jQUhQzpdIOaIPJrP0Mk09d3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh4ZCEACgkQAVBC80lX
0GyaXggAlKd3pKidEHwWEfHhp75VkpiiUx0zFaU0zfpG+FOSEbZR4vN38w/8QZi5
QSKpwgoKP/IpUgFDxaSDVUtke5P3iGhsOirHPzHxxnNPaTEhxLllzU5cvUx/Kdrn
A7yeOh4qFSwWZ6tA7sPAYpIEYe80eYieNnA8tDqBljoIQ6lswVGuVBoJrZldCxQl
KvXTy3vs3LDiNasNbEGXlj8clooPvkH6+XK6ClGNwHWLbxha60oSdMyGRlKQACCG
WMuT6Ec/rc/7xHH3rRPfhfyleOdIm6/Q0v8YFS0VEkFUo3+iPpgSBrGpC5UfRmhj
7bsD8QdcjZTrQ6OA+WnuZLfXsuI/Mw==
=Nzw5
-----END PGP SIGNATURE-----

--Sig_/jQUhQzpdIOaIPJrP0Mk09d3--

