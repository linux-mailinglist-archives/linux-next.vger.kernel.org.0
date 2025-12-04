Return-Path: <linux-next+bounces-9332-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B37CECA2A62
	for <lists+linux-next@lfdr.de>; Thu, 04 Dec 2025 08:36:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C3C8303EB89
	for <lists+linux-next@lfdr.de>; Thu,  4 Dec 2025 07:36:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 379DC2571DD;
	Thu,  4 Dec 2025 07:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="hMTKcPad"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC966231827;
	Thu,  4 Dec 2025 07:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764833810; cv=none; b=B72OSWroHFnCO035fu7XfC2VnW1X9XxZsZWuZ+/2pJz0lypois1DpjnQJ9jdDW/wzrxPNekF5riX/1AsD0sjN6fQDc3GvZhPMYWk4H7RoXOYG2gyMN+0JdrN0eFholJ8zIcxszbBNTpQU8vPjIrMYwduRXvK6hFUAjne6DTJaHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764833810; c=relaxed/simple;
	bh=RIto42qJ07VriqKhp6Ln/GzJzTTedJ+me2QONqI4Wyo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pDQkUDkYj4qTphCBfziwrTsqb864Z4zyBcAQJl3Sltu6gYz20IAsnEb36aSN71cZ7gBSeJLRSwJGlm9Enl+JWxdnUVtcQhzqWjeD23OE0RKWAIqlWQYedYmVppRLrJJtCMKiQL9T5Z+nolStkTyRAias7qJPx/69y4UNmE6E+Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=hMTKcPad; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764833805;
	bh=rMbsjZ03VTCEFAJQybi1VFz4L0IpCr49R4A8EzWdxU4=;
	h=Date:From:To:Cc:Subject:From;
	b=hMTKcPad1ui0aO49XmbeMm0+CY1dfdWGgez+Uw9o3MBWSU5RgEwrueUw3VVqo2Obd
	 iUu0IPvkWCBEZnn3IDI/VqspFvVG/Qw8Ch2Mjzg5KmqJUHleBz0fy77WuBVPBPuadr
	 T//mDJ22lrHPKTy2JaUoXsDdd5SduKtUwJmtRzOn6eTnafu4EeQtvBmQ79El9bU09Z
	 FHfsLR2MqZuhkhVvc2GXuoKIIRRDWegZlp5sf6wgoF09MGFP8eXV55S5OIGPA4iYnp
	 VXBvX4YJ8MIPJJAW2QBdrqmMDkuoH08pZBFb0y6e7HoY2b4b080erRXagdPnJ5vRsD
	 zEE/Ss5pEVSyw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dMRCd0zbPz4wBJ;
	Thu, 04 Dec 2025 18:36:45 +1100 (AEDT)
Date: Thu, 4 Dec 2025 18:36:44 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Trond Myklebust <trondmy@gmail.com>
Cc: Anna Schumaker <anna.schumaker@oracle.com>, Mike Snitzer
 <snitzer@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the nfs tree
Message-ID: <20251204183644.5757c050@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qVW9vSuqiiojFHNOc+8pe8o";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/qVW9vSuqiiojFHNOc+8pe8o
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  869b7402a7cb ("nfs/localio: fix regression due to out-of-order __put_cred=
")

Fixes tag

  Fixes: 86855311c117 ("nfs/localio: add refcounting for each iocb IO assoc=
iated with NFS pgio header")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: f2060bdc21d7 ("nfs/localio: add refcounting for each iocb IO associa=
ted with NFS pgio header")

--=20
Cheers,
Stephen Rothwell

--Sig_/qVW9vSuqiiojFHNOc+8pe8o
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkxOgwACgkQAVBC80lX
0GzICgf/S8B9qukLJALvP1W7zGseCbtGdMoUwtxysr1djbfo5IEkPz60ebnnd+pX
vqQDvgmuGT9foTxyMi7xHfSAGSxwuQ5abcV2IbFQbCTN2ttHOV+CvyZnptpBkZvr
clX6ZKmON6hVZePB3iGqbF2jY2kxHxMz4IUZMvWn6javdAgTgxy4GzQ4y25SAeh1
Tu9k8T7Zq3K2H0X8YE16juG30PFS1fOBZ1HwaaM4lgzjG25Lm6APhud0FRm5ETkZ
1iOMYQRshgCq7O18hN2zIvS+g4CiZLg27GxR618kT8JwIkjo9JDnZ4X/5Dio2vGq
E/Vzbj8CmtyfiiQxxzaukYeWG305Hw==
=mecv
-----END PGP SIGNATURE-----

--Sig_/qVW9vSuqiiojFHNOc+8pe8o--

