Return-Path: <linux-next+bounces-2853-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEF592AEE1
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 05:55:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 846951F22318
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 03:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3538A3CF65;
	Tue,  9 Jul 2024 03:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="O2qtJHuO"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F175442078;
	Tue,  9 Jul 2024 03:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720497331; cv=none; b=u9GbNpak0DrHfV1CR95xCnieBJqA2Drq30nh8b44i5IHEDwamQC8DEiFksJ77QXqa85O+6zoZTRrwbAutmqUrrAe1LLOBBMdv6CoaDDbH7PTAgm7XuYUDT7ocyes9q5D7EhWTEutqq1p+eqWYK7Gur+955WI0r3OilRUFSgg/x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720497331; c=relaxed/simple;
	bh=mPbd4CzRRhIaPy7kOQuC6wG9OxlGMG+Gm18ZXI9RaQM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KmFCH3sECKBds2AaVn4mW6ifOicEp3mmsOt5SJjU1UbsvBTKpGD2rbLpr6Y6b+ai8em1m0LAuhUH/vrfY3XeYwkgQZgADKj8V4ZxsjD/f5rzbv71lXgwtEDr3uToJfCfF9JjFFVYsmb0p9wwPEcKjw6blLEQkPCrjatsM30cn14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=O2qtJHuO; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720497325;
	bh=J67GnzhImmRUw3myv3nMmNcQaeYDRROyP4CftbTPBbA=;
	h=Date:From:To:Cc:Subject:From;
	b=O2qtJHuOkD1j15+H1aRyBM5bEUqaWJXmPegdJYRUI9NAbqdwSz/Bk27XAxZu8LCBD
	 VIGIMQ9C3021lHBZySU6ZXzoPQt5TtsdMxw4v1T2ndo0NgSdALh9NnXNt1o6NiFN6b
	 TwVlEN7ja6wv6bBM2ge3FF1Ig9pBKlYgSm9pK5C/yvGIjpaoMLdslZqhwIldOF0WwD
	 SPdgj2suGmt9wsGp+iFeftV0DwSndiO4vpGh+DjMiWj0c+7oSPVtHlLkQafvfhk6gx
	 qnGjqAg5+VSRiibZUUMxtShy1gLcI3nIjGqATeX69uAOTrj4KQd9F0gWgidHkfX8gR
	 i2e/ebMzHfq8A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WJ6b137TMz4w2S;
	Tue,  9 Jul 2024 13:55:25 +1000 (AEST)
Date: Tue, 9 Jul 2024 13:55:23 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the random tree
Message-ID: <20240709135523.29112dba@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NgulIbg9v7KAUMEI9qBs7nr";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/NgulIbg9v7KAUMEI9qBs7nr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  868680ffba11 ("selftests/vDSO: remove duplicate compiler invocations from=
 Makefile")
  7bb79ef48b9d ("selftests/vDSO: remove partially duplicated "all:" target =
in Makefile")
  14cd1a877fc6 ("selftests/vDSO: fix clang build errors and warnings")

are missing a Signed-off-by from their committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/NgulIbg9v7KAUMEI9qBs7nr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaMtKsACgkQAVBC80lX
0GwLUwf7BQYUsuAtXbnXjy3p97mMwcREp31LB57m0oqar7mClszXFCFuuLARRngf
iqj+TD7DflD42VrVlL0NstTFYtsen+QbOfKlNlbX/kC2fpfCryKF40EaTAlWWThC
rnuDA58Bkfm3LtIXIBPOT1xnCgm36OE8Z0ESLqVa09zbvoa9988CtUUi9h3EdM64
6HtNSD5m2CMmBBAgZnshBxm9Vb4lAlgS+7w6nLRsSlXEMHpPB72HM5ZdsuVfb/dt
CtR528vPu2UIJmb8rA6ke8L5NejRiT4l5lFg9MG9cD0cXA3RD0kXJYtUHlG38ilI
l8wPcO8TtNDfYWW7ux5WsScF5uGBXg==
=c1MV
-----END PGP SIGNATURE-----

--Sig_/NgulIbg9v7KAUMEI9qBs7nr--

