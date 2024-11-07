Return-Path: <linux-next+bounces-4662-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E499C0454
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 12:40:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57BE2280DB5
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 11:40:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 625D21F428A;
	Thu,  7 Nov 2024 11:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Sq1sgyWj"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675DC20B1FF;
	Thu,  7 Nov 2024 11:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730979618; cv=none; b=gD9ySLSAIviWTZLB2hKA4MKMWqEoIgIoyyap92fW2cz6lMC4EQwtEF7RYCoYJciXWRBOHdA4lK8b43+KxuvUNz/tZ/Y3uCy3FHBLKQnKma1gx0BKL32SpugEEgvyTRB441dbz20eb5gQYDSQub+Vyf3QReu8YUT4XEBF0jfCmaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730979618; c=relaxed/simple;
	bh=D7rbhEZbPVLV80yEFgUNCtjx3x34/eUF5UyQRanTe5M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=OuEX+deE0RUuBqUHqVu/cTbzCPHzVgBeQsZiT6XUFBNo/7NG9NHyCpq3+ujQE1Nm+1kDost1pgLVSg4KHHG8V3B9L/5JFyt5TZCZJgQBhH8sfOFv5wH/oFpjTU/B30oAbc3pkKAEmRNyoKE5jbmi+1uJcdzQH3MwsrcuC2G4pQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Sq1sgyWj; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730979612;
	bh=4NmQnCvufRHSAjEVpJjKsFCxXn7czIle4IH1QXp8Ipk=;
	h=Date:From:To:Cc:Subject:From;
	b=Sq1sgyWj1mzem+ks//phn2bbrrbFP+ob7gOnsAlrbAl6LKjpGnKuiCIC/GNGPRmii
	 MEZm3IBiRX+XLVcbFXhz0qjT95Z/gV/JgP/TnXYywIRAMciAQ0Ht3d0LE/AMRdzJl9
	 iugOQRSp3WKrt0lw9T9qugJI4RqFOWCp8wiBaFk6K9BccUJghPUqMln7OY3+B6Gj7y
	 sEWpC1zbIkyUYMl+OQykuYuOKYYJzlag/bX1VLEmHSUwbz3Bzcbu6rCXvA958yTeku
	 +lJQFLecgYn+mfbyyeT3O/l+OVACu8+dVlEQ5TUCp2/ZHPZd0GgznCB96Yf4zThP3v
	 e9JXbeajTg2Wg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xkg9R1Jz6z4x1w;
	Thu,  7 Nov 2024 22:40:11 +1100 (AEDT)
Date: Thu, 7 Nov 2024 22:40:12 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jonathan Corbet
 <corbet@lwn.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the iio tree
Message-ID: <20241107224012.2981aa90@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CzVIJh=gUOnwcJEdglu.mFK";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/CzVIJh=gUOnwcJEdglu.mFK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the iio tree, today's linux-next build (htmldocs) produced
this warning:

include/linux/iio/iio.h:628: warning: Function parameter or struct member '=
__private' not described in 'iio_dev'
include/linux/iio/iio.h:628: warning: Excess struct member 'priv' descripti=
on in 'iio_dev'

Introduced by commit

  9a5a2483bc60 ("iio: Mark iio_dev::priv member with __private")

--=20
Cheers,
Stephen Rothwell

--Sig_/CzVIJh=gUOnwcJEdglu.mFK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcspxwACgkQAVBC80lX
0Gw15ggAoCsHExabqc1FtunzoupihcwRg+kDnx7K5qC884C/B6vwyY5X9vETS2et
lfmkuUF5eXOURHer/P9ghdnRIqg9xY3YP8t3L3PvLMSM4teOF+6y9Vm/75+huv8C
9YFDvRaLvB+y2K4UrI0A1poLVDuhOQIAqnQIpPBFNigiJ4WLf1gL8WDv+zEnuBXE
GVui3m0iUrNpUYQJwpwIKyxBz87x7QFKigIwfzfF9GN0ID8JYCksuu7THP40OKSY
U55+xJImd/EoDm972uVsaaC4vHe1DYE0C/VRdc5J9ElfH3jLS+4diSvaoDA4pzNy
2/tSz6xO5mlFxhoiK7TMi+9d6zxW8A==
=Q+UE
-----END PGP SIGNATURE-----

--Sig_/CzVIJh=gUOnwcJEdglu.mFK--

