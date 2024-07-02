Return-Path: <linux-next+bounces-2784-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 05ACC91ECCF
	for <lists+linux-next@lfdr.de>; Tue,  2 Jul 2024 03:47:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9530DB22337
	for <lists+linux-next@lfdr.de>; Tue,  2 Jul 2024 01:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A8F06FCB;
	Tue,  2 Jul 2024 01:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="snYI0/s7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBD3D50F;
	Tue,  2 Jul 2024 01:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719884851; cv=none; b=mgEtko10NIqKEWb/GGkXopHQUuoRD9TW4++QGywtxwvFmii6fe0OCCSxxpqUlsqvj0snooTW2+i5XLujvGDcJ+7FzmWIoSConsAIyadH8VLQwmDb2OdgUZAWogwGFTbr1qumShvxynAXRLcjdaEIw1dtmBYtg7wz4GdZDn6TURo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719884851; c=relaxed/simple;
	bh=fwlcg6dEyMc8yGRWPwYC4+SljPTyA9WzUDlvhLQIbVU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=HfE5dp5rZ4n3TeY4i4yo3nD/M4zY9OWiRRrfo4GjGj78mnr8AYwxhS2T84S9oncuwpkakO5z2c7Dhc4BdGUGzwLeZB3qC+sXq4q2dkSrE/lmCqjx48WygG39+Dr7F+aV5/by7PEIGW+4N8f8rzD1jG6v3GgXOa9A8ZMtR8MPH/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=snYI0/s7; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1719884847;
	bh=Y0VeOVGinzsoUo7LfqsNT0OHxwnaSA3c73pop37eSfw=;
	h=Date:From:To:Cc:Subject:From;
	b=snYI0/s7vsr+rHTfvxC2IBNGJzq+fViewwoRasGd4Nd2wZt9NvgfG0lx2hbsNrsyX
	 NuuynLEL1TT7ky2pKr8cjMinNsdi6bFRE+ZQ9+tIotzHChG+SDIvrGXEy8BgML1rlu
	 x0+0cImOGQqpAwy3xw1VCEv3waHTUJP+FZ0GpSUx4sb+Tq8dQ/t/a8ItLIZt8PA5rO
	 l93qmCDTSzKUMDh4XWYGHjCH9kfYhZ3aNBbmxYmR3oiJ55aXwTKwRQNtynCd1ep00n
	 o2kpumJQR/VLby/hRFX+ungimEjBhJHRcY7uhb7o2jA10vG+DBNuKLu5A8H7JEfhHp
	 SVUxfMl6VJrmw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WCm4b0Nkzz4wcC;
	Tue,  2 Jul 2024 11:47:26 +1000 (AEST)
Date: Tue, 2 Jul 2024 11:47:26 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
 <johan.hedberg@gmail.com>, David Miller <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the bluetooth tree
Message-ID: <20240702114726.633aca60@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Qj7fGcZi7uf2osEz8RBPq_v";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Qj7fGcZi7uf2osEz8RBPq_v
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the net tree (I think - I didn;t check
them all) as different commits (but the same patches):

  1754e2144739 ("Bluetooth: hci_core: cancel all works upon hci_unregister_=
dev()")
  1fc73da90b52 ("bluetooth/hci: disallow setting handle bigger than HCI_CON=
N_HANDLE_MAX")
  39a92a55be13 ("bluetooth/l2cap: sync sock recv cb and release")
  48bdb4085485 ("Bluetooth: hci_event: Fix setting of unicast qos interval")
  4b5e8d5635bd ("Bluetooth: Add quirk to ignore reserved PHY bits in LE Ext=
ended Adv Report")
  7274f7479942 ("Bluetooth: hci_bcm4377: Fix msgid release")
  7bc60457138b ("Bluetooth: btintel_pcie: Fix REVERSE_INULL issue reported =
by coverity")
  94a60402b1c1 ("Bluetooth: Ignore too large handle values in BIG")
  bafd12aba679 ("Bluetooth: btnxpuart: Enable Power Save feature on startup=
")
  c54bcd8a2f9c ("Bluetooth: ISO: Check socket flag instead of hcon")
  f305a9bafe14 ("Bluetooth: qca: Fix BT enable failure again for QCA6390 af=
ter warm reboot")

--=20
Cheers,
Stephen Rothwell

--Sig_/Qj7fGcZi7uf2osEz8RBPq_v
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaDXC4ACgkQAVBC80lX
0GwVjgf9GvD/5LjeQotK4YvpgIshkbjS4VqgiH6vZwRneBaVOEVObyfJO5SUrA47
8ILAX4iwdhkc5zojBTBxZa284ShZDVnFZSvwz6DCsatDv9bAbApdYxnJAVdmX+GN
SK+1rpMufJYI1XKp0Adv1q0GKvbE3lZr58Pyr0EXZGYDAVMBGcYIH5oyLx488q2q
9oC66q8fXMOCLgPXDU5BPCgipvKmDpJEMGDqrCBOYz4joC+GLVv4BNfWggkNEqTt
WIHzYzOaKgrtkpjMAcweX0f0zRtx2KBmZMCr9SB/vu1tOwVXHNHU1CqeLvSpOBM2
TdQy/yEx55jYA++8T1YC313lxt4jXQ==
=ySEs
-----END PGP SIGNATURE-----

--Sig_/Qj7fGcZi7uf2osEz8RBPq_v--

