Return-Path: <linux-next+bounces-5414-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76951A318A5
	for <lists+linux-next@lfdr.de>; Tue, 11 Feb 2025 23:32:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C37281689E5
	for <lists+linux-next@lfdr.de>; Tue, 11 Feb 2025 22:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5801268FC2;
	Tue, 11 Feb 2025 22:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="EIqdOZfW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5722641CE;
	Tue, 11 Feb 2025 22:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739313161; cv=none; b=cNp2SGZEXD7ha87DGAHjqo14Nq2AuAteIW7glJsW3iSiNw+Yj1e+mCXsavI7ZY/FPdBdNVHf7tQqEg/ga90wowUO/oyTxoh6BGpvEDEzDpIAaKesdK9d6utr3Mkwx2INfQVPMKhH38wwd/RP1hTXDF+JSwnhxePN16P9g/dSfuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739313161; c=relaxed/simple;
	bh=C+iJYXXOupleKOv5WMOquMy6igxqSaoLDoO3zL9tcXw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fSTXqylBjAqvVORjC31PTA1PsJ6U/6rMBRpKO0v887Cf3BgT3szC1EC9tVuyUgoHEPDkgVxNrbnly81AdRGEzMlCJrhwxytiHf+DwiPlNHbKiJbY0Ex2nB02e/zTOvH/bawbyYCliGmqlvTNpEjWrPrECG5FVyBKylperAU7zYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=EIqdOZfW; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1739313153;
	bh=C+iJYXXOupleKOv5WMOquMy6igxqSaoLDoO3zL9tcXw=;
	h=Date:From:To:Cc:Subject:From;
	b=EIqdOZfWLzWhxqs88T2pjJx5dIXl1U8Ev/Ej44HXVwjpi3f8aAif5R4h0ddUDbpRb
	 TFgkL5Ur/yy2eKMYHZyUA3g+eAtkuBPUrCTXWbZy/vBUKmwR258j4x2ka5ndGaEbDh
	 xoUvDdzwtXUxwtNF49h7E+xah4LH5tNFAKE90iqmAOHYTT/CQ58R2jrCxjqhijklQv
	 DetPFU7yt1RznT4J4gBJhduiza+FOJs+x1a1vaon1VZtfJBvXx7T02TvXcRlEQa2qQ
	 wD5c4H1t9x09vdspDMISRS3fACtx84tytDKPmatpE18I1o0mPDGn1mlywEvecwNw+O
	 7/S7ZRxPDre5w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ysx5r5zlvz4w2K;
	Wed, 12 Feb 2025 09:32:32 +1100 (AEDT)
Date: Wed, 12 Feb 2025 09:31:47 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Arnd Bergmann <arnd@arndb.de>, ARM
 <linux-arm-kernel@lists.infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: failure fetching the arm-soc-fixes tree
Message-ID: <20250212093147.02ddbf2e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7bAHXIpg/Vq18Kp++s6zoCL";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/7bAHXIpg/Vq18Kp++s6zoCL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Fetching the arm-soc-fixes tree
(git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git#arm/fixes)
fails like this:

fatal: couldn't find remote ref refs/heads/arm/fixes

--=20
Cheers,
Stephen Rothwell

--Sig_/7bAHXIpg/Vq18Kp++s6zoCL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmerz9MACgkQAVBC80lX
0Gyaawf/c3wic5cNc71Tpj5XCgk0xoXuFmJLJtRz5TcrRGe1ZRIQERkItly1fddY
/qN0DEZ2lvCB20cte59VC4meGdr1FWChjUK99UjN11/kZl+GrjLx1pVN8OBkhpFc
91u8VzTBPTv7dfNAvXplT2fihm+zT0zwsKLZ4LVJ7NOyP0hVf9qwNQlJ9+ZXNRaC
W/sfx2Q3KkMtRNRZZf3C4E0Y3z/m619ZKiKLLaMuYmfv8vtrGDnQGSGzSQbXh+zx
wYKXcVOwgzGqXkowmEzEpl/rFHVrPnPvZWidgx9Xt2rFkhxLfrIwEyJPeUBjROK6
pVoHNlZoI5m+WiSgQ8XcuI9yHQ9xdQ==
=8o5S
-----END PGP SIGNATURE-----

--Sig_/7bAHXIpg/Vq18Kp++s6zoCL--

