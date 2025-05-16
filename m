Return-Path: <linux-next+bounces-6802-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA8FAB92EF
	for <lists+linux-next@lfdr.de>; Fri, 16 May 2025 02:02:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94E01502D1C
	for <lists+linux-next@lfdr.de>; Fri, 16 May 2025 00:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F393310E9;
	Fri, 16 May 2025 00:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ZMJHzbOP"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D73F10E5;
	Fri, 16 May 2025 00:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747353732; cv=none; b=cGnxw57Y2SkCP6bS/c6R21tIi69wps/X6cpYBmLscpAOQ71GWO7/nkkn5hvKyhAwncCnGtxMQ4ZoVktaMLZm+HEkAbVJ4n2eqYPzmME5S/RHUq07GbqxKDQE+9UJM8X1eYUPFaLxJTa9FG9Vzs5XYgwTLsqjWb0JQoT/H0QtZ8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747353732; c=relaxed/simple;
	bh=HQjggEL4lxDsMf822lACHrdhTUTWnjJfP6QrLo8Qgkk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hstKfOYmM/O4TUK534KkVchaTy4kBOwg5htnhU58uVRJ7O0XkYb7/JbH7Xwgr/GT2HnCiM3NomrgLfzotT2vk0GRpBts5rQqqb99qcDMJ3Uq1IP0Ihl4cu/SFJesohQaLwPJeFbtb0ezoXk+semxX4x6ZrbCIgtwFtbgSPrP1Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ZMJHzbOP; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747353725;
	bh=mmXgyAN3+Ih9k1kswJmzCBhT3sacWuVg4PWgfmpOGUM=;
	h=Date:From:To:Cc:Subject:From;
	b=ZMJHzbOPuklXA785/exaa2ORGrwSskCIx3OVhnF3z2PWTYcHKGoqEwGl7OQPTqS43
	 w5VDSHCdjfU/Y6z7XgNqC6cuPJt8ORCtvsF4YdWR1cVdhiST/izbu+zmbsb07resRZ
	 nd23/hzAZy3hvzqk6A9Ahe1xA1hcu1F5MxVYeFtoQMN3GCwnibzFliFYY1KAR7j8Dt
	 bgYTZl1FaMHt2K2q4z/X5YtKsrVHrWuYDDtukqIMl7IoHSeWAVdU86+NyAMElnuLRc
	 SAlNWWt+yZrFFkOHr8n9szV8E3S+l1tTnCtQ3N/AQF84VH8UJez/7ymWgrnYoUl1Cl
	 s3Mc9FcmOsZJg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zz6hD5GMNz4wbv;
	Fri, 16 May 2025 10:02:03 +1000 (AEST)
Date: Fri, 16 May 2025 10:02:01 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Al Viro <viro@ZenIV.linux.org.uk>, Christian Brauner
 <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, NeilBrown <neil@brown.name>,
 NeilBrown <neilb@suse.de>
Subject: linux-next: manual merge of the vfs tree with the vfs-brauner tree
Message-ID: <20250516100201.01a18903@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yn+arXEw30JYiENGvFJZqgN";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/yn+arXEw30JYiENGvFJZqgN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs tree got a conflict in:

  Documentation/filesystems/porting.rst

between commits:

  5741909697a3 ("VFS: improve interface for lookup_one functions")
  fa6fe07d1536 ("VFS: rename lookup_one_len family to lookup_noperm and rem=
ove permission check")
  06c567403ae5 ("Use try_lookup_noperm() instead of d_hash_and_lookup() out=
side of VFS")

from the vfs-brauner tree and commit:

  006ff7498fe8 ("saner calling conventions for ->d_automount()")

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
index 3111ef5592f3,749637231773..000000000000
--- a/Documentation/filesystems/porting.rst
+++ b/Documentation/filesystems/porting.rst
@@@ -1206,40 -1206,7 +1206,46 @@@ will fail-safe
 =20
  ---
 =20
 +** mandatory**
 +
 +lookup_one(), lookup_one_unlocked(), lookup_one_positive_unlocked() now
 +take a qstr instead of a name and len.  These, not the "one_len"
 +versions, should be used whenever accessing a filesystem from outside
 +that filesysmtem, through a mount point - which will have a mnt_idmap.
 +
 +---
 +
 +** mandatory**
 +
 +Functions try_lookup_one_len(), lookup_one_len(),
 +lookup_one_len_unlocked() and lookup_positive_unlocked() have been
 +renamed to try_lookup_noperm(), lookup_noperm(),
 +lookup_noperm_unlocked(), lookup_noperm_positive_unlocked().  They now
 +take a qstr instead of separate name and length.  QSTR() can be used
 +when strlen() is needed for the length.
 +
 +For try_lookup_noperm() a reference to the qstr is passed in case the
 +hash might subsequently be needed.
 +
 +These function no longer do any permission checking - they previously
 +checked that the caller has 'X' permission on the parent.  They must
 +ONLY be used internally by a filesystem on itself when it knows that
 +permissions are irrelevant or in a context where permission checks have
 +already been performed such as after vfs_path_parent_lookup()
 +
 +---
 +
 +** mandatory**
 +
 +d_hash_and_lookup() is no longer exported or available outside the VFS.
 +Use try_lookup_noperm() instead.  This adds name validation and takes
 +arguments in the opposite order but is otherwise identical.
 +
 +Using try_lookup_noperm() will require linux/namei.h to be included.
 +
++---
++
+ **mandatory**
+=20
+ Calling conventions for ->d_automount() have changed; we should *not* grab
+ an extra reference to new mount - it should be returned with refcount 1.

--Sig_/yn+arXEw30JYiENGvFJZqgN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgmgHkACgkQAVBC80lX
0Gy6Ngf5AUT77GdFG1KSp6uODdryA1OCoShWAHr2o7ZTUYlAx7dzZf3LyqaxVRjn
ff79UcBx2e5S/lKwZiiTqGOqA/hP+mvFPzFFk5qHj4/NL4kJyfaHeHzgy7EedUae
qkSTuRwWy7IpnpPPqt8wDJPNo/VO52fmg63sGlLwJ9mC+RQrVfgdqF3jQoSzBjNE
7hU4u5vt7CcPTJQq7vC3omB982XceNuX/J1FKCiDATuMheeaQtdAZZH8ALo4RaP2
75RU7c3JC3EvYpU999Lp42sR7EOEyr+94eDgM1T8LQfzgHxWkaW2cfmZR6cZVQh3
p3yTcmUfaPpLsQdKIQOdO2g+Jx9CVA==
=Nvhf
-----END PGP SIGNATURE-----

--Sig_/yn+arXEw30JYiENGvFJZqgN--

