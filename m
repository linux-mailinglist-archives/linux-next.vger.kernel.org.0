Return-Path: <linux-next+bounces-3886-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EACA097AA7E
	for <lists+linux-next@lfdr.de>; Tue, 17 Sep 2024 05:43:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5ACF3B229F7
	for <lists+linux-next@lfdr.de>; Tue, 17 Sep 2024 03:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C0AE27473;
	Tue, 17 Sep 2024 03:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="MbuN1yhD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECE1A31;
	Tue, 17 Sep 2024 03:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726544579; cv=none; b=ePyiNu5Q9suK4OAaRwjjLb/cPWBJX+7lejom9tFmHFWfujfT7RMLMsIZGv3SIUh1K/LeG91PDhLMjxND0K15x9iGrj3S2iVCIO95JAieZAKtuVU+5mZ8bAplleEAljcDDdksRAcB3Nj2PuNk4KeBK3voqUPy4SfYBaxpBcVf+pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726544579; c=relaxed/simple;
	bh=cA98yOHGELB5VQ+EVtrhAL99ZyBCOSDspGKiVy3KGBg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=LxPn4GRpG5nEhJQvlg1gpNOdsj36debdTf2srUZmWNMk4cuvZjnRIIK/HZTJ3KIj22j63RmtUdW1zJpdHS6LDaTseX7MO3gClUmfYinzcHnQoPjzvp+/Kg/l3iiOv466P+pTWdd8wKuQZUuG88PpfOEn29GYGycRdcZmTWGxYd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=MbuN1yhD; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726544574;
	bh=DD0ckZqbs/+1e0QoUVyU/4dMdI7zWJgceEE/XEGqFww=;
	h=Date:From:To:Cc:Subject:From;
	b=MbuN1yhDN1WFBT0E6sGWgpW8+lnESyHC7nZ6QdH4puu+xuVWmOUW6939nMVcbwAu/
	 cBGwxwTrIIiJq49b/ycKPLGkmZmZzDcNE77nA93LF6BXyL19nN/8C2s4TdpZzOEltG
	 3q8m8VbxgvPCVsBZKrb6oHwHbBKmZVyyEPCwhTluTq7/1pcMkpF4S83hzCeJW9hwx1
	 5o8zsNhSCqhF/j0IPVZfitgEDQqMRHfaljMtRTnjnyw1RvrHG6BQbWV9ChCUCEs2zb
	 kk7/tAfZAHyrvD1MRocNdWLx/kG2cY+3ku5akcQOfpbH/3EZVqgm017USi/C9HZjJC
	 8upci/LzKK37A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X770F3rw9z4xWk;
	Tue, 17 Sep 2024 13:42:53 +1000 (AEST)
Date: Tue, 17 Sep 2024 13:42:52 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the workqueues tree
Message-ID: <20240917134252.1534039a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//jYBaLn2qFZha3HI.VBk0_S";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_//jYBaLn2qFZha3HI.VBk0_S
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the mm-nonmm-unstable tree as a different
commit (but the same patch):

  b4722b8593b8 ("kernel/workqueue.c: fix DEFINE_PER_CPU_SHARED_ALIGNED expa=
nsion")

This is commit

  e48dc610d2fc ("kernel/workqueue.c: fix DEFINE_PER_CPU_SHARED_ALIGNED expa=
nsion")

--=20
Cheers,
Stephen Rothwell

--Sig_//jYBaLn2qFZha3HI.VBk0_S
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbo+r0ACgkQAVBC80lX
0GyyNwf/cY1ietkPGTPdGJXJMoPOKyTJrEFSsTe1K1DLObFVKFddQ/Nq07PGkIZ1
LiXRXkrL1Hq/ROD8tDwjZfjCCRMKV26cc54tn1L8gsoMCxxPm/Ne14CiRWyKu6fI
0v9N7BWYqsPq1X1p3wagkpdys25mCVR+VcUse9xxfG+IdE5HZkKRH9+wBz7vDQmF
X05BJZY59hjeYgb4etPAWVeJweuaXGMODkN0Ny0Li9MYrgQMXgDStQdnOsHcr2ab
9ogqVpOQMDAgIfGGH8ojIDYb8fMO0On9ifmjFR4neeSJkHAi8Wr5Z85KvKwoHuVB
8HvzHnj4veO72rmQ8GKMjRIIyyspLA==
=W35f
-----END PGP SIGNATURE-----

--Sig_//jYBaLn2qFZha3HI.VBk0_S--

