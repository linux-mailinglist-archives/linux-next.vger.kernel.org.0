Return-Path: <linux-next+bounces-6710-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C448AB4675
	for <lists+linux-next@lfdr.de>; Mon, 12 May 2025 23:35:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 672991887031
	for <lists+linux-next@lfdr.de>; Mon, 12 May 2025 21:35:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 477502BCF6F;
	Mon, 12 May 2025 21:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="lVDaWAY6"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6754A299A80;
	Mon, 12 May 2025 21:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747085401; cv=none; b=TKT61ogawk2CJPyyaLZXlo9mrlhVnfgrkh/sEs1kCnHNm2W/7df3BzrYibmiRf50b2ZB6bGL//uBf/sBTDbC/BQ2WJbKYkeODSLFwvrzyH0JWWVvZ+Ie+2QMgptV+GvlPMVEaDzILo3clBLd8VZSenL9KCdKC8FVdYYts1ycINI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747085401; c=relaxed/simple;
	bh=1f6iSEtepNBGygtteKF8QL4sPceQAcs2bjnOlqA47+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=sYHv3gZROmqJh6bhrHdMesnK6eeKUGzx71HJwo8RU4GQ36xcCbARLzBpTSNFyiBNxSRsAkvyqMeYMCRD/9RvhzmUT8gs4TlSQi//eswyuqVbv3OYf4U0T2pftIHzYvd6hFEYy9LSLvQf4PTeJdA4ujgCRMZz038poUYOwgCfhBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=lVDaWAY6; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747085392;
	bh=cctbwQdXgFPjQ/kDxSw9pOVfczKToij08ZtkAhC4QEg=;
	h=Date:From:To:Cc:Subject:From;
	b=lVDaWAY6V85nuKY8YRxBxZf73ZXL4dRaaion7q1Eiu+v3kmcSJ0KGIn79IALqKM9q
	 HTI7CJrKbysXRwx445BepYo3hQn9bEmQ0QGnfm2wrCaEasGI0LbsgFH7+McnXOVhUC
	 liqFyFyxmq1DqRW2pw1RCGkPIyQUpyokDJCZ8uyhqORibPDpy/evPbXA9LsR80pTvY
	 f5D19eIHi87skbDany3crGT+P+L7vr3A9Pjwp804BQryWx1GD3EsAsFTrq/FjC0MEE
	 6XdBzfRh+MEEqN6Ij5RYjyTqgDEG+yOTeKQ3PVnqdjiZyzcPoO395toAmquwnGvxos
	 fylPvf8rj8E3Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZxCS02m2dz4xN3;
	Tue, 13 May 2025 07:29:52 +1000 (AEST)
Date: Tue, 13 May 2025 07:29:51 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Nicolas Ferre <nicolas.ferre@atmel.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Ludovic Desroches
 <ludovic.desroches@microchip.com>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the at91 tree
Message-ID: <20250513072951.192e1213@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AmnsV4.2_8pPjtl231yYmJ2";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/AmnsV4.2_8pPjtl231yYmJ2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  7f0132d21261 ("ARM: dts: microchip: sama7g54_curiosity: Add fixed-partiti=
ons for spi-nor flash")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/AmnsV4.2_8pPjtl231yYmJ2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgiaE8ACgkQAVBC80lX
0GwHPgf9HLNbnKv4zF7eHqfOdiq6ZJ71up01Op91WygF3ZN9y8f/ksS0kJXyUHvt
i1pOHhRYCUK9SrDkgGE6Pii4loA/DkQcp0X9VQgbPtCl5IxJgX54k8Vahe/DGpRt
DlOaHu3ApgyAWFt3YcOACEUmM+DFo/JVKPp1oI/+d1jz5ts5rysV02Z16W3JAVqP
j+9zEddsF3Q7xmEYbhKpdePapD/y5wch9VePEohM4fYFNErKs43xzSxIyBtAHtvt
J5rnkROkER25vgQVQ5Y2Dp1IVlSXYCHlxaG/93TG4uhUGHiNp8YIhWl6Gvd9ieXz
7NpRagJOwynzD+n1sidvHLrSnoFkaw==
=OnBB
-----END PGP SIGNATURE-----

--Sig_/AmnsV4.2_8pPjtl231yYmJ2--

