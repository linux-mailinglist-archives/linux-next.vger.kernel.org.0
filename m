Return-Path: <linux-next+bounces-6396-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 212EAA9E590
	for <lists+linux-next@lfdr.de>; Mon, 28 Apr 2025 02:49:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E17E177D5A
	for <lists+linux-next@lfdr.de>; Mon, 28 Apr 2025 00:49:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC08C38DDB;
	Mon, 28 Apr 2025 00:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="CKqHoe2X"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B867D2701C4;
	Mon, 28 Apr 2025 00:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745801357; cv=none; b=YtVtzdBg2Upr62rgjxG4TWzxxXI5xOSN5ZU/wMQ+bwWfhFpM2FXkjtckS8GJisw+L55Csz3PrwAF3jooS8u97ATPQRPAc654lWFQxmcrtgDze0EgIOpBntCg8kEx4BpV095RBCyE5tYWCICUE3PV3woZCSRdSJ3oadhZd5wDmZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745801357; c=relaxed/simple;
	bh=GRtExQoSpMDcN8m4JjjhTmCB0KpOhfqC0Ukd4yA43No=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=k1+GYzS0rkG+SmdNdcyQj+i33gGsLHR2Ym3WOBCW/jXi2lhh8W7pShyyzoIj2O65bN7xV1Y1aF3+l778W+E7VONW68gfoYdr2+HjVzi9OMopMelTT580PCAgTQv+ZEFUaMoEllf8DGB4tXVET2nTwPzlTcS0ikpC5S4XDxc0mYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=CKqHoe2X; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745801350;
	bh=dceDVVW3ewLIvRvDPLJmclWQJzCUYkKLgP9Kl7VZ5NM=;
	h=Date:From:To:Cc:Subject:From;
	b=CKqHoe2XspupgcNO+T478S5gjmOOduyezpvqS5uL95ZLhwErDIhBpS7ihHSlZzCe4
	 1L0UB1K+gEJQVIZzebvTNtD1jwrowdZE8UJ124rvtvhb6+4I69x7aLomLoFTPhSKbf
	 hL00S45RAvQDjhrboNHZ/rHuSWX2CPK4RRXlAB0qAQSEU/HMYpisJWli3hdCBTDuPp
	 qnOQ0/sbjRCPqT0wN4HFYfwDkJ7BVQlX5ayTHT5uT4ClJrizSMHnEDZFmTGaqCyyH/
	 nd1VGonrWIHeELxuVs6eLjU+ypombshU0BnEYdubNLZJ0lMri+cq+F9aEOu9N4yEe7
	 NzCC1vUv7CjUw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zm4Zq4Wlmz4wj2;
	Mon, 28 Apr 2025 10:49:07 +1000 (AEST)
Date: Mon, 28 Apr 2025 10:49:05 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Wolfram Sang
 <wsa@the-dreams.de>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Jai Luthra
 <jai.luthra@ideasonboard.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Romain Gantois <romain.gantois@bootlin.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>
Subject: linux-next: manual merge of the v4l-dvb tree with the i2c tree
Message-ID: <20250428104905.2b54643f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Iu8MMAuifCK8izLOpQ_sltl";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Iu8MMAuifCK8izLOpQ_sltl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the v4l-dvb tree got a conflict in:

  drivers/media/i2c/ds90ub960.c

between commits:

  3ec29d51b546 ("media: i2c: ds90ub960: Protect alias_use_mask with a mutex=
")
  818bd489f137 ("i2c: use client addresses directly in ATR interface")

from the i2c tree and commits:

  24868501a744 ("media: i2c: ds90ub9xx: Add err parameter to read/write fun=
cs")
  2ca499384e98 ("media: i2c: ds90ub960: Add RX port iteration support")

from the v4l-dvb tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/media/i2c/ds90ub960.c
index 5a4d5de110bd,1877eb735cc7..000000000000
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@@ -1056,11 -1271,10 +1274,12 @@@ static int ub960_atr_attach_addr(struc
  	struct ub960_rxport *rxport =3D priv->rxports[chan_id];
  	struct device *dev =3D &priv->client->dev;
  	unsigned int reg_idx;
+ 	int ret =3D 0;
 =20
 -	for (reg_idx =3D 0; reg_idx < ARRAY_SIZE(rxport->aliased_clients); reg_i=
dx++) {
 -		if (!rxport->aliased_clients[reg_idx])
 +	guard(mutex)(&rxport->aliased_addrs_lock);
 +
 +	for (reg_idx =3D 0; reg_idx < ARRAY_SIZE(rxport->aliased_addrs); reg_idx=
++) {
 +		if (!rxport->aliased_addrs[reg_idx])
  			break;
  	}
 =20
@@@ -1069,15 -1283,18 +1288,18 @@@
  		return -EADDRNOTAVAIL;
  	}
 =20
 -	rxport->aliased_clients[reg_idx] =3D client;
 +	rxport->aliased_addrs[reg_idx] =3D addr;
 =20
  	ub960_rxport_write(priv, chan_id, UB960_RR_SLAVE_ID(reg_idx),
- 			   addr << 1);
 -			   client->addr << 1, &ret);
++			   addr << 1, &ret);
  	ub960_rxport_write(priv, chan_id, UB960_RR_SLAVE_ALIAS(reg_idx),
- 			   alias << 1);
+ 			   alias << 1, &ret);
+=20
+ 	if (ret)
+ 		return ret;
 =20
  	dev_dbg(dev, "rx%u: client 0x%02x assigned alias 0x%02x at slot %u\n",
 -		rxport->nport, client->addr, alias, reg_idx);
 +		rxport->nport, addr, alias, reg_idx);
 =20
  	return 0;
  }
@@@ -1089,11 -1306,10 +1311,12 @@@ static void ub960_atr_detach_addr(struc
  	struct ub960_rxport *rxport =3D priv->rxports[chan_id];
  	struct device *dev =3D &priv->client->dev;
  	unsigned int reg_idx;
+ 	int ret;
 =20
 -	for (reg_idx =3D 0; reg_idx < ARRAY_SIZE(rxport->aliased_clients); reg_i=
dx++) {
 -		if (rxport->aliased_clients[reg_idx] =3D=3D client)
 +	guard(mutex)(&rxport->aliased_addrs_lock);
 +
 +	for (reg_idx =3D 0; reg_idx < ARRAY_SIZE(rxport->aliased_addrs); reg_idx=
++) {
 +		if (rxport->aliased_addrs[reg_idx] =3D=3D addr)
  			break;
  	}
 =20
@@@ -1103,12 -1319,18 +1326,18 @@@
  		return;
  	}
 =20
 -	rxport->aliased_clients[reg_idx] =3D NULL;
 +	rxport->aliased_addrs[reg_idx] =3D 0;
 =20
- 	ub960_rxport_write(priv, chan_id, UB960_RR_SLAVE_ALIAS(reg_idx), 0);
+ 	ret =3D ub960_rxport_write(priv, chan_id, UB960_RR_SLAVE_ALIAS(reg_idx),
+ 				 0, NULL);
+ 	if (ret) {
+ 		dev_err(dev, "rx%u: unable to fully unmap client 0x%02x: %d\n",
+ 			rxport->nport, client->addr, ret);
+ 		return;
+ 	}
 =20
  	dev_dbg(dev, "rx%u: client 0x%02x released at slot %u\n", rxport->nport,
 -		client->addr, reg_idx);
 +		addr, reg_idx);
  }
 =20
  static const struct i2c_atr_ops ub960_atr_ops =3D {
@@@ -3231,21 -4370,12 +4376,14 @@@ static void ub960_txport_free_ports(str
 =20
  static void ub960_rxport_free_ports(struct ub960_data *priv)
  {
- 	unsigned int nport;
-=20
- 	for (nport =3D 0; nport < priv->hw_data->num_rxports; nport++) {
- 		struct ub960_rxport *rxport =3D priv->rxports[nport];
-=20
- 		if (!rxport)
- 			continue;
-=20
- 		fwnode_handle_put(rxport->source.ep_fwnode);
- 		fwnode_handle_put(rxport->ser.fwnode);
+ 	for_each_active_rxport(priv, it) {
+ 		fwnode_handle_put(it.rxport->source.ep_fwnode);
+ 		fwnode_handle_put(it.rxport->ser.fwnode);
 =20
 +		mutex_destroy(&rxport->aliased_addrs_lock);
 +
- 		kfree(rxport);
- 		priv->rxports[nport] =3D NULL;
+ 		kfree(it.rxport);
+ 		priv->rxports[it.nport] =3D NULL;
  	}
  }
 =20

--Sig_/Iu8MMAuifCK8izLOpQ_sltl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgO0IEACgkQAVBC80lX
0GwuxQf8CDRUDUhUkSEtnRMzezwxTCxy6hBsfytMQIjQJ5MeAjktp2VoTGlAr+KQ
Pzp2MVLRiOYYYOZ+/TYCN4LJaPLbMAB3pTKSg6lN0TahsuFUwXnLgy9M7JO/3REn
uuE7H/AkngqMCCyWpG7CN2Rxf/IbkwkzM/mEzZLqUAbpV+fN26glXuMxGK71jYJ0
D2cX5y7YI0Sy4UGrDSmQmaWoWbOMIqTg/PXYmH/+M/pGZ46pcToxwviivh8btClB
BqZIPPY1rbYS1aXk/XgLor4pFY6IFfrQnDkSKzIdkhEy62ALAw8Iidmg0fYKl/f3
bqpMuw1CzanAx689gtSLQYO4iZ7SLw==
=V1Pt
-----END PGP SIGNATURE-----

--Sig_/Iu8MMAuifCK8izLOpQ_sltl--

