Return-Path: <linux-next+bounces-4094-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B445C98FC42
	for <lists+linux-next@lfdr.de>; Fri,  4 Oct 2024 04:18:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D828C1C2174A
	for <lists+linux-next@lfdr.de>; Fri,  4 Oct 2024 02:18:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A150417C67;
	Fri,  4 Oct 2024 02:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="G4NRfL6g"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458DB2AE7C;
	Fri,  4 Oct 2024 02:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728008289; cv=none; b=KrSGJbmY16eZoj1/Cw3+7qOSX9hhgOeKyA6/PEWpw+vxFGbZEARrCAt8zHh8O02oeWcFh2BcP1rXr2xkDc+a1f7LLppRS9aLa3TodXmqn/Ejm30JqEYyqLiG5AvLT/3m3BhN6EQgMr8w4KWpwbHdKETe/4aUHR21k9A2xyWx+Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728008289; c=relaxed/simple;
	bh=afjIzbngGz6W5k5wttx7RqO4r3GRqfCcrmtfj98Vr2c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mvCWwmZLQZYXb65uW4E3746axOJg1CcIATdXdmZhRodfCAGmnLKHMX2vD6JNZ0RL0lI4ZKVM7G5FBPtMA4hR3js+WzhPfRruG4Im6UcEERU8jSro3sHJBKkN9QjwvK/Dp/WInVVVjWAuZX7L2O2fia1x3j2M24D1jvmBGu/g0RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=G4NRfL6g; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728008281;
	bh=PltzQyGOsappo7+6bKToHM0oOpnfQxAb9D8FQdYGGLw=;
	h=Date:From:To:Cc:Subject:From;
	b=G4NRfL6gvV9RuGYHaywEujfDQWkt/AhGxC9D8VHBi8lEl6810zAkKgiI1D8+4Fc6K
	 9lvj/4RbPjsz2koRZes4v8PJWBK3LM7pbuzT0TrumMF6b1uV9jQGBVC+FkhzK1oQWq
	 h+ijXi0OJGUrcherZwxl/9bSEzJLJ7e6VJKDeh9XnVbKg2zvzCfX4iyoed55hOi1QW
	 gRY2DZb0X8C7G+/UjMd63Ggwp3/XSGCRgEV58dxiUmNAYr9ib+bBqzK6QFxvWsFWGX
	 b+u6U9K60KMElMqhi0RPPa/RBouYmYYRs5WZ+i9CLvvI4bFygUaj1l1KHath6U4SrK
	 yIAEzELzVw6Kg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XKXJS2ycQz4x8h;
	Fri,  4 Oct 2024 12:18:00 +1000 (AEST)
Date: Fri, 4 Oct 2024 12:18:00 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0?=
 =?UTF-8?B?csO2bQ==?= <thomas.hellstrom@linux.intel.com>, Simona Vetter
 <simona.vetter@ffwll.ch>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, DRM XE List
 <intel-xe@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: linux-next: manual merge of the drm-xe tree with the drm-misc-fixes
 tree
Message-ID: <20241004121800.7ab3214b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jD=fq14.FzymV123VlZ2qFF";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/jD=fq14.FzymV123VlZ2qFF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  drivers/gpu/drm/xe/xe_guc_submit.c

between commit:

  9286a191abe2 ("drm/xe: Drop GuC submit_wq pool")

from the drm-misc-fixes tree and commit:

  861108666cc0 ("drm/xe: fix UAF around queue destruction")

from the drm-xe tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/xe/xe_guc_submit.c
index 17c25f18e286,8a5c21a87977..000000000000
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@@ -224,11 -224,80 +224,27 @@@ static bool exec_queue_killed_or_banned
  		 EXEC_QUEUE_STATE_BANNED));
  }
 =20
 -#ifdef CONFIG_PROVE_LOCKING
 -static int alloc_submit_wq(struct xe_guc *guc)
 -{
 -	int i;
 -
 -	for (i =3D 0; i < NUM_SUBMIT_WQ; ++i) {
 -		guc->submission_state.submit_wq_pool[i] =3D
 -			alloc_ordered_workqueue("submit_wq", 0);
 -		if (!guc->submission_state.submit_wq_pool[i])
 -			goto err_free;
 -	}
 -
 -	return 0;
 -
 -err_free:
 -	while (i)
 -		destroy_workqueue(guc->submission_state.submit_wq_pool[--i]);
 -
 -	return -ENOMEM;
 -}
 -
 -static void free_submit_wq(struct xe_guc *guc)
 -{
 -	int i;
 -
 -	for (i =3D 0; i < NUM_SUBMIT_WQ; ++i)
 -		destroy_workqueue(guc->submission_state.submit_wq_pool[i]);
 -}
 -
 -static struct workqueue_struct *get_submit_wq(struct xe_guc *guc)
 -{
 -	int idx =3D guc->submission_state.submit_wq_idx++ % NUM_SUBMIT_WQ;
 -
 -	return guc->submission_state.submit_wq_pool[idx];
 -}
 -#else
 -static int alloc_submit_wq(struct xe_guc *guc)
 -{
 -	return 0;
 -}
 -
 -static void free_submit_wq(struct xe_guc *guc)
 -{
 -
 -}
 -
 -static struct workqueue_struct *get_submit_wq(struct xe_guc *guc)
 -{
 -	return NULL;
 -}
 -#endif
 -
+ static void xe_guc_submit_fini(struct xe_guc *guc)
+ {
+ 	struct xe_device *xe =3D guc_to_xe(guc);
+ 	struct xe_gt *gt =3D guc_to_gt(guc);
+ 	int ret;
+=20
+ 	ret =3D wait_event_timeout(guc->submission_state.fini_wq,
+ 				 xa_empty(&guc->submission_state.exec_queue_lookup),
+ 				 HZ * 5);
+=20
+ 	drain_workqueue(xe->destroy_wq);
+=20
+ 	xe_gt_assert(gt, ret);
+ }
+=20
  static void guc_submit_fini(struct drm_device *drm, void *arg)
  {
  	struct xe_guc *guc =3D arg;
 =20
+ 	xe_guc_submit_fini(guc);
  	xa_destroy(&guc->submission_state.exec_queue_lookup);
 -	free_submit_wq(guc);
  }
 =20
  static void guc_submit_wedged_fini(void *arg)

--Sig_/jD=fq14.FzymV123VlZ2qFF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmb/UFgACgkQAVBC80lX
0GxVsAf/ZYVWAcXeYUGDOHAeO28Sf2yjhVR2ORN42Cc3+vf+jbnmMzSM21w/jSC3
i00ah/BnLAel8+9vAi+F/TiH+jpJLvHQSPMeAfQ5I3na2S6ocz6U2X05Yjg6FaH3
6a23FL4lh+Chm9cOTw7WR+OqPu1//x3n1xRtZLTNB/tdvbF0UqCZYa2i2ia2IfMQ
nmt6vCmMgL1mRCiDSiDR61D1puW9FD8Poilv82Lta2YpHuiryfurQhF7hREAKIaF
dutvRlioCDCVsHQ1I8RRH28KOgvWfg0gbGHBkfJASbeuAP/rKDGx97/5HGTS98EO
P6hC7Tnd2lnMCnoUNOXg70kypy1Cgw==
=6604
-----END PGP SIGNATURE-----

--Sig_/jD=fq14.FzymV123VlZ2qFF--

