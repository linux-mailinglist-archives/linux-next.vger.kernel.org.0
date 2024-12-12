Return-Path: <linux-next+bounces-4946-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 913D19EDE12
	for <lists+linux-next@lfdr.de>; Thu, 12 Dec 2024 05:03:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B6BF282CA1
	for <lists+linux-next@lfdr.de>; Thu, 12 Dec 2024 04:03:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E5751799B;
	Thu, 12 Dec 2024 04:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="C9bhDiIs"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9172E257D;
	Thu, 12 Dec 2024 04:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733976207; cv=none; b=uJBMej5mUO53hLk3nu0yLo5xbL+JVXYK6xctTW1GGt5D7Il5CToos/GKJ82koMov8ZFDVC/nmiCu7YA3hNUfuKlNKbm1AJRFtrf6ixi4a0JcmTM5CKQcHDU1FU04exmVwW4+epZkKpQuBut6gSMSRKxu/yDJmggWcNHKodU7EeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733976207; c=relaxed/simple;
	bh=pRu7+YyUW1DP/oxgnsxHWFCldfM2ZzSgGJNQfizADXg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qtdTxNFFUL3Cw8p46Ke+AFN/M0BrKvSUlgONwDyDMdULRWk2JaGroJq05hTbeIlyTfklR8r2ni/kq4KdIeufaiBODnnIHva3bD6+2qRiUYMOzIRxn2MFHCXYze1QONEvXEbwuoF1e4f8jIV5jG6Farfvy9f/aEYsPEXICKWoof0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=C9bhDiIs; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1733976190;
	bh=EHrcy0IZLJYTb3yGifhCQwGcMkuSe09xwGQWvHbQWzU=;
	h=Date:From:To:Cc:Subject:From;
	b=C9bhDiIsaHJ2pf7shIknxDpbImO179bgJ9Z82vZSVGa4IzJ1wBe8lX+I9Act59Ri5
	 irRVsf0hLkd02GHRCbksq/zT3ocwaFmsjwDfMkiCCPru+ck/AUxLYHhNsEjn/afODO
	 Rb/dpnT8whdZ2USAQlWLvRrYz7hVfDXEhG4QoqH57HkLnEjqp8XZNEcnH2WIUqqmCs
	 KMmx6/dE717Dai5z9t4m29Ix4dVsG79/4Ip5mmJacBWbGcrl8wdNYxx8dR/AAFdavo
	 nNyiMeYKd/n3An514l0IyA6K5EMk8zKHcj1OE/LEj/F90JSKnesvACqOB2/G5b9qmK
	 pW1iZukCFw52A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Y7zMy2hVqz4x5m;
	Thu, 12 Dec 2024 15:03:10 +1100 (AEDT)
Date: Thu, 12 Dec 2024 15:03:13 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the kthread tree
Message-ID: <20241212150313.100c1fab@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9+TdeWweX6e32ShTnuaCxFV";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/9+TdeWweX6e32ShTnuaCxFV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kthread tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/arch/arm64/asymmetric-32bit.rst:158: WARNING: Title underline=
 too short.

NOHZ FULL
--------

Introduced by commit

  7c41f66ca472 ("arm64: Exclude nohz_full CPUs from 32bits el0 support")

--=20
Cheers,
Stephen Rothwell

--Sig_/9+TdeWweX6e32ShTnuaCxFV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdaYIEACgkQAVBC80lX
0Gz5EQgAnjH4OpG7mCvnBORIKGJVo6xSJCILzsYxZJbyg9EEu5VuYpgXaLQF9Qme
cBw1pY9V5MlMaaPAjMvF5FQP8I++Yg1D/099xoHf3Mz7EkuDOBsMNTpE6PYu+L7T
qa1j26n/6VhJp90GtUNgIwvFSY+ejy1XqKAEojsXZ0gg/meXuMq4kLeYyyW5nI7H
rSMNGaFjEzvL0TLUrAL/Qq3OggCBgl8bMSB8SM1grq3dn1sW+oDy4y/CLnBcpTBx
LqOj8wkCQOdmQib7WcUjUa0ZOXJmYSBAcwPJX1GzoTOzvKUbZkpKG59r/0JgB+eE
97AitD0hq8QpZ70gGzpIkOQtjHVi2A==
=tIha
-----END PGP SIGNATURE-----

--Sig_/9+TdeWweX6e32ShTnuaCxFV--

