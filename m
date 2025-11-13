Return-Path: <linux-next+bounces-8964-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BD3C5A48B
	for <lists+linux-next@lfdr.de>; Thu, 13 Nov 2025 23:12:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93E813A7F42
	for <lists+linux-next@lfdr.de>; Thu, 13 Nov 2025 22:07:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DD43322523;
	Thu, 13 Nov 2025 22:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="psWlYHmp"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE9131A04E;
	Thu, 13 Nov 2025 22:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763071637; cv=none; b=JCB8f/RZ1xW6axw5mTRB5Q4nD+P4d8kW/rUGO77ONmsFkRtu4M3Sxif/nfW0wabJinlaz3g1zpc2dkH6RMCyVyiAUtwfLZR74ZYXPjIMLddKKtMzS4J+cz1EhdJj4UsDtUyxEu124hmTuk2gsRNFIETx9o6Gl6RZOkYfpkh0sCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763071637; c=relaxed/simple;
	bh=ZWXKPWEGog6aCmRb0C3P2t0p2TXuWgSuQU/4FGC6aXM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FEnQ9KzP0v5UA0ypr4D2PMpEkPlARCBLEtfvtUdz+ejY3PhhE/EZxkLW1b4fFIFdVjIjLEyuF0an+kwqrWA4yJLSiw7UAcLNfOihZGsFvdetU/2Q1JkDxnksaXS0W45rsGPneTST4K0alISGiOydrG1LljOzgLFGaBRZpzCO0Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=psWlYHmp; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763071633;
	bh=TFxxo20GXfgBVOlQxT/tjezOsIkYsHsGzCpOyhgZgyo=;
	h=Date:From:To:Cc:Subject:From;
	b=psWlYHmp9jLZaw5rGLdOM/A0HGRQUGFf6P5KEbULYnZKKg5ItfkL5r9CwsdE6hqv0
	 cExp+P6WS8rvADe7uoNg3BYYoi+Shwu4OhfHx/GyQCes+A3Z3zJwqXwguGtEJ36Z/m
	 L3lATYc2+Ubps7LnCcQC7cB/VXYTdefhMQ6AFTn3zSzacxBueBiOU9Pi/nvXrlP2jn
	 pW35cFdQyVyyWg22k+B23AmXPgDnmsIemcK/PMb24JrAz+5T7eeZqfYqrRmcieUbep
	 kdv/WDcq38xdILWv3bUIc1Bc3Fud6RwKtAVE7kbMEJK0RK3zXkZyNLRQlhYpCsPxG3
	 K9huSFrx8xhmA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d6vWj0Cjgz4w9R;
	Fri, 14 Nov 2025 09:07:12 +1100 (AEDT)
Date: Fri, 14 Nov 2025 09:07:12 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jens Axboe <axboe@kernel.dk>
Cc: Damien Le Moal <dlemoal@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the block tree
Message-ID: <20251114090712.31a33529@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nWiE=W_mEEHh/Mw8g_yKVGW";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/nWiE=W_mEEHh/Mw8g_yKVGW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  881880b6f307 ("block: fix NULL pointer dereference in disk_report_zones()=
")

Fixes tag

  Fixes: 2284eec5053d ("block: introduce blkdev_get_zone_info()")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: f2284eec5053 ("block: introduce blkdev_get_zone_info()")

--=20
Cheers,
Stephen Rothwell

--Sig_/nWiE=W_mEEHh/Mw8g_yKVGW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkWVpAACgkQAVBC80lX
0GwqYwf/R6yN8fE5bB5D0GofNf8n/o05jesWITaPYsllGPueB021cBf9C09hcgHU
CzOLd7XMSIv6djoVeZUjunCgv5SiEMjfp5+C2RxotJJscl4aPxa5VzFAPZm1YVcG
afTQrvN+zjMF0hnKBQ50fjEIYCDyKP89x2Gl/0pkjhGXYzpB6fdASYolShUj1Muo
kIv2CX8K1hMS5xb8DW59Jr71XYQeOZ+2AHrprW9Hqc9UhZdi6UC3Y6vPX9beBZD5
nHWwQaede62fEuk008hFfbSf26ky4O8ZbNhHNvSWxH6GSXfueRqfOZxusAvNJvo8
MJy7e66vK3qChPnF3KNJmu/rcx1trA==
=DBVM
-----END PGP SIGNATURE-----

--Sig_/nWiE=W_mEEHh/Mw8g_yKVGW--

