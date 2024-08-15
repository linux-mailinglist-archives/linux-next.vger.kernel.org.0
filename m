Return-Path: <linux-next+bounces-3335-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD146953D98
	for <lists+linux-next@lfdr.de>; Fri, 16 Aug 2024 00:55:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1E801C231EA
	for <lists+linux-next@lfdr.de>; Thu, 15 Aug 2024 22:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6769155726;
	Thu, 15 Aug 2024 22:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="f/F7kbDe"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757FF1553A6;
	Thu, 15 Aug 2024 22:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723762526; cv=none; b=KRmhw/3xicMFnl/DMmo20RIJGpquZ6OsAhavkaL3MD5YealpQVs0dbXW95UKCyhtZaMMBg3Ue15hB/7oHN5ORWGBQPkpPmnjHwUbJc+KW9/NN18jqnk2kn/6aEJ3gxBfoqvV7EUXm7xsM8/BGJVyi3C9i2+4a4+6YjTRVncORBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723762526; c=relaxed/simple;
	bh=1Jyp5/OjxDtn22/tb79SvoyuS6X/EKqqqlELdNt6Mms=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=bWIvFzLxpTMFrxrjqCzCtBGxtDB4Wy2Hr6DtWqS7xfxmRhKEDouvm2Ha/qdPNIIotnEWJ3nJF4KXMfz//mlVUWnM2q2d87qm4TmLlVPUGokpNpPNLzse4oDZhTu+WtJQ+LijXNpaRXGW2p5mByX4lIdcFUZx4teR/eqpvPdN7GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=f/F7kbDe; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1723762522;
	bh=Ecqf4pFlXsOSqx4HQNz2Upc09Q5giY1n0EvAfX41Cqk=;
	h=Date:From:To:Cc:Subject:From;
	b=f/F7kbDeJUNi0TIksfjLZQzhCG9R7kRzIdjlieFuhrBGRDVLH0y7ohumHjt5Hil8T
	 AGhMaXr3pqECe74eBqUIDi4u6D7zbsEE3EbJE76W4BIYhnSOIyM4jUgSGqsMP2qSzr
	 dBJw9/fSY/9KPjtA1Y9sBBCoBD0NT25mn/M/a11JQK6ckdJBHZ+58r9RhWS1IqpUkO
	 DMvyf5r3bEqgWuEQfLjPgwswZdhmUNMjuXJNho6MqOusHJbPF1n695Y4cA+EsJlKhi
	 LvNMBooYPtqsR327mzUJth5xGd0IUGnlSzUYnkjxDa0qZ4QAH/9r/0O78kk54MTTCt
	 tJCSZrizxguhA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WlL7G5jtCz4x04;
	Fri, 16 Aug 2024 08:55:22 +1000 (AEST)
Date: Fri, 16 Aug 2024 08:55:22 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the vfs-brauner tree
Message-ID: <20240816085522.29e1cda6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9=W2BwqbpWrRCd3R4Klrap0";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/9=W2BwqbpWrRCd3R4Klrap0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the vfs-brauner-fixes tree as a different
commit (but the same patch):

  8b30d568bd8d ("vfs: drop one lock trip in evict()")

--=20
Cheers,
Stephen Rothwell

--Sig_/9=W2BwqbpWrRCd3R4Klrap0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAma+h1oACgkQAVBC80lX
0GycnwgAn6XovHAgVFqdjbQZ8n+VdXbyILvPkZAWDWg0DGAobjFv9uc5jljFzrT0
ZfohU9HAaZcumD5PhYSfrAepRFxVcY184AvlnnNOvDjagqblBpYWtSHyT6NA1Oiy
YQHA0W1lwBWHQR/topatwJ1WP6mGXReour64Viy91/ZfM2K1Jkw6cxqZqPPZt665
OBpAM0Nnuy54gYG9WiUEsIUBv1CJTy21Y+u2QrYjiLs7dTigXEgoCSet1hzk+FKy
WydGHAmfaQ6st7TkXJ0MOlKvmupu5xn8CK7WQAG1h9fMP1oqzBeKi17USdSYYjuG
7aD5dprj5MjrX5BYUOd/lKXmWS1fDQ==
=+A9F
-----END PGP SIGNATURE-----

--Sig_/9=W2BwqbpWrRCd3R4Klrap0--

