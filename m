Return-Path: <linux-next+bounces-9661-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B1BD219E4
	for <lists+linux-next@lfdr.de>; Wed, 14 Jan 2026 23:38:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9B017301D329
	for <lists+linux-next@lfdr.de>; Wed, 14 Jan 2026 22:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDE8D38A9BC;
	Wed, 14 Jan 2026 22:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="i+bFDRt4"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783663A89C7;
	Wed, 14 Jan 2026 22:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768430327; cv=none; b=u/O0mjITngGLuP0+2U2eHTov9Hj5KKr9LoUbFRb0vG9AKRC3hADDa9PsyZSxkx+nz1vt9U/fJkfs3iQfYMypkmtOKgLWzGfuoohsIJxTtSpiHDtRi7RZT5+fR2Kr0yumJWKiPwH+eNMbCEOA08hohdyn0foQ0MwuTndNmsdAShw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768430327; c=relaxed/simple;
	bh=xaJvIk2DJ5DkE6EsKWZlJYZXTNwFIl97sDGDFg8aIwk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dDwVt+pVKt1UjFdQ5BW9lyAZoPBbd0jBFpfjqVnTD8Zsz1BJ9Zr8XajnErdxJ/gjYRnzT4lUiGlN+c/Za5bMaA0cV/QoafEAAIFIyg98Awf0q+mHhXIrBaa/5Nqyb07B/Ofmi4TQTw2Psa7xBpDqnkKO8rG2neolksV/VjB2eDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=i+bFDRt4; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1768430309;
	bh=BtSACyDLs5AomhIHUOymj3ak4lN6Fa97oUNc6C68NE8=;
	h=Date:From:To:Cc:Subject:From;
	b=i+bFDRt4q53Uk6JfAsa4EskHNZv5jWg3kk2C2ce7Bs8EGG0J5Lx/aoV6YBx8lFgKF
	 xCJ7ah/QO8Gb3BR6AM4Exakt67aGM43XUC70hOn6npjF01qWMwWstgUO7e2KDOIzI8
	 gbW42AQdBg6WTqPwFK7R27ddbtgyb0dfxLwqHLH2luu2B6irt76aXWgEi3IrndIp/k
	 YRk96EckeOQIq7OyJA3vvuKu5SgscDTp/YAlDmLI2iykyQpzawiOzEDAh3Oqwb254E
	 OvIT32XZs2Yfi4/Xbj/9gQcGw8hfMD7Zv4qwe1DTsVRp8PsmJoa5qFCjB32yHmCVWJ
	 o/E/F3Q9so9ew==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ds1H968cdz4w26;
	Thu, 15 Jan 2026 09:38:29 +1100 (AEDT)
Date: Thu, 15 Jan 2026 09:38:28 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Al Viro <viro@ZenIV.linux.org.uk>, Christian Brauner
 <brauner@kernel.org>
Cc: Jeff Layton <jlayton@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the vfs tree with the vfs-brauner tree
Message-ID: <20260115093828.318572ea@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3oNr6q7BopKIEhWJa9bAN2S";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/3oNr6q7BopKIEhWJa9bAN2S
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs tree got a conflict in:

  Documentation/filesystems/porting.rst

between commit:

  2b10994be716 ("filelock: default to returning -EINVAL when ->setlease ope=
ration is NULL")

from the vfs-brauner tree and commits:

  d04faed9ff84 ("non-consuming variant of do_renameat2()")
  7335480a8461 ("non-consuming variant of do_linkat()")
  82f616740547 ("non-consuming variant of do_symlinkat()")
  efa68e343b3b ("non-consuming variant of do_mkdirat()")
  f2a62ccef4ad ("non-consuming variant of do_mknodat()")
  5f6a811e9abe ("non-consuming variants of do_{unlinkat,rmdir}()")

from the vfs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/filesystems/porting.rst
index ed3ac56e3c76,2b4dddfe6c66..000000000000
--- a/Documentation/filesystems/porting.rst
+++ b/Documentation/filesystems/porting.rst
@@@ -1336,7 -1339,6 +1336,15 @@@ in-tree filesystems have done)
 =20
  **mandatory**
 =20
 +The ->setlease() file_operation must now be explicitly set in order to pr=
ovide
 +support for leases. When set to NULL, the kernel will now return -EINVAL =
to
 +attempts to set a lease. Filesystems that wish to use the kernel-internal=
 lease
 +implementation should set it to generic_setlease().
++
++---
++
++**mandatory**
++
+ do_{mkdir,mknod,link,symlink,renameat2,rmdir,unlink}() are gone; filename=
_...()
+ counterparts replace those.  The difference is that the former used to co=
nsume
+ filename references; the latter do not.

--Sig_/3oNr6q7BopKIEhWJa9bAN2S
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmloGuQACgkQAVBC80lX
0Gz6FQf/bSonuMEp8y72wpch0alYzVpxaKGvlCScC9PM4cIF6ztxBS0hhLyZ9vSC
ym/SXHo2X5Nj2+R8ENaN3nADreHpRlNF50SNWFT3SY4pepYINmary8d7FTVjgzZY
t94I+thaZ6OMZpFSvzIKiJevr+gPHa8XwBzfknKoBKhRkinbBzbsX0CnqmvvwL98
muTZIxNcJYjav6N41QEnTBr6ojBO9AoLqzdaVJ7pRPGYY3faPjyw3Umn2wkVSztO
096qIXkyj79K7+LTTfaArs5k3airm+tynb8WySKJ7uIB/HbMQ5JqfcboV/NC/rVH
hqaXTD0HrMI20M7Eq9623pmqdnMH0w==
=fh0L
-----END PGP SIGNATURE-----

--Sig_/3oNr6q7BopKIEhWJa9bAN2S--

