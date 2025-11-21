Return-Path: <linux-next+bounces-9132-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A67C773F1
	for <lists+linux-next@lfdr.de>; Fri, 21 Nov 2025 05:31:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 60E164E3CB4
	for <lists+linux-next@lfdr.de>; Fri, 21 Nov 2025 04:31:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A8E32417C2;
	Fri, 21 Nov 2025 04:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="o8I8aIpU"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A89226CEB;
	Fri, 21 Nov 2025 04:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763699471; cv=none; b=MbuIjIwNZn+aujsFNTsDVe5JUysewwqEj6R3tcFFSxiK7wMJsXXcpiYjwh2OWgg5cJt6X/Vw5fgfZzY3PN0MYDzykW6ip9ZxsqBve9EmkHAwymrnJktd8LMlBT0L0wc4WqZpJgCzs6Df6BtnbK+dq5MCNuIC+tq/YCHvD6utZts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763699471; c=relaxed/simple;
	bh=K50Qz1F9GQNlGnSbAJSgsz4xFCIgB07iDGuoI6BqhW0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=kq18lMYpuRYgyo0tbrGR6dSbxXvNH1Rce9EdULB6bbp/B2I4yY3EUtrsGWl4D+P4JDVh58/fUqvihaWVijbYkFTEIhs16oi4IvHdeZYvbeqi8vPM8GHr9/mF5XOacT9RjCLxlKPYYC8fd6GXLCDu8eHzvD3Q5jjHIrZDH4/g3DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=o8I8aIpU; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763699462;
	bh=/56Z8p/Pbtpa67J5etAj61wdyZ6omu1MV9QmFSJeA/c=;
	h=Date:From:To:Cc:Subject:From;
	b=o8I8aIpUWifLGJm1Y3E96zp2MxVP2o36wt5C4qXyLejW4EFkl+eOPT1r5dzRHPiJ9
	 dI9svGnJZMHFuzewb4q8qxNwbKrEed2N4RTb+zz5klrpUj4MRFEgQdYfVrrOcLChQX
	 8MmbCr7GqdCiZXkJGECremwb7dNGt4M1xRU+WxmbUXjQWAvEJSWCByryHrmdB54pKo
	 n8s6TM7wfU79huhTb/3yrycWZbjNjwHu0jjy5S6sPpYsjXi4S6tHUsyrDemnFiCZzW
	 X9uwBg0Kiky/hpHaT9sc7/mgYl8luxNFTHzsoKilCPPTMwMSUe2OnjEweMidMSBAbk
	 M2lywW9i9KGew==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dCMjK1DC2z4wC8;
	Fri, 21 Nov 2025 15:31:00 +1100 (AEDT)
Date: Fri, 21 Nov 2025 15:30:59 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, Christian
 Brauner <brauner@kernel.org>
Cc: Ian Kent <raven@themaw.net>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the landlock tree with the vfs-brauner
 tree
Message-ID: <20251121153059.48e3d2fa@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RHvi30aHtmDS7SNDfD=cbif";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/RHvi30aHtmDS7SNDfD=cbif
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the landlock tree got a conflict in:

  include/linux/fs.h

between commit:

  922a6f34c175 ("autofs: dont trigger mount if it cant succeed")

from the vfs-brauner tree and commit:

  f0c02fe6ad93 ("landlock: Fix handling of disconnected directories")

from the landlock tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/fs.h
index 474f728d1a6f,74e0d599e9fd..000000000000
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@@ -2839,7 -3269,7 +2839,8 @@@ extern struct file * open_exec(const ch
  /* fs/dcache.c -- generic fs support functions */
  extern bool is_subdir(struct dentry *, struct dentry *);
  extern bool path_is_under(const struct path *, const struct path *);
 +u64 vfsmount_to_propagation_flags(struct vfsmount *mnt);
+ bool path_connected(struct vfsmount *mnt, struct dentry *dentry);
 =20
  extern char *file_path(struct file *, char *, int);
 =20

--Sig_/RHvi30aHtmDS7SNDfD=cbif
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkf6wMACgkQAVBC80lX
0Gy21Qf9FRUrf55V9yI3aKXd1RR/dfL79bbDThu4eIAOjZ4EjJJHaxFljaxvQMZw
9R2IqCphaFEvKqqhhcUr+YUGt9FSE0gjPqiilz5tQpC/ZAnSMbq/KjJzIot2JIU+
Z9pVim7pVyKzYG1ERuPxQtRk/ShMv+KWyAu9geL8bIOUtorb8RmdsJAVJURo7SGS
8wD5enbbJVor/7tp12yhNwlPTU20BqAvGQEqaLP8nldGJKQZ5E2hEk96dZAratNH
ywheVD/bYLIc2R5hsNqFmX5EWi+kc8lbO5ocBqHEUQM+p9gBpNoVLf+mQJz6IygC
N1GxVFnuckA1My8OS5wqJWxDrgh9AQ==
=tsi/
-----END PGP SIGNATURE-----

--Sig_/RHvi30aHtmDS7SNDfD=cbif--

