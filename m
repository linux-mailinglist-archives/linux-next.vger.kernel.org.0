Return-Path: <linux-next+bounces-4004-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F75A9898EC
	for <lists+linux-next@lfdr.de>; Mon, 30 Sep 2024 03:19:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 413431C211C0
	for <lists+linux-next@lfdr.de>; Mon, 30 Sep 2024 01:19:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF27AF9DF;
	Mon, 30 Sep 2024 01:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="s46HyWnK"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5148A2F30;
	Mon, 30 Sep 2024 01:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727659137; cv=none; b=etLsUgTr+lTzT4oWRhzTZgAbU4wdS2zfuNJrDSprhjdcM6Cg3wtBQx7RHI48UX2W0O462eUJWRYBbpKizIR/Tm6PhF23+R2fXGecpZgteJn0421ghVD7hhscqdYS1sLW0o7+5Leo+XqicsCEEnzJXD2xlHJv5D3+ZyungNZ71oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727659137; c=relaxed/simple;
	bh=U9n8XTV277nLBjpDiMnmvf4MWzQxzHAw7LLCngVHIxU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=AeO67KMxopceAAWmRePQB9k4gLD/cowun+H06F8P8ftnBeTOgrHHqBPllfXsueVhumdA8pAxoWmv7f1yo6uudxw/A/3W2v75u3lbASx/Io75gTC27SE5kDVJs5iwiniHPFXbizmfso/mCIX93FYT+1z0UHz5X2Cp+ApWPXxH/Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=s46HyWnK; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1727659130;
	bh=QluYZPVxSoa3hBsCuWcJZrZ8oOIxonhv+zsAfubSKX4=;
	h=Date:From:To:Cc:Subject:From;
	b=s46HyWnKKPylsm3phKgH3SR98FOd2JABSoH6h9GXn40q5lxibfd5QTwbDFn+bMJ5T
	 ghJsxHPNvo/luAHgPcwfe3bOgh7Kdmuoj5nJIZ0huUb5JC3ye/Memcm7WLP72AFof6
	 ECkqQIobkU3oOAxJlWwkZF2qQkdPgCRQPduH/3YIw8wMiBDnrL8gTPBwH0yaegjMz1
	 PlR8sV+8++UuvX+epjrgEOH2R44G0EP5u/Yf8ml5yDdWaT44TGMzmQNcb+2OMY0Od2
	 x1/dRDjwq2UVHHD5AIffHE5MmHT00e6Ne17054nNDLtJEXW5wuTAgstojSU63YngBb
	 RCI5/aJF5P53g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XH3B15Hzxz4wbv;
	Mon, 30 Sep 2024 11:18:49 +1000 (AEST)
Date: Mon, 30 Sep 2024 11:18:49 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Alexander Aring
 <alex.aring@gmail.com>, Stefan Schmidt <stefan@datenfreihafen.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the wpan-next tree
Message-ID: <20240930111849.09fa7c9a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/w2WOznnLAN_gf_Dh=w3gPn7";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/w2WOznnLAN_gf_Dh=w3gPn7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the wpan tree as a different commit
(but the same patch):

  ace2b5331355 ("net: ieee802154: mcr20a: Use IRQF_NO_AUTOEN flag in reques=
t_ir
q()")

This is commit

  09573b1cc76e ("net: ieee802154: mcr20a: Use IRQF_NO_AUTOEN flag in reques=
t_irq()")

in the wpan tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/w2WOznnLAN_gf_Dh=w3gPn7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmb5/HkACgkQAVBC80lX
0GyCYAf7Ba/GdNY3Panhx7POXWXNOddiDOGT9GUofs7VfX4Bk+kjeWsFVeQN9+8F
IUBFFsYHg39Kh88bOxdt/r1qUsSvQY8v8G7mb9wQainoyI9iHDYNjjrNzdMP1j2Y
FDTIFY5p5mwUlMLC4q/HSIbacmf1aSbW0iqMccC2Aqh3wCHWi44ObWd+7EPqdu4b
C2konP3Y8tSXNI9RIUisWdCU6w2GP9z3CGWWJCy6ZQLY3t3/i4KFnvbvc9K7/LNW
LAYwwAISNedpIo6yKZc8pfCd5yZBlXABqPu35rMlAz3fLpti4ZH9TpS1QqGGzrq1
OYrt1uK6caUGAYR7VQk2BpjyCRU+wQ==
=vMWa
-----END PGP SIGNATURE-----

--Sig_/w2WOznnLAN_gf_Dh=w3gPn7--

