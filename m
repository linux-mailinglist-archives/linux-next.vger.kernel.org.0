Return-Path: <linux-next+bounces-7065-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E32ACEA44
	for <lists+linux-next@lfdr.de>; Thu,  5 Jun 2025 08:35:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 976D61894B91
	for <lists+linux-next@lfdr.de>; Thu,  5 Jun 2025 06:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D4EA6D17;
	Thu,  5 Jun 2025 06:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="dvbccyEw"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F071876;
	Thu,  5 Jun 2025 06:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749105322; cv=none; b=tNZAJu7Z2jan+bIIheI1E0WgG/jQ2Gb4FiMEpwf06RceVD3ZkaUm5XEuhfZXmcjsWvsdkYF/Mt9gndelZhr02dZq+tDFupHrh/ixAsy3MHTWABLJDcGzkPAEz2zy7+Youd4YClg0nKYmkUHQyyslWn8u5W1/nAIQt2VM+yJK4eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749105322; c=relaxed/simple;
	bh=xtl04Ru3+hySUvvsxwfudo+3sMxK5la2F+9A+Q0D4Vk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=EKbXXnXeECe+OlD9DKZdlSyY39M7tfd31QBxByvk3qRIurfRHCQjJSGuyn0wRBbTKB1SZQaZY0jb5QkMURM7IBTaYQBXRUXZ2mH6WbOrV1nuzoLP1MNWaUnopeKrME6adzA+9FHE57VXzh/iXODt8FXpkF8DYAgO4AlWt5uHxTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=dvbccyEw; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1749105315;
	bh=Z0a5pRAqENCInUSAGi71Pcld7tarEoX9Yzz8XCJFZ8I=;
	h=Date:From:To:Cc:Subject:From;
	b=dvbccyEwRo3ZQLA8uRHDcmYpN1YYH+TFUl223JQOxjFhrwENVPHxnR7WAN4FG9Js5
	 GYXotnh6sS6gulktEqvPIFwAis/3eBCfoRbyXT7NbtIAOrhsQrtaT91hSxnMDy2EAm
	 7NFyJltpzN+igd090hiL4u4oO/82CzeVp9X5VPI6eeeZKJyEFLELyErAKvIFNH2lqP
	 fsEohmPxuPhC/NRdIbEmM/k1U3GzGfDN85ruy7Zw3HjQNup8Ix8IA7nnxVq7uGNmfD
	 MUjcYcy1Lfb+G2i8Y6e+VuzsjWhrZF8goYT09UzITzdOlobKdnHB+JTaviNLlIdz6y
	 2Nm5U5DdlAU2A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bCZSf0qbkz4wvb;
	Thu,  5 Jun 2025 16:35:13 +1000 (AEST)
Date: Thu, 5 Jun 2025 16:35:13 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>
Cc: Cyril Bur <cyrilbur@tenstorrent.com>, Alexandre Ghiti
 <alexghiti@rivosinc.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the risc-v tree
Message-ID: <20250605163513.7cfb7f2b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1cRZFh3OSivbt/CiHWDPuSv";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/1cRZFh3OSivbt/CiHWDPuSv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  4e27ce58e7fa ("riscv: uaccess: Only restore the CSR_STATUS SUM bit")

Fixes tag

  Fixes: 788aa64c0c01 ("riscv: save the SR_SUM status over switches")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: b0feecf5b812 ("riscv: save the SR_SUM status over switches")
Fixes: 788aa64c01f1 ("riscv: save the SR_SUM status over switches")
or
Fixes: 8f9b274ad153 ("riscv: save the SR_SUM status over switches")

(yes, they are all the same patch ... and all ancestors of 4e27ce58e7fa)
--=20
Cheers,
Stephen Rothwell

--Sig_/1cRZFh3OSivbt/CiHWDPuSv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhBOqEACgkQAVBC80lX
0GxsMQf+MXtDlHfmRRDgOpGhXmwyGPpy4naV2ndns0BZklyUjuDpBlq5/TZLd4DC
WgYNGBw05mrgQJrDnJM61zraLNC4oljrMQWIR7NgTrSOqXQ44QLKunQL04M0JEAV
gVL/5cPbZsh1xlgr4WQGP5/SWr+VAt8N/KJ72hsSv0SZTUGmgjhs4mUkyZUFVeNc
52PmEua1mdjPB7jlI5CwrSzP1yxIYR+doZo4O4wiPaKTS/ROe8tUYvBp3OXIXS2y
6XVsDPKH+8QpmYF1XFiKLWdpgwgo9C9t2dEITT7+9pts0iBXGiXQDjGQY2Ups+e7
tWCqS+E4rO6MKGR3YhuP69YhK2G0AQ==
=Q/Uq
-----END PGP SIGNATURE-----

--Sig_/1cRZFh3OSivbt/CiHWDPuSv--

