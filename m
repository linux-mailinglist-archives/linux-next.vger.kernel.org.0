Return-Path: <linux-next+bounces-2811-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DAE924C62
	for <lists+linux-next@lfdr.de>; Wed,  3 Jul 2024 01:49:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 26AB9B21256
	for <lists+linux-next@lfdr.de>; Tue,  2 Jul 2024 23:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E60B517DA2A;
	Tue,  2 Jul 2024 23:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="rvv9Bb6N"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FAE14F135;
	Tue,  2 Jul 2024 23:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719964144; cv=none; b=rlwI3r1To9OzEJC+Ssg5H7WVcYUPVFRroUxRruEe2qL1q/SiyRFRvLWVIgMsF+T+Qb9iOfPbJXFOusmRgunYTEROTfAu4B5LlByX9412wppbJL5gjygFfOkrobc4k5d4Os+ueAJ3T5AOhNIaf/aWx5hwRFWxzYZ9Ack2L5F/2y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719964144; c=relaxed/simple;
	bh=nLbuO9tnEyS6AG6MzYGbOiO8kGjSfk7LqXnnjjCNzig=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pBfvJKGMZjuHskURLP1RxOpTFA4DZhHwBmFsjSj3Wly/RoBLqkxO5dOAVpVwv2OTl3+PGQ0LMOzhejoWBennjMjRJ1lsLjGLzcJi+MK3dINMuWbKrZdfNr5+Ytmm+Jr4sbwZE/gfX/rDq0PX4Oc3r8bbQPWcaSs5OBpFsfW4JMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=rvv9Bb6N; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1719964139;
	bh=BlKZZNRlG1lecOtIMyzas1Jhys8I6pZW+xDbV4ff3ls=;
	h=Date:From:To:Cc:Subject:From;
	b=rvv9Bb6NOLbTUAW9xNx7qWEJiFt5iVcg+6gk1Cgq8jpGE/OaD/wExANVbrFdU2McA
	 1NYC+S3RHGvSfEvK98JQ5cQDKEnYeSRibqzRqB++52Aw2FFT5DD5QMg6CRVB+tqI7I
	 acgvhOIx4GGQk2UlwBVxBFCjBLeouXUBXoP3fH7mTYxuAm+TUH5jUPLxubT8vMWeSM
	 om4cG6ewQZstz/AeFuIW1ehZxqMx0mKjcR7lgYWO4G/6W9DJLsj0Tb26JjximXu1TU
	 nmSvSInsvMJnJ8DO3JbGeccB/9SOQM52Rg4KMXj8h+n3I4H3f4dTJMQIEJgxq0ZjRc
	 9sLPIZrP7oPHA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WDKPQ17y1z4wc1;
	Wed,  3 Jul 2024 09:48:58 +1000 (AEST)
Date: Wed, 3 Jul 2024 09:48:57 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the powerpc tree with the mm tree
Message-ID: <20240703094857.3f489d4f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Yb+1W8wPbSKE3q_hXMTkwWK";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Yb+1W8wPbSKE3q_hXMTkwWK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the powerpc tree got a conflict in:

  arch/powerpc/mm/nohash/Makefile

between commit:

  9e49846e4d65 ("powerpc/64e: split out nohash Book3E 64-bit code")

from the mm-unstable branch of the mm tree and commit:

  732b32daef80 ("powerpc: Remove core support for 40x")

from the powerpc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/powerpc/mm/nohash/Makefile
index 90e846f0c46c,86d0fe434824..000000000000
--- a/arch/powerpc/mm/nohash/Makefile
+++ b/arch/powerpc/mm/nohash/Makefile
@@@ -1,8 -1,7 +1,7 @@@
  # SPDX-License-Identifier: GPL-2.0
 =20
  obj-y				+=3D mmu_context.o tlb.o tlb_low.o kup.o
 -obj-$(CONFIG_PPC_BOOK3E_64)  	+=3D tlb_low_64e.o book3e_pgtable.o
 +obj-$(CONFIG_PPC_BOOK3E_64)  	+=3D tlb_64e.o tlb_low_64e.o book3e_pgtable=
.o
- obj-$(CONFIG_40x)		+=3D 40x.o
  obj-$(CONFIG_44x)		+=3D 44x.o
  obj-$(CONFIG_PPC_8xx)		+=3D 8xx.o
  obj-$(CONFIG_PPC_E500)		+=3D e500.o

--Sig_/Yb+1W8wPbSKE3q_hXMTkwWK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaEkekACgkQAVBC80lX
0Gzo1AgAkHx90xFZGC5boB/VkLI3RDmEjh54mHf0fdAF7BT96duaaPmrd/k2Yg+I
w4U5LiA9CIonPaYfGawwBgBjw+hM4vJ9qK4+iYpOiKutjowsPYODr1wYpOl/P7Xr
Suw4Ul6s8qY8/UsKLNpm0AYS0BLJRUidMRIATg07G0f73DUwMpmKIhxfK4OJwod0
8SfWzDQeb23yESIAH2OQ0BXC5vKU6UMNPcS3YNOCw6Ni9zhScsbao6vl+FNjl2X9
6pNVaSwKmxuzM/4WB2W1/l4D6J/JH/+9417huAyOi1Hk3Gxw/QA6qjMI0/TDKJgz
IjbNVDw5gyx2ADO4PCf3tYheaXHYYw==
=a+Ix
-----END PGP SIGNATURE-----

--Sig_/Yb+1W8wPbSKE3q_hXMTkwWK--

