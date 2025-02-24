Return-Path: <linux-next+bounces-5537-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B8725A41347
	for <lists+linux-next@lfdr.de>; Mon, 24 Feb 2025 03:17:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A339016A504
	for <lists+linux-next@lfdr.de>; Mon, 24 Feb 2025 02:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C81B2B9A5;
	Mon, 24 Feb 2025 02:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="PKAXxAg5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E6B4A1D;
	Mon, 24 Feb 2025 02:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740363451; cv=none; b=OvcYB+lacpVEHnfWxBnYGn3IX1vjHh3wgDSaIkzmgJCwR+bohZYIs1uZ0Sl9eC4eX6T43PEdoaQz8koaN6rC2X7cq0xhBHJKB4eOq+qZUdM4/z2OaDOgz2UVECxdAka2LaXOqoD6kxsqMn+D6XWKdZsFqQbCIM7COV65N727/wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740363451; c=relaxed/simple;
	bh=tgG2P8UhUYLgFEY9nLp1PIXBbGTZVN4KJP3DJfE7n2A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=cJbaftrB5k8E/b0JB498wibf67kDR4TeWzTSn4YBViytTLPxynBxtn4DihTotviDnJQNTlIQYhHUct32CAd0wnhBhXIaTH6wwilWH59dA8urbtlHCkMZk1gTKF1upSl6WR2zCoMt2eT7i1To87okjxBdPKgjvMXAj+U3CScLCpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=PKAXxAg5; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740363445;
	bh=JstdTH7nzAAXg36O5wRnVAOFiuKCDOPbMBnHrd3Px6k=;
	h=Date:From:To:Cc:Subject:From;
	b=PKAXxAg539sXm7OziZBj8mmWM8ov9UorRT/bsc4pFiYu5MrprEYdm+StTZk80Btng
	 xKmnAVmikGbCy5cM1N7lWfTNUYQBrPmuqam8WNPIyyKPs/TYQVU+RZtCdMFcXKZ2YD
	 chgwNm7MdOfk/7D6grsh4SR+Kg6kU6gRCGgCFAyVR/EjxFqRQCFPiV9S9QPvdPWYCV
	 a/8vJHxZukywnFImxzFzdzR8CNOFvuXu/Jdk9p4nZD6FyuYoqjI32voN0p2YKypKov
	 XUy+2wEhuzpfys8t2yDZfDGMk4unXEnZcsicJRxYjgcdTxOwRGoiut/CbL5JwzFmMS
	 ywZA1Z2qGv7Vg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z1PWm6sNLz4wbR;
	Mon, 24 Feb 2025 13:17:24 +1100 (AEDT)
Date: Mon, 24 Feb 2025 13:17:24 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
 <johan.hedberg@gmail.com>, David Miller <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the bluetooth tree
Message-ID: <20250224131724.3041d38c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gDrUxv88XNURJTnne+.ghVX";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/gDrUxv88XNURJTnne+.ghVX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the net tree as different commits
(but the same patches):

  2a509818ec2d ("Bluetooth: L2CAP: Fix L2CAP_ECRED_CONN_RSP response")
  980d6e2904df ("Bluetooth: Always allow SCO packets for user channel")

These are commits

  b25120e1d5f2 ("Bluetooth: L2CAP: Fix L2CAP_ECRED_CONN_RSP response")
  bd30e8d7bfa6 ("Bluetooth: Always allow SCO packets for user channel")

in the net tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/gDrUxv88XNURJTnne+.ghVX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAme71rQACgkQAVBC80lX
0Gwp6AgAjdYNUZnJ53fEsb8D9f3gJlmte0nuVRbq6tyahdQ/4zXHxbL1oMsLQW+T
ssBMVkk6IsF0E7lY+a+iJsHpWKlNgrX09qxBfPBIT0bnkuu4bZIKDAjnM9IJu6qY
r04Bv6/RbwbzL88Z2mBOcNEY29dp00s1gcr7xgnKSPsMgnJTEUBNhuwzGEvLHLig
Uyq7UcYt/++ip8ksBqAjhIcWUlEJYeeIEk1tzGSZx+kFWaS1eOhANObghWngA4JR
z3+c2Cn7jt2DtL8wrzCUkgPyr5g3VDMc+mjupsIU1HAdHA3qSM0m5j7LNca2DBJK
tBOOMpXEAh+H3XPFJddcGBjRN0nU7g==
=lyxX
-----END PGP SIGNATURE-----

--Sig_/gDrUxv88XNURJTnne+.ghVX--

