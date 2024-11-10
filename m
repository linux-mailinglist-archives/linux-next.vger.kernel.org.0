Return-Path: <linux-next+bounces-4723-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDCD9C34AB
	for <lists+linux-next@lfdr.de>; Sun, 10 Nov 2024 22:03:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 617F6282DC5
	for <lists+linux-next@lfdr.de>; Sun, 10 Nov 2024 21:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A9301531C2;
	Sun, 10 Nov 2024 21:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="uLG0/niA"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EA41428F3;
	Sun, 10 Nov 2024 21:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731272592; cv=none; b=lhKo4Do21So46Z6IpkAtpAHD/2PfuhO3zhYfsuUNqoB+jLS1ffBbeOWeiuacggVK4JWrKjACy07T6rwFHlbIulWcMum9LN3uLQp2zSq1Y6Jk+Fw3bV7ZPO7JntwjIGjM0+WIJywSLhskYSsfQc0mcDBPUWLX3RsWlHKJu5zuaVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731272592; c=relaxed/simple;
	bh=ILqtH6M/KDrLXFNAEd/l+FdmZWzWFYk+QlPMDrOOmH4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lNwzMyYZrZy99KfT7EEact1lc7LYDvuHqrqYw5i5Fe2k6xY5ojR8Gc2SWzusnK1ZptgS6MBTn4fLjlRM5mbCJfdfZIGXvpIe348I1HPdHlEQ9Kj++WLVQhVY8oX3q0TMyU5NgQFkHn+r4Vad3gDSr+F7f6pS2f8NTC3LhGvtXps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=uLG0/niA; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1731272584;
	bh=jF+0KS+HBap7O6Srm6X7rD9XclIA6lp7C+uo6Zv0eh0=;
	h=Date:From:To:Cc:Subject:From;
	b=uLG0/niAe2a8DrWzHA33X5rlQ7tvZdabwZruC78pX+yTR0QydbdwwfYW/nhWfi0X2
	 Rwk6b0gDtCJ0LMfYLmvh+lzSeAW46fIQsm5KSDaa3nJQtmauy6gzdLg7PxybiApYC6
	 wgg+kweji74g5k3I4ebeqzXmOae3/cfMtf2D8hLqDVetxRkttWBx60A0hgquamVhem
	 bJo/DskWmuz4DDz0pSXC0jEIodzysDdm0yxhN9BZixHr63XmECxjWKfWKrSBZAwgeU
	 rS0hD8mLjXJvPz2nKjWem/mHDpJIXR8cXuex06zPnfwEN7sKXkQ/uPDVc7vKo+GIlF
	 9qozHAo1NvWQw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XmlWX2MGHz4xDQ;
	Mon, 11 Nov 2024 08:03:04 +1100 (AEDT)
Date: Mon, 11 Nov 2024 08:03:06 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the v4l-dvb tree
Message-ID: <20241111080306.63eb2ea4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dQ=USKK131M=Z4kZtdXlUZp";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/dQ=USKK131M=Z4kZtdXlUZp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  bfe703ac0c9f ("media: dvb-core: add missing buffer index check")

This is commit

  fa88dc7db176 ("media: dvb-core: add missing buffer index check")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/dQ=USKK131M=Z4kZtdXlUZp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcxH4oACgkQAVBC80lX
0GzupQf+PmavADSKX4c7r2c5ayaKnct5dqqA+f5X/Jw+p2lg8OYewRc5J9XEEWnF
S0VHGpE+OXqz/F9ojuTU7mUDf1dzkZmcJYNPcKNPtvxMbjIypnVTukfhOxTR4HvW
9G2v3cOmPm5jyQQQeoc5FTBjNRd/PnLGBOegwoBkBtNmJrhZxaUhBsRKPEFNwh2W
iGyzAm7JVpxDFSyETj8Hbx++DXXEh60kQj7SxdAOPzkyI1stBu1TX+bSjxFzFZnT
9iDxNsvKbYaPgbNCRXbc7jSADnWyBRBadjO9KGO2CKtPNcoRPckSmYD1RWLjrcmG
EYs4YD6K5Sc+mCwls6IKlqxP75zG5w==
=QoU5
-----END PGP SIGNATURE-----

--Sig_/dQ=USKK131M=Z4kZtdXlUZp--

