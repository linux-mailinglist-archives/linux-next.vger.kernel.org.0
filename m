Return-Path: <linux-next+bounces-7285-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D3FAEECFC
	for <lists+linux-next@lfdr.de>; Tue,  1 Jul 2025 05:22:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 226AC3AE352
	for <lists+linux-next@lfdr.de>; Tue,  1 Jul 2025 03:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB6283B280;
	Tue,  1 Jul 2025 03:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="bMhxWvkE"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800781DFF7;
	Tue,  1 Jul 2025 03:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751340124; cv=none; b=ORKbTfoK/rfp2SwkcEzWw1T8jxoZtMHi17do6c5gU5hXwIWlwZtwqADQHgvY7sBGJSmaIswJJgfMiW/Ao56yrRsctEJPpj11iObwbyCB21dWQ5qFcmu+rqTeui179IXu0Bq1rPX8RsUSQ6sqi9rODvt1uYlkx49TZlbDfeCv9m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751340124; c=relaxed/simple;
	bh=NTTgCBmxi/pseh7PhJDsa5oYUIHNlxsOnmXchF703Gk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WvxWWWrm4f1TZ0I4Y99b1a/nvkmp5f4BerRiT45iIqzkFYuRntHYYPGx86P8tB1mvgcub2jNQzaPjYi6d+9W6mGjvNGbaYaCYZARuZPFSZuEJ58SacuEu8LFZkqcGOP9Yd/UT5wVlb7f41Mbi0qJ/Fy8D6EhKM4VUSbTNGKOiKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=bMhxWvkE; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751340120;
	bh=Qdga8GXeynKJpWuId8xCTRI1qgYirSAaJ/06RXU7auQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bMhxWvkEgfovwGGnNSNLudIAxUYVpRQqv3ods8T6X/bVIhxoURuzLuF56/seOqV15
	 Ub3j7iRxbWYZTNAMINvOrtqgtCeT96j384sHTLeyBd/bsnvyovZLpopn0bxxrDUVuE
	 KWQ3crBnVVAnXctjnKeVTYdIq4iAyq6/e2ebw0IGH+LcRfXcg/vjcnvDe4/WKmT541
	 qNK6PfDSQvLy8J0n/Vmcgu6g1zyEVtkiQgxP9Ay8rVXDLS3Lm4NG99DZ1gRUh+PYiU
	 iNjVqZHuGNLKKjTMHRiaiurLzBj69uuLJzQozl1PLZe5P/cPqpXl0VqG+GIIllBiQY
	 cXLCCsvkKZPdQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bWSxh1v72z4x0C;
	Tue,  1 Jul 2025 13:22:00 +1000 (AEST)
Date: Tue, 1 Jul 2025 13:21:59 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, Alex Deucher
 <alexander.deucher@amd.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>, Christian
 =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Christian =?UTF-8?B?S8O2?=
 =?UTF-8?B?bmln?= <ckoenig.leichtzumerken@gmail.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the drm-misc tree with the drm tree
Message-ID: <20250701132159.01cce959@canb.auug.org.au>
In-Reply-To: <20250701130702.416ba635@canb.auug.org.au>
References: <20250701130702.416ba635@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TDHW2DgfU/gWMuR=oGT2.Mu";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/TDHW2DgfU/gWMuR=oGT2.Mu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Sorry, this was actually a conflict between the amdgpu tree and the drm
tree.

On Tue, 1 Jul 2025 13:07:02 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the drm-misc tree got a conflict in:
>=20
>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>=20
> between commits:
>=20
>   183bccafa176 ("drm: Create a task info option for wedge events")
>   a72002cb181f ("drm/amdgpu: Make use of drm_wedge_task_info")
>=20
> from the drm tree and commits:
>=20
>   821aacb2dcf0 ("drm/amdgpu: rework queue reset scheduler interaction")
>   43ca5eb94b38 ("drm/amdgpu: move guilty handling into ring resets")
>   38b20968f3d8 ("drm/amdgpu: move scheduler wqueue handling into callback=
s")
>=20
> from the drm-misc tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> index 6b4ffa9ceb7a,f0b7080dccb8..000000000000
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@@ -89,11 -89,9 +89,10 @@@ static enum drm_gpu_sched_stat amdgpu_j
>   {
>   	struct amdgpu_ring *ring =3D to_amdgpu_ring(s_job->sched);
>   	struct amdgpu_job *job =3D to_amdgpu_job(s_job);
>  +	struct drm_wedge_task_info *info =3D NULL;
>   	struct amdgpu_task_info *ti;
>   	struct amdgpu_device *adev =3D ring->adev;
> - 	int idx;
> - 	int r;
> + 	int idx, r;
>  =20
>   	if (!drm_dev_enter(adev_to_drm(adev), &idx)) {
>   		dev_info(adev->dev, "%s - device unplugged skipping recovery on sched=
uler:%s",
> @@@ -133,47 -133,22 +132,24 @@@
>   	if (unlikely(adev->debug_disable_gpu_ring_reset)) {
>   		dev_err(adev->dev, "Ring reset disabled by debug mask\n");
>   	} else if (amdgpu_gpu_recovery && ring->funcs->reset) {
> - 		bool is_guilty;
> -=20
> - 		dev_err(adev->dev, "Starting %s ring reset\n", s_job->sched->name);
> - 		/* stop the scheduler, but don't mess with the
> - 		 * bad job yet because if ring reset fails
> - 		 * we'll fall back to full GPU reset.
> - 		 */
> - 		drm_sched_wqueue_stop(&ring->sched);
> -=20
> - 		/* for engine resets, we need to reset the engine,
> - 		 * but individual queues may be unaffected.
> - 		 * check here to make sure the accounting is correct.
> - 		 */
> - 		if (ring->funcs->is_guilty)
> - 			is_guilty =3D ring->funcs->is_guilty(ring);
> - 		else
> - 			is_guilty =3D true;
> -=20
> - 		if (is_guilty)
> - 			dma_fence_set_error(&s_job->s_fence->finished, -ETIME);
> -=20
> - 		r =3D amdgpu_ring_reset(ring, job->vmid);
> + 		dev_err(adev->dev, "Starting %s ring reset\n",
> + 			s_job->sched->name);
> + 		r =3D amdgpu_ring_reset(ring, job->vmid, NULL);
>   		if (!r) {
> - 			if (amdgpu_ring_sched_ready(ring))
> - 				drm_sched_stop(&ring->sched, s_job);
> - 			if (is_guilty) {
> - 				atomic_inc(&ring->adev->gpu_reset_counter);
> - 				amdgpu_fence_driver_force_completion(ring);
> - 			}
> - 			if (amdgpu_ring_sched_ready(ring))
> - 				drm_sched_start(&ring->sched, 0);
> - 			dev_err(adev->dev, "Ring %s reset succeeded\n", ring->sched.name);
> - 			drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE, inf=
o);
> + 			atomic_inc(&ring->adev->gpu_reset_counter);
> + 			dev_err(adev->dev, "Ring %s reset succeeded\n",
> + 				ring->sched.name);
> + 			drm_dev_wedged_event(adev_to_drm(adev),
>  -					     DRM_WEDGE_RECOVERY_NONE);
> ++					     DRM_WEDGE_RECOVERY_NONE, info);
>   			goto exit;
>   		}
> - 		dev_err(adev->dev, "Ring %s reset failure\n", ring->sched.name);
> + 		dev_err(adev->dev, "Ring %s reset failed\n", ring->sched.name);
>   	}
> +=20
>   	dma_fence_set_error(&s_job->s_fence->finished, -ETIME);
>  =20
>  +	amdgpu_vm_put_task_info(ti);
>  +
>   	if (amdgpu_device_should_recover_gpu(ring->adev)) {
>   		struct amdgpu_reset_context reset_context;
>   		memset(&reset_context, 0, sizeof(reset_context));

--=20
Cheers,
Stephen Rothwell

--Sig_/TDHW2DgfU/gWMuR=oGT2.Mu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhjVFcACgkQAVBC80lX
0GyuVgf+NwAHCei17zfrQBdLRF/QvkAmnwXZmtarvDknib5olRYsyPeDfogm7GKu
Fkq7ZP4CVLKa5kWrh6mCtJREUjPNSQUtm6/0NxRbnsWpWeQYbj06TtTRAH3sZ2g0
Ptl0pzGR6HJbe+Pt1AeZOre84zyor+fgnj8ot66LRPhninwoTL1HrbucpulcMgwP
Sys0CKZyKQG7HSQ3zBWAKdOXquULYYtOKxQY5vdZ2ggwU62BYZwI1GLe3SybC38i
PE/oyWfnY/M6RbthilIcFu2zaD14CfqDo3IBVLT08EpZVjJMdrALmqSFG56yKVzp
73GSVK5S321g5hmIYFS2LDpHkO/rEQ==
=PIYo
-----END PGP SIGNATURE-----

--Sig_/TDHW2DgfU/gWMuR=oGT2.Mu--

