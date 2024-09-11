Return-Path: <linux-next+bounces-3735-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 32020974794
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 02:50:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8F11287A0D
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 00:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2087614290;
	Wed, 11 Sep 2024 00:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="fJNzEVoK"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1EEAD5A;
	Wed, 11 Sep 2024 00:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726015834; cv=none; b=leFAh0EDkV4/WY9si5M562ndeIj+2KQ0t7rmlqsZOvTVM+S+0X7ON+z2XDgPvWLaCL8YkL6JslAUjuOY2ggq4CKc0E9FWefpy+wcD3xosPwQSM+wo0u1Mgdc/+dKQqhBIO6Ih/k59bbAMgIlNyl65PPlZlBkK+SIF4hpgARc1hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726015834; c=relaxed/simple;
	bh=zpI1uCZLvvFwBaGI26jX8e2UlfoC+tZ0elmffqEzPeo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UrUhhiCrpI/NKYNpcXWcG/ZYKpiDLKphKKVMBnWQcqRkFg5zSLhB6Ak4pns1+ho5M7Jj8iqnaEz/SN3RSaMo7KzDyWmp0BhxVLBmEwevE1rLe6p6x6LqS815Cepr61m1i9ySggXB8sgBNmBJWY4L0Ilw/e+o6aIhQzFNA4q5VMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=fJNzEVoK; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726015826;
	bh=VbzATizzlHOsZq/f954MxQACutPqT5MCN4jXzNEQxK8=;
	h=Date:From:To:Cc:Subject:From;
	b=fJNzEVoK/pWlfWl/v7n6en2bPj8UpfHjb/Hs1Go6P3FVLY+EsfXU++lHaWVf/Fk6e
	 fpc2OGyWGPG1jqcl0cmmHnNCKm9WLIOjz23PS6AjMgIwLwiskZhVLKKmKOrR/JZ4Wg
	 Qw+ylAPpPnm76JNGXcF04tJRP1yCx7V7LlivetVr6S8J59AdzATSWUP1USNCBD5uXN
	 QbyNnPmTx18YQ7kMyIshA/nOQ3vQZjKi8TzSC2AenZYl7U9DB/9VgssO6KuzKX0xqI
	 sA6FBhRHM3u88716lPKca7A3sP9wf1KP8nGXHBKaNX2R0cp3S9iIoLRvqs4B0Y2HkI
	 LxnqYArJJTQTw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X3MS157BQz4wd6;
	Wed, 11 Sep 2024 10:50:25 +1000 (AEST)
Date: Wed, 11 Sep 2024 10:50:24 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Michal Hocko <mhocko@suse.com>,
 Youling Tang <tangyouling@kylinos.cn>
Subject: linux-next: manual merge of the bcachefs tree with the mm tree
Message-ID: <20240911105024.4f7cb63b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/v9OJSwVtMEVaLI4yTIxlxb1";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/v9OJSwVtMEVaLI4yTIxlxb1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the fs-next tree got a conflict in:

  fs/bcachefs/fs.c

between commit:

  3346ada04cf5 ("bcachefs: do not use PF_MEMALLOC_NORECLAIM")

from the mm-unstable branch of the mm tree and commit:

  082330c36194 ("bcachefs: allocate inode by using alloc_inode_sb()")

from the bcachefs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/bcachefs/fs.c
index a7c5570c4084,fd6ac91c9b75..000000000000
--- a/fs/bcachefs/fs.c
+++ b/fs/bcachefs/fs.c
@@@ -239,9 -283,10 +283,10 @@@ static struct inode *bch2_alloc_inode(s
  	BUG();
  }
 =20
 -static struct bch_inode_info *__bch2_new_inode(struct bch_fs *c)
 +static struct bch_inode_info *__bch2_new_inode(struct bch_fs *c, gfp_t gf=
p)
  {
- 	struct bch_inode_info *inode =3D kmem_cache_alloc(bch2_inode_cache, gfp);
+ 	struct bch_inode_info *inode =3D alloc_inode_sb(c->vfs_sb,
 -						bch2_inode_cache, GFP_NOFS);
++						bch2_inode_cache, gfp);
  	if (!inode)
  		return NULL;
 =20

--Sig_/v9OJSwVtMEVaLI4yTIxlxb1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbg6VAACgkQAVBC80lX
0GykhQf+OUgpj7Pjk9Fcouni/Afuw+EmEjCwxdCWXj+j7bJKHnIKjVmzHqhkU3hM
lyW6wP3wbTPRLnYgY1IjkWuJLQdtcQamX8dcvpf7ZHRUFGccGHWODWYxpL1NtmC6
qCQPfLzR0RbjsT17oTyZ/vM3EkJYa8u7Zpw4E9pOjQPVF57oinnb3SzOhVpXkspP
u+8GDwjF2uCDDff+QtDqmqIHT88C2Z3Dm5WUnjAu7sRcCkMy/Mj1H2gyZ+cx+rN0
jD2jwlIEd18uOP+9Bwb9ZSu5RJNiDIkTNfwTROAc8mbYmAYtP8PhMQFPlXNLwzwS
a0OmVkzOmKBqSytnK5cGq2ln0cwUaA==
=TsYy
-----END PGP SIGNATURE-----

--Sig_/v9OJSwVtMEVaLI4yTIxlxb1--

