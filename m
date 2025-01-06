Return-Path: <linux-next+bounces-5035-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB9CA01D2A
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 03:04:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8515162C48
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 02:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 405B8111AD;
	Mon,  6 Jan 2025 02:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Z4YD75Rm"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC777469D;
	Mon,  6 Jan 2025 02:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736129038; cv=none; b=aGZM++m5Im31PP/B5v5bU0i/xCwCqm++xem1fjtV0Im+lpSOUGtj1KJFzdKMyRKVlBCUAiEByUXMtMGdiKgFs3JpryMtkU/0K+3BuXFaSquPhvTZTd83RmoJPztaTXObdvVwr622Ej6tGGcrpxOXS7nI4f9vIMWLh9b0s3r7SIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736129038; c=relaxed/simple;
	bh=hYGqyKKkCQU0qyHhekOl8k5xhxLnHh+QsvI6QTc8DUU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tgRIuaB2sg8fPUlTdh08/zNf/Xb+9k5U7YeFJDQ4Kv56I8dxElFr/Eri1KKDKoY8mczrOOXAxl4EzCQHmbe+zYxeN7xLHhZuYzNKLUc0u2MGZQo+Wgyu9Qz5WzpzO4J4BNOlW96Bn742xFHc2MDk2kbCzH1wG3fBbRumJB0PYls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Z4YD75Rm; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736129024;
	bh=o7q4YMCbm6QDOOrZ12zWJdvJpl2MSPRbhzNZADhYwP0=;
	h=Date:From:To:Cc:Subject:From;
	b=Z4YD75RmhflWtIkI4EhVSPo3670B8nIFoomrQtpA/KUcBN2UM5y3ePwvJoNLk5Xd/
	 VJFLo6W4gYw0FincqDG1bphIMfh9J9w/cr4ud9D7A3iIqgDtxgSSB/IiZmr96ImlDH
	 yirb3YapY+1ty9xsZ0AiOd3GARpOecs1pRqyGu22txBdaqD59z5uAYVrjUzb6bG2yK
	 ybple8Ob7/1QfYZlgcRI1UVcdZtT3eMN72iO/U0qKXgnyGYAZsjOl0fazBTR2XYqFE
	 gNs81HXHeKta/f2LZDXFHyowz1XpYES4lAMVMjA1SC938Fs0rwmaR7uoAQzZ+8KcrQ
	 em5MEFjOjN17g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YRHXZ5ck1z4wxx;
	Mon,  6 Jan 2025 13:03:42 +1100 (AEDT)
Date: Mon, 6 Jan 2025 13:03:48 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Jani Nikula <jani.nikula@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Yafang Shao
 <laoar.shao@gmail.com>
Subject: linux-next: manual merge of the drm-intel tree with the mm tree
Message-ID: <20250106130348.73a5fae6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jBLpBhe/Y1HjnQTCrWM99kN";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/jBLpBhe/Y1HjnQTCrWM99kN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/display/intel_display_driver.c

between commit:

  4fc0cee83590 ("drivers: remove get_task_comm() and print task comm direct=
ly")

from the mm-nonmm-unstable branch of the mm tree and commit:

  f5d38d4fa884 ("drm/i915/display: convert intel_display_driver.[ch] to str=
uct intel_display")

from the drm-intel tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/i915/display/intel_display_driver.c
index 62596424a9aa,497b4a1f045f..000000000000
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@@ -389,8 -397,9 +397,8 @@@ void intel_display_driver_resume_access
   * Returns %true if the current thread has display HW access, %false
   * otherwise.
   */
- bool intel_display_driver_check_access(struct drm_i915_private *i915)
+ bool intel_display_driver_check_access(struct intel_display *display)
  {
 -	char comm[TASK_COMM_LEN];
  	char current_task[TASK_COMM_LEN + 16];
  	char allowed_task[TASK_COMM_LEN + 16] =3D "none";
 =20
@@@ -399,14 -408,15 +407,14 @@@
  		return true;
 =20
  	snprintf(current_task, sizeof(current_task), "%s[%d]",
 -		 get_task_comm(comm, current),
 -		 task_pid_vnr(current));
 +		 current->comm, task_pid_vnr(current));
 =20
- 	if (i915->display.access.allowed_task)
+ 	if (display->access.allowed_task)
  		snprintf(allowed_task, sizeof(allowed_task), "%s[%d]",
- 			 i915->display.access.allowed_task->comm,
- 			 task_pid_vnr(i915->display.access.allowed_task));
 -			 get_task_comm(comm, display->access.allowed_task),
++			 display->access.allowed_task->comm,
+ 			 task_pid_vnr(display->access.allowed_task));
 =20
- 	drm_dbg_kms(&i915->drm,
+ 	drm_dbg_kms(display->drm,
  		    "Reject display access from task %s (allowed to %s)\n",
  		    current_task, allowed_task);
 =20

--Sig_/jBLpBhe/Y1HjnQTCrWM99kN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd7OgQACgkQAVBC80lX
0GyVngf+OrzkOD7TLv4JmROI3BaLqfZVO0h5D/abja84Bp37NG54xPo8OwExh5v7
+IiwBCbrAxUFiXHuBgvM3gZA+gyJOjp68/YlZdngVThsGN0N3AsOuUnunEsnrUG7
FB2R89nPV5GYEoLab5mI5VxTtaymBt+U77hL+TngjpHeovHmQh4bLSl9DC6F2NwZ
MiB+3Grz/MHJchwodizgtG0fYiNaj0/7Q3bGBPsHsW8d3Me5MtoQ+HSeJ6A+/9VO
A+69paKg9+QKwQ1wrsSr+TcNLUxwi7j4dYhkxJnYf1sr/aTx2CHCqN9nQhICvew9
TxuL/6vO/PsAt7Pq8EVNdMwGie37PQ==
=Q0n0
-----END PGP SIGNATURE-----

--Sig_/jBLpBhe/Y1HjnQTCrWM99kN--

