Return-Path: <linux-next+bounces-2835-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BF2929E2C
	for <lists+linux-next@lfdr.de>; Mon,  8 Jul 2024 10:20:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 324C51C21C1C
	for <lists+linux-next@lfdr.de>; Mon,  8 Jul 2024 08:20:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAD2B24B26;
	Mon,  8 Jul 2024 08:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="GESB/u6F"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B628A2F2E;
	Mon,  8 Jul 2024 08:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720426829; cv=none; b=cZQkzJ7h/2k0X9UbYnwC1rL2Zmk/milCWT/UrjrDAMLdBBvKGnKdtQQ/XIm2QmuuyBTcDImAKPMvXBJCw0kHN2XSAXZYQb07mhSIo43vzPHdFXOfyrHp4/wKClhz6NGvzV7yz1L0qe0OwCyOyEYmGulm2CduMuuwqUWTqS0eGAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720426829; c=relaxed/simple;
	bh=ZQXA+LK7Kz1RVNL3/xiLr4QZlg5mI99hARSwXjB+SP8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hw1nH81oM1TLJpPROxwb6lrP7ZAq/XqXI6d2kES+XpZdO1C2N43gpdeXR4KxXG0Kf/c5fh0Z+0OPVnhND/mQHI22i3BlCil+ITnJ3K30zNjDWPPcq1UAhvwQOsFQuNkqmBaISwD5DS7IMhpAl/0Koq5zxTKSz86BM5E1IGqpFPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=GESB/u6F; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720426826;
	bh=UxFrdZVfKTEW0ZdGoiqsMKCXYsm4uo+y3fpQX60KMhI=;
	h=Date:From:To:Cc:Subject:From;
	b=GESB/u6FfIGUYPHg3N4BRWtMLl/QF5B4LcKUAHBoOOHRmXSwMuhgwbpg2GGMqI5A4
	 Mn4xJXX6cRJqjWPF1MuTb6wHH1hGPr3rcbOsAUMvCvl3qFzPpZ3rP81OStsOik2da1
	 bl2JMVpYutcQeyKVI55ZACMef99H+BiT8M2kLlrcQExjvm1XuKqsigTYn2GqZMusVi
	 0K/uYb6CkvgXLdcNN1jxdXLko6GHHqrkCwzw8xGgzkeFC6OnvC/gkEFpE6JqT6eZIV
	 8KT531BbwSn/hIAhHD3a0Q+xNCynfesTWj/u3ew3rYrsOokSa6JkhYVEXiMEtrg1Kq
	 pKHuyjfU+8Z8g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WHcWF6jzPz4xPg;
	Mon,  8 Jul 2024 18:20:25 +1000 (AEST)
Date: Mon, 8 Jul 2024 18:20:25 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alasdair G Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>
Cc: Mikulas Patocka <mpatocka@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the device-mapper
 tree
Message-ID: <20240708182025.5f2e36cf@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/C=M/=V/LxVEbhYbRow/JYQh";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/C=M/=V/LxVEbhYbRow/JYQh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  eb5f088474c7 ("dm vdo indexer: use swap() instead of open coding it")
  feb0cdc1d47d ("dm vdo: remove unused struct 'uds_attribute'")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/C=M/=V/LxVEbhYbRow/JYQh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaLoUkACgkQAVBC80lX
0GyfTgf/TP7m1ZoHzbhMXFTXyQhJ/Bi8IzsP/peqnFYc2tH/bL+uxvRNsBI+x43j
kxTH3m/VdBkAgTjNv6uC3r/2mvKau0t9hyh188dIid7SrZ1QLB0FtrxwgwlTtx+n
eDOAxzCjetdShqJtcPgrQJc7whTOGVS5gJ4YeP3+P1d/kK8kg2MKDmohXwDpTGCL
HrBh9miLSTgI7ynTlkFET01netvJ9lwCXvJhmoo+Z/kt8u45YIF02SjqlAojjNXH
XmUo2+Osq2T3SmQc7FOH3F7URcFVlw8H1tJF21RkMxnRTCiGJbKZ5tI2/O10B6yA
U9rvBqCruhPzghHEEQyqPCVmthbFcw==
=qVbp
-----END PGP SIGNATURE-----

--Sig_/C=M/=V/LxVEbhYbRow/JYQh--

