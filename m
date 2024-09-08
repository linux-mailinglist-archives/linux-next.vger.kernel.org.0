Return-Path: <linux-next+bounces-3659-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E903F970A2D
	for <lists+linux-next@lfdr.de>; Sun,  8 Sep 2024 23:47:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1DD801C20B67
	for <lists+linux-next@lfdr.de>; Sun,  8 Sep 2024 21:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F09941531DB;
	Sun,  8 Sep 2024 21:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="L/LTyytL"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C656D1C01;
	Sun,  8 Sep 2024 21:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725832069; cv=none; b=D5GECI3QAriICinBFoIP6G09IM0tOg9xR/j2MiRUpRuL0knhlV2Dtj8SHR0jh/qWFrvAssLGbfMOd8PbWcuV+bFS1ZhfP6kq+6b7LsV4rFCewEA9AzwzL2LQh7EwG1bZScJSAhQ9ti04NTG/pTkyz+SMg2v+IasIXz4V4fB03fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725832069; c=relaxed/simple;
	bh=KKRxPk3jRhwlBHxFKbXsStFK5j1z3Tg4HW37rI4mfzI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZI+cvbk6Q/+hIWqgJdslw8loaaMweSdwVvPAlVHFoVQnGRcavnd2SoZM24kRWPnC++7Xi77rrFLRY69KWQw8ImXYmrOvvFu7wVq11HeY2Fz+CsKwmdA2C2lh0fcSuYE7jtU9hBQ1kesclo4lzQ+lgImQ4zkOCdMgqo+g7FHgyZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=L/LTyytL; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725832066;
	bh=e57jB11SskwwFDZaAu7Y43GkT3CbSSYjpL9GE5L4++8=;
	h=Date:From:To:Cc:Subject:From;
	b=L/LTyytLZW+wiUpKdxNJhrrGzOylhjcz7j2ed6FUwtu/BUMZmCoyvaRCQLqU6FeV2
	 d4UmYTdoWcelL2Vni0SfU2u/rsqUw8rjMoULyeNY4XqPTw2XbWp2v399ThzvPNojkm
	 FSKsNAYmBa76uexM+JJxHP1y5g+EkpY7GtA9IT9ZN7mwvDztQ6u+tcJVBcSgmjciJ6
	 4Rrk+QMqPR1HikD3K/Md1whX8ZqPqxeZh+QN7I5ZUiWNrBSYFTTlAdFwxRgb0q6CwQ
	 7ycwGHV/2uJ51fKGXW8e8mhyIqwwkajf7+N4597xdbAMcraVu/TzLYMyuCsBpFaT37
	 AAE4EOfegn+kQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X23VB00FXz4wb5;
	Mon,  9 Sep 2024 07:47:45 +1000 (AEST)
Date: Mon, 9 Sep 2024 07:47:45 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the vfs-brauner
 tree
Message-ID: <20240909074745.2767f0dd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LzoJvRasnPpA4BG.efuvcDd";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/LzoJvRasnPpA4BG.efuvcDd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  785de7deb1e5 ("9p: Fix missing set of NETFS_SREQ_HIT_EOF")

is missing a Signed-off-by from its committer.  Rebased?

--=20
Cheers,
Stephen Rothwell

--Sig_/LzoJvRasnPpA4BG.efuvcDd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbeG4EACgkQAVBC80lX
0GxoSQf+M4NU0/p5asBdlxEiKhesoPwtvm+kpGSnEqPduIRgqT8ku5iGJlWbaC2J
nRSTnz2fWR+PudJkbCsqCJVBVpomjnGiNTg4IoNPInrZYBOYwZLRIJJ3uE0oKoIc
b0ZuZxU+GzgdkKaHlPa86Vu1ccf8NOcnIBPpi6tuhYnuOOlYYuz5X75iloHo1dM6
xV3Jqguuhl6F0MWh8L7ePvnbjHB+Kb4BrxB9qZIEZ3sN0zKPrLBdP/9iP7GpKUCX
wAxfZ4aM2WXv5nSCiuCR1EMFlGCLf2HumkHWI5stMQbtX2hMf5zNWeABPNktVQGm
iHYJ/QkNdF9O9wbVoFJbN90kBCAAEQ==
=xtge
-----END PGP SIGNATURE-----

--Sig_/LzoJvRasnPpA4BG.efuvcDd--

