Return-Path: <linux-next+bounces-9034-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 55894C62408
	for <lists+linux-next@lfdr.de>; Mon, 17 Nov 2025 04:37:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 00E324E1216
	for <lists+linux-next@lfdr.de>; Mon, 17 Nov 2025 03:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96645258CE7;
	Mon, 17 Nov 2025 03:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="aBf4YR+S"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACA023D7C5;
	Mon, 17 Nov 2025 03:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763350670; cv=none; b=XIQcZrBUkjAYFONXu1hRhJ+pDPnfJmG4k9VTegfvP1CeZpbtsHZ44sFWTHz+3rJZ4wrSDsXjjRM7AHUF4i8rDV2mhyJjwIyJTNrPTslvrzU0a4qbD6bPMGKQZEioPsQM+LITkR35O0Cn3EMFomRwASfvJDCpiJOml6FmjzUl5t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763350670; c=relaxed/simple;
	bh=HfvNn6ub9CN+eWRbND6vfc7mrG83np95vCrdNtMp684=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=s/Npa0HGUqSvPo9GeD6ScP29SdfnnwYb26rKxFv57GixxV+fHnS/hbVZm9+GINs+HUOtInwW+5LzEhTsqXiRXwvaiOr6i3vl4nCbNUL0eO+6zZWS+LkN2D1F/T54h5o6UkLWKyP6Snx+iXKuICl66NbEhBnt567awiWr1rterCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=aBf4YR+S; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763350666;
	bh=hd0/TYwU+hfu+7aN55yzb/M+mePZ33iAmhErFpBv7dA=;
	h=Date:From:To:Cc:Subject:From;
	b=aBf4YR+SxvOPaM+GRDQqJt+s0hxq6RyrcRaYRkTjJRCSVceX975KKA+5zPxr1K8Fy
	 AI9Myea85FAwxgGo2XPRwDcLxd6IX/rVfUE2v4B4+7vUsD1LBk+UCnDIcC7jfehXWu
	 KTmHxv2B84OdQJOyNbv7BlLWPAH6Dv62PsUXlxH+qtwOvahM069F65veQ75zUf9riz
	 T1D73ryuUa6m9cL1AJJ6vIE6YzLLzwsf36kw9a5nwyUShPgwE/GMVsbxymuMWrh5k1
	 1qzry/RnNnDwOme1bbOE9R4DCtrI04ae5G8cauSZ5icFlnue8OtnD6Cv+fmnvWUKcE
	 j/6bmkx6ceXcg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d8tjj462wz58bQ;
	Mon, 17 Nov 2025 14:37:45 +1100 (AEDT)
Date: Mon, 17 Nov 2025 14:37:44 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Herring <robh@kernel.org>, Wim Van Sebroeck <wim@iguana.be>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the devicetree tree
Message-ID: <20251117143744.2dbd6be5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3yOfGtKaaVk1+_UYjiKB2Vl";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/3yOfGtKaaVk1+_UYjiKB2Vl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the watchdog tree as different commits
(but the same patches):

  ed15cb1d21fd ("dt-bindings: watchdog: Convert marvell,orion-wdt to DT sch=
ema")
  5415ea2a70b4 ("dt-bindings: watchdog: Convert TI OMAP to DT schema")

These are commits

  fbd10d967045 ("dt-bindings: watchdog: Convert marvell,orion-wdt to DT sch=
ema")
  af34a25336ed ("dt-bindings: watchdog: Convert TI OMAP to DT schema")

in the watchdog tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/3yOfGtKaaVk1+_UYjiKB2Vl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkamIkACgkQAVBC80lX
0Gx0Dgf9Fv3idGfvM7XyXQaCwv6IVebucAQcZjp+BD3eCxTvmJlb2BQOAFE8JUgW
44wQUW8tqDu+719hFEQdrPtZ7oe8cG4yPkxl35qRjtRUJx1ezcdQJG7YtAz6AfG/
s4x4SAX2jwbEk19DeBYy98YbJbjaBZ9F8tt4D22CIqROp1kU76QiaywDiNPClTLn
BFAqLYl+haksJUYoo+IpoDy8rrUT5M3BHX+PhWwFKxAZa6t3gkuBa2ZXo71/iW8M
qOTCKLFOgH9uGaSeTRrZuK0blD1xbObiXvqYkdXSiJr8a/WvIZdM5exdbqJzUcbf
TBnlWagf6gJwNAQhRO7U3t44GRegQw==
=2LIw
-----END PGP SIGNATURE-----

--Sig_/3yOfGtKaaVk1+_UYjiKB2Vl--

