Return-Path: <linux-next+bounces-3145-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3138F93EA2D
	for <lists+linux-next@lfdr.de>; Mon, 29 Jul 2024 01:57:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9FEE1F216EC
	for <lists+linux-next@lfdr.de>; Sun, 28 Jul 2024 23:57:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4418C6F079;
	Sun, 28 Jul 2024 23:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="REhnDuyv"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0844B79F9;
	Sun, 28 Jul 2024 23:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722211022; cv=none; b=UEAHnfxs1vF1BbtjM3W8MMMU9MMyE49MD2BokgcvJDPymPJUw5bw6LARveCv8WsbzBFA0KMmrolfEp+dW0ml+Ypby/Kq3/lzWOB8curlTybj7Uo/5TpPScisyT+8oTZ81gxH3IapAm6fTBmKHbPI2keIcUayRBbPG/m4tEs3SsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722211022; c=relaxed/simple;
	bh=eygwsaw7PTf96Qus9GPxc+Y6P4QadJ8e5eO2VQt4CjI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=TzvZACwiEjqCI77FrxqCK4XIpAArj9cg0EB2NutqUrnGk4O24luNVH35iTKBP6SeNgIR3oJNggLBbd0cT2qnkq6lgRSlZy5DKAHYn7tL3xKhJ6hYJGtaQUwOPWchT0ySQfFAKJPt3ZlmmELgy4f36hKOfmmIgY9ejBA//dKvB4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=REhnDuyv; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1722211014;
	bh=2fyD/b9DJwq82E/3b+UP3kj4qc9PoQTKTEDFL71sfsU=;
	h=Date:From:To:Cc:Subject:From;
	b=REhnDuyv7PbJJB7ubrAMh1y4bBnRzpKTROn3jd9csJh0qdMgx33iJW/S67Upd9aYO
	 ZPDUGNqswylO2DoejqhMF8uAdbqYsNbe2P0nMOnonnNWcJINpzfYNw4x20XALR0BnW
	 3QuM6Ja/v3Pe6JR0c+U6WAqKLJWtLwmDmcRQrarrOzJR4U+8A3cumzjwWVoAGr6pPs
	 zgSLkhD8BXdeU0vWFSm8/ByoNtby20OpEEryfTBGfZkOv/0vgqAmHPixiQazLtVBk0
	 lSiyq5UIxrghom4UJHw448sJqgqNW1cbEhjIZ52Wn9gOgxsgxNSd1WCTVbD6ulSKoR
	 2Uc/d71vXH45Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WXJLY2ntPz4wcK;
	Mon, 29 Jul 2024 09:56:53 +1000 (AEST)
Date: Mon, 29 Jul 2024 09:56:52 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
 <johan.hedberg@gmail.com>, David Miller <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the bluetooth tree
Message-ID: <20240729095652.383afcc1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hu+gE6374MzZCcVZ6Pyu9Xq";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/hu+gE6374MzZCcVZ6Pyu9Xq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the net tree as different commits
(but the same patches):

  0c9b6e2f7742 ("Bluetooth: btmtk: Fix kernel crash when entering btmtk_usb=
_suspend")
  0f6bd069a04a ("Bluetooth: btmtk: Fix btmtk.c undefined reference build er=
ror harder")
  3a493d96e81c ("Bluetooth: btmtk: remove #ifdef around declarations")
  52828ea60dfd ("Bluetooth: btmtk: Fix btmtk.c undefined reference build er=
ror")
  54dd4796336d ("Bluetooth: hci_sync: Fix suspending with wrong filter poli=
cy")
  7a27b0ac58ab ("Bluetooth: hci_event: Fix setting DISCOVERY_FINDING for pa=
ssive scanning")
  e0b0a863028e ("Bluetooth: btintel: Fail setup on error")

--=20
Cheers,
Stephen Rothwell

--Sig_/hu+gE6374MzZCcVZ6Pyu9Xq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmam2sQACgkQAVBC80lX
0GyWRQf/TR/R8e8gukcHu4CC6sS9/7482NejmCaLi5Akkmmhx/o3EGuNtrcRtWQF
coTG6CGGJ6epg8tZfktBNXlCmoC694Bh4SOfzGkCiL0gU3X2qinRaCUpdK6N4oXS
UV4DQoSyQ3kosEWT3gl2U4R9yhLIKrdTg9OFqDJPBxwae0tqsVpb/VJMFyuNh1PY
kpBAU2b9je0JMdaDHGLYYLEFl1xUDBbqd1HKQQQmwU8Q8ehrF8JY4ZUT6CJ08O77
F9oi9v2xUZvnDTgZeU10tGM6O10xVvXB2gR8da13moyvKSrumSEQK8sA8V2vGVjU
i8ShS7/HLtS0uHsEpssCrh77o738/A==
=P1Dz
-----END PGP SIGNATURE-----

--Sig_/hu+gE6374MzZCcVZ6Pyu9Xq--

