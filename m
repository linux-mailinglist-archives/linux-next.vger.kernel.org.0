Return-Path: <linux-next+bounces-6413-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5018AA9EE1C
	for <lists+linux-next@lfdr.de>; Mon, 28 Apr 2025 12:39:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E51C17CCA8
	for <lists+linux-next@lfdr.de>; Mon, 28 Apr 2025 10:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A7A025DCF5;
	Mon, 28 Apr 2025 10:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="n9A2Aq2h"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F4A38F9C;
	Mon, 28 Apr 2025 10:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745836792; cv=none; b=VVdpa4pXkBvWSu0dR35db5DiYkWPpCma3uYI9ETxe1xAmV4NYPY2YEPG5uQr03pe0tleZb/Kypd1Ygn0aiPkxNRPHQyBZEesIR1HcI/fJ8gFaabMja619yng0grNOKRKuDmsKiQITvUERzLDQzhCeM20pRQ7dYnK7cOU8STACf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745836792; c=relaxed/simple;
	bh=o0ugUElhtzi4mDPakapnZlKEjEHXVD5/Lj9xvWJvslk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=USVdlSybYGhdnIdnzr3bQQj9KtW7QgYMt029k1qzDSTGqafYmthrNbCperAPmddCzFdkou58TJsNBeJBuN3N7qBkk1QrFm+mKWxymIOdokq2wsCfe78gsjeMmJbsTztmfsksdraq7F4bWqzPf5AMieQLlkUjka6luS0MTTHETgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=n9A2Aq2h; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745836785;
	bh=o0ugUElhtzi4mDPakapnZlKEjEHXVD5/Lj9xvWJvslk=;
	h=Date:From:To:Cc:Subject:From;
	b=n9A2Aq2hfdpR3K03lG9yQfluvFoDbYqM8szThzOX6pu4L/w4jvXv4ThQJzQ5NjGCf
	 Y1n46PE9NthquD0WxUcHGIneUqKsfyeZpKqCwEI4uWfPLKXEEfQErhYJYm215cZXbH
	 FP6PXMmkpifgoDAU6d6JVaYpBKpvmC8KN699Ffp012dwNgOC2a/6MBC6joujWKZRSo
	 EcfPOkHoDQCI3cMSHyP8bbbvgu46c2p3P8JDgfUgR8JYXrltUr1O8eBGTrRa5Sr5FE
	 7/82C1VbLWTMJqNHHiUVTZ8fd/c1FpnhFtKprdRueVeOhMbYP1nVJ2CaIe2n+NjvR2
	 RzsWkedS18B3Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZmKhK0l2hz4wj2;
	Mon, 28 Apr 2025 20:39:45 +1000 (AEST)
Date: Mon, 28 Apr 2025 20:39:43 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andreas Hindborg <a.hindborg@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Danilo Krummrich <dakr@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the rust-xarray tree
Message-ID: <20250428203943.51dd39d5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wBBwTJKS+U3MH+tQ=lqWmxG";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/wBBwTJKS+U3MH+tQ=lqWmxG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the rust-xarray tree, today's linux-next build (x86_64
allmodconfig) failed like this:


I don't know what caused this, but it is presumably an interaction
between this tree and the mm-unstable and drm-nova trees.

I have dropped the rust-xarray tree for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/wBBwTJKS+U3MH+tQ=lqWmxG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgPWu8ACgkQAVBC80lX
0Gx+FAf+MGVQWcNjetkaLJrRtqI9KQ9RYs/yB9Mc0+saf9BgmHmVwWCl8AL2kKWH
Lwdt31JzdssAUTTndOcdquFtqI39eBsqUPM9PABlpeh3LHX02v21+cEPDNdu3mBR
a45775mNjJY7LGeZd6PTIfEV3abBX0QgecB6JjXuO0qB8OLFktaOAloSwqlf55Vt
N1k+SB3GvINhxTuRseD4u+FI6TcPi/MjjnzM1qivcCru5t0+C1KUxAqfe2BpvkDS
Tz51xw8np3S35rZKbn6xuum69SXw0csm0bHqRYEYiWNW4ziWkFrgVFV+bHybp+5r
XuAigBaFhoPxByk1fMjV1ELFRA7dAA==
=thNZ
-----END PGP SIGNATURE-----

--Sig_/wBBwTJKS+U3MH+tQ=lqWmxG--

