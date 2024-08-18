Return-Path: <linux-next+bounces-3344-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A40D955F8C
	for <lists+linux-next@lfdr.de>; Sun, 18 Aug 2024 23:58:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4DE251C212FA
	for <lists+linux-next@lfdr.de>; Sun, 18 Aug 2024 21:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B91B155322;
	Sun, 18 Aug 2024 21:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qhghUGBB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED54149E0E;
	Sun, 18 Aug 2024 21:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724018313; cv=none; b=HmoszYvQnipwlWC3qF+ZUf5xcMhNebclXA8q5t3fEIDpqVQjHQ6uLnyOewGbvaHCDpAMxjbSiluCLwFwK9ic0gviis7T8Nxn5QBQPp5ZO4GmQd36NPKHi8xVUsH24vSWixsJ/Koa1zcWGPJI7Cq0ZuEFKyVTBMr5kAWv725GrTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724018313; c=relaxed/simple;
	bh=yIrv1ugWY+jdtTaVjLFOD86FgzqIE7oR7TLV0Wm+jAc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=k60yt9HF/1RyH2p9dCNQHrAqfBg+01fZ+TmTv3uDEcv3ibNzGXfw8yRnQ4bDK2LAENddEkSVbrFsVZ+9rD82vHYeht4YlVlPz+lIgXP/mWP4ARLA/Mc+1vhx8NKB3+PKZTIKGvnJ6B9US8TPhooCBrYQEH38pS5Z5UR0hJg0aj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qhghUGBB; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724018309;
	bh=kkN/4IQEkyeHg8FMN5nMbrrsT6mgC47VL3EiB+T3XfA=;
	h=Date:From:To:Cc:Subject:From;
	b=qhghUGBBtMDAM8ylmJzJF4SI5iRUtdBY+4sDh0bXYguM1BuevV0nsNQnFPwmcs5pR
	 GuCeLHSamfNoJOjS1P+V317L7oMiOqDxExxFATrD7XabOkKWrgoMOjlgD6pGRAhSAL
	 Zhx/R6ugdP/xK4s9+v5k4Cj/vgyVv21B8Az/1uvfdkGWjTKfiMrEBhyIhK3HmS34Ui
	 KHArfahaBfNllYS3qfra4hCqKXA/EwNqTee1BXjHtaEOJCl/xfQp+kjf7p+XGIiUXI
	 ikkZOvhwelCULsGqXtRPeRv14TWnAp6DGRtZ6L9ie9G1qMXozGxPRDiPvtvk2LsNJP
	 Kh4lA1aJl6PCQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wn8kF4WTqz4wbp;
	Mon, 19 Aug 2024 07:58:29 +1000 (AEST)
Date: Mon, 19 Aug 2024 07:58:28 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the mm-hotfixes tree
Message-ID: <20240819075828.1d82c0a3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RHihe2zdPGb=4/AxHw8MgBM";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/RHihe2zdPGb=4/AxHw8MgBM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  8e1aa267f430 ("kunit/overflow: fix UB in overflow_allocation_test")

This is commit

  92e9bac18124 ("kunit/overflow: Fix UB in overflow_allocation_test")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/RHihe2zdPGb=4/AxHw8MgBM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbCboQACgkQAVBC80lX
0GzZAQf7Bjo20Mvji3rKPYzJgOnBAQpf2a3c+cT0yjNiK0rVhejraJMC8GqmGgDv
9/VjiYVjf/ps8vkLOVCl758s8f9nM8TH2JB2zuqcpuNvGo5vVTL18EDXM+un5k+O
bDjo8TorXjkVvGHBUB5+d+2y06P2lyxwdZJxJwQKIXhVMy+PAOnqXjyktiYp+fVS
k5csmDaQDoL6HGjIXO4GD5P0a39N/xSUu3rWTS9/n2mUBMO2tV4pC7Y/2U764uDp
YfJzkWgPUAFFADrhgye8ydYjeW+CBkuJQr6QPPfGGBGM5d4+qUqbhysSBPE3lxnj
XqX1EuQGultrkW8MBgGXVZt9I6jARw==
=piVy
-----END PGP SIGNATURE-----

--Sig_/RHihe2zdPGb=4/AxHw8MgBM--

