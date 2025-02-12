Return-Path: <linux-next+bounces-5428-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D354EA33170
	for <lists+linux-next@lfdr.de>; Wed, 12 Feb 2025 22:25:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 993517A405A
	for <lists+linux-next@lfdr.de>; Wed, 12 Feb 2025 21:24:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D78F202F68;
	Wed, 12 Feb 2025 21:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="HdUp/4EI"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A95202F61;
	Wed, 12 Feb 2025 21:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739395535; cv=none; b=NKHYdvgzYDm+iqwnPy9CgwtIxmLeS7sqKAn0GL+S8SvBxVVKSVLgq++HkTigeA491ozKa9QYxmCj2vtXTxDOthCk+6er2r7CSOqO8bwLuvZAsGKw3O7XzebY3nnHfIadFFzFaE28P41Twtp7+zcBOVYor2dJhzAEno+Oil0Uro0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739395535; c=relaxed/simple;
	bh=03Z8biH18L9FZMMAmims/VOX32xtfmOa0W18ZbjpQ14=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FiRraLCAnceaeQom3ixU8F/9zEu2RP3mf7xR8BNXR/4XV3ZWHpyyUDxgYP/cwE7c7NRHY34jK2tqQGNgrMdxp6Kgy9tn34C+f7WYGPwwRc9Baccf7Rrgr5vGuKqsvSKERQlhmzo+MFearR+7HOtO42WG6yV73B8n+rsX0rvcxgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=HdUp/4EI; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1739395523;
	bh=AKh8X90vyF7JdBjv9k1Ghn3wvruHDrDm7vAtdLAepTk=;
	h=Date:From:To:Cc:Subject:From;
	b=HdUp/4EIsdNCc1Q+9XhAskORQ/4ETuLiePRae78qfO2nd8bAhxNO+QdT5Zq2bZmro
	 d/DOYTPLf1L2ROZoOVlGD1lhlXApuodOCmfAq7jLIjAPaV4nxWcgm26d/6g9AqUqAE
	 Lrbk61s1i4yXhX1MSVwhNVyPHOOzp8XWMb14JetOc6G/MOZJGfi/taLIFA5+hphc/6
	 a5CbZo64snTuEtuLCrX95NQ/N+mabfs6HzEZsCctIYaCY3hacWaKU6JiKiVZBEOc2q
	 wbtR84pelMNjiBbi0tlZj66tJF/mh/R7OEIz1txuZ5YQUAh0v/nI8Mjq/HBQp6oFEJ
	 J3l+5RbVEkPQg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YtWYv1Cdsz4wy1;
	Thu, 13 Feb 2025 08:25:23 +1100 (AEDT)
Date: Thu, 13 Feb 2025 08:25:22 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the mediatek tree
Message-ID: <20250213082522.52ca62e0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UzWDtLHIZjBvcTWtpSiJtV9";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/UzWDtLHIZjBvcTWtpSiJtV9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  c4d75a56d161 ("arm64: dts: mediatek: mt8188: Assign apll1 clock as parent=
 to avoid hang")

Fixes tag

  Fixes: 4dbec3a59a71 ("arm64: dts: mediatek: mt8188: Add audio support")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: bd568ce198b8 ("arm64: dts: mediatek: mt8188: Add audio support")

--=20
Cheers,
Stephen Rothwell

--Sig_/UzWDtLHIZjBvcTWtpSiJtV9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmetEcIACgkQAVBC80lX
0GwCngf/bEWbHuQ/BDVW5O7ZwkMqdSXKt23miXuhZMibZiGo1brPnqCDzhQ1vir3
u/J3HkMGo75mU3jzscmvmUaQNVy0oVX+tAwGKK8UcawMFZKQdzj01UW9BUOTeZdB
OdKKCHKBx5NRm0StlCmcf7PKzjX15B4aN9eJPf2L/Z9qS602E0VpDglB+Y6pl7bG
ETRLJ5EeB7J6X6F4Fr8CHxsibQXwAllVNegxCxDXBJFFebSEtjTrLHHaRiSoS8+S
hbY0vg91sQHtfrqpTReq4dz5+zmMuz+D4cBluaTREjE1lXqZsllmsX4tQ1BNCMo0
rZ7J6y4HpEPoy0OPFLqlpz9SfRnnzw==
=gXty
-----END PGP SIGNATURE-----

--Sig_/UzWDtLHIZjBvcTWtpSiJtV9--

