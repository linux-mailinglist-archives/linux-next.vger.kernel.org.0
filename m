Return-Path: <linux-next+bounces-9660-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB80D213C8
	for <lists+linux-next@lfdr.de>; Wed, 14 Jan 2026 21:55:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC81E309D9F3
	for <lists+linux-next@lfdr.de>; Wed, 14 Jan 2026 20:53:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7718A357A24;
	Wed, 14 Jan 2026 20:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Kp9T/zWt"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025BA3559F1;
	Wed, 14 Jan 2026 20:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768424029; cv=none; b=Cz58DQE2dgPjzaxJf7V4fx5KeK63FNdgLXLrvqnISYHJDoremBWuaJ/d1b3363hGoY79xyhp6GKIzMTwC7MhrlOjL/GHM95jTLa+zlTNWvTCvbsmi7HMgtjqdsESx1cF4YP89SSDSq79B5n1/NmxU04AVqxG02rPS0czt1X/bX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768424029; c=relaxed/simple;
	bh=4eW37fPd/Cdu9dh9S9lE7GbXYXMjfexOnaCCXwq780E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=aEIbQEQ4xgx9Q5ZKDR7DGdupheBTXXut/Xy9I6g2MTIUjEmCRiXg44efAXs1jU1yD3rxAzKR18L2eNUKcl2Jrl+ke9PE60JzKRZjnf5u8RUYBlMEnnePwYVHlemwUKETZTZBCN0FHrhhovagNtWUYbXbxeCByELcxVDKrOExBF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Kp9T/zWt; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1768424022;
	bh=A4/n64SB75kIWeEU+EWMxcFfNtAF2hHW5wwL0GMwKwE=;
	h=Date:From:To:Cc:Subject:From;
	b=Kp9T/zWtgmUATr3SHuvqlgCRF93dshnstTg3mZT1EfaTi8NkxFCh8J6TxQA9L0ZwW
	 ofK6c2xkRD2pC8ukdRNbZTJzujgL9NHukZ08jpijQ+jEj5dtxtzXaRQe0yGuT8OhzN
	 nEz+B0pYVCY1Wsd3jiPj4HDKsNm30PqaLcbsijlnaSyRnxWkm4UKVszrN7m1SkMEUC
	 whFfgglPQ7PCCGpQ5LeR46yERAwoiDveS2jN+eAqUnKFZ/HhSKXa9CrtokRHhIsFY3
	 FuTz8ViOF8e1IpUxXvpopk/lHy5olF6r/PhxjHKtmkU7oghDT1kZwyCLxzEY7WiMXr
	 hVFkuykkVutGA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dryyF2Z4Cz4w2D;
	Thu, 15 Jan 2026 07:53:41 +1100 (AEDT)
Date: Thu, 15 Jan 2026 07:53:40 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Jarkko Sakkinen <jarkko@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the tee tree
Message-ID: <20260115075340.72b35a93@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KoOADVkMEYE_o+mAVfX6MZl";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/KoOADVkMEYE_o+mAVfX6MZl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  e4280e3ec728 ("tpm/tpm_ftpm_tee: Fix kdoc after function renames")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/KoOADVkMEYE_o+mAVfX6MZl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmloAlQACgkQAVBC80lX
0GwvGQgAg7gHNLtwGauytJBaId81RYxTgzpTR83WkrPpRgyKeuKtfnZPKC48MQbK
fbwM2Mm3FpMYEzJ3PbAvGDtoF214c7KKIfDAZg4/nsi5nJWY7U4bki10PP4CdGCS
Id1ahdYyQsAmCjZTAE2A+fjFG0A3uea0Uy7F5ZB5Km8c2ow37gWZCNMNiMK/6V+k
r/QVIV5GenmKFMqbflHH5tEdkkCPbkBd3ZoDvFRr7HHY7dT24BUNQk2ye64JAylf
vaAoHhmHXcYKn2jL8jV3MZ+Vl3TWGBrZDZFVJ+YAyrSY4aO9VOQzXkQy5zKSvuQt
tNpKCySIW+Btt/P8+6wkDwGE6FD77g==
=FbDF
-----END PGP SIGNATURE-----

--Sig_/KoOADVkMEYE_o+mAVfX6MZl--

