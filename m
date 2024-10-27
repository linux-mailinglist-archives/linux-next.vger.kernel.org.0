Return-Path: <linux-next+bounces-4455-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F509B20C3
	for <lists+linux-next@lfdr.de>; Sun, 27 Oct 2024 22:14:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3716E2818CA
	for <lists+linux-next@lfdr.de>; Sun, 27 Oct 2024 21:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63009186294;
	Sun, 27 Oct 2024 21:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="n/2DeL6c"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C4D5684;
	Sun, 27 Oct 2024 21:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730063649; cv=none; b=rQnaKaJuHaSYop1gPOnBM4H3Nd6+artWigtlOStqNNhJxecImbVUG+Y3pULn/j3ZmXTWHqltBqRTwaYjPKpJbU2RbNh17r5HY2zHoa2efBdJ1wuQ3mZfgslc7c0ZGjCf91jAZT1RmLQpsSOdfcvq/95//sOibNUHD+P61pjlwJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730063649; c=relaxed/simple;
	bh=so+AoySYcBM12c77z/LnWClqHDFKcepvmE8+98poeKE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=QKSomf0NLa2UfLQrwVWBUhcCaI0e6WvElZ2rhA3aSmuKbpqcysNXPEs1MvOvF+3u1eOTwEnTyM8Rz8ZFEOcum0/FRbfY+iXpZb0fSSf0gCkbqNToBGfIZ/V3IZcjGGx8WWK0p1Gw2jE1tL3GPFVzZm1aa+A9twTDNXfsTIs7+qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=n/2DeL6c; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730063632;
	bh=mIWK1Jsn/3SU028ik+J4ZKdihUKmSuKh5p9duoSc4bc=;
	h=Date:From:To:Cc:Subject:From;
	b=n/2DeL6c4ZN6p1AsQFlt6JGrSYJU6hjGYcHuTwIFKHAqaNBH992Z3jzZ/iyWc97XJ
	 3ktGEAthHJxO2L540VuoIICiD6JtiY9eojxWrZW3hLI9Rt1eLWt7JVsThCtFyjVp8V
	 IIFKLAGNS9LjVkmwMPRma+2bz0e3xzbb0DsU2cnr6u7DaLRAnpe/imZgI28D19kDDi
	 xw63UDevA7tzswg0vgV1gTmkuWo/4bL3TdXB0v8U2EaGFxheXXnkg9CVtGx9hexP21
	 2jSg1G3yOaqP7qqIcZVHg1J1qVhjYYiGpVqrVv19AAVbqSKd3TJJUlYNYcMjk7pxQg
	 03G5xz0zVhjmw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xc8QR3Prvz4x3J;
	Mon, 28 Oct 2024 08:13:51 +1100 (AEDT)
Date: Mon, 28 Oct 2024 08:13:32 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Herbert Xu <herbert@gondor.apana.org.au>, Linux Crypto List
 <linux-crypto@vger.kernel.org>
Cc: Lukas Wunner <lukas@wunner.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the crypto tree
Message-ID: <20241028081332.70264ab0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BMIWo6+TNJ9OhoHAfSUg6Xt";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/BMIWo6+TNJ9OhoHAfSUg6Xt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  6835b816d02d ("crypto: ecdsa - Update Kconfig help text for NIST P521")

Fixes tag

  Fixes: a7d45ba77d3d ("crypto: ecdsa - Register NIST P521 and extend test

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split fixes tags over more than one line.

--=20
Cheers,
Stephen Rothwell

--Sig_/BMIWo6+TNJ9OhoHAfSUg6Xt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcerPwACgkQAVBC80lX
0GzVOQf/b65KoYpfb/QG5k6StU5qf+mxNJUVX7QO6obpWotGuyzdCH3VmB3RL5W+
M2xAms21r6QmZsohUdDIzvVcMonwiV9alf0pbScEyN16rYLeafEzkkvWZIbTy9Zp
wVXiu2IqpQ9mfRQv6YDulVaXltIR5FGR3ppOoKAwYHhuHD3EsluGZFOuuciqylZd
MtTbdmml+7fBGGOB7FZvBNt3gRKx+vJ9o9FtStf2/wKoCA1c9ON3GV70Maxo8aTU
teIb6CVGl2IelBW5uF8GPxWHfzrxa2W8gPKJf4+UUNLBgGstQAAGi54AqXgPsgQy
3KxNEs+lM5aG+3/qO3ZsVYLoWBBgbA==
=CxKY
-----END PGP SIGNATURE-----

--Sig_/BMIWo6+TNJ9OhoHAfSUg6Xt--

