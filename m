Return-Path: <linux-next+bounces-5468-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D0CA37B27
	for <lists+linux-next@lfdr.de>; Mon, 17 Feb 2025 07:06:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 339801888999
	for <lists+linux-next@lfdr.de>; Mon, 17 Feb 2025 06:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35BCC1531F9;
	Mon, 17 Feb 2025 06:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qoqJ9UKD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C643372;
	Mon, 17 Feb 2025 06:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739772363; cv=none; b=ZoYuxG3JUg/fmAnSy0rkYBYGKyviRWtv4ld7solZlaF8jkU245/O6Y6S5HpkAT78d6tEcxmyYbhL/czQZQrXNsNtT0YNnoscHc19XaGNETHvI6H3Uqjf6sLFx4CueZblRwvqERcWi5YoJYtj4p3CQuWuieoCxmNYYBqWGSZ6wSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739772363; c=relaxed/simple;
	bh=87lqHcxlr+6t0XifubkMkS29HM5Usa2AbuKGB6yCMvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RBlJCNP+GWywKQE5fa3vM2EKcvhQ76+M4fJyemyQAvSSuKHiqTEhNurfuZcoJZBtaCbVIuEfIdqhLdUTAdOGtZjpdZW2IUgysM1ifDwWoTiNN3SJOCvO5ImIEIMvmff2RmgvaRWSQEUhKmGSNaNauTsTSW3HXgiYTLKJsuhKW14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qoqJ9UKD; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1739772357;
	bh=iiiDmTupqcqYxMSCFim1nVourLKWubRpin1Fl858jsE=;
	h=Date:From:To:Cc:Subject:From;
	b=qoqJ9UKDCkkJwsnHLR4DEdu9wzPcWlSu/xOraEKNXqR008c3cLAP4iXVBNd+7Mr2c
	 hZRxATvBM/f2W/noRV6vGkxoWK+o/5mU6EGHQpw874q4iWPqJ4KcL0pvOkEkozqANH
	 hMXVlxU7tmeY106T8OLw7/I9F8X/EbtBPhskdeGJNiGZB9zsCt43J46tepxcM8bmh7
	 GrzLXQMewDa9O9doo+kT3aApbQY+a1K9zroOR9v380RHSpvIQzgRWbmCr5hZviloOg
	 D/U0PyRay1qWrRM6YiI8UDzfJ8pQ0QA5SDq91D0nT8jgEA65fJnMtlmofyS2AelVYH
	 M9Ai7AWp4mhNQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YxBwh4vFMz4wy1;
	Mon, 17 Feb 2025 17:05:56 +1100 (AEDT)
Date: Mon, 17 Feb 2025 17:05:55 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Eric Biggers <ebiggers@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the crc tree
Message-ID: <20250217170555.3d14df62@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/J=fzqjvTI1qfw2=pyAE8QYq";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/J=fzqjvTI1qfw2=pyAE8QYq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the crc tree, today's linux-next build (x86_84 allmodconfig)
produced these warnings:

vmlinux.o: warning: objtool: crc32_x86_init+0x1c0: relocation to !ENDBR: cr=
c32_lsb_vpclmul_avx10_256+0x0
vmlinux.o: warning: objtool: crc64_x86_init+0x183: relocation to !ENDBR: cr=
c64_msb_vpclmul_avx10_256+0x0
vmlinux.o: warning: objtool: crc_t10dif_x86_init+0x183: relocation to !ENDB=
R: crc16_msb_vpclmul_avx10_256+0x0
vmlinux.o: warning: objtool: __SCK__crc32_lsb_pclmul+0x0: data relocation t=
o !ENDBR: crc32_lsb_pclmul_sse+0x0
vmlinux.o: warning: objtool: __SCK__crc64_lsb_pclmul+0x0: data relocation t=
o !ENDBR: crc64_lsb_pclmul_sse+0x0
vmlinux.o: warning: objtool: __SCK__crc64_msb_pclmul+0x0: data relocation t=
o !ENDBR: crc64_msb_pclmul_sse+0x0
vmlinux.o: warning: objtool: __SCK__crc16_msb_pclmul+0x0: data relocation t=
o !ENDBR: crc16_msb_pclmul_sse+0x0

I have no idea what has caused these.  Just sending to the crc tree
owner (due to the symbol names) and Peter (since he made the only new
change to objtool - though it doesn't look vrey related).

--=20
Cheers,
Stephen Rothwell

--Sig_/J=fzqjvTI1qfw2=pyAE8QYq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmey0cMACgkQAVBC80lX
0Gy1kAf+IitjeI9NlosniiImUoa2nv/hULuOSlzxqTJNqkzFHkA4TMlu0dc4JyPo
pKwRLjfhC+AjafkMmvWTy/dqb15h1GvIuA38KEKk9mNRKi5wwxWFVRLad6D32i9V
K9IThrhgm28InD60up/kGlWceESjOhV7SRQ6z7odJ6eQFgTYsBxmkXE1IHLGQ0a6
iuu6ZM81pa4bx/E7Lsbyivune2N20HqoYC77cf42oF4FSJ7BQ0BtgaPJJ6EcttWS
lB6fFvkiZJ5JyAROE2WypLntzzw1CDTN6NNK9dP76oBxQbpdeXhbFJCpLctEzI/1
brpIUmPkJ0BaJdga3ErC5ZyNFOsI2Q==
=e8Cu
-----END PGP SIGNATURE-----

--Sig_/J=fzqjvTI1qfw2=pyAE8QYq--

