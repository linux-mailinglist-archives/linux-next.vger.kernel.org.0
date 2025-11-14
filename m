Return-Path: <linux-next+bounces-8979-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4066EC5B348
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 04:44:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A7A0A4E7FD2
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 03:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D717F266565;
	Fri, 14 Nov 2025 03:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="bxQiKHP7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE7125D1E6;
	Fri, 14 Nov 2025 03:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763091773; cv=none; b=kwEydVNaWx3ck3jPiPmm/ZURN6a4nxHrwpXR/q4xIXiF1Hrj1WhNOckwpfYqjMN+HOR8eleBC3Ieo8Z/7qVCmxA3mU4qY0wIpHkAb4Xa+qxpDEjxmtcub+knSAtN2ULk1k6PNoSLV/zHi051dzqwCdgJwRjWcXhgvIdBwcPwfe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763091773; c=relaxed/simple;
	bh=jiNdOp5H4umisUQaxdIOXrZqGjF0SxAvlp6bhEN2nvY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=owrp81qOyAeM0WkI3objTQ1KFW2YADlAJh8uAW2ROXWOlEWQZrqErrhnr5ENh7GDSvHg1NxJLPunpBSMBfC5wLI5eby9NRhev0hzVwiMW8QS64+TWFxhj7ZheVfzm7OWADSHG4Bhw7nz2jWrhdDpfL2KtJP1kSsZRPKGwqi2JD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=bxQiKHP7; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763091763;
	bh=Z7ltZ6SCpA8A0jT21gpuPIjkIpQ9471RU/QFrL7ocbY=;
	h=Date:From:To:Cc:Subject:From;
	b=bxQiKHP7y5PRDK+r46QmHVPs2Py+jP9buZlrvJe0AlN4axESA4eZWdkG/pjCpGV3U
	 wO3AofSJhsaeJ0JgecdjrU2esbgA4R3yJ9lO0it5mjeedJFS6SWTJMIgmqD4gksPnL
	 v26gpCft5fDIqPjlcitdrou2cTAc+7JVV5jMNUc+/oLDSJxnJjWxQhdIlLlY2Je+oX
	 3GKid2dpk46v6vV7+s+MSWWTpvq40o3nDgcz7fODLRcf++O2xMT8k9RF3CHnJ7r+te
	 pUJVtkKgRUQ7ej+BbuGhjzQFkvCqC9v3uNF/fiqGwGqZzGtzbFzpmZNSZrhVKBHk3Y
	 6kkKj+Vedw74Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d72yq4vC9z4wMS;
	Fri, 14 Nov 2025 14:42:43 +1100 (AEDT)
Date: Fri, 14 Nov 2025 14:42:43 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lee Jones <lee@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the mfd tree
Message-ID: <20251114144243.05facfce@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+MIGngq..aDbRawUEtNjlWD";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/+MIGngq..aDbRawUEtNjlWD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the pmdomain tree as a different commit
(but the same patch):

  30ed024fb076 ("mfd: bcm2835-pm: Add support for BCM2712")

This is commit

  060d111e8a56 ("mfd: bcm2835-pm: Add support for BCM2712")

in the pmdolain tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/+MIGngq..aDbRawUEtNjlWD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkWpTMACgkQAVBC80lX
0GzglQgAoPmO4kLks9+ZEwzPBhsK19jCT5lUvGw1yY9q4kxD+nZJZHiNFqaGO8U+
URnh+iO4nL8OPnSZnQckQrdB5xZld8SUgks2M19/xgCSauKRQBTwLfftMPCGTR6U
TxlqTboKKcwTyPNGdFW0zbo7WnPRDgcHNZnkzj5GC21csL7jHxFC5kmcOVtX+vXr
rW0ldyGcx+nG1gDro5u0/fMfhF40nmFy5plVgbWuvNFcn7TT2AMGmPUuMR7m+AeH
ceuvgoXqN12XW0Bl7DFvCLIhNTOpcsf4ZzZwP4jDUfzatDirMMRQbJkdKt5S4o5M
5Fmg/N4PP7KWiS2K2V9LeAhDjzg2fg==
=itJH
-----END PGP SIGNATURE-----

--Sig_/+MIGngq..aDbRawUEtNjlWD--

