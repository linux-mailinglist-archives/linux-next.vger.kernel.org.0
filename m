Return-Path: <linux-next+bounces-5030-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 921F5A01CC6
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 00:51:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5874B162493
	for <lists+linux-next@lfdr.de>; Sun,  5 Jan 2025 23:51:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCBAA146A6F;
	Sun,  5 Jan 2025 23:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="cZca6v9e"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A299143C7E;
	Sun,  5 Jan 2025 23:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736121075; cv=none; b=A9G1WCu1+Thro9VOpf2jh3ewcXjxi4Yn945+pqZx0IWpvMcxi0ot43/6QkkHCv91FTcjvQdjMfyJDj4pH8l2dGA6/PF2cQUBgI8Osak3Xu+ZOcr2u96J5hKtF9iJBqRr7M2NZfGPuD6k9BaWNqYJvnOe1NDvSnOVukXm5b5sGtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736121075; c=relaxed/simple;
	bh=x/L1L16oOgIh0c2qfQMxFEngJfIbTJ5DBaOF8iH8xD8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rld0TrnHxS1KNGic6SPPStArrtN/jcBrvOOlWECmfEOmeBlKSjaRAUT9vyJmlnDYkqvKhSRVAyS2F5K0NQsOft01et5ua1nurqyjBlmbxBT47UUZ5StGxOw1L5MlzhILF4V4+hevtSkS+FBLdQ96Nmb60hQV8jx0/1MGGwMjOPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=cZca6v9e; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736121061;
	bh=Jcxp/TUPPkOlufMN01EKbVDK11T9WDZed8WxrM6QXXU=;
	h=Date:From:To:Cc:Subject:From;
	b=cZca6v9eU57DsWdNxdOcy3lYmF1ai7fLzDZuDMZNmvaPlwb83jBHceCQCwTyKBRQ9
	 8/lWWJiP29lOWzwtOsRT2Kc0bavXwD9yNt4tLqGyPz+k7ZwO21acBigXSvy8J2cgAa
	 vZHOiZN0o2fZ/iHv9DroTmZAJ/kD4dynTC7rxLvyQ2Mo0JtRMYyslJ9uUDwgqVfOGA
	 d/qrST0833lqEBGw2tNkKdDTMJIbxn5987bZxxvZ2NLIQH8tUp0myjrPl51rqRPh0c
	 9SNcvY9WogJVzoqD2bEnYl0UuiyLhs2e7CWEKE9Txb0yA0N3JK3Q3j7wDomz/mN5x5
	 aBhaaqVpY/exw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YRDbS3RPbz4wxh;
	Mon,  6 Jan 2025 10:51:00 +1100 (AEDT)
Date: Mon, 6 Jan 2025 10:51:06 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>
Cc: Junxian Huang <huangjunxian6@hisilicon.com>, Leon Romanovsky
 <leon@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Yuyu Li <liyuyu6@huawei.com>, Zhu Yanjun
 <yanjun.zhu@linux.dev>
Subject: linux-next: manual merge of the rdma tree with Linus' tree
Message-ID: <20250106105106.3d94b0c3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/N32wtb+71tM94L0V35cA.Nr";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/N32wtb+71tM94L0V35cA.Nr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rdma tree got a conflict in:

  drivers/infiniband/sw/rxe/rxe_net.c

between commit:

  2ac5415022d1 ("RDMA/rxe: Remove the direct link to net_device")

from Linus' tree and commit:

  958152336cfa ("RDMA/rxe: Remove deliver net device event")

from the rdma tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/infiniband/sw/rxe/rxe_net.c
index 8cc64ceeb356,d400aaab0e70..000000000000
--- a/drivers/infiniband/sw/rxe/rxe_net.c
+++ b/drivers/infiniband/sw/rxe/rxe_net.c
@@@ -595,13 -577,7 +585,13 @@@ void rxe_port_down(struct rxe_dev *rxe
 =20
  void rxe_set_port_state(struct rxe_dev *rxe)
  {
 -	if (ib_get_curr_port_state(rxe->ndev) =3D=3D IB_PORT_ACTIVE)
 +	struct net_device *ndev;
 +
 +	ndev =3D rxe_ib_device_get_netdev(&rxe->ib_dev);
 +	if (!ndev)
 +		return;
 +
- 	if (netif_running(ndev) && netif_carrier_ok(ndev))
++	if (ib_get_curr_port_state(ndev) =3D=3D IB_PORT_ACTIVE)
  		rxe_port_up(rxe);
  	else
  		rxe_port_down(rxe);

--Sig_/N32wtb+71tM94L0V35cA.Nr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd7GuoACgkQAVBC80lX
0Gw3FQf+JPWeFv0uBRacGyYiOIjmQtgkVj1eE9hOWmcr5qyz0T6s2c1pa/Fdg1TG
0M5i0FwQUJNX/I7//Zu8XDzkFJ8wvmDTECe/No/vLZupdXHy2s4Porn6B8I1MFig
0AJg4G0vx7HSeY0FveAyJInY8gYPQiP5Z16FSJlIxuZWpaR2nBNZANC44z0I+hjf
YC6XkmVRs8thNZi5jdaytCJeh6uUYa7CTHXX0bgjl3p/oAkxL/6nCBMJ7zy14ffN
RdtL8CKOtxoAc+HkuW6TDg0mgJS440Qb07YmbnqXc0GElDRxnqfCOzPnDTfNQMUF
qFKN/w2BX00xNsjtykHUwfbeQqJ+hA==
=jQeg
-----END PGP SIGNATURE-----

--Sig_/N32wtb+71tM94L0V35cA.Nr--

