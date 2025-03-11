Return-Path: <linux-next+bounces-5752-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 59ED8A5D1AF
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 22:24:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 943AD179A1B
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 21:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3466C22A4D3;
	Tue, 11 Mar 2025 21:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="dUKvmBw1"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD26199FBA;
	Tue, 11 Mar 2025 21:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741728293; cv=none; b=iQ7erWjZQ/iOjZc4fOSBeRd5JQwwSVxbHPc1J5xNr4MIi3DDgag5cxyv5gdGg0/zQAKAVzyCAauWpNj38Xdui3gKbQPc5Bx9tG9InabwtFknw4hxVHsbCi5DXYVWr8qf9fSdTGlGzV5B1L8qtccbLyGr68a64lWRm/i7+Hk/UF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741728293; c=relaxed/simple;
	bh=1fLXz1Z17KdztB9Xq5D8pNArueYNUOphN1H9sPeg3Ps=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UUElfGxzPEchPHqHwd0uDkSSfSBqgGBYIvPPF9ORHrL3KrexkMo0YpSAvVBqzlhXCUBOYWypkdwdvuv/SKh2o164A4gh9sa4XQZ5d5a6HjuLs1s0rBfm+kzcJfS0Wd+GiTGbUzH2DugHQGnqDYxZrf0RB0wcWRURDoUDv188GZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=dUKvmBw1; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741728280;
	bh=ZsmVQ5DlB1ZpsAtkvACr0C5cAsnPSC+0UeEEHIOW8ag=;
	h=Date:From:To:Cc:Subject:From;
	b=dUKvmBw1VfF/PNWUYgg9DkUPZ7pnXd7LKELZ4C4nucQMlyoWydL54MYS/02G+MYkm
	 OB/bwrIX214zDu7cqQ204+vEeC6K66BrFuQjYuuyijyxiJUIYmJ+A11CEFt6IOgYV2
	 XJVCrlG7THfIlw6U9q7jmJELOXeXuSY5mFNjutPpILbu+oUkkOeRFMmMTQ+faqJXTK
	 h9fpLRbQBDT6/CAju1v4MwiVmjL7t4b+2Xhbbba4JYMmLyrh2Qhuezsq8EEBtm4WKu
	 rAgeuw8P1P6qkpWc2sQpyMaO12KXnqamuBxSKlO/i66i4QhTfmYZZePZGt64z2/vSL
	 J+09IRaR/g9jQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZC6Gc19pLz4x8R;
	Wed, 12 Mar 2025 08:24:40 +1100 (AEDT)
Date: Wed, 12 Mar 2025 08:24:39 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the sunxi tree
Message-ID: <20250312082439.098124ee@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/43b010ypr4rpN6VAbDG1lFe";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/43b010ypr4rpN6VAbDG1lFe
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  575464821eb0 ("clk: sunxi-ng: add support for the A523/T527 PRCM CCU")
  9c8d960c13ab ("clk: sunxi-ng: a523: add reset lines")
  4548c0414839 ("clk: sunxi-ng: a523: add bus clock gates")
  680f52d723e2 ("clk: sunxi-ng: a523: remaining mod clocks")
  5fd7421770fb ("clk: sunxi-ng: a523: add USB mod clocks")
  dd19c52e686e ("clk: sunxi-ng: a523: add interface mod clocks")
  9bc061e57b4d ("clk: sunxi-ng: a523: add system mod clocks")
  4b759de121c4 ("clk: sunxi-ng: a523: add video mod clocks")
  2d47dae93981 ("clk: sunxi-ng: a523: Add support for bus clocks")
  04f6ff49525a ("clk: sunxi-ng: Add support for the A523/T527 CCU PLLs")
  38ea575784d3 ("clk: sunxi-ng: Add support for update bit")
  24ad1a7e8a3e ("clk: sunxi-ng: mp: provide wrappers for setting feature fl=
ags")
  af7a221c1213 ("clk: sunxi-ng: mp: introduce dual-divider clock")
  17bed1817f11 ("dt-bindings: clk: sunxi-ng: document two Allwinner A523 CC=
Us")

are missing a Signed-off-by from their committers.

--=20
Cheers,
Stephen Rothwell

--Sig_/43b010ypr4rpN6VAbDG1lFe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfQqhcACgkQAVBC80lX
0Gw+cAf/dGLRCMVZP5QcNYjLoiNw/RnVlBRIWKujXiZ0Ls2SIFnpjHIzYCsbpQpF
3U/bqqDF0Bk8xgy8oZVtvCPcLaadd2AzRdWXScgnc7hgsjYjUp8oaiQGruB5euEd
SE6npbR3T5c34oea2eR6NWNCapf/0NyVL68RAljl3izSSyjKzy63i46Db8qyX0zH
QVyhZpJi3/QIXK7fwZt1RG24naL9jszb0bN3IkSSPQiig3bveQt5fb28yoeADUG5
6k1dlH74v3X3aPK2MqC6uHjHob3pXrACuzfRAai6HYdL2JFmFeQzq4h2vOzICJYp
qmkUFzyJjpcGm8iL+iQjUN+0GHvu7w==
=306N
-----END PGP SIGNATURE-----

--Sig_/43b010ypr4rpN6VAbDG1lFe--

