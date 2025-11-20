Return-Path: <linux-next+bounces-9117-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 2816DC7661B
	for <lists+linux-next@lfdr.de>; Thu, 20 Nov 2025 22:34:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0686134E047
	for <lists+linux-next@lfdr.de>; Thu, 20 Nov 2025 21:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 739FB253958;
	Thu, 20 Nov 2025 21:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="JVZqNn+Z"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E95C239E8B;
	Thu, 20 Nov 2025 21:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763674418; cv=none; b=SfqVgIhJcoBHtiDzDHoPxxxvWK0cHUFBfEjm56m+xNwx3C3OBmYV9kC/IezCCMPk7h3HvHMsVVVD/SEmIH8wcV60G0ilXruY6/slWtSVX90hwakV4ro17VVEhUz/gwfDc44sKuC6P9TD1DGVcT8nogMjEU2+ISeOqVGMjV7O6/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763674418; c=relaxed/simple;
	bh=SGkyXAHdrmtxL37OM50hnpsyVT90aYH62YIQ2CZnqzY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dEZhtn63NzF4wVt2k2I0sZnHoVXzU9/iE6mU1Bt56akjLpZKH8Yv4nI3H60FFgigVJJICYZIU0xeWcq1f0Kg4kP1FrsNOO7urbzS7hvL0YOwMbO1IgfHew7+zQX5+OdjeJs5HoH53KTl+ipsY7hLDWP3FfUFRyAQccVcaUtJWhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=JVZqNn+Z; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763674414;
	bh=VHA1p3obql0TmlED0EsfBAcnYjWT3/+5obAI9kW+KzE=;
	h=Date:From:To:Cc:Subject:From;
	b=JVZqNn+Z8EUCReVrPsnP5PGqGv8tBtZAAe5jxjCI5lZr9kF/qeTL4YGG+DyIZoYk9
	 kK+6SAbN5yRve1nhwVtu0dFKtN/cnHFKxk98FmS/22YE9ZFNFnS2j/eT91om1TbIQZ
	 NkaSnBZ/Ouwji9v9i2yeEXn4ERu2ZFVJJ/keR9d87ElJrVm1e40ncYRlSx1m0Bb+Oa
	 5Nji06ZOc+9pxXmWALUwUaCLejmzQZukcAcu+fycJvxzNZNCBBkxdnc/qepmmqQ2Hv
	 S812zxcls8YjGpJLoQil3svndqms0wpu0tNaSeRdQ0i5l0cx+OGjdsf2UAZTs4ptvo
	 fmkkf5pD0ta+Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dCBRd4Lc5z4wGZ;
	Fri, 21 Nov 2025 08:33:33 +1100 (AEDT)
Date: Fri, 21 Nov 2025 08:33:33 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Al Viro <viro@ZenIV.linux.org.uk>, Christian Brauner
 <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Mateusz Guzik
 <mjguzik@gmail.com>
Subject: linux-next: manual merge of the vfs tree with the vfs-brauner tree
Message-ID: <20251121083333.48687f3e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/L6Kk52Eh+tr3VsVzMSt+aMJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/L6Kk52Eh+tr3VsVzMSt+aMJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs tree got a conflict in:

  fs/dcache.c

between commits:

  31e332b911fc ("fs: add missing fences to I_NEW handling")
  b4dbfd8653b3 ("Coccinelle-based conversion to use ->i_state accessors")
  1e3c3784221a ("fs: rework I_NEW handling to operate without fences")

from the vfs-brauner tree and commit:

  bacdf1d70bbe ("primitives for maintaining persisitency")

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

diff --cc fs/dcache.c
index 3204cc55b566,824d620bb563..000000000000
--- a/fs/dcache.c
+++ b/fs/dcache.c
@@@ -1986,9 -2012,17 +2019,11 @@@ void d_instantiate_new(struct dentry *e
  	lockdep_annotate_inode_mutex_key(inode);
  	security_d_instantiate(entry, inode);
  	spin_lock(&inode->i_lock);
+ 	spin_lock(&entry->d_lock);
  	__d_instantiate(entry, inode);
+ 	spin_unlock(&entry->d_lock);
 -	WARN_ON(!(inode->i_state & I_NEW));
 -	inode->i_state &=3D ~I_NEW & ~I_CREATING;
 -	/*
 -	 * Pairs with the barrier in prepare_to_wait_event() to make sure
 -	 * ___wait_var_event() either sees the bit cleared or
 -	 * waitqueue_active() check in wake_up_var() sees the waiter.
 -	 */
 -	smp_mb();
 +	WARN_ON(!(inode_state_read(inode) & I_NEW));
 +	inode_state_clear(inode, I_NEW | I_CREATING);
  	inode_wake_up_bit(inode, __I_NEW);
  	spin_unlock(&inode->i_lock);
  }

--Sig_/L6Kk52Eh+tr3VsVzMSt+aMJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkfiS0ACgkQAVBC80lX
0GzYpwf9ELxrbyzVcCLzrlDVprqjY9ipVEINQzZA9ZJTkaOxMyl48KMJ3vbgv6U8
MpXbCB0PErfA3Q9CHIAZw2RqmYfrNWbbgVJDFZOTmpEzeAvBtFKhCcrEUdjMlLZD
o/wqXjrlRNw9I1VEcf190SbK3Y5+e2XgMA8jJGRtgvzz5bRWeI0xMvjbHMssbVl8
ja5OaYbaTIHhDy0Wv50nBpmnFbNAXxAZ4r+gi/ZtK2IWGV4y/8axCPMWZAisHiGd
86CgWgBMTWsShN3IWhiMCbVSGoI3jfgSkT1byBC53p9DG58phdkx6jnAuuGg/CJ5
HfwDa5W7IsUXWtM37OhSt2RCdUiMMQ==
=J4tw
-----END PGP SIGNATURE-----

--Sig_/L6Kk52Eh+tr3VsVzMSt+aMJ--

