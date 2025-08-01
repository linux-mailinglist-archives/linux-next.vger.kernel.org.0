Return-Path: <linux-next+bounces-7800-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A33B17ACC
	for <lists+linux-next@lfdr.de>; Fri,  1 Aug 2025 03:27:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 512B15453FD
	for <lists+linux-next@lfdr.de>; Fri,  1 Aug 2025 01:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1897473451;
	Fri,  1 Aug 2025 01:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WvRCfGKr"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA0E1367;
	Fri,  1 Aug 2025 01:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754011658; cv=none; b=HZ1IYwqj/b1+7zV2BLddjB2d3F86srxGnO6Cosn7VU+DGqxS3SUqFMRFzvC5ud1nimnY3u4we/3XiVSmdKhhs9vQBfFhZg85T1gdqJeqSe7yMEHWdJ+MbmFIJwO+sSBOrCbI0qVnjTcxs+p6jtm1QG2LKlDoSQoQHI0hL8sUeB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754011658; c=relaxed/simple;
	bh=E7Pq1tfzDn1DX2qk4TdCUESV6I5vkIHbCzSWupbxk5k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=a6q9fC1n2rQn9t4ErrRID62dc+O0soXm0noDFyS/ne5u0PZu3r0nFj4FozknvE3CLzr4QftU9KmZExJyBKbFHQ/w8aGMpN0ZCf6aB/Ll4fBxbJpNm0++uNcK3aOZly/rDZZo+hTEDNsrhHeT4KCT956JCa02FjtFjeplwfqoFUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=WvRCfGKr; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1754011420;
	bh=tzi8CRdHjB6GYkq6UEUNBLadk7kFJhuZCDgo78OJcF4=;
	h=Date:From:To:Cc:Subject:From;
	b=WvRCfGKryzOUXmHsVym7hNeSYxrIzoDAGzYoYuv7HtI+WcpKu8thNpQCLqDykZloI
	 trlhF0w+2/C/dxpUh+kbBIQwo3Dsx2GWSE65F9j7z79cdeISvZxk8UW0bNljppav/D
	 ZuBR3KdGzsx3ofLhVfiSjPJHF/+QYH4j/JWeep605oc1Iq6bxXEXCfGS78K30S5VTL
	 DRCnv7eezVvzYr4TPD0wlSzq1P7EeviawOkqGBIdxpt8OLn9tvW+oNbwuc4TDVQ4MO
	 C/LLs1ShQAa4VOIxCca106Pl007tpT+w4qR/8ty8ehE211a0GRdL9ScApTARtJn9bE
	 mQPoFpxJb7c2A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4btSrr2Fpmz4wcn;
	Fri,  1 Aug 2025 11:23:40 +1000 (AEST)
Date: Fri, 1 Aug 2025 11:27:27 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Yury Norov <yury.norov@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the bitmap tree
Message-ID: <20250801112727.17d6e604@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4h95.4JV5Df/dPvOLXmvyDh";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/4h95.4JV5Df/dPvOLXmvyDh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

(all the commits in the bitmap tree)

The tree seems to have been rebased for no good reason.  Please clean
it up.

--=20
Cheers,
Stephen Rothwell

--Sig_/4h95.4JV5Df/dPvOLXmvyDh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiMF/8ACgkQAVBC80lX
0GzxNwf9E5S5GQfC3QXFC2kDcXCyCKQEhDkQTsl5D2q7c4T/85pNP7fOFGJ0T7l4
giitqp6DOO4B9e4iinxx9ZrgPvvRzCRElT1D8MkJJQ+zcsl80D8S+SBdpqJM/HeC
VErsH88RWoqzL5XS0mgD5+dR2X2QE+j5EjsN7xxTaef8n1mOcbTapNalPcHMXO8u
5m+z84C5pu+JjfNSHFinr7ddU2OS1Fh+Ndrmg5Fe1cHgJompmx4R4nZwkI7PS38N
279w+iWgO5HhknlKEoidG9Xsjm+7uzUx7HJmxIOusoXe2YooNak1RgnWL5cP803i
Xqf8Lvp6goa6k5Br4eW0MhFcAwLaoA==
=HJun
-----END PGP SIGNATURE-----

--Sig_/4h95.4JV5Df/dPvOLXmvyDh--

