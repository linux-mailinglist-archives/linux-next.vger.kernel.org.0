Return-Path: <linux-next+bounces-3349-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA339560B0
	for <lists+linux-next@lfdr.de>; Mon, 19 Aug 2024 03:01:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F4601C211C7
	for <lists+linux-next@lfdr.de>; Mon, 19 Aug 2024 01:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66D5B1946B;
	Mon, 19 Aug 2024 01:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="eJkxGoZ1"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE1EC125;
	Mon, 19 Aug 2024 01:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724029293; cv=none; b=ibqGmDdpi0QAw6kjisrVEskl6UWl36zGSU2j1HWkS47dzlsGShYlyVwHHYlzFHDlcQHKECdNyWvBdpCW2wTJppwMGtFruoJHrvyApixlunvsQw9VxnXGTuG6gYZEPbYYBdeIzDMOGxWT3yEnVJKLT5SK8ndEBs+wCOcqW2WNHpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724029293; c=relaxed/simple;
	bh=hkRdYAsfhYp/ybwn36K89qsl9iAZ9LkaxFYPIWH9rFA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=g1FkKAyfkjlqlCtkTfVxn5GvVg1Cc9vMg0RAI1VqEZPFDYkf9AyxTAag73xvH1ukked70roiDYOtaZVfdX5EIjHutPXtZAzqZigMn1dnuVelGTrYcGLq3o60KfY2J0RAxDF32HDBbloPUtS0EDcgIwjr68SMqrvxrOGZiWO5u9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=eJkxGoZ1; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724029287;
	bh=CFujByEHqumZxAAKyZWs2Zkb8YFd3SY4LYhYrhkhBUw=;
	h=Date:From:To:Cc:Subject:From;
	b=eJkxGoZ19jICufCzV92BQkNOuBRttmrv3VHyTGSW78UazOS4AzsgOql8JPcswMWFO
	 K76lpf6M0hrNG0CtuD4aBLsHKtdLKwTrMozlJidS5GwVbjAPPiluwx6QIWmr2KLCIJ
	 jIlOSwSc3w75Fvjw3/JjVTYCdPTm65A/unw553t2uuYqQNlvEe8jG1IC7nOkXsWjFH
	 orYDnfxJT/C1SdKAVSsuVhg9ldrIjldQISYvCksl4TF5AGvSt1sPQPyBIgRUjnI64+
	 +DZtCwK20bCAn3jorsap1oNYumdjM1P0CXnUFMtN18wS/GFS8KD6wzuCxnIZOl9Xri
	 /qn/mXkqsNGbQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WnDnM4m0Kz4x04;
	Mon, 19 Aug 2024 11:01:27 +1000 (AEST)
Date: Mon, 19 Aug 2024 11:01:26 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
 <johan.hedberg@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the bluetooth tree
Message-ID: <20240819110126.440e7031@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4CC0vWuXr71MOTNT23..fXC";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/4CC0vWuXr71MOTNT23..fXC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the net tree as different commits
(but the same patches):

  01bcdf3cfddb ("Bluetooth: SMP: Fix assumption of Central always being Ini=
tiator")
  7285ef081977 ("Bluetooth: MGMT: Add error handling to pair_device()")
  8ccaf1a2bf4a ("Bluetooth: HCI: Invert LE State quirk to be opt-out rather=
 then opt-in")
  96ddcf0e9e5b ("Bluetooth: hci_core: Fix LE quote calculation")

--=20
Cheers,
Stephen Rothwell

--Sig_/4CC0vWuXr71MOTNT23..fXC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbCmWYACgkQAVBC80lX
0Gz8Twf9FJzxdTi+JA1H5TlICLP3lom2ExDF39qzTALEg/ClyY+5myv4O816nsac
f/Hd4ZRxlKmZTIK8lafZpSu4H2g4LyQJWd+6QkuK9TIOLb8sZd7lgphkqRPcC3Gx
UaKLS+1oJKPqbKG3ekSrPPPCVEU5QZfvsaFQbhaNbkmdyEKqG5agqN2ORQ1TX6oq
CWHJgy9h0xbAQLemkIHNDYnyBCby8y5CA6x52qeAeHrjg7Jcmvn6WwwjULDE5zof
EyL3QCi3/wqtElBH0aGsAIYwo5By8oNiEMwyL3p24fNCRzavGoxddoFkH8Gz8UBs
e5cyWKDl2VPrqGYLmsW/So/YXbzvaQ==
=5wVX
-----END PGP SIGNATURE-----

--Sig_/4CC0vWuXr71MOTNT23..fXC--

