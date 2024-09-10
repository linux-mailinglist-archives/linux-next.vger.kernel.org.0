Return-Path: <linux-next+bounces-3720-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE8B9727A6
	for <lists+linux-next@lfdr.de>; Tue, 10 Sep 2024 05:27:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 389101F24AE7
	for <lists+linux-next@lfdr.de>; Tue, 10 Sep 2024 03:27:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87EE515382E;
	Tue, 10 Sep 2024 03:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="GETChhei"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F9F1CD2A;
	Tue, 10 Sep 2024 03:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725938867; cv=none; b=SwC3wJHvXSBYnNrMylxaObZeOzeIaWKWIeN7KfWKxU252u6T86auFf2Plq+cN1u17TR+htdi2HOdtgZCfxOFMYnzwn4ClRct0YMbO7kpCW91xq5dgD2MWgNIs0HMeT772qpWXhv0/XPkR0GAgeYI4mgQYkrkPcf2uynn5G1Vs7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725938867; c=relaxed/simple;
	bh=77BQ0K6c9QEHcwWrpMD++9VEQhdYVfn0dLDEbHXJ0j8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mxBsLV8bjSmFYRh1z6Cs8ZzfcW98ypKo/5WNr0KS3H9dFtFU93RPjIONL0MMmntCGyNpggqSe6SQLTC3QZ+bwnyjFNMkQdwaHr68TZYw2c0mJqOuB8759vMeet95CLIQyEdT0L3ujmNUSvQXvns6qmhRssGosRtYXA5aJwQwFb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=GETChhei; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725938862;
	bh=ftPGTq0URl/NRjxwWH3HGAn3hQeblb1FqX68Js9V1+I=;
	h=Date:From:To:Cc:Subject:From;
	b=GETChheiOwXg1XbZbtMM3ojiImLdFF5A8mBEHVBv6UCwfNMEnzpAEFkpaRx0B9TaP
	 EuczgDnTBQA7UJJ+UAyIyQmmUjkEnhVxg18hLzubUqu/AYvcCqa4IuDZaSj9GZtFlA
	 buy+srjbIXamd3BnxCMKYWW5uFuvLUtqghEUOFXA1CJa7VNVLkoHYbSeWlCxTW3JBw
	 BxD2nmNWHvvC8rWLKRvBbifmFOIMa3L7erL4m5EqwPhW3H8QUij+yLPX7uxpaKTLVA
	 SrNVaDMKUBukfernBpRQ/l+CsUDQSiBZ3aHMqpPgtvJ1mKuYsg/M2fhlrgf/EZgFWA
	 nYcjYRCvEkVag==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X2pzx5ng6z4x8T;
	Tue, 10 Sep 2024 13:27:41 +1000 (AEST)
Date: Tue, 10 Sep 2024 13:27:40 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Paul Moore <paul@paul-moore.com>, Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8?=
 =?UTF-8?B?bg==?= <mic@digikod.net>
Subject: linux-next: manual merge of the security tree with the vfs-brauner
 tree
Message-ID: <20240910132740.775b92e1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PJzWgEfLmy=2kd9swbNFW7p";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/PJzWgEfLmy=2kd9swbNFW7p
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the security tree got a conflict in:

  fs/fcntl.c

between commit:

  1934b212615d ("file: reclaim 24 bytes from f_owner")

from the vfs-brauner tree and commit:

  26f204380a3c ("fs: Fix file_set_fowner LSM hook inconsistencies")

from the security tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/fcntl.c
index f6fde75a3bd5,c28dc6c005f1..000000000000
--- a/fs/fcntl.c
+++ b/fs/fcntl.c
@@@ -89,72 -87,24 +89,66 @@@ static int setfl(int fd, struct file *=20
  	return error;
  }
 =20
 +/*
 + * Allocate an file->f_owner struct if it doesn't exist, handling racing
 + * allocations correctly.
 + */
 +int file_f_owner_allocate(struct file *file)
 +{
 +	struct fown_struct *f_owner;
 +
 +	f_owner =3D file_f_owner(file);
 +	if (f_owner)
 +		return 0;
 +
 +	f_owner =3D kzalloc(sizeof(struct fown_struct), GFP_KERNEL);
 +	if (!f_owner)
 +		return -ENOMEM;
 +
 +	rwlock_init(&f_owner->lock);
 +	f_owner->file =3D file;
 +	/* If someone else raced us, drop our allocation. */
 +	if (unlikely(cmpxchg(&file->f_owner, NULL, f_owner)))
 +		kfree(f_owner);
 +	return 0;
 +}
 +EXPORT_SYMBOL(file_f_owner_allocate);
 +
 +void file_f_owner_release(struct file *file)
 +{
 +	struct fown_struct *f_owner;
 +
 +	f_owner =3D file_f_owner(file);
 +	if (f_owner) {
 +		put_pid(f_owner->pid);
 +		kfree(f_owner);
 +	}
 +}
 +
- static void f_modown(struct file *filp, struct pid *pid, enum pid_type ty=
pe,
-                      int force)
+ void __f_setown(struct file *filp, struct pid *pid, enum pid_type type,
+ 		int force)
  {
 -	write_lock_irq(&filp->f_owner.lock);
 -	if (force || !filp->f_owner.pid) {
 -		put_pid(filp->f_owner.pid);
 -		filp->f_owner.pid =3D get_pid(pid);
 -		filp->f_owner.pid_type =3D type;
 +	struct fown_struct *f_owner;
 +
 +	f_owner =3D file_f_owner(filp);
 +	if (WARN_ON_ONCE(!f_owner))
 +		return;
 +
 +	write_lock_irq(&f_owner->lock);
 +	if (force || !f_owner->pid) {
 +		put_pid(f_owner->pid);
 +		f_owner->pid =3D get_pid(pid);
 +		f_owner->pid_type =3D type;
 =20
  		if (pid) {
  			const struct cred *cred =3D current_cred();
+ 			security_file_set_fowner(filp);
 -			filp->f_owner.uid =3D cred->uid;
 -			filp->f_owner.euid =3D cred->euid;
 +			f_owner->uid =3D cred->uid;
 +			f_owner->euid =3D cred->euid;
  		}
  	}
 -	write_unlock_irq(&filp->f_owner.lock);
 +	write_unlock_irq(&f_owner->lock);
  }
-=20
- void __f_setown(struct file *filp, struct pid *pid, enum pid_type type,
- 		int force)
- {
- 	security_file_set_fowner(filp);
- 	f_modown(filp, pid, type, force);
- }
  EXPORT_SYMBOL(__f_setown);
 =20
  int f_setown(struct file *filp, int who, int force)

--Sig_/PJzWgEfLmy=2kd9swbNFW7p
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbfvKwACgkQAVBC80lX
0GybVAf/T+5HWSFFS7Y8OSraDqm23tJCDGuqQBgBxbjsRHlHDhWKGrddrSK1lHxR
EXRxRpql7j2/ww/SJDfYPK7Z+qIQdXtKEkDHq/w/a1qSeLNWxvl7TxTqG2sVPNzi
44pp7VjKj7B0a6z/6kYeCnDXyqkdIja3e5jtvywiu9NQCHBFyjfGKv0fvOTU382V
n72diZoMTd9zf6D3Mh+SLkmrCiTvVjKjJcp2uO/W3R2nMiS16weNqMb3CAArPLaE
H63kRTKwk2nwdz+hSJIfvGpYUjNJrP/VsDqE1fZ7AULzgY7Z6iXpGos8nE+FQJeK
x7FEEibOxM78Q//h9fL1vZLDTFsUoA==
=ed7/
-----END PGP SIGNATURE-----

--Sig_/PJzWgEfLmy=2kd9swbNFW7p--

