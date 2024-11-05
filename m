Return-Path: <linux-next+bounces-4615-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A5A9BC28E
	for <lists+linux-next@lfdr.de>; Tue,  5 Nov 2024 02:28:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0CA3CB217FB
	for <lists+linux-next@lfdr.de>; Tue,  5 Nov 2024 01:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E6161BC49;
	Tue,  5 Nov 2024 01:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VHDXD2pr"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D9E2837B;
	Tue,  5 Nov 2024 01:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730770126; cv=none; b=SGQm4y6XtZxnvWJ8xY6b4/No/xuQfMUoJ5L0688IHdhDHz99uS8tDY3kE5vzrEcrInLc6NtcBB6Ejhzjxx4lSxoZ9N3qtLX0rvSXCBVCK8X/AZXKJiY4ujcnwktWAmVlPnmRosyoVJRQYfKpmI+wkqarZe6j+gvMqyC7lqdb2Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730770126; c=relaxed/simple;
	bh=Irjhm/hyzSaOy7K8L8MUaM7H/gFtinY+JmWS+0wPTsI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ShMIo/D/7e7mB9a377HbYnoMYXVvOGfRagc4QKYV3sFZ8ssFw4s3n0numehO1g2sMik3C6lpmZCHDnVDCwoF2X9Fg11iQMXWuudt7pUilQy4PO56ObKMaIsrH3Fn6g1azpZwxzzKm9ute8df0y9cVowmaJDscIIRiMmZnSpkL/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VHDXD2pr; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730770117;
	bh=2ydqDCJfAjTtRMwJu/mQEQxyknSlntFKqHzTV922HGY=;
	h=Date:From:To:Cc:Subject:From;
	b=VHDXD2prYvHJgPnsosEFKbXN3LOAiXXc5QHEpEOPOQ8TcBS7u5TOXJlGdFMgpcTcY
	 IyB6RFz65R6htaYjxmtb3peh3XuDdWyQAGY2Tc7JheXAuSI+gG70A4kKSGERuM0k87
	 kvR0cItdrz7BLN8I+Yi0Z53QfdOCsFclO9QAokVybbW1Rvx0ATLPxKZ+ZOXJcecaNe
	 dU+GE94deNxTOU4MqhVSkzTEOVvDhwggbkkb54qSEO14q/ZgmhSzokGZRuPSycJVed
	 xidPgXiWegIudT7T8C/rJSFdE7ZvBkXyUTOCu7j8bKstUHWoyfdEo0AKBPA6/Kr3/C
	 SoHBqTNPqakeQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xj9hj1PPLz4w2N;
	Tue,  5 Nov 2024 12:28:37 +1100 (AEDT)
Date: Tue, 5 Nov 2024 12:28:38 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>, Dave Airlie <airlied@redhat.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Christian =?UTF-8?B?S8O2bmln?=
 <ckoenig.leichtzumerken@gmail.com>, Jesse Zhang <Jesse.Zhang@amd.com>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: linux-next: manual merge of the amdgpu tree with the drm tree
Message-ID: <20241105122838.0d6d94eb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xzOYzmjgbeNdirBYSiBDDcK";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/xzOYzmjgbeNdirBYSiBDDcK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c

between commit:

  b2ef808786d9 ("drm/sched: add optional errno to drm_sched_start()")

from the drm tree and commit:

  35984fd4a093 ("drm/amdgpu: add ring reset messages")

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
index ea2663169bf3,cbae2fc7b94e..000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@@ -149,9 -150,11 +150,11 @@@ static enum drm_gpu_sched_stat amdgpu_j
  			atomic_inc(&ring->adev->gpu_reset_counter);
  			amdgpu_fence_driver_force_completion(ring);
  			if (amdgpu_ring_sched_ready(ring))
 -				drm_sched_start(&ring->sched);
 +				drm_sched_start(&ring->sched, 0);
+ 			dev_err(adev->dev, "Ring %s reset success\n", ring->sched.name);
  			goto exit;
  		}
+ 		dev_err(adev->dev, "Ring %s reset failure\n", ring->sched.name);
  	}
 =20
  	if (amdgpu_device_should_recover_gpu(ring->adev)) {

--Sig_/xzOYzmjgbeNdirBYSiBDDcK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcpdMYACgkQAVBC80lX
0Gym1Af/fOAJCphNBfESpwoprBZW3i+sAFLXwoyDMHJihVIOcu34HxOhtQdcGb/t
9RVd9C3OQrVPsvlaR00Pqzu7DJkln+rOV5hrjZp/LHco8aXOFgHCTA54yekV+zik
gPkvvJVlAcZL1DQ3Hw6+ijFXIRDUtmw/89cSMpO+LJC67UbJ3qYov425tN49k3+J
naaCSqQFqxsAcdoWEgsNMCzYnreNjH+T0Hsk6KlCUg/MIPkVJm8FRzu8XP2JAM76
sjt1hQsQbKQQGzTXJjfptDOVciktcOemISdfrlZL7OHIeMGWS5UHQoQYDDBb090t
I577QL60ex3URgouFkalMf8O8zS22Q==
=U35C
-----END PGP SIGNATURE-----

--Sig_/xzOYzmjgbeNdirBYSiBDDcK--

