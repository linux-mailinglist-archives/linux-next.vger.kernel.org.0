Return-Path: <linux-next+bounces-4619-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2071F9BC52B
	for <lists+linux-next@lfdr.de>; Tue,  5 Nov 2024 07:01:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 526B31C21709
	for <lists+linux-next@lfdr.de>; Tue,  5 Nov 2024 06:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 962C51FDFB9;
	Tue,  5 Nov 2024 05:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="X+bh2IrL"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FFD1F585E;
	Tue,  5 Nov 2024 05:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730786397; cv=none; b=ToFSzlcwkIKoZWC46o4fHClZOqQyBasxUn+0GGO+vUEBnce98iTLX+OFIvaNd+9i9k/XxwBo0K8kZg7FjgrbUQ78rvtGSUyjn8y5Gn5jggOjBCyNBqA7fuc8qnXFgzmar41AeAcDEh8s+GX9sveA/1XVat7StJPGOiYHxdZ9i3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730786397; c=relaxed/simple;
	bh=uVaMzA1xn6LOx7oym8J9M1mrtBEtDJyfI/7d6l+LT/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VtiDkMvXA3GlnZsRItmTk826GlM24T1AZugzLc0i1uJLaME55kxcsgvT8Pojf0fWSkfblYdFIFaW3BkkgsUp6ThdvjCOqJXBtV1imY3KRl9jlCeYmVlXlwQTgPn4iTAqQlTwTn51EvvX5XteyA+aKBK8x02q/8f8UflGJZyrbsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=X+bh2IrL; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730786389;
	bh=Afj5YsQnQzRrx+3Adn7qZ7sHWdUdCMUHbp7gg2jYAdY=;
	h=Date:From:To:Cc:Subject:From;
	b=X+bh2IrLHKawtPgw29/4ign6HCMozXvmziyetfqkb8pStr7RPqFcn0ZUWnDB+RNuP
	 57uCYatr8KDceM1Yo5LhLCMu+EELq0jbfyzwtuH9h9Fqhb0dAZ4E6fYz0Zzxqbf1m1
	 3pXlvkoLCEvEfInZjf4zo9aL6yaIAg9yd3R+KQ6kwzseC7FH6LG+mW64OsiEBgrEcC
	 nGxGdWYI/DjCayv4t/U5jldv+1VferdEEMH6+ggfAQqZYNPCwmQvVe2PT2JvgxdyVs
	 qy7iLeHblq8atplGl3dSucxCyFk6boArPFAE5gNEwt5mBtPGVDxhyryLIXxd5AS+t3
	 HxFYcLHzYz2Jg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XjHjc6dKbz4wcy;
	Tue,  5 Nov 2024 16:59:48 +1100 (AEDT)
Date: Tue, 5 Nov 2024 16:59:50 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Greg KH
 <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the nvmem tree
Message-ID: <20241105165950.05d01c8e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9KAiitTI8YtPh4HZIMguI9/";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/9KAiitTI8YtPh4HZIMguI9/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the char-misc tree as different commits
(but the same patches):

  24c50e7003bf ("dt-bindings: nvmem: sprd,ums312-efuse: convert to YAML")
  786700e267b0 ("dt-bindings: nvmem: sprd,sc2731-efuse: convert to YAML")
  17d6f058403d ("dt-bindings: nvmem: convert zii,rave-sp-eeprom.txt to yaml=
 format")
  e2ba37350d1d ("nvmem: imx-iim: Convert comma to semicolon")
  3e93f43ae64b ("nvmem: Correct some typos in comments")
  5ac5933d4e06 ("nvmem: Add R-Car E-FUSE driver")
  149e83f1b385 ("dt-bindings: fuse: Move renesas,rcar-{efuse,otp} to nvmem")

These are commits

  b8357f6764a2 ("dt-bindings: nvmem: sprd,sc2731-efuse: convert to YAML")
  1c4ea801570a ("dt-bindings: nvmem: sprd,ums312-efuse: convert to YAML")
  5e61687075e3 ("dt-bindings: nvmem: convert zii,rave-sp-eeprom.txt to yaml=
 format")
  2e7bb66b55f4 ("nvmem: imx-iim: Convert comma to semicolon")
  b3d75e9ba013 ("nvmem: Correct some typos in comments")
  1530b923a514 ("nvmem: Add R-Car E-FUSE driver")
  2aea0d17ff9e ("dt-bindings: fuse: Move renesas,rcar-{efuse,otp} to nvmem")

in the char-misc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/9KAiitTI8YtPh4HZIMguI9/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcptFYACgkQAVBC80lX
0GwkSAgApcvLB7hSd4ZxZkUr1a3aeqC6eXMV/ZFRetNzZR2Yce+lB/7fX+u7mb11
RFQmDlt0LBykzB4+kJnopN2MUKerW+C1VeYzm0nXt4FJ2pbfflwTLuDJcexrv0J6
cW57gFXgbyYi+sqq0WXnieq9Z9YutCMaCLuv0PGlWKdZQmme8ugGk0ImuBU8QAss
xcce9xeVRaeOzq7f9gV1fKw5E+82xAQ2sxAryolVMyGavaGBtJjUI2xoWsOnWaH7
pnR3TswaG7uWln0uPMTtYI24oGqyVWmpexi7ozkGdX1A3YeOpTPbSPuRWyyn/PIe
B8b7ud4z1RZmD0IMPNF4ogiI7pbRGw==
=OcIk
-----END PGP SIGNATURE-----

--Sig_/9KAiitTI8YtPh4HZIMguI9/--

