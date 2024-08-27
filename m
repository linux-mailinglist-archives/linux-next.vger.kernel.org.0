Return-Path: <linux-next+bounces-3434-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B0A95FE2E
	for <lists+linux-next@lfdr.de>; Tue, 27 Aug 2024 03:17:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11C11280FC4
	for <lists+linux-next@lfdr.de>; Tue, 27 Aug 2024 01:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 045E52F26;
	Tue, 27 Aug 2024 01:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ap/3qJJL"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2478638C;
	Tue, 27 Aug 2024 01:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724721415; cv=none; b=lTmqpqcNdNrWVGoPpuCVCmKiW4uNjokPmmlbX4UXCrHYfPLngTNoZ/sHQN/YZN3oBszJlJzWQ6cqU+X7J/7kAetsXf2VwofHn56gwziXzOYCPiTRiiTwQXaEzjjbroNTiPJFPqykeBOury7zqGBapGKucNaD7pkrFyJGFG9IGzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724721415; c=relaxed/simple;
	bh=pqTNpmDyX1APR7fc1sin0bYpplnYvU3ITrDabqfnwKI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FDVWMp54AKmNz9DQZWTabfrJWQ6ViUDVPAT+VDYBU5z6xrQJK8ukNuRLgovZ2IOSy3Y9H1Bo13R+/OfYVIFm7xDpkRS6d874+OIvUn9QR+PFmW+mBkKT/NhAcrUFxHx3Hlm3T+6kYVtdkvyvtrx0aDcLAImiUQrRKDizJLEFcaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ap/3qJJL; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724721408;
	bh=tqmAPvnAzaEIKis2MDMTjtpVaSeJDxe21zSxrryH++M=;
	h=Date:From:To:Cc:Subject:From;
	b=ap/3qJJL65r61EYmAFVTBzx2QotEK4CWaPXMyXk4zK8BD4cCdRnMjsRV0029XA7rF
	 103S3zCpM3M5xZ+KapcDVU8zUmb2t4WEX4MRoZD5PCgKI+GIxe3fifhoR9MeM+dNA2
	 WyhacyawgODawp2Z7GHzoqkMd775gZdbT0u9Qs4/u57CVoW4v0+xnTRtbAgatBpCVd
	 WrcqxebD7FSdLPO1juGmKYjbWMq/kwNa15IK5Dz9gLYiilWiaUXmMiVvvjGyOjgq+v
	 487cVnI7XnsadyttLljkZAEe/54QGPTru9UvNdZmvH8n1oxXzlgEXqOGlZk/45pDEf
	 j2QlZ27m0eubQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wt8lM4lWTz4wnx;
	Tue, 27 Aug 2024 11:16:47 +1000 (AEST)
Date: Tue, 27 Aug 2024 11:16:47 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, Kees Cook <kees@kernel.org>
Cc: Jocelyn Falempe <jfalempe@redhat.com>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Wen Yang <wen.yang@linux.dev>
Subject: linux-next: manual merge of the drm tree with the pstore tree
Message-ID: <20240827111647.5b127414@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/r6dainDK6DRhX9HCi8ZrBj4";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/r6dainDK6DRhX9HCi8ZrBj4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  fs/pstore/platform.c

between commit:

  1bf8012fc699 ("pstore: replace spinlock_t by raw_spinlock_t")

from the pstore tree and commit:

  e1a261ba599e ("printk: Add a short description string to kmsg_dump()")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/pstore/platform.c
index 84719e2bcbc4,9c6b7c97fa3c..000000000000
--- a/fs/pstore/platform.c
+++ b/fs/pstore/platform.c
@@@ -285,10 -285,10 +285,10 @@@ static void pstore_dump(struct kmsg_dum
  	int		saved_ret =3D 0;
  	int		ret;
 =20
- 	why =3D kmsg_dump_reason_str(reason);
+ 	why =3D kmsg_dump_reason_str(detail->reason);
 =20
- 	if (pstore_cannot_block_path(reason)) {
+ 	if (pstore_cannot_block_path(detail->reason)) {
 -		if (!spin_trylock_irqsave(&psinfo->buf_lock, flags)) {
 +		if (!raw_spin_trylock_irqsave(&psinfo->buf_lock, flags)) {
  			pr_err("dump skipped in %s path because of concurrent dump\n",
  					in_nmi() ? "NMI" : why);
  			return;

--Sig_/r6dainDK6DRhX9HCi8ZrBj4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbNKP8ACgkQAVBC80lX
0GwZ3gf+OoINSkkFHpfMpWfO+5+GRHZj43lhdgDEX5xxdGFhZpdbSkJ5/0Fks0Pr
5ptK7gwLF6DovaG2WTeHTXRDuR2fqAXy6+XzMaV/MkbmyB5DhlXa2KlsJyirI/ZD
Ew7DX4lOwECspkopOtjQl28um64yg80ROkyEOPdeAYydBsq6bIqVlZ6xvNcr96Ue
aIyr1CNj+1LFYikcIO1s38a0uFb1xYSNPHPrp4Hz2js1snPSjYfqYaX8gTqHzVO0
o2BarHV0aPQ2weT8+sV48DyHw+hk4BCUNhJ3JeZeyTf17AQ78tejNJRACGBMNj4M
uapLCBXHvq32qj0QFpUcSDwdeI9pFg==
=xnHv
-----END PGP SIGNATURE-----

--Sig_/r6dainDK6DRhX9HCi8ZrBj4--

