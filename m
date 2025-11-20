Return-Path: <linux-next+bounces-9116-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F722C765F7
	for <lists+linux-next@lfdr.de>; Thu, 20 Nov 2025 22:28:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EE1D23597CB
	for <lists+linux-next@lfdr.de>; Thu, 20 Nov 2025 21:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 585FF3002C5;
	Thu, 20 Nov 2025 21:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="mVQJsG8d"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1602517AA;
	Thu, 20 Nov 2025 21:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763674061; cv=none; b=W/ooORmA5L3pyX838JFTuCY1rY43ZShIu9khAOgZrdecUVF6iVFkwVdntGnpBWSeI5pYtkTSc39xCWGfiFEo6wd076basCBNWyRAmyddDLGGf1GdbZxqBliXW2n4HcBSOzOKJtlGxonPTnHJMPVVb+Y2keoVV3YdTSwL2GSonQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763674061; c=relaxed/simple;
	bh=dEzEiQTdDPNqMf6UN7Zyf932qvLKNDUvqjgI25IvvBo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ExAvWMI0HB3nocmvCU9mHw3HB/fuJsWso6HofquYEjyb55ivV2MSboMM/TH6ZLTvojUObDyhrZsJlPf5vwJCV1uOc3oZt2r/eqRLkOLntqRx2UykhcLUPazzqW8zLLKz+6dRMQfmgQ8CjuVVdoiNIShHbuGg73hRec6a/X9HLik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=mVQJsG8d; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763674052;
	bh=XsI47zv+rR7QbPzwnw9zQrvFUcu8TzBmwyfagbG4cSY=;
	h=Date:From:To:Cc:Subject:From;
	b=mVQJsG8d3RgeGCjEs5CRkD/SsfnEYcyVmwXmaiU5LmjZT7xdxp+7yIFrEcCIfRReb
	 ZIatJK5Z125DMzMihxouCER1VyOCj//W7wj5WaRhzpmTwdEEl0i1oA5CC8/gOUdNrM
	 lvyTGTyZmRfvkPu5BUj8XA3nxVliXM3/b+bLZyo7Q29Rl4fH8tgYVvjRZ5kr+fwZ/S
	 5hhjYkV8wMYWUI8xJL0CjrJ09cOaN2xHvb/nQds9E8Cyomqaf4AKuQ7SgwOxdLFakG
	 6BwqWlnB4O1PFylCvEeov1g2ek1ttXQRh+6GYBb2EiQR+0lMMQe/WtyoQ0iPw9321O
	 BqCqo6wVzErzw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dCBJh0YWfz4wGZ;
	Fri, 21 Nov 2025 08:27:31 +1100 (AEDT)
Date: Fri, 21 Nov 2025 08:27:31 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Al Viro <viro@ZenIV.linux.org.uk>, Christian Brauner
 <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, NeilBrown <neil@brown.name>
Subject: linux-next: manual merge of the vfs tree with the vfs-brauner tree
Message-ID: <20251121082731.0e39ee5d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9tUdd4Do6h.=jwYp/CjP4La";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/9tUdd4Do6h.=jwYp/CjP4La
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs tree got a conflict in:

  Documentation/filesystems/porting.rst

between commit:

  fe497f0759e0 ("VFS: change vfs_mkdir() to unlock on failure.")

from the vfs-brauner tree and commit:

  fc45aee66223 ("get rid of kill_litter_super()")

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
index d33429294252,4921b3b0662a..000000000000
--- a/Documentation/filesystems/porting.rst
+++ b/Documentation/filesystems/porting.rst
@@@ -1314,11 -1314,5 +1314,18 @@@ instead
 =20
  **mandatory**
 =20
 +vfs_mkdir() now returns a dentry - the one returned by ->mkdir().  If
 +that dentry is different from the dentry passed in, including if it is
 +an IS_ERR() dentry pointer, the original dentry is dput().
 +
 +When vfs_mkdir() returns an error, and so both dputs() the original
 +dentry and doesn't provide a replacement, it also unlocks the parent.
 +Consequently the return value from vfs_mkdir() can be passed to
 +end_creating() and the parent will be unlocked precisely when necessary.
++
++---
++
++**mandatory**
++
+ kill_litter_super() is gone; convert to DCACHE_PERSISTENT use (as all
+ in-tree filesystems have done).

--Sig_/9tUdd4Do6h.=jwYp/CjP4La
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkfh8MACgkQAVBC80lX
0GyavAf8CY2w+4O1xoC6bOef9XSYQPe0Du754nP+ZYWZR2BXXs1AkSduskeMtSJc
GBruV2PIfSoBsWa0FyoQqOfXZWbp2B54wwo10gBdp0oIRmbFH+8LPnSm34g2IEuE
rsqJdS6WpCT/XoSugb8x7at8CvIvvj43SlRq9qlp/3ANW/xKbp+1Ba9hMDiqvcAt
5fwbkQyLdgZmovOikwSBzmOf+rAn3Jx28EywJcfk8VQWANdYxvRyI+AndJuTvNAk
gwz4y+sRu92+f2rcVCbQxw27eoxOTK9rX4+vGLjwnoJbJAmQakUQ9JtgrIdI0SOC
0mCpc0KQDmHMDUNZFTv6s4WX7ZjnyA==
=A+yW
-----END PGP SIGNATURE-----

--Sig_/9tUdd4Do6h.=jwYp/CjP4La--

