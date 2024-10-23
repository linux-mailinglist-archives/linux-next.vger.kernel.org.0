Return-Path: <linux-next+bounces-4390-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EC84A9AD673
	for <lists+linux-next@lfdr.de>; Wed, 23 Oct 2024 23:15:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 276E71C21061
	for <lists+linux-next@lfdr.de>; Wed, 23 Oct 2024 21:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44D9D1E7C16;
	Wed, 23 Oct 2024 21:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="QsGDmfJw"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B9A19ABC5;
	Wed, 23 Oct 2024 21:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729718123; cv=none; b=HZwyT+XP2f3AXB6qG/TdravBzbBt0bjf7jY6EU3Z4HnKc0RtfwmQBeOTQj77+B6kNgGrx217ptvQviw1MUXeDhJctNsXxbLoctce/ehxsKXIKN/rJVsiIAi3S4J9rNC8PfMAk8YCEpBtWIZKsnZ7nJ0QRRkU3XqrODZZ23NVFYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729718123; c=relaxed/simple;
	bh=33WpnnxPKu5z7Y+mjMbMAMkMnHaAtkfAJr7cZjLqemc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=J1s45N5JP/r6yNdqSj6VsVsM0GJARthQgmTv2CyMAG0AcX+vbhtaKbAVmbCuTH/TPxn76kkn8ZKY/jpmFWVPJuT7eHWO19AIO1rEuhBScxhXBh41MY3oAY0sd9y7bonR4OkZqJJ/bYwLp8bEyHZC7TlzcAYH2Y6Q3J5Y1mjyOww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=QsGDmfJw; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729718115;
	bh=8YvOGxM8kb2NuNgHj4RT6hKWedkAYC8f0lfKs2Kg908=;
	h=Date:From:To:Cc:Subject:From;
	b=QsGDmfJwrRqW/x30OE/ZbzCV0LTLsrA1QFVH2B+t5PLJ5cF1P/VAuUpsmDmgKX/5z
	 vSGmPTIpV0Oq5cAczsLXvHILHCj7T0nnA12rUJoSpmWgh7MZsGtC8DfkT+Ne7VldQM
	 +4wzZLmlqV5TSHEFsPoeGBNoQGaCEk9j87tAjcuh/08awl2IlhDAOftjfvRqW09h85
	 EDiY2ZN4nLcQgkFj8SqvEiKejfZD5RVoFXVZoVLsnPUhF/Ua/SMFPkyYqnuAYNYaU0
	 4k17jpMTOKx5+hMwDtHeP7VhPO4CYkN4Rz5hHLNbJhLi5Fbx5DQBLDi+RebQBLAFz9
	 ShajEAHB0luzA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XYhdt6lMGz4w2N;
	Thu, 24 Oct 2024 08:15:14 +1100 (AEDT)
Date: Thu, 24 Oct 2024 08:15:15 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>, Chuck Lever
 <chuck.lever@oracle.com>
Cc: Benjamin Coddington <bcodding@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Mike Snitzer <snitzer@kernel.org>
Subject: linux-next: manual merge of the vfs-brauner tree with the nfsd tree
Message-ID: <20241024081515.1cd254a0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kObEkQ6bstOY/+vMklGt2Df";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/kObEkQ6bstOY/+vMklGt2Df
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got a conflict in:

  include/linux/exportfs.h

between commit:

  6e99e4b4291e ("nfsd: disallow file locking and delegations for NFSv4 reex=
port")

from the nfsd tree and commit:

  b875bd5b381e ("exportfs: Remove EXPORT_OP_ASYNC_LOCK")

from the vfs-brauner tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/exportfs.h
index 106fd590d323,4cc8801e50e3..000000000000
--- a/include/linux/exportfs.h
+++ b/include/linux/exportfs.h
@@@ -251,32 -263,6 +264,19 @@@ struct export_operations=20
  	unsigned long	flags;
  };
 =20
- /**
-  * exportfs_lock_op_is_async() - export op supports async lock operation
-  * @export_ops:	the nfs export operations to check
-  *
-  * Returns true if the nfs export_operations structure has
-  * EXPORT_OP_ASYNC_LOCK in their flags set
-  */
- static inline bool
- exportfs_lock_op_is_async(const struct export_operations *export_ops)
- {
- 	return export_ops->flags & EXPORT_OP_ASYNC_LOCK;
- }
-=20
 +/**
 + * exportfs_lock_op_is_unsupported() - export does not support file locki=
ng
 + * @export_ops:	the nfs export operations to check
 + *
 + * Returns true if the nfs export_operations structure has
 + * EXPORT_OP_NOLOCKSUPPORT in their flags set
 + */
 +static inline bool
 +exportfs_lock_op_is_unsupported(const struct export_operations *export_op=
s)
 +{
 +	return export_ops->flags & EXPORT_OP_NOLOCKSUPPORT;
 +}
 +
  extern int exportfs_encode_inode_fh(struct inode *inode, struct fid *fid,
  				    int *max_len, struct inode *parent,
  				    int flags);

--Sig_/kObEkQ6bstOY/+vMklGt2Df
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcZZ2MACgkQAVBC80lX
0GzCbwf+PxuaWzPlK6ThYIMlLZq4cwrjTgqHBYEB9/YeSQZoRmVWoml3nDlkOZy8
JdjcrKqvQF6FhzLyBKcfThwuj9Qza2N/aJsQJzGnfsO+41mj7rhf60SbkG4g07h1
k81xt6ZCGOJQ6oTEQAPwynMvUBHojWf6akcRFuY7sm9ExjG7pPGe+oLbYhECpT5z
x5StChtbcifclzEGxQxWltFKfs2YJ4EZUGA1J13HryqHUuSiOdAcgGvlbFUfh6Iy
gdCeByxl0DKcvbtbBZb40hJJtTvtwymUB3u0/LlxYf08ofTrc7062P5/OtxKY385
a9A1M8n6s7Qu9OEGrbdObg6bmiHLLQ==
=jT2L
-----END PGP SIGNATURE-----

--Sig_/kObEkQ6bstOY/+vMklGt2Df--

