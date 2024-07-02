Return-Path: <linux-next+bounces-2795-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 759F991F07D
	for <lists+linux-next@lfdr.de>; Tue,  2 Jul 2024 09:49:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 901961C21D27
	for <lists+linux-next@lfdr.de>; Tue,  2 Jul 2024 07:49:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9555C146D42;
	Tue,  2 Jul 2024 07:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VnhI9p4T"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25EF95CDF0;
	Tue,  2 Jul 2024 07:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719906586; cv=none; b=VuUQGtUkZmVNjm1HTFdXbUqBVwPOmrkn+EB4WNjkh7mmkAFlyaH2FQdh/UTIc7Maz7DOXKhQDrmdErGXFsL1WrkQ0keOEaU1ciQtfMJQG2BQHruP8zeV0odzsfR6DuBga+2H6ZcBuToS+RLGUUgBptPoISm0Rkm3lO2ndvttQwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719906586; c=relaxed/simple;
	bh=g5djAKCWpAb9YtQoWESXj333874VFGxX7PpSogCi1UE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ihXGfaGOwtKtpLrQWF4hiAjV7k3mWwp9kS5lO7X9CSeUx86HBXKJq/p30KRrYNxKsIMGiSA2ujDYUj5l55KLz5fIa2Qi96OIFiWloMssHcQ9YiLx5Ymdgu4PpByTTCYp0b7XzNsF8nnTpw8RLEW/TFy5RctsIHcxDOzUQcoOoms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VnhI9p4T; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1719906580;
	bh=YQ6oFofAo/61h7OmhB3vDYAGHBrj8bujxIrUCCGAHUI=;
	h=Date:From:To:Cc:Subject:From;
	b=VnhI9p4TiRELua3YCS6p1oRw1C5zPpEAuw9x1yo+KgNpwEhcr/3wAMRQsoAFs79Un
	 FNV3HCgcqwD09DC+z/fJoxlZqj2wivBLVAQ+E9Xeqpduygydrqb7DwopmjuOF8ruLE
	 lz6piIsYEuokLlBajBf5o+7oJAq7CJIv/lHK3Mw92hDbIa+PWMrYcCpsdIBMJx1rG5
	 AGm8CmqblTYWxfJsJpCDztYgQasD9vX94+3z/dcI7Yn+mp2xjcRBTOSS+IuohU92BJ
	 7Y1Px6/x9x0te6xy8CFlBm9rYxC2tiKlMfcS2I3Xw7CzA5tPH5QpoM3YJN1P4sfqK2
	 4iAkSYogDqsPA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WCw6W37lhz4wnr;
	Tue,  2 Jul 2024 17:49:39 +1000 (AEST)
Date: Tue, 2 Jul 2024 17:49:38 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM
 <linux-arm-kernel@lists.infradead.org>
Cc: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the arm-soc tree
Message-ID: <20240702174938.04c12aab@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8dRmiJtKFHT6wPSib/zPlpQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/8dRmiJtKFHT6wPSib/zPlpQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the arm-soc tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu:26: ERROR:=
 Unexpected indentation.
Documentation/ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu:26: WARNIN=
G: Block quote ends without a blank line; unexpected unindent.

Introduced by commit

  dfa556e45ae9 ("platform: cznic: turris-omnia-mcu: Add support for MCU con=
nected GPIOs")

--=20
Cheers,
Stephen Rothwell

--Sig_/8dRmiJtKFHT6wPSib/zPlpQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaDsRIACgkQAVBC80lX
0GxnnQf/RhrN2fssfrxWEHOyovqD0Lwt+aRTCRiCOFbtPlan8mdOYktsfNqmVAZ8
JVj5MAK1hql3j0Cuq6BIxyx/hI7oBByxqrz7ktNIYhKn4Vpaeuv8WKJiGdd8JQH1
E10JGWOZSSwUrkWiPI0IJN49IHIuj5Uqr3GSiHP+EJg+b9+DjGixF/HpczMkQoNi
O9dJFtHeaW75XNj8ZsiBt5af/do+4l5rGiKCZRXsE/nJDfT7mfQUxbXXZNrMoP2F
S2Y5ErnAoGmvDVnvMaPW/auRO/FdpAVGzi9ELmUJXyE82CB9hP2ng96N+WSJ2yee
gCIRZSrPt9dw2v19zVigJrJafJQDrg==
=9BIA
-----END PGP SIGNATURE-----

--Sig_/8dRmiJtKFHT6wPSib/zPlpQ--

