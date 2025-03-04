Return-Path: <linux-next+bounces-5641-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E144A4EF4D
	for <lists+linux-next@lfdr.de>; Tue,  4 Mar 2025 22:19:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CA421729C9
	for <lists+linux-next@lfdr.de>; Tue,  4 Mar 2025 21:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45D01202F8D;
	Tue,  4 Mar 2025 21:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="cxQDVDs0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D2B42AAF;
	Tue,  4 Mar 2025 21:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741123136; cv=none; b=N+Oytkjja80m9zSpKn+BJQcGKOJeCZbiT9jDK4VpZG0kLqsYPsHZUrRCjTNBOjtqCqhSWuZoiDbolyhgb+I7RDDx4Yo0uPL1mT4XOJOMzZVpotlvmx697aZ9BQrfkZiegQRLgI7L6bbh+GssjAaWjIpZjyThu2FAp/DDoyLMh/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741123136; c=relaxed/simple;
	bh=AzJUr29Vb/g/ONtu+stDA7K2X/Y7sJl2D+LA2zgMqJw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=POBGFXp9KMFtsXbAh4r8bkAg3V95KnmveSx/1wXzlAPhKy0TehlNXx0sS/YpP/MuR9lCVLJFL3RkgdAMrS8U/Zx11EE+Zbv2kKq9w4XANav0sy76Rw0XmzR9R2XWmSoPS95XdUCRlkfT+99+sG2IHMMLu7v8yYkjCRoF/686piw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=cxQDVDs0; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741123129;
	bh=ZOZV7PQq7LpOKHuzyq+rk1zxKQLdyN9tUCZcLHIl18I=;
	h=Date:From:To:Cc:Subject:From;
	b=cxQDVDs0G8YAciBCDwP6gjoSQ4EuI5LfrlU2G8Vmcdu6MF81Pzmu9uAulowtOD1Ae
	 yuVrsJczXBFczLBo2O/IxveoH/sMwpzt/c9Dozpmb1ijsASsSk0BZnHCy7orAsN/YL
	 rb3cRB+cC5dbYIPOSdxEnvLTh8X+t9hhzvuhEoH0oMs2hHxB67FjVXLBdn+PhfwkpB
	 doHWKWY+Z8StCPC9gznZOo6sCRopSfI7dJ06sWAXTxDoQ/nEoW6N9KWiWIvLKVGVeH
	 jSOgBR9576tN2ouHMZT2McHLPUGNsLoNDjJVrFnCTthu4ckx4TwAwEhs2VGL+nhQFY
	 kUXOaLcpKuCSQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z6pT508Pgz4wcw;
	Wed,  5 Mar 2025 08:18:48 +1100 (AEDT)
Date: Wed, 5 Mar 2025 08:18:48 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires
 <benjamin.tissoires@redhat.com>
Cc: Tomasz =?UTF-8?B?UGFrdcWCYQ==?= <tomasz.pakula.oficjalny@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the hid tree
Message-ID: <20250305081848.4f3023e9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ifSJV46aY/lY305b1AB+X/T";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ifSJV46aY/lY305b1AB+X/T
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  e2fa0bdf08a7 ("HID: pidff: Fix set_device_control()")
  f98ecedbeca3 ("HID: pidff: Fix 90 degrees direction name North -> East")

are missing a Signed-off-by from their authors.

--=20
Cheers,
Stephen Rothwell

--Sig_/ifSJV46aY/lY305b1AB+X/T
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfHbjgACgkQAVBC80lX
0Gz9HAf/Wcsin4ruwqpRLWNvvnbkzhpCd8vE9Pp2wiKl0UM9Jbbkrl8ZlgVZdPb1
D03i2TDGo2gLHcHBub2WcpukfHjCVEe6HNLCKHnNYLZUPze6rfNJyw+gf2BS8LlS
fUbUwKG8OkxaEjlrArgYDjw9pDwoWi0D9WYPgQLc721JXcoo89B8dQbb1hVsEDy6
bjvmEZSZTk3iud8xNjejSTFV4FZub39oTB4ynQWsAQv7Yt9WD6bfkBogbaicb/KJ
CJfRsBmitTXEutJkfdwyjUn4xalCPoTRi1J9CZD3zvqbaWJgp6+XX1G6mFU9nJQA
s42sbJmQCBBVIIFbakDqYhCmy5g5RA==
=TCMm
-----END PGP SIGNATURE-----

--Sig_/ifSJV46aY/lY305b1AB+X/T--

