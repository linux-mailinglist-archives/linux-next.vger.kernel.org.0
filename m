Return-Path: <linux-next+bounces-7414-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D10AFDBBB
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 01:15:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 585547B0A9B
	for <lists+linux-next@lfdr.de>; Tue,  8 Jul 2025 23:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 742E3237713;
	Tue,  8 Jul 2025 23:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="RB8MKUW6"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0024F235C01;
	Tue,  8 Jul 2025 23:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752016367; cv=none; b=rXcXg832DyVqANkKrhJw16ouQwdrIODn72kyhqtg53PKDefCh9gBEugc0Wu8NcbzBNi6eql9TN8lecjq6RBrHA5ox0rP8RN3NL16nVj9seGD+HF4SOiYnj389G5i623TAr8qtyfkM4JujU3lau0U4tMidAsXsjDcpi+SwuS7PGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752016367; c=relaxed/simple;
	bh=90nGyAakCvWnLdZiCbX/FBGeaT6B4XoOp7i6Nr8lQMc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XTUkaKY93IBwCuIXwAKWBtWJKPjutRzpx+Sap/izL/M21mPxf6KDVivGx3i3P28Hizs1w3e1qb0rdwkisDR6G3CgY9nCc/pqrhTE29f2Z4IU3ZaeMCPKFzrg8JfbCDg0girWTQQWX4jjsCnQRpvc0wt5oUCe48Xl0GRNErscWv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=RB8MKUW6; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752016299;
	bh=McXy+p10Grl2gXoY3hhtWWdErutYTtge4rPjEjVK6Rk=;
	h=Date:From:To:Cc:Subject:From;
	b=RB8MKUW6E2K5DCzieYvgMP/QEGWWfkWvFBfiSKbTB+zTxouK8xx2QvFq0wO431cIW
	 R16o7vXaBfujG+FsRgge4HIbkqX4BLz4zdnPVZOpyu7U33xXetVfwrhm9B+yZwT3Ut
	 VNoMkY6hmfq0fWFiunXBtMTvZRPX8hfsVG6NA2tFa//MFWLVX30MvTuHlFn90Gb0XH
	 +YB6N/exCMRb0Ae4DhRX+oa+JHIQbs4xyjjgQ67NELdb8Q16mR5s1kwd3V1gjTwIMt
	 0kG5fvIautb4b8+PWjypQ7GG1udoC9n4TJmz6DNvh+nARGz0o/fcaYAPk9tFX6SQoa
	 iBuE9uW7XO1JA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bcH1748KSz4wyh;
	Wed,  9 Jul 2025 09:11:39 +1000 (AEST)
Date: Wed, 9 Jul 2025 09:12:41 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Conor Dooley <Conor.Dooley@microchip.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the riscv-soc tree
Message-ID: <20250709091241.66d1d701@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QiX7_kY3XvkvNX2Dlt/zVpV";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/QiX7_kY3XvkvNX2Dlt/zVpV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  0bb48ad676d5 ("riscv: defconfig: spacemit: enable sdhci driver for K1 SoC=
")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/QiX7_kY3XvkvNX2Dlt/zVpV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhtpekACgkQAVBC80lX
0GwHKAgAk82rLqj2AszvDE/ogn3CMNeqJjXFwSX6ziwadhlfLgAgmCehkKv20mAz
9+qyZA4XgOTRpGg/n9XLiLpcChu6Te9uIPBJ3EOc7EYmOqcgl7emxdGvuRM+zxo2
HdSk6uWhf+MohwCohZTk4MOnBFtO4a/XH36kySVWnTlIU5mZYEzlqJWZjos6gej0
SjozaQSkBeSiWhdOxioXRwu6Di81PFSb17x3CG21xCfZRoHgsvTZL3liyUkNGLEy
L6myVwK8vvCUUORyMUJY+OjEz9kl6J/Qz4hebwLQsh6FYZjJ/oxpPBPzfWJpJ+hS
z2hqrftwit8sZxwwHHXWxoukFDd/yA==
=Ok1o
-----END PGP SIGNATURE-----

--Sig_/QiX7_kY3XvkvNX2Dlt/zVpV--

