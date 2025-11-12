Return-Path: <linux-next+bounces-8943-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E008AC54D44
	for <lists+linux-next@lfdr.de>; Thu, 13 Nov 2025 00:45:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E4ABE347620
	for <lists+linux-next@lfdr.de>; Wed, 12 Nov 2025 23:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2EA62E8882;
	Wed, 12 Nov 2025 23:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="pjbg6FCa"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC40B247281;
	Wed, 12 Nov 2025 23:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762991097; cv=none; b=jOKzBuUPRBPWThOE9z2gxGM7IYTkheg9KzUGjjVsYZ9PoIKx/MYcpsP5BKKAwk9SNA9HQxlGlKY3bge+jSWLHowbZqzEjghOBh4xYqgzXOdnSSHSuCP9ILA9levVP7DxIEyFw0p6rtqS+JlwaSsASCh2tna9ULMZZ+yyKi2+w3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762991097; c=relaxed/simple;
	bh=KqqPmb0Yg0oJERas9ZGVuwURJQcyrSsGMeI99lFLQH4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SW6DB2L8lRcavDpVnUJt65c3uEXkouky09Kt87Ib62U3E9IZ2G5HYxCbG4WiqpZbirwigRcoXe8e0hHsQK0JbYcLGKMoO2XNC+GIzz3vSBoEsFl7u+hbTqT+sOhRSkYs/AF9kEs6hLzuKxuZeS3avwCyDUK0vcvi6mi4PgqOu6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=pjbg6FCa; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762991091;
	bh=3sZL979kE3k93TAuqsE/YmdfdFEAtbmc3/P3DZZdvMg=;
	h=Date:From:To:Cc:Subject:From;
	b=pjbg6FCawROnThYn4i09DcNEyDqSjZ5PspyTHbz6j3Qqrqg//eZYxocRKRChHwn1J
	 VBzic+JToE3nQifa04+x6C4EmbDSz9Qkd7LhkAYzmpRoxv32u7hMw1KrDsQ1WGcCif
	 3qY7gq9dP+oKdf0Rw0dmOFkTnV71dH/jsXSKQGcTwTcJiY131ZTW8CSFiRfUz/6Lqw
	 i8/WQaueFRn67ozjYsVHcp2RP3AMD3qVbr/r2MYRrKDqYJZQUB5TWL18He3qoEChU7
	 3YuupI/kaSu6bBCthZvxcL7G9fDfSW7iKQ9lU+MlAk4lUrWXOfSbdeTMdjilZknjBI
	 JSzOd7kaKqkIw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d6Kkp3jkBz4w8x;
	Thu, 13 Nov 2025 10:44:50 +1100 (AEDT)
Date: Thu, 13 Nov 2025 10:44:49 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
 <johan.hedberg@gmail.com>, David Miller <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the bluetooth tree
Message-ID: <20251113104449.2073bfa3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hAakLIODg4juT4T21.eVWjL";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/hAakLIODg4juT4T21.eVWjL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the net tree as different commits
(but the same patches):

  d6422a746fcd ("Bluetooth: btrtl: Avoid loading the config file on securit=
y chips")
  d3f4dfd9b4cc ("Bluetooth: hci_event: Fix not handling PA Sync Lost event")
  84f59de96cf0 ("Bluetooth: hci_conn: Fix not cleaning up PA_LINK connectio=
ns")
  fde5b271c88f ("Bluetooth: 6lowpan: add missing l2cap_chan_lock()")
  e1cd2d7db0bf ("Bluetooth: 6lowpan: Don't hold spin lock over sleeping fun=
ctions")
  35d11c1cf51d ("Bluetooth: L2CAP: export l2cap_chan_hold for modules")
  c7409a88d204 ("Bluetooth: 6lowpan: fix BDADDR_LE vs ADDR_LE_DEV address t=
ype confusion")
  7de8dc9b760c ("Bluetooth: 6lowpan: reset link-local header on ipv6 recv p=
ath")
  162d88a68ccb ("Bluetooth: btusb: reorder cleanup in btusb_disconnect to a=
void UAF")
  2747d9296177 ("Bluetooth: MGMT: cancel mesh send timer when hdev removed")

These are commits

  cd8dbd9ef600 ("Bluetooth: btrtl: Avoid loading the config file on securit=
y chips")
  485e0626e587 ("Bluetooth: hci_event: Fix not handling PA Sync Lost event")
  41bf23338a50 ("Bluetooth: hci_conn: Fix not cleaning up PA_LINK connectio=
ns")
  15f32cabf426 ("Bluetooth: 6lowpan: add missing l2cap_chan_lock()")
  98454bc812f3 ("Bluetooth: 6lowpan: Don't hold spin lock over sleeping fun=
ctions")
  e060088db0bd ("Bluetooth: L2CAP: export l2cap_chan_hold for modules")
  b454505bf57a ("Bluetooth: 6lowpan: fix BDADDR_LE vs ADDR_LE_DEV address t=
ype confusion")
  3b78f5091827 ("Bluetooth: 6lowpan: reset link-local header on ipv6 recv p=
ath")
  23d22f2f7176 ("Bluetooth: btusb: reorder cleanup in btusb_disconnect to a=
void UAF")
  55fb52ffdd62 ("Bluetooth: MGMT: cancel mesh send timer when hdev removed")

in the net tree.

These are causing at least one conflict in include/net/bluetooth/hci.h .

--=20
Cheers,
Stephen Rothwell

--Sig_/hAakLIODg4juT4T21.eVWjL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkVG/EACgkQAVBC80lX
0GxEyQf+LpBPP/Ql/msq2PbbaphGO9QhF8fgYHQiRiPcRT/FoAfducwfbBEfREMl
0C2/evwc6Q2f40IaH0mKnJYaZ/uIZAuU62yQsGq3UD3rgut/HtKMqtm2OavBOZem
Pdm5HaHEMYDPmf+hUWeAd8IqS4VXH/PMMa/2dkV8+BFFcxgkxITg14314u/1QeVd
037Wuz2ttQ//kq/BcReII0bnxAntRBjfkzSEbIgsQF0nGVWUuOByd12IpCqD4q3m
3dQGAbBgVUi8sD/wpcZou5j+CN54XDkEIFxlWaL4Liq95jOapYQoiUVHsvg3Dx4y
9idXR71mzorVDu3UFxTsBiJgTxVOTw==
=K6bF
-----END PGP SIGNATURE-----

--Sig_/hAakLIODg4juT4T21.eVWjL--

