Return-Path: <linux-next+bounces-4783-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8249C7F8F
	for <lists+linux-next@lfdr.de>; Thu, 14 Nov 2024 01:54:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43E8EB2288F
	for <lists+linux-next@lfdr.de>; Thu, 14 Nov 2024 00:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D651F9DF;
	Thu, 14 Nov 2024 00:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="t/ZVPvYD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E83A95C;
	Thu, 14 Nov 2024 00:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731545657; cv=none; b=lbpWTx8l5ffXo6ncJ3lUvx/HqIjLLP8/xAXmQXfGDsdirwRf6X0piZtzx0Lzyy8YUTv1BToS5ZK4LFf8Mt5lwHxYG67U+8tgAJlS1q87O0B7d0s/LTQlqPCQKJ74iS6eJ5mLVJS1OrvVC5XOBYATq7sryidu7DaB5QnaovvDL4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731545657; c=relaxed/simple;
	bh=6OsCMySZMXTfbfCGigvTngMt0xTkdTTh8En4b1SpV7s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jiH9Ode9TqzsDQ92YgSrqt5j+VMnu+AkdLKVKXvR6CM2/ngGj4FGc0uUVHUFptAXKz0TktxYbTa1l4M/JxN+VsTq3+WqfIZeHegycQ+1c9u6T2qCdqTMvO416P/NTdVFuZ2170NRUd3D1NAYjCBWdaBq9tlr9fFspg/HgddXGpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=t/ZVPvYD; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1731545648;
	bh=Est7Jd/umgaPi4Irnjp40gTsq2m9dPL9FvCvPpw97pI=;
	h=Date:From:To:Cc:Subject:From;
	b=t/ZVPvYDoCzxTgcWtOSiQPy1vbtTMDfRwlUh8UKqcT0givycOK0rKqcrH+YVzzUzZ
	 9bzr+G4ZZAM42GiwGe0fPtxUMmNWVfOGBhj1E7a7VvLa6mZ2ddYwIOQW4A8R/DFnDA
	 3PEvMrpNaK4XF4ZIcLDGgD7ghLzXamG6tsBpOvt3cLStFclXoSxyEkyZztK9q3+9Sr
	 xqsIU6CkzULIJR3g7jlV1go91nVSndMDz1QYkJA6sKifDH0HOOZ/8ZFh+fbipYNMeu
	 C7LWDwJH6xfjnzIOcd8bJBfQY5OyKF8nPZ3zoADOlJiYnQgHNMBAIQIZ8UIF/OTNfu
	 I4FRtRDcVxGzA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XphVl6QP2z4wZx;
	Thu, 14 Nov 2024 11:54:07 +1100 (AEDT)
Date: Thu, 14 Nov 2024 11:54:09 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
 <johan.hedberg@gmail.com>, David Miller <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the bluetooth tree
Message-ID: <20241114115409.1a897078@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Bolq64Gm5jYHzcUnyNyOZtr";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Bolq64Gm5jYHzcUnyNyOZtr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the net tree as different commits
(but the same patches):

  e88b020190bf ("Bluetooth: btintel: Direct exception event to bluetooth st=
ack")
  48adce305dc6 ("Bluetooth: hci_core: Fix calling mgmt_device_connected")

These are commits

  d5359a7f583a ("Bluetooth: btintel: Direct exception event to bluetooth st=
ack")
  7967dc8f797f ("Bluetooth: hci_core: Fix calling mgmt_device_connected")

in the net tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Bolq64Gm5jYHzcUnyNyOZtr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmc1SjEACgkQAVBC80lX
0GyyVAf+JtQJ2CPaGtaijoSwXdUvLXLVMH5rcmC52YHZqBfubo2LS6tytJapf2Mp
MbtS+olEm/zq0V5zzuLIkc+wSfS5L6paeHkS/Vhv4Vohy/ZtJ9WyxCtI3D80+QuN
LQ/xTT1zvIauYr9aTzx8ClgfnXS6RCLtF9KoqiLGeNP7lWYcJekXusDJIYpzAM5W
lKzAVCnsc3zyWNwgNSQHhjE8sCH7MSXJDDIX18WIjFVyTkSBKB4BwiLpQz0ZwWSJ
2Le7tucmyyb6qcvMZ0gUWJOXnSfZCawyLX17GVJIxBfVj2ZmS9IggAtae4h/w5FO
j5aC0JrmdHx33kIJxKLdUjXGMFMl8A==
=QVRx
-----END PGP SIGNATURE-----

--Sig_/Bolq64Gm5jYHzcUnyNyOZtr--

