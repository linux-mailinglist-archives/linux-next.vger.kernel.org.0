Return-Path: <linux-next+bounces-7283-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E42CAEECB3
	for <lists+linux-next@lfdr.de>; Tue,  1 Jul 2025 05:07:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D93E189EBCE
	for <lists+linux-next@lfdr.de>; Tue,  1 Jul 2025 03:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B134C1DB154;
	Tue,  1 Jul 2025 03:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="gimtROFg"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9EB1E871;
	Tue,  1 Jul 2025 03:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751339227; cv=none; b=db/20uHOW6sV/jg4HDXTJxcK7NjJTmilbL9ICZETf05Fu/lX7AVtsDhbINsgF/6BHTMcSvXOdGREm4Pn6oNz2/KN7OwDh5Ea2i+l2yrznCtL/n5Dpixf7EVks8RQXAB39NFgDDIWHvLtCjj2ONe2MbA9bHssNa9GmB3H16qjuU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751339227; c=relaxed/simple;
	bh=FC1Iqoywm5e+iVpDgfreSlCfNeAERV1POiyhre+ItK8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dBtyFoyZXqOuV7a0jXz3Mv+ab4CPggLJnJvLoHk9echmgs3DfVIiSgq3X5IfvXDPjJxJKzASAnMmzeRiclqJgQMTC7lShenFf4IxLmoRhLAkS8hEF2X8MUqeRMSj9hvwQIiqzIezsiRdNc3JdlQ01b1CdG6ZYrygt6E+HifsNUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=gimtROFg; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751339223;
	bh=cnRZycmV29wnxz+1tOWhqeDibAbM/eb88xyiQu5/VMk=;
	h=Date:From:To:Cc:Subject:From;
	b=gimtROFgLqBy5fxNe5aGfKebs2dojJNTFVwG4LJANpQ9F3C1ldjA8odO+en3N8le0
	 vUQ1Spb+lbTmusbr1m+BkEPHMB2zuyppZNpA6K0ha8oraT1NmBha1TTvgswXBPOM3t
	 udhjob3a9zDFUlez+DTq5SUEXv0Swww8/wSfrcDuo3x2X6u3v7B7YVv7tUrO5wC0cI
	 pDq3wIsXmEyZXEGivtzwP0bg47DnVzrgW2kDDgCkqJy/xuy3DZRGbOuneI9oLJaa04
	 4BWs+Yyz0BZbt7fucfVh2tVvw3V+vygrcwaZ3t2WZznhQLtslAXle/r9swiJ860BYT
	 5qzk8Gggxh9Tg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bWScQ2mmnz4xSX;
	Tue,  1 Jul 2025 13:07:02 +1000 (AEST)
Date: Tue, 1 Jul 2025 13:07:02 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>, Dave Airlie <airlied@redhat.com>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Alex Deucher
 <alexander.deucher@amd.com>, =?UTF-8?B?QW5kcsOp?= Almeida
 <andrealmeid@igalia.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Christian =?UTF-8?B?S8O2bmln?=
 <ckoenig.leichtzumerken@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm-misc tree with the drm tree
Message-ID: <20250701130702.416ba635@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3km7j/xIsIBB_inJew/ru1b";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/3km7j/xIsIBB_inJew/ru1b
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c

between commits:

  183bccafa176 ("drm: Create a task info option for wedge events")
  a72002cb181f ("drm/amdgpu: Make use of drm_wedge_task_info")

from the drm tree and commits:

  821aacb2dcf0 ("drm/amdgpu: rework queue reset scheduler interaction")
  43ca5eb94b38 ("drm/amdgpu: move guilty handling into ring resets")
  38b20968f3d8 ("drm/amdgpu: move scheduler wqueue handling into callbacks")

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

diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 6b4ffa9ceb7a,f0b7080dccb8..000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@@ -89,11 -89,9 +89,10 @@@ static enum drm_gpu_sched_stat amdgpu_j
  {
  	struct amdgpu_ring *ring =3D to_amdgpu_ring(s_job->sched);
  	struct amdgpu_job *job =3D to_amdgpu_job(s_job);
 +	struct drm_wedge_task_info *info =3D NULL;
  	struct amdgpu_task_info *ti;
  	struct amdgpu_device *adev =3D ring->adev;
- 	int idx;
- 	int r;
+ 	int idx, r;
 =20
  	if (!drm_dev_enter(adev_to_drm(adev), &idx)) {
  		dev_info(adev->dev, "%s - device unplugged skipping recovery on schedul=
er:%s",
@@@ -133,47 -133,22 +132,24 @@@
  	if (unlikely(adev->debug_disable_gpu_ring_reset)) {
  		dev_err(adev->dev, "Ring reset disabled by debug mask\n");
  	} else if (amdgpu_gpu_recovery && ring->funcs->reset) {
- 		bool is_guilty;
-=20
- 		dev_err(adev->dev, "Starting %s ring reset\n", s_job->sched->name);
- 		/* stop the scheduler, but don't mess with the
- 		 * bad job yet because if ring reset fails
- 		 * we'll fall back to full GPU reset.
- 		 */
- 		drm_sched_wqueue_stop(&ring->sched);
-=20
- 		/* for engine resets, we need to reset the engine,
- 		 * but individual queues may be unaffected.
- 		 * check here to make sure the accounting is correct.
- 		 */
- 		if (ring->funcs->is_guilty)
- 			is_guilty =3D ring->funcs->is_guilty(ring);
- 		else
- 			is_guilty =3D true;
-=20
- 		if (is_guilty)
- 			dma_fence_set_error(&s_job->s_fence->finished, -ETIME);
-=20
- 		r =3D amdgpu_ring_reset(ring, job->vmid);
+ 		dev_err(adev->dev, "Starting %s ring reset\n",
+ 			s_job->sched->name);
+ 		r =3D amdgpu_ring_reset(ring, job->vmid, NULL);
  		if (!r) {
- 			if (amdgpu_ring_sched_ready(ring))
- 				drm_sched_stop(&ring->sched, s_job);
- 			if (is_guilty) {
- 				atomic_inc(&ring->adev->gpu_reset_counter);
- 				amdgpu_fence_driver_force_completion(ring);
- 			}
- 			if (amdgpu_ring_sched_ready(ring))
- 				drm_sched_start(&ring->sched, 0);
- 			dev_err(adev->dev, "Ring %s reset succeeded\n", ring->sched.name);
- 			drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE, info);
+ 			atomic_inc(&ring->adev->gpu_reset_counter);
+ 			dev_err(adev->dev, "Ring %s reset succeeded\n",
+ 				ring->sched.name);
+ 			drm_dev_wedged_event(adev_to_drm(adev),
 -					     DRM_WEDGE_RECOVERY_NONE);
++					     DRM_WEDGE_RECOVERY_NONE, info);
  			goto exit;
  		}
- 		dev_err(adev->dev, "Ring %s reset failure\n", ring->sched.name);
+ 		dev_err(adev->dev, "Ring %s reset failed\n", ring->sched.name);
  	}
+=20
  	dma_fence_set_error(&s_job->s_fence->finished, -ETIME);
 =20
 +	amdgpu_vm_put_task_info(ti);
 +
  	if (amdgpu_device_should_recover_gpu(ring->adev)) {
  		struct amdgpu_reset_context reset_context;
  		memset(&reset_context, 0, sizeof(reset_context));

--Sig_/3km7j/xIsIBB_inJew/ru1b
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhjUNYACgkQAVBC80lX
0GwYQQf+ONG+nBDAzZ2dO5RA1bLBgMGIXhiyUJNFQ2WhZ1X4tRLK6M7oFOQBy8oo
MzKZZpzDo2y+bjavb9CbLZTZ6uG04G7wtZNrFGcxIqlJ/LCCbZ2oBSEXHcVmUKAh
kuSdh8XDZj3ONKWeOvHXCZbre3GNCgQQpdR5kszrYtBY/KiGoiku8WUPWKI9HJcj
eK0J+fTEPTvtAay+K7WwZ+ijf6enNj7vFHuyaTy04CDAK59CKi+ngv8E2NWTcyb7
M3FSCs4CX8DdyqG3ToLZJlkUwUAsc3B8rg56B9l8qrUGKXd1roIMnkgvu8mxeQDv
dsrwrWa5RHg1KsU6iXirLZlOkcUetA==
=JnSB
-----END PGP SIGNATURE-----

--Sig_/3km7j/xIsIBB_inJew/ru1b--

