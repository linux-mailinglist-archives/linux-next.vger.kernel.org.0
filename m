Return-Path: <linux-next+bounces-6194-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 12141A835B1
	for <lists+linux-next@lfdr.de>; Thu, 10 Apr 2025 03:22:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 285401B80BE5
	for <lists+linux-next@lfdr.de>; Thu, 10 Apr 2025 01:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74B9018FC9D;
	Thu, 10 Apr 2025 01:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="oHmuXsqj"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13B11DA4E;
	Thu, 10 Apr 2025 01:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744248069; cv=none; b=bFvdDHv21rzRB3i6rEY8D2zlzuKfj8SlUFSQLQufrmvTMy6ODQJCa9aO9Cx9nQvsCFGgulvoQv3b6ChbyQZ6B1tpycBzjoDVgEev7xE8/h9ehVeiIdBK1UVbXpCcPGs+W96Q/Of+vk1cBjntk63WWHJ6/KqcS/9zrkqBOezztHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744248069; c=relaxed/simple;
	bh=wfQv5qp4h2hEADELBOWE58AgNrClOW5O0aschMVNXMU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=d4TLw25jMj+tfyCmvH9OxWrCRKhwcXuVvPGrmXEKaUyRC1dtH1f47tRdvf9Lk/C5z9s/sh9CcF63bOW2e1Ag4wUMnPdy2E8GlJCbjIUT8mjpQAp8Lf4ibsY89sIXx/0b5H0csoCMSqN7rv1dZAUQCVNkEEUqTaq2UXes/1J2KdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=oHmuXsqj; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744248054;
	bh=Cx4J31uASiMwR6P8vvfdcoDVlZLYQgYvAz5AWcgMpZ4=;
	h=Date:From:To:Cc:Subject:From;
	b=oHmuXsqjqqxQq5VMTOYtqk3caaJhbXHgPIzYHP6xQVpp8ghQyKaYw5aMUzkEw7JDH
	 lvbZQUcfSvW6tR//Ohiz027cSx6yHHu02wagHHULLU7LhEFL37MZGpY10cw8ZDzqVA
	 ceVZXSHnYqxfonzLNcx9nKOqPzfno6G3OSqFJvJXzcp63+odB9NRusHSUjELpmYqNO
	 PrqYMyTtd/NW9HiaY+ulKroMluAbqwwbaQgeGjN3UIJYtHFcPNJ8xsmgD0lxAv3fP5
	 NZYkc4MgYfyKbvmbk6e7WKj3iIHQ20AxUd8e0hGxcdlH0miwH75OnydrT+2dZfKW35
	 hVSh1cny+bNbA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZY27p2qSLz4wbn;
	Thu, 10 Apr 2025 11:20:53 +1000 (AEST)
Date: Thu, 10 Apr 2025 11:20:52 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Stanislav Fomichev <sdf@fomichev.me>
Subject: linux-next: manual merge of the net-next tree with the net tree
Message-ID: <20250410112052.3d7b4f2e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/i9SkFbt2pK6WV/8Hn.BUA1k";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/i9SkFbt2pK6WV/8Hn.BUA1k
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got conflicts in:

  Documentation/networking/netdevices.rst
  net/core/lock_debug.c

between commit:

  04efcee6ef8d ("net: hold instance lock during NETDEV_CHANGE")

from the net tree and commit:

  03df156dd3a6 ("xdp: double protect netdev->xdp_flags with netdev->lock")

from the net-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/networking/netdevices.rst
index eab601ab2db0,0ccc7dcf4390..000000000000
--- a/Documentation/networking/netdevices.rst
+++ b/Documentation/networking/netdevices.rst
@@@ -338,14 -336,51 +336,52 @@@ operations directly under the netdev in
  Devices drivers are encouraged to rely on the instance lock where possibl=
e.
 =20
  For the (mostly software) drivers that need to interact with the core sta=
ck,
 -there are two sets of interfaces: ``dev_xxx`` and ``netif_xxx`` (e.g.,
 -``dev_set_mtu`` and ``netif_set_mtu``). The ``dev_xxx`` functions handle
 -acquiring the instance lock themselves, while the ``netif_xxx`` functions
 -assume that the driver has already acquired the instance lock.
 +there are two sets of interfaces: ``dev_xxx``/``netdev_xxx`` and ``netif_=
xxx``
 +(e.g., ``dev_set_mtu`` and ``netif_set_mtu``). The ``dev_xxx``/``netdev_x=
xx``
 +functions handle acquiring the instance lock themselves, while the
 +``netif_xxx`` functions assume that the driver has already acquired
 +the instance lock.
 =20
+ struct net_device_ops
+ ---------------------
+=20
+ ``ndos`` are called without holding the instance lock for most drivers.
+=20
+ "Ops locked" drivers will have most of the ``ndos`` invoked under
+ the instance lock.
+=20
+ struct ethtool_ops
+ ------------------
+=20
+ Similarly to ``ndos`` the instance lock is only held for select drivers.
+ For "ops locked" drivers all ethtool ops without exceptions should
+ be called under the instance lock.
+=20
+ struct netdev_stat_ops
+ ----------------------
+=20
+ "qstat" ops are invoked under the instance lock for "ops locked" drivers,
+ and under rtnl_lock for all other drivers.
+=20
+ struct net_shaper_ops
+ ---------------------
+=20
+ All net shaper callbacks are invoked while holding the netdev instance
+ lock. ``rtnl_lock`` may or may not be held.
+=20
+ Note that supporting net shapers automatically enables "ops locking".
+=20
+ struct netdev_queue_mgmt_ops
+ ----------------------------
+=20
+ All queue management callbacks are invoked while holding the netdev insta=
nce
+ lock. ``rtnl_lock`` may or may not be held.
+=20
+ Note that supporting struct netdev_queue_mgmt_ops automatically enables
+ "ops locking".
+=20
  Notifiers and netdev instance lock
- =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+ ----------------------------------
 =20
  For device drivers that implement shaping or queue management APIs,
  some of the notifiers (``enum netdev_cmd``) are running under the netdev
@@@ -355,7 -390,7 +391,8 @@@ For devices with locked ops, currently=20
  running under the lock:
  * ``NETDEV_REGISTER``
  * ``NETDEV_UP``
 +* ``NETDEV_CHANGE``
+ * ``NETDEV_XDP_FEAT_CHANGE``
 =20
  The following notifiers are running without the lock:
  * ``NETDEV_UNREGISTER``
diff --cc net/core/lock_debug.c
index 941e26c1343d,598c443ef2f3..000000000000
--- a/net/core/lock_debug.c
+++ b/net/core/lock_debug.c
@@@ -20,7 -20,7 +20,8 @@@ int netdev_debug_event(struct notifier_
  	switch (cmd) {
  	case NETDEV_REGISTER:
  	case NETDEV_UP:
 +	case NETDEV_CHANGE:
+ 	case NETDEV_XDP_FEAT_CHANGE:
  		netdev_ops_assert_locked(dev);
  		fallthrough;
  	case NETDEV_DOWN:

--Sig_/i9SkFbt2pK6WV/8Hn.BUA1k
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmf3HPQACgkQAVBC80lX
0GxnYQgAg8XTjYcv62M6nJ+mxY9jinLg+Vwqwi/GBFZycB9+CWP2P8WssCArwBT2
409FzC0aBRyE7m4LF7sU1sVtR8scF7Wkk44umX7vUGVxiRE6fxS198H1rEt7rX3e
hmx4kU5Uh3lF8jTd5xHStrg4tjdRtVQ43JC/IYSR+g+H6Qa37xkXRuRuIoTsxaX5
HaaIu+yglnrH8PQt7dQUHiEuWPKGpeTlpn8LQgjZ9M9qM/rg/kOjxlTrPh2zRDpE
GEGTuHHGe4k6/YsuZ2odgQukBRCr+zqz0Ms26+cBznoCscf98AbKbHTVyr4OSGN2
RKzyVT/S1rbxKxD0/tkD0GvyULJqbQ==
=l5gp
-----END PGP SIGNATURE-----

--Sig_/i9SkFbt2pK6WV/8Hn.BUA1k--

