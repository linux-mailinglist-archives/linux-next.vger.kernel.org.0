Return-Path: <linux-next+bounces-3738-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBF2974917
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 06:28:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 062181F26888
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 04:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B07A43BBEB;
	Wed, 11 Sep 2024 04:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="J71Uv7dV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC32C433CF;
	Wed, 11 Sep 2024 04:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726028908; cv=none; b=GNNylzy8ya9KxhgKghFqHCkHJ093Q6rOxDFj68wjzn+7RFgbOhkNLOfJLu+wRyJR7BJy1j/gCygApo8AbpyNrTIjLuMIunZI377LCxcFjfvW+mZk/EVi51ik33JKHk7Yu3oIIaBgVhFRUpj9s2hjRcfMNi0NwOX/+yDD2Xo4wgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726028908; c=relaxed/simple;
	bh=04qlL0GaN1TE5BHJzvgBp2gDMuwaPuQuWHuRHqYP5nY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZGT9sUhMPcJ6ga+d6HzQYzOAxVbXcP3on24jT5vE3pmvO/NmEeYnqf+akmv8S+AL7bFRcTLOZCpRgzMH1SAAtO4n5FHWRsOSyqn2zysGZAVcgxrEWmR9BfvjTJjFcDDSAtehkO87ILrYunIDx9ndwiT9qjLhowAPncxuoYl/jUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=J71Uv7dV; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726028902;
	bh=gFlINUXFS75xhjEVRSsQ3Z/OyMhGyHXONkz2E4XA1sE=;
	h=Date:From:To:Cc:Subject:From;
	b=J71Uv7dV+o5ilU1wAXfwzv2WDdEd+fXP5PUnzVjIVie7OMnVnJ7GxOjBZrvH001+L
	 H6OEJQb5CH8DVC94QiL6YwgUyc+tExMFSJWUqk3rn+xcgiGh/HSGLwjHziEPI52uc5
	 5+Wa3oYdtaaWuuGwTb/Q9LsMvXpGCSmYEiM/14uPVIPsucRcLX6JMAUNSxXLIXiZkc
	 w7UEviJ5slqMF6EW+KU2URvRNGzLWLvYuODG3L4IYOVV3TFletGJG5mT8usUXhDlyr
	 uXEFxTm63uuTgVbOEcMI/Vit4Hv/uoRi4Zv4LoC19LU2d/lO2yHwii24YMdJ0LyTzr
	 OcLUDReAx/dMg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X3SHV4y9fz4x8c;
	Wed, 11 Sep 2024 14:28:22 +1000 (AEST)
Date: Wed, 11 Sep 2024 14:28:22 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Paul Moore <paul@paul-moore.com>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Michal Hocko <mhocko@suse.com>
Subject: linux-next: manual merge of the security tree with the mm tree
Message-ID: <20240911142822.7c65e02e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lBBakm+S=.nBlErGrIJW7Lf";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/lBBakm+S=.nBlErGrIJW7Lf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the security tree got conflicts in:

  include/linux/lsm_hooks.h
  security/security.c

between commit:

  3346ada04cf5 ("bcachefs: do not use PF_MEMALLOC_NORECLAIM")

from the mm-unstable branch of the mm tree and commit:

  711f5c5ce6c2 ("lsm: cleanup lsm_hooks.h")

from the security tree.

I fixed it up (I used the latter version ofinclude/linux/lsm_hooks.h
and see below) and can carry the fix as necessary. This is now fixed as
far as linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc security/security.c
index 3581262da5ee,4564a0a1e4ef..000000000000
--- a/security/security.c
+++ b/security/security.c
@@@ -660,7 -745,7 +745,7 @@@ static int lsm_file_alloc(struct file *
   *
   * Returns 0, or -ENOMEM if memory can't be allocated.
   */
- int lsm_inode_alloc(struct inode *inode, gfp_t gfp)
 -static int lsm_inode_alloc(struct inode *inode)
++static int lsm_inode_alloc(struct inode *inode, gfp_t gfp)
  {
  	if (!lsm_inode_cache) {
  		inode->i_security =3D NULL;

--Sig_/lBBakm+S=.nBlErGrIJW7Lf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbhHGYACgkQAVBC80lX
0GycoQf/Zq7eAaEVorpcLyB34DuZTwJhQmykuNZ3spO7AYeqxqTUCwaA4w4tZSnJ
f9VxhotsdrbPgXRmjYv5um/pbc8kUFifUxSonxvnrIoSdHqJIdBURtIWrhtJTVDX
wNk/Gp4vLL00iOgdWQwElWm6Ie4YUuU628H/z3u3uxYkeE5yaZ7FjgA4pi/QJNFk
xsabBY61YOGU2tu5zLDuYOD6ViOHGOcesELVzwVAVPSgtWRq5lft28CFZS7FEeTD
kSPCJ7jGETSG9/gMZATL23M5AuVbgPhLMkKe4ugH4IqlghdlZnckv8nDhod3hxWl
WMII4HNihFeN2kNvz33fPFK1AzKeDw==
=VBDu
-----END PGP SIGNATURE-----

--Sig_/lBBakm+S=.nBlErGrIJW7Lf--

