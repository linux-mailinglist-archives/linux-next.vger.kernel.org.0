Return-Path: <linux-next+bounces-7413-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C265FAFDB93
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 01:09:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D56034E8021
	for <lists+linux-next@lfdr.de>; Tue,  8 Jul 2025 23:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8760B22E3E8;
	Tue,  8 Jul 2025 23:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="rHYDp8Dv"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFCA22C35D;
	Tue,  8 Jul 2025 23:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752016139; cv=none; b=Aw1WLGDM/q5rNIbAHDD3BFHXi+kozoYwfiajUfkgIcoevfcTGpF3PaD6rjCtef8QmLhVCgApIxM71s/6Zq82oYOpOVW0ph/WCUYESb1Mg3lvtM0Px6Pps1thKNJrVSWv/K8zqtL8gJxZdNu5jAA5eCX8I9a77ulugs7vOB+N5MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752016139; c=relaxed/simple;
	bh=p1X7O3b0ML7w/9EzI1qu4eqF3Y9atMsv8WPbJ1SYU/w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=NOzJkikTbMSuVRjfiKx9AVoyVBUxrr1hvpcvIKWv4yZNEl/EiFWJz4M9KbCCsaUt176bq2TbRZ5Bpyng1sE4lW17f4CTNhwmBCzGnJgtgWsXapk8nsqC0R+L3A4Nu5J9T2jmMHtu+JY3awHQ3TGG5DbXDUuhHnspGvU5j2IrzTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=rHYDp8Dv; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752016061;
	bh=yMjFJ78UCJA3K2osKSdm4VdluTkaEWzZpEU7BpAcmjo=;
	h=Date:From:To:Cc:Subject:From;
	b=rHYDp8DvGHX5TxMCQWApqZXYdLppJucXDS7icPLuYPQB5itgE1jnsZ4emzfSFQ0Ge
	 IbIxKn4Fb7x9VWEU1RoQniZ3CDTFOxtSpBNcROLscRL9suwuXfj20POFWGXC3hrPCZ
	 GzvvBzlGE6RCLLsJB5q7o2zs+V46BnVwDb8jy8023dbIpgNlBvwVGTN+S4Gmcdp2Lc
	 bm22aOGWF3+WkPgnXtgHwmgbfm/e24u/1/yG7ZG9J/yGsv/bXTJxk9mZyD+5q7sYLG
	 MBdiRJQp5hQ9dtovx/ueZyJm2yTZkB54j9K1fG2b3sSYwFPPsp9lw8eKkCaQYF38Cf
	 G6NT9XKwKFTBA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bcGwY3QXdz4w2D;
	Wed,  9 Jul 2025 09:07:41 +1000 (AEST)
Date: Wed, 9 Jul 2025 09:08:42 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Yury Norov <yury.norov@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the bitmap tree
Message-ID: <20250709090842.467cfcfb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/klxkVCnjqeLrP3TZLGZU2kV";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/klxkVCnjqeLrP3TZLGZU2kV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  d702b0ed6329 ("MAINTAINERS: bitmap: add UAPI headers")
  adb5c828d022 ("uapi: bitops: use UAPI-safe variant of BITS_PER_LONG again=
 (2)")

These are commits

  1afc85deecd3 ("MAINTAINERS: bitmap: add UAPI headers")
  70b9c0c11e55 ("uapi: bitops: use UAPI-safe variant of BITS_PER_LONG again=
 (2)")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/klxkVCnjqeLrP3TZLGZU2kV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhtpPoACgkQAVBC80lX
0GxVlwf+JbTfNm4zGkOOHiKJ2Ihm8tcXUMIEopXc6y6v0gtFAedkdb/inw+Jka1l
7A9suY3CKQ68X5FXfR9ojSFNKgG9E2kv4S3hhCPDcRyoDM+pclA9IVWggdWdzTiT
dxsLrzfeYxmDpgftM3CAOQ53nrSxb1wHCDJ16vyhhETMKISpPCzSvVskR8RRMGsl
VtKcBjRk/g+Imtn7VEHl2uGKNQGzW7wGfqUNih1UrR/KCeU+PCQKZWG31RCtsvMe
wH4CJXPWzfx6wWHQ6LbTxgB+eZ1cKlOPjQrLZuNLFUMYnj4MBk9knl1YPXcTgN8f
5aYIxPKlf4rQtuQzO7cX8zZsIZuQDA==
=gRYo
-----END PGP SIGNATURE-----

--Sig_/klxkVCnjqeLrP3TZLGZU2kV--

