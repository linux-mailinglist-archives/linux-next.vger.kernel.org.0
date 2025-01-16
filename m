Return-Path: <linux-next+bounces-5219-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCE0A13066
	for <lists+linux-next@lfdr.de>; Thu, 16 Jan 2025 02:01:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3DA1E7A1E50
	for <lists+linux-next@lfdr.de>; Thu, 16 Jan 2025 01:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2C5E5672;
	Thu, 16 Jan 2025 01:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="uZOZGyQs"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CBE1367;
	Thu, 16 Jan 2025 01:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736989271; cv=none; b=t/rM+nRsjz/zMgYIsKdUZx/X4jr1/XPy5ME9S4u4/2D4/y1Qo41E6mm56ZrLOji4+iWr91RWDq1bRzTphzoYWYLWOHn4I7aOWfUICKJqSmViLfZATWncpW8P6s4eQfKPYrrsZ09mYk/ZwrK1U1/ahC3N/ZvzAKlLuZmA+s3C+/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736989271; c=relaxed/simple;
	bh=rcBvaHfnawEb8639v0yMxmLT/WGmveVHNuJkdlz/kSo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IgnfifmlbNASn4rtRamm0xz6tIn+41dCMRjf3C9B+ej9tMlELZVc1dDwm4BxrqA/6IzpTf1+AnT3iBAFXIV454Rbix1CKrsp4P8lU3fn9yKfIu5xbo5h8SXE+uRParBkGNG6lmG1jA3QjqR3QQ7aDcnVy8H8MnWcxkOnkvbCx1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=uZOZGyQs; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736989256;
	bh=WtseQk43hPu/y1TdKZa4CykZZ0+3CnLbf+gdN5rIcio=;
	h=Date:From:To:Cc:Subject:From;
	b=uZOZGyQsy/TxdOC4xD1p8CY0x1jezF5WncK6aWLezjDdZQdvnVn05uyLP4o1jiwnZ
	 haFPGtby2Gw/g69tqcqGGLVEbInfZJRKRCtSuIvp8T8i8VBc/dirD1C3iYYc+ugdKg
	 FiOeANv2fucIAwZmDEIWhx533oqz6GEznEcsj4HOokZgCBex9BS0r5zDcZ0esZqHh0
	 bvT7134aTQyDF/ho4DT6ff91xIAvCH6WiEnkwHZZqInJUVHQv4unDjAs2ropLaYwD2
	 Sk3Svpw2RG+wCE6LRjMiC/LBxxsURAKhYVaNdBpJNHCoVzpFvKRXAK7rUqtZs8LzcG
	 G8EUOWg4INolA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YYPgW6XkLz4xRj;
	Thu, 16 Jan 2025 12:00:55 +1100 (AEDT)
Date: Thu, 16 Jan 2025 12:01:02 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the samsung-krzk tree
Message-ID: <20250116120102.6c848c63@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UIedGggCiofjb4Ab2l/UtLY";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/UIedGggCiofjb4Ab2l/UtLY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the arm-soc tree as different commits
(but the same patches):

  33ebc0fb73ba ("dt-bindings: soc: samsung: exynos-pmu: Add exynos990-pmu c=
ompatible")
  2dbf3f19da58 ("arm64: defconfig: enable Maxim TCPCI driver")

These are commits

  f16d91d8febf ("dt-bindings: soc: samsung: exynos-pmu: Add exynos990-pmu c=
ompatible")
  d2ca319822e0 ("arm64: defconfig: enable Maxim TCPCI driver")

in the arm-soc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/UIedGggCiofjb4Ab2l/UtLY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeIWk4ACgkQAVBC80lX
0Gws3wf+Oj+gdN2myGizUDwvWyQp2sn7eteF+icSC4QHZyTFduUKaj/OhHS6uLfZ
Z5L++/s4ny6iMN6kf/OYu3i5ullTNSa7/N8CK3/u4H1wUXMKJ6yQQUe9oc8uPt8w
EyZ/e6PM+3Od5A5JcYb3v9vMkGuiQKM3uSb0X6cbAunCRSBuGKwuDWXafvwGwqw6
jAL+L3hGobqAuAC6HP+Ekh+X3ILWjf9OC8JWcPDHhncXCqa37W5c4WOPJEPFCtaF
CqESE0Tg9SRG4Xy42jzNHWpdyWaeNomyOZnao3MZB8olj0W8hKEE0zKFoJ4z0DMO
WgkQpIbWuudXiRj6gNwCvnivMwg73A==
=6fl4
-----END PGP SIGNATURE-----

--Sig_/UIedGggCiofjb4Ab2l/UtLY--

