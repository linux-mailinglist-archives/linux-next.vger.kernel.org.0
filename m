Return-Path: <linux-next+bounces-5346-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 705ADA23568
	for <lists+linux-next@lfdr.de>; Thu, 30 Jan 2025 21:54:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 737333A66F4
	for <lists+linux-next@lfdr.de>; Thu, 30 Jan 2025 20:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AB601B3921;
	Thu, 30 Jan 2025 20:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="GDcJrfGy"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A5A1AF0C3;
	Thu, 30 Jan 2025 20:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738270489; cv=none; b=PWu+5Uh1U0X6bANZcPvzLasuGOTPkF404XDf+VLjM7vRZgzPIgemd3ABAJ3DIVAl6LIqhZWqu3SMNK+kiqF/ul9M0D4iy7ma5feRgG/zw91dWjRlgeEYV30SCFBsf0NJumcpv2X9+CDwKHV8gsNIY8+aiyom8ouZFQYl4wmAadg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738270489; c=relaxed/simple;
	bh=79nu8oQEfj4h/uBdJJghkxFJTEeKvvrmP8QQQyh6eq8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KmD1xQWVEqVJyq1QPYUJDIgH6vkZ8NV3sKuiPZhWKtotdwDKEbuQsMAEulDdwAdGUBtwWHiCWHyyMW5f/dVNmFxJlcPVM8y1tRQOjkOc/CpFKW70EyEd5XasyUhFeoVj3wT1aJgPeDytquGhJEJeCM9+04IJQJYZSBvt5Ij/12s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=GDcJrfGy; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1738270465;
	bh=BrDmub9gfSOCRMnIhhxj0iWVOHOHurRqFWOG+8aDtgQ=;
	h=Date:From:To:Cc:Subject:From;
	b=GDcJrfGyOd4mKbN4Hsb0h9MM5sSAYvnlFfp9kSH0weXG357D1P93JaK8TkpssAep1
	 aqt/f4dE2jfY2l8Zthen3Hw74fmF5NzvIh0R/levG58qqvj5w1fJ/yaOAWX5b37wme
	 FTptXQiCiy8Z8Qagt3MHKtVQ24mayRPRBtG4AVc/TmwVVrt8Hug838jPlLCtohNM6G
	 bATO7n57lFdSgF91AjuWv/0ArXJC8o9h5s1q1sa/w4roTqF+1HTbxm2GH9YXlM9YQ2
	 cpSWS6akXuvhnTEr67Cd9vzZcDKsyUm5Z9ZqcgudriPyn9mkLT0A9DoZVbwBw430+3
	 19A2cApeziCrw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YkWV85T0yz4wc4;
	Fri, 31 Jan 2025 07:54:24 +1100 (AEDT)
Date: Fri, 31 Jan 2025 07:54:13 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the risc-v tree
Message-ID: <20250131075413.6fc6c272@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Hv+T/2lex8/aKBLz3Iva4p2";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Hv+T/2lex8/aKBLz3Iva4p2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  0207244ea0e7 ("riscv: defconfig: enable pinctrl and dwmac support for TH1=
520")

--=20
Cheers,
Stephen Rothwell

--Sig_/Hv+T/2lex8/aKBLz3Iva4p2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeb5vUACgkQAVBC80lX
0Gz0wwf/Sg8J501MHV7p8T0U5BvjHwhpsiWI0clffcLWsX5QipBLrY0FUbtq1BBm
xXcq+/9Hx/uOJ5Kx9gHU/8UG6wnWfkMBp2U0S1XzhLIi/2MGpBpDduE7X3pH/TJT
OAAIM5fXd9HT9YToYDBIn9GPdY6ufv6Eypckjnh/F1kW2aLoHsmM9moKd/KCeqbA
Tiwym9Lb4QzIYkN1aYvy8Rd8B/hPvBj5M5TQR4emEHGIWbl9jM+fGdkA7GhOCKxc
2M2hv4T6CRySUmTY7RkLF7h9hrsdYUXlWlpTC5crK4Tq/L8aLE24Pg0mTGy6ViF+
VLzCHMbHE3ZTX3C1GaED8r37ihA9kg==
=skVP
-----END PGP SIGNATURE-----

--Sig_/Hv+T/2lex8/aKBLz3Iva4p2--

