Return-Path: <linux-next+bounces-6247-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4639A8944C
	for <lists+linux-next@lfdr.de>; Tue, 15 Apr 2025 08:58:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C957F1893E42
	for <lists+linux-next@lfdr.de>; Tue, 15 Apr 2025 06:57:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A4A623BF9E;
	Tue, 15 Apr 2025 06:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="HtvPIYJG"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCB52750FF;
	Tue, 15 Apr 2025 06:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744700254; cv=none; b=mVP8/byNZJtcRpfm9ffUntCW9X+9k2AuemALLDlIjpJRc1lE8pCa7XMHdY69JkbS6eWMkBu9/djuvH969Fv58bj+A/j0jh5D2/CbXBMsAFPyw5vVaeGbB6BljAmx18i3MOhVWnU0x1SN4Xb8yj1Ijhpa+eaSWw7w8ZQnN0mgsfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744700254; c=relaxed/simple;
	bh=/863X5z7UyLpFIgUBEjoP86nAAFdlQ3SXoEtjwX59z8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RbF2W7IGjw1MTPaRaoI/Yimtt2UJLZ6+0tkiUia68s+E9X989xWQs+7AH4UD5j/M7WQfC93NzYrVYcpOAI2GC+hxTtU7xeB3xUykrGlZ4qnhthVDDWDnzcrh2xUurphJ+MtvcP/D3zSaFoOkaruxFC2Lj9yNR6nVwaYD70kH+S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=HtvPIYJG; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744700248;
	bh=7CRlzrA+7PmFXM8Vvw3HdGg0d1TjClHXNm5KjIRiLVA=;
	h=Date:From:To:Cc:Subject:From;
	b=HtvPIYJGdT4fkjiAKOsJFmLOG0gW2J946HKxJyTugrak8R+CPdz7zr+VoZEv3yNR9
	 Xpu+VlPrbuzlJ5eM2K1Ede8i7FQfh+VnFfy6jBQLNdEpqqoDkq4nv2lanxsBQPcrwq
	 Wm97oKkPLCBQZKgiz/uA0i37iVo8CcnOAEV1fdYekSxUDjEu+p2uFNMY0Rc9zWk+Ur
	 bL5FkK4z0pXHGcWDxLQJG3cpGMwSlPUwSR81rMor1D/z9W+PVqOkSnsqyZmWEYcHgi
	 xitkrnpnELxNCfsgpzvqtxIpIfCd7TCOYhbn3rhxsAuxHF4/GBLsoyqHIl3WGI+lT6
	 0/idqJRHAcTVw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZcFMr2Wdmz4xG8;
	Tue, 15 Apr 2025 16:57:28 +1000 (AEST)
Date: Tue, 15 Apr 2025 16:57:27 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the mm-unstable
 tree
Message-ID: <20250415165727.76edbe24@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IU1dt0ce8+gwgk=d=FaZj1r";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/IU1dt0ce8+gwgk=d=FaZj1r
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  0a8fd1930f74 ("mm-huge_memory-add-folio_mark_accessed-when-zapping-file-t=
hp-fix.txt")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/IU1dt0ce8+gwgk=d=FaZj1r
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmf+A1cACgkQAVBC80lX
0GxUDAf/XjuKYWBgnmPTeEm51sQQVggDOP+lcXx5oGvJjuFidMy85lv+mIHCllQs
uMul1uWx+wvflpA8LALMZ/MtsTHC0dzhDtne3e6KumCHERF1MIvvKx9r1pDkJFcY
rsWywG0nIp2mpjHUaJ2gsH2kIAz4KMAQBB2f7bEF91VwWKQHawQc502b8deotoQx
79SZynubEGUeIxND2TXFEYgBP3EkpiyTIucP5Sc8BYKPrMIT4h83HuWTsy2VWslD
ehdst63aZXtRdKopGvfqbEoghLZK/w5qQDnMsa3erHMvV8Fdx/OWS4rNWItuz6O1
oKz0J3ayF1ggRf84CHVF0CIOHJ0x5A==
=7s44
-----END PGP SIGNATURE-----

--Sig_/IU1dt0ce8+gwgk=d=FaZj1r--

