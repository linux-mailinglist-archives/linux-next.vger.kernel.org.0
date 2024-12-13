Return-Path: <linux-next+bounces-4952-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1259F03EE
	for <lists+linux-next@lfdr.de>; Fri, 13 Dec 2024 05:56:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 685D916A0B6
	for <lists+linux-next@lfdr.de>; Fri, 13 Dec 2024 04:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89BCA154BE3;
	Fri, 13 Dec 2024 04:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WlGjC441"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01D363D;
	Fri, 13 Dec 2024 04:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734065787; cv=none; b=taqlJ1q3wZxqdA3TW4vT9wSS7hnvdDpHzbSDBq2ykKR4lkLqF98H+L9CjGge7n450d0ZqtCRTc+lNQDXrCzxoewJIfcsM0aO0bnpxpepL7xEVNzEUgXKH1eyhWh+L2Bm4PAuaNrS4m0E5s//uC6g+uzAPj4KOu20vDjMHFvHxdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734065787; c=relaxed/simple;
	bh=mMQPJMXSaR2uFYdcKBtjZvDpAAUlCOHNHqUtaQLhW3E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hzGHxPEur7zB52bwjS8cktR3XUeeqYmcU38Crt+Mkc/0g+aQCCFYRD+Q43yeN8M1lRBMb9g+Tn0Fb6OZIdGdORd4ahfxUFm0+zY+sNfLOLhIzt2Yt3XfzxMFGbYMaqNEFmF35z0zKuAV1RbF6QQM5pSLoYCymnUS8wbOwMNtfqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=WlGjC441; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1734065776;
	bh=ddTcMS5AVphVhaRtXcstV+ts3TnhAu39kgGCHJAiAMQ=;
	h=Date:From:To:Cc:Subject:From;
	b=WlGjC441evtuX1n6wkdSsnXUi13cK99XuaIDDA7srD4QkMgraRYQcaleTvhy8rF1U
	 pPgja/1VRC9O7DcXawaJ4/aNG26jBsn2wknXIfwSzqdNWWJuVNZdza8xbo3qyyBZX8
	 NDUCqRzSj2Xh2bkAQR86Y1uEPiukZmCBy0LL2Ye2GabYOThcBmlrhvLb0JCnTdhpv7
	 70BlSNx57tg4VTlDJMx6Tbf6sly6lNlJJzOMpGFyfyDXMRimlBVjJrydFGrFcx2xik
	 Ev5LkBmvBSAbaax0o+hjQRgv8whfbsv8wAJEeWvyoFdlObhNNPbpMufniwBX/IYLZz
	 KG3xTyfDzsFvA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Y8cVm69ypz4wvd;
	Fri, 13 Dec 2024 15:56:16 +1100 (AEDT)
Date: Fri, 13 Dec 2024 15:56:20 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Vineet Gupta <vgupta@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the arc-current
 tree
Message-ID: <20241213155620.5966dbfb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jseZPoI0wl4H..GIX+58Fx3";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/jseZPoI0wl4H..GIX+58Fx3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  0d535742b039 ("ARC: build: Try to guess GCC variant of cross compiler")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/jseZPoI0wl4H..GIX+58Fx3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdbvnQACgkQAVBC80lX
0GyS+wf/dP5RmvBoFYJPPchUAkgT89p+u/QzrWU3kz6qDC1Pic+fNZ5gut3y3rRj
W8pj46EpyYbD1XrStTOp/vg6KC/pCDxGQV3NkwqhzYagjVKfamS0PdfD3s9mL9YD
xGSOe4wiO9NSS/GP17CkP8nH7QD/58k7h/RrS+5DSRijVK+QMxxtuSKdDFuZGAeL
2Z6NG4l/RufN+da3Jcd9Mf2lO6wymAKJkvPcdJ351SX4QqlAL8ik29J1nBpNCVmU
ovQz/0X9PvrkkzuB/fwYwIren6xNugaSEK3rmlzPlKGcOEBudG32dZOQioJL4Z5s
uQBFCWi/ZZAmgLYaqU0SM3Ao0G8wKw==
=dh0z
-----END PGP SIGNATURE-----

--Sig_/jseZPoI0wl4H..GIX+58Fx3--

