Return-Path: <linux-next+bounces-6209-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7B8A87610
	for <lists+linux-next@lfdr.de>; Mon, 14 Apr 2025 05:08:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 504073B0A96
	for <lists+linux-next@lfdr.de>; Mon, 14 Apr 2025 03:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33B6D18A95A;
	Mon, 14 Apr 2025 03:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qMUQURQS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A9BE571;
	Mon, 14 Apr 2025 03:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744600082; cv=none; b=hIAKoHw5y3ssNOlOKymNT0M799RRwXt5h3glNneHNE+b8nU2t5ATEjbfVCsMF+HiBzcQntBRgQWBkJ+imdn08LNDgb2p5UA+xpyxRXgJxlUjs8C5/9MChhwsIy5TT5HFbIqy2wAfGwVt1yuvl6cPbH/TDMqSdKFAoZeN9Ow7EfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744600082; c=relaxed/simple;
	bh=NA82Xb1S11tx1DMCSm8Ih7RELOdBcjiOu2PGJI8tRWM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=c+N3ESXo7413pQpblSuBW1iNO8xYnDMjS9z/rIKzJ9g9ou28BU63Hw5k96HnU4tPnF3YgpHLoio1RFtZyUdFi9PD2uqtaKJSi79WQjP1CIfTNzVO2nVTLhZOzv8NluYuZ0F/8OcMsc5GGE6N9bjsJd4nfjocs8TqZp8iHZPPYcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qMUQURQS; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744600075;
	bh=Y1bnnL2C8tQiGn6sE5V5/Spkz0c8Lj/iJNXVazr9/Z4=;
	h=Date:From:To:Cc:Subject:From;
	b=qMUQURQSPYMMOvz6RctOTPGp5nHrmPaiX0OT5ekc5EVw9hHkzXXavvzQtYYpWS9Jq
	 4ippVMLG3GqxmoUPMQQZVqn06XmEX1Dl9+sAoSbt3pty+xIRcBPVv1WbVzFYsh8K71
	 8jvV+Fdwmb6HlmKh2oReAD2Cst4YzDHgKnEbYKUgrWlMqIPYyAVXi3aLapYjvCMaYv
	 BP1pdbaIGXVauqsF7x371ImxO5VPz+cUMxel3DcD2u9v7Zednf46MCQ/KoYk35aq1N
	 gUhwvd7y+p0uRl6MW9xyOgh3RpnGKkl0a4b1LOVnNPbcAp1T+PNsrdpoIFCAvw7PAu
	 krTLgnVp9WOtw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZbXKP4WBdz4wcd;
	Mon, 14 Apr 2025 13:07:53 +1000 (AEST)
Date: Mon, 14 Apr 2025 13:07:52 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
 <johan.hedberg@gmail.com>, David Miller <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the bluetooth tree
Message-ID: <20250414130752.1752fd4a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ED0qPeuG4IN8_ul_RRNBDwc";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ED0qPeuG4IN8_ul_RRNBDwc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the net tree as different commits
(but the same patches):

  50c1241e6a8a ("Bluetooth: l2cap: Check encryption key size on incoming co=
nnection")
  061e4972c48c ("Bluetooth: btnxpuart: Add an error message if FW dump trig=
ger fails")
  17931d1b6d0c ("Bluetooth: btnxpuart: Revert baudrate change in nxp_shutdo=
wn")
  2c1cf148c1fa ("Bluetooth: increment TX timestamping tskey always for stre=
am sockets")
  87d48ed16c9f ("Bluetooth: qca: fix NV variant for one of WCN3950 SoCs")
  113f1345ce0c ("Bluetooth: btrtl: Prevent potential NULL dereference")
  32b70317f41c ("Bluetooth: hci_event: Fix sending MGMT_EV_DEVICE_FOUND for=
 invalid address")

These are commits

  522e9ed157e3 ("Bluetooth: l2cap: Check encryption key size on incoming co=
nnection")
  103308e50db9 ("Bluetooth: btnxpuart: Add an error message if FW dump trig=
ger fails")
  61a9c6e39c8d ("Bluetooth: btnxpuart: Revert baudrate change in nxp_shutdo=
wn")
  c174cd0945ad ("Bluetooth: increment TX timestamping tskey always for stre=
am sockets")
  e92900c9803f ("Bluetooth: qca: fix NV variant for one of WCN3950 SoCs")
  324dddea3210 ("Bluetooth: btrtl: Prevent potential NULL dereference")
  eb73b5a91572 ("Bluetooth: hci_event: Fix sending MGMT_EV_DEVICE_FOUND for=
 invalid address")

in the net tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/ED0qPeuG4IN8_ul_RRNBDwc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmf8fAgACgkQAVBC80lX
0GyzKQf+Oc/vd2mQ7oStG54WphvAu35f2bD4Vd2ozov/TVwNwdiDwtO+3xWTWlxZ
Tq3SCBZjZ8t/JSsA+FEW3edwm0tYtgX2/F51hArna6uhemZGzMqWWHs32QUP0eMr
JB+WWeyjDLdSPa32LbDDGj7y2uCg9z9Uo82xTxCcrmP/q4HsEIcvJ6uGZr2lUSZs
hpiLhsdygAi/jNcI3un9qEyg2TSL9JE83lK/ZmdY3PV9o6ssR0ARLr9v417l+HEJ
Iu10liDypGr2QAzU7dUkaOVT8rIUsqxV+/DqWSPYpyQez1Dvgl1oGb6gGotiPtEQ
r0F5jUbskk/SU0BSEoQgYuxmSaUrWA==
=WLg3
-----END PGP SIGNATURE-----

--Sig_/ED0qPeuG4IN8_ul_RRNBDwc--

