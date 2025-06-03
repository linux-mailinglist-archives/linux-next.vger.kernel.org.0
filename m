Return-Path: <linux-next+bounces-7019-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0695FACBFB5
	for <lists+linux-next@lfdr.de>; Tue,  3 Jun 2025 07:46:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C483E17023F
	for <lists+linux-next@lfdr.de>; Tue,  3 Jun 2025 05:46:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A84C18FDBD;
	Tue,  3 Jun 2025 05:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="pFhkpe9+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9BA12CD88;
	Tue,  3 Jun 2025 05:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748929555; cv=none; b=N1IyHJZLw3nlXGfxqXZi7nP/YtnwePBNdI6DMjtthZt/+wzyTK+I8r4zjst4XjgDJJ8AAuFJStrDCFAZNM/8N4DS8fwp50S06Iw5Y8k29j4rYJz2QeTJpjM6Drp7g6+sTbnCfps47FqJnyh/30hXu8iVUPd22zlVQ5llkheR0p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748929555; c=relaxed/simple;
	bh=LtHvPdT+Q7lR9OGt4/pM1UjYaajoB9iYZBB/9f95i/8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UkIO4ltvDxO8WeC4GbPjPOiVesvZ1xUfmkOWWAPez7w4mj0KpU9+fB3A+F8RPpd9FTpQSTrZsmj2/PpJ4arW9O0IDrhyNmEN+fpzliHynI7SCNZKPeY5URjtIrfJOZhRHvJeR54u4xgcuhVuNdn9eLThGNpzD5yQnTUNJ6rjYxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=pFhkpe9+; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1748929548;
	bh=eNCFXTw8XKmhEt8tKCJxKFbM+gDPJPPm7GtD8paQF7A=;
	h=Date:From:To:Cc:Subject:From;
	b=pFhkpe9+gfoPDdb11J79OsaYCry/skjlbdbapH0mpLRePOSNk4OmTOa9x6PdE1UhS
	 4LlJsC46fbzJS7KUvc/XkdN3M/c2/+R4J3s4QsiOz27WhceJV0iwEDHeGKITXrR0qn
	 Ot8Q+HQbAd/qyP8CcoeMrFdJIwDQ20e872wFK/wmFGfCNUfIZkh+7voPmsZ6VVGvOq
	 6hai7/OWVWfHORmjNAtqWmiwLy0o0uW+w5hHjFNZWucLqoIEifQantGCahaACVlBM4
	 Tfdb8XpbmfsebrR68oTfxuOiSLw0Xls3PROEOumDFfkole/nv8Afv+mjsfzQkDM1WG
	 75CQwA2m7uuRQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bBKST2Xtmz4xgW;
	Tue,  3 Jun 2025 15:45:45 +1000 (AEST)
Date: Tue, 3 Jun 2025 15:45:44 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, Andy Chiu
 <andybnac@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the risc-v tree
Message-ID: <20250603154544.1602a8b5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.NHMe63MR8k.cRvvDTizoPq";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/.NHMe63MR8k.cRvvDTizoPq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the risc-v tree, today's linux-next build (htmldocs)
produced these warnings:

Documentation/arch/riscv/cmodx.rst:14: WARNING: Title underline too short.

CMODX in the Kernel Space
--------------------- [docutils]
Documentation/arch/riscv/cmodx.rst:43: WARNING: Title underline too short.

CMODX in the User Space
--------------------- [docutils]
Documentation/arch/riscv/cmodx.rst:43: WARNING: Title underline too short.

CMODX in the User Space
--------------------- [docutils]

Introduced by commit

  0e07200b2af6 ("riscv: Documentation: add a description about dynamic ftra=
ce")

--=20
Cheers,
Stephen Rothwell

--Sig_/.NHMe63MR8k.cRvvDTizoPq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmg+jAgACgkQAVBC80lX
0Gxrqwf/S5QiDPzs0yjPbAzUPF+T52/OnTecTUUpNb5TjMHrf1kbasGKEIcih6hm
35+5MOEUbfxWObcxXc4VEZwZwo96si5BKfRglWzdpAJEeXw1PV9LRTWj1cbdJOKC
NJcJgPDZkxgUmtVaFd0rZowa3qh/2EQIvjraTXFDfd+mwwK2eLypJfLduxQxiW5m
C/F9Vdsjc8g5Bi3/sXdFkcPoU3lSiv6JkczPX4frwr/JWWrWciIR1nGemkkilGGk
HicC01vegPlHRnrV1n2klbHYoDzN8taCKNDYVEqhnaGeOaDp1xlX8M+fW/Frtsrr
BYWf1mNfP5hDNoEdzygJYyYbodc2vg==
=EoZT
-----END PGP SIGNATURE-----

--Sig_/.NHMe63MR8k.cRvvDTizoPq--

