Return-Path: <linux-next+bounces-4346-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C079A5A9A
	for <lists+linux-next@lfdr.de>; Mon, 21 Oct 2024 08:43:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F18331F212D5
	for <lists+linux-next@lfdr.de>; Mon, 21 Oct 2024 06:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D75FD1CF5C1;
	Mon, 21 Oct 2024 06:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="NXSAa544"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53EF1CF291;
	Mon, 21 Oct 2024 06:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729493027; cv=none; b=NURKJ6TQ0xRylOvsR47O1erliugDI3myH5JfBdnbJCO1nkf+eMjwZ33nftN0hTe+AQ0WN5QcWZW7SHQaIta8gJLXTOFd/g7mv4VPgB1dOie2A2uPBUjIGoHY9R8pIWDaFzPe8QfLaXNDZSrkLz8pyQWYm7U0xnePdTeSe+5b2zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729493027; c=relaxed/simple;
	bh=iIy9tvDqESmR/9IhUdnSu6yGwysbOBrSKaadvYLnPiM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=QF6nLVKXJaeA4Hme2Gz+geoDRmAO4+jjWvoWlxdpLSbxCfGuIIAKiZR4sdiU7JDE5wbNZ9TP6cDug6lywgXxPZnwvMgVgkFhfohZBBbOXhz8u0p3mkNRXYQ9Sg7HqjjW9gypcT7POZ566+so7VqP+0z/itiGKf1spS7mY0AxjxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=NXSAa544; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729493021;
	bh=r7x5svYwRhENMfZdZsJYlLqJmUwgRUnm9x6Qe0wW/fo=;
	h=Date:From:To:Cc:Subject:From;
	b=NXSAa544yhezsnSvWDYtLSFbwX9/r6uaJSsVlE9X4Vu08XAp4VeFn076DaOeCHgGB
	 tILcosyFpZmYpBpEb2PckANuL/ze2QMbOpI49XY8xOj7ooQeY2YKwnobfwGDWztpPD
	 jTUXQEu8TndHY3ah3HOhSan50ZHHoqpF+abBRO842uuDvrIMHQkLckG+ZeZ0BDEh5z
	 SInzwcCsaKmNCYyXNm6ncU6n5lHP/Pc83pF9Z01LLu6h1MNlOLzLhM7OdjRbiaIdIO
	 EeQ86FyFGK0ZwFu176zhr+1ZqABwp+NCl4qWeGN5RR3geM5k5ikytF0Qsl9TrH7elW
	 OCzZ3aglfuCEA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XX5P93fDVz4w2R;
	Mon, 21 Oct 2024 17:43:41 +1100 (AEDT)
Date: Mon, 21 Oct 2024 17:43:41 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
 <johan.hedberg@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the bluetooth tree
Message-ID: <20241021174341.413de31a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aJig132AMbXY02BlmeHnz0s";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/aJig132AMbXY02BlmeHnz0s
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  b29d4ac72975 ("Bluetooth: btusb: Fix regression with fake CSR controllers=
 0a12:0001")
  c444fd3ff73a ("Bluetooth: bnep: fix wild-memory-access in proto_unregiste=
r")
  a2ce7481010a ("Bluetooth: btusb: Fix not being able to reconnect after su=
spend")
  dac9e8edebeb ("Bluetooth: Remove debugfs directory on module init failure=
")
  d1e168910fcc ("Bluetooth: Call iso_exit() on module unload")
  d990b50fd7b8 ("Bluetooth: ISO: Fix multiple init when debugfs is disabled=
")

These are commits

  2c1dda2acc41 ("Bluetooth: btusb: Fix regression with fake CSR controllers=
 0a12:0001")
  64a90991ba8d ("Bluetooth: bnep: fix wild-memory-access in proto_unregiste=
r")
  4084286151fc ("Bluetooth: btusb: Fix not being able to reconnect after su=
spend")
  1db4564f101b ("Bluetooth: Remove debugfs directory on module init failure=
")
  d458cd1221e9 ("Bluetooth: Call iso_exit() on module unload")
  a9b7b535ba19 ("Bluetooth: ISO: Fix multiple init when debugfs is disabled=
")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/aJig132AMbXY02BlmeHnz0s
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcV+B0ACgkQAVBC80lX
0GzCKggAiKH4WoSbdBmSm5T+kw4O6rtvcJfU6h2NCvOs/YAv/Ndsh9D2YSJGtVFs
H/1fL4AdCdSAQGzSoNj7pOGvBt3rnaE6/cN/bUDxYB6bNI78R1cYx43QH4U0WQt2
k46my+CPcaM489PKh0wX1MEVKQMIYEN5UCVVdMkUAw+pnocvfq/mF2+Bw4qVpUNB
lPXYsA2QmduOcWIip/S9r/2/aVofy+P0khMKp3KtzZstyDD9ce3ztYCmNc99Mg0g
uvzS+D0Dz7X7VtUU2YWnB6svprL7qYGB+nvmOM44lAUgAazWZsZ0EDoc2pzP4RDC
Q/sHmJRJoSAqSxGRzEUx3A35L34LVQ==
=zH5R
-----END PGP SIGNATURE-----

--Sig_/aJig132AMbXY02BlmeHnz0s--

