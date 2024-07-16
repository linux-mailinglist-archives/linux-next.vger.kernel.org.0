Return-Path: <linux-next+bounces-3043-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D93933428
	for <lists+linux-next@lfdr.de>; Wed, 17 Jul 2024 00:15:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5D161F21228
	for <lists+linux-next@lfdr.de>; Tue, 16 Jul 2024 22:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69D831411EB;
	Tue, 16 Jul 2024 22:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="eF7ZsFN+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4FE8121B;
	Tue, 16 Jul 2024 22:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721168103; cv=none; b=TkXBiFjv0E2RJ/Y9Yjn1d/LFPsuGpEP9Y0UTkHQNwCjfIVb+sdsUf9P91Ic3WMvpKRSW1XGRBZHKK57t0/G1+JEgVkFnYAAOI3p4UYp+EZWYKQEvmkj6JidhE+7U/QQPyO2gNaNegEiqdN39PtSywhmD5oz0IdDMb4mE7uA48iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721168103; c=relaxed/simple;
	bh=Fp8j6SeXE35FjYxtG9WHXN1sH1TU6fo0xXvNjWUJ51w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mu7OP+22mUT4dy4PyeTwWc5XKAm7YvZQk5tBcuT8uFryWn02vcb0TC1ch24nT47n3in5HpivkgHZ02AfFDlRnmKRUmB2yqas061qHJG0PEBFiApyHAablMzo5F2SaOkXzZ4zXqTQGpKShs6cMM0uCnzEcHH33t2BvrfrVh0VLEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=eF7ZsFN+; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1721168096;
	bh=hxSyjRPFAwRLMBGD3sCBru9bM0uPJv9BAseajCe9I4s=;
	h=Date:From:To:Cc:Subject:From;
	b=eF7ZsFN+n7NIXkXzCrlSWQ4/jbGft4tdQx4SxdnyaukG3tItANj/DbtYVDOPv7tw+
	 dBixK/sDBovkE7yi7mAKj9NJFagun8k/8jWCYPvxPXnKZkt4n/HnJJscCmSRp9ak/M
	 N23ercHX/rN3gt9ueJuySQzm0pTnUbuSddq8I7uRtiUG98rC1QEWq8jdA4agGTxRRT
	 wn4W+YehwI4BUqrClcpHQyDb39vxBOs/JKGOGSedZjasdoHiaINJkb0xhC01QONaTg
	 A7s072cDCKrZ5Vtry6U3zdaSsxGwSlQiLs2U6FqIbMdzMPFt/RYS69jIc9FYVQV+l0
	 9nUzBC6+5amFA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WNtfS5ygQz4x0C;
	Wed, 17 Jul 2024 08:14:56 +1000 (AEST)
Date: Wed, 17 Jul 2024 08:14:56 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Conor Dooley <Conor.Dooley@microchip.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the riscv-soc tree
Message-ID: <20240717081456.57ee0709@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/r63bHlP0z3Jh0MNSCpR863D";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/r63bHlP0z3Jh0MNSCpR863D
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  c813ef3c5f6c ("MAINTAINERS: drop riscv list from cache controllers")

--=20
Cheers,
Stephen Rothwell

--Sig_/r63bHlP0z3Jh0MNSCpR863D
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaW8OAACgkQAVBC80lX
0Gy3iQf6AvZyGOQNZ3C2zQ+riYI6MP6CkLdwVLO2kVtqnMqU7hLnSDdwzi49/L69
o9Pdzfspo6b85sM1eRJxDzKl7Fqp5jh1GDqjvEd1KHkzljT24JGpWFzYcdPKOViC
7jRStD5Y/6HW8NyuYHA9pZHuSt90/Fa1YWwXJEuqYtUakCYyeHGQ4MZmEEFLlORf
MB8YaBKTks7TNTVfLfFA8RJrRcDv7Zs7RQDsY6Es9cBweCNYV10cQGQAZgC8eDsQ
faBRLSdVLpizfEpd9fxyYM/f8Kqvt5kKEwB9o2Yv0dHsYiTuoiIQce8UfwoBAMzt
WDOfWQhzpSq667ZMEc+yfm6WuGlkkg==
=T6rb
-----END PGP SIGNATURE-----

--Sig_/r63bHlP0z3Jh0MNSCpR863D--

