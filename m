Return-Path: <linux-next+bounces-6448-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B9456AA4119
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 04:44:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E29E9A554E
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 02:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AF2D1C7005;
	Wed, 30 Apr 2025 02:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="C7naWY54"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1601C5F10;
	Wed, 30 Apr 2025 02:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745981081; cv=none; b=ITZEybG8DUm+HqCRUvGnPY/zJ8Z2bRwDoUs3Qx6w0eIdvFkY+93aTiMfD1jFLeJ5jWTS6CCkCxT1H2sk6EmB/OU/DqUPqd6UXVUSkJ+kJuYseDUDivcvx13RpGG938f0wictQQRtzN2yj/bhWSeJuCWKF0Z1G1H/SX8m54hjAIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745981081; c=relaxed/simple;
	bh=J+J35anbmnrnMyVjMxvi3WhdrFRIMNrtrGsd33Rriz4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XfAf3KZRNpKdJR1jhV7VIvVrAaoofkdG30KxFgu3QyN8r9aimTtFcxGrMz4RwCScf9+bDL0UjK9jWylEXoDFKhwh1jo77G5DY1qVwBHJmFcJ8z+nyYKP60Y6KFnfQQ4GeIOaPgKPmznzGPEFzsfCbiWQfF7wGpcjOKKKG9b/b2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=C7naWY54; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745981075;
	bh=3wqzx6kzxn2d3pLgU76Ab9T5xbNZ4uAOQwc26w5fXzE=;
	h=Date:From:To:Cc:Subject:From;
	b=C7naWY54bCQ0idAKSZPQDjdJbCmS4nVLoPK1o1s7l6v/9L37QOcUWD3GsLp25GLAA
	 1sZ28go6O3OvFAsjo2ZdhshC5OiL+jNLSIa4We9YT4sUi09cxZbHeuO8pOhNpUXCqD
	 YOJtrm59XfGCUdOzGZfrUyw+Y6OsOzggawHHJm0fBILuYAQjGwAEwC3E0WA7cYmHew
	 Vv/hszy7PujAZR+vFWhuy1f8RcoP03T1VQykFUqfo0SM2FNI+vu0Ws+OxyAk8tJYW2
	 +IQWZ6h3REkVbjV8YwyVJFWv9NYHb9MU5y3iAB7OP9MPMsrHf9EVU9kVhzs11ReN6g
	 lexF1is3mWz4A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZnM361fPkz4wcr;
	Wed, 30 Apr 2025 12:44:34 +1000 (AEST)
Date: Wed, 30 Apr 2025 12:44:33 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
 <johan.hedberg@gmail.com>, David Miller <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the bluetooth tree
Message-ID: <20250430124433.6b432a10@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+=FxjpuO3HXJl_P+.ZmgCqM";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/+=FxjpuO3HXJl_P+.ZmgCqM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the net tree as different commits
(but the same patches):

  60b82ca5d6bc ("Bluetooth: L2CAP: copy RX timestamp to new fragments")
  ac1f44f12090 ("Bluetooth: btintel_pcie: Add additional to checks to clear=
 TX/RX paths")
  e0af21b30c82 ("Bluetooth: btmtksdio: Do close if SDIO card removed withou=
t close")
  04c96a7ace25 ("Bluetooth: btmtksdio: Check function enabled before doing =
close")
  a9d1f7313df5 ("Bluetooth: btusb: avoid NULL pointer dereference in skb_de=
queue()")
  16b4f97defef ("Bluetooth: btintel_pcie: Avoid redundant buffer allocation=
")
  c3b6a7cfa98c ("Bluetooth: hci_conn: Fix not setting timeout for BIG Creat=
e Sync")
  58ddd115fe06 ("Bluetooth: hci_conn: Fix not setting conn_timeout for Broa=
dcast Receiver")

These are commits

  3908feb1bd7f ("Bluetooth: L2CAP: copy RX timestamp to new fragments")
  1c7664957e4e ("Bluetooth: btintel_pcie: Add additional to checks to clear=
 TX/RX paths")
  0b6d58bc6ea8 ("Bluetooth: btmtksdio: Do close if SDIO card removed withou=
t close")
  07e90048e356 ("Bluetooth: btmtksdio: Check function enabled before doing =
close")
  0317b033abcd ("Bluetooth: btusb: avoid NULL pointer dereference in skb_de=
queue()")
  d1af1f02ef86 ("Bluetooth: btintel_pcie: Avoid redundant buffer allocation=
")
  024421cf3992 ("Bluetooth: hci_conn: Fix not setting timeout for BIG Creat=
e Sync")
  6d0417e4e1cf ("Bluetooth: hci_conn: Fix not setting conn_timeout for Broa=
dcast Receiver")

in the net tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/+=FxjpuO3HXJl_P+.ZmgCqM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgRjpEACgkQAVBC80lX
0Gy81wf+N2Mlxf8oHs+Tkwv2gbJ6l12mOduR7SubPnIwWDDYknVR9zBipr5nd951
Sl/KHPgtGq4g6UkWUpE9ttc8Y1BzZlufu6JjOdG4XnkZYyZC8gv5BkqKp2T32CzK
FDEx91I+7WjH+m05HlG5GcTXMJufFUtbQKSkRLhgth5MrnbgOP90GDknGn1tZzo0
cWZvcsyQZ9YySZNVMXAENYTjiOZ5PUm9EJ0ckPOvAJUPu+rDoJTHRhi5tSK3deei
LbiKE4sg/6Ao8NngWIE90ZNbxTYnoFLammxhSIqdodX3AlXjmsMtiagPwmaSAfGp
/a+u7eNoJN/trgNiWvwgFsAFPoX/9Q==
=0301
-----END PGP SIGNATURE-----

--Sig_/+=FxjpuO3HXJl_P+.ZmgCqM--

