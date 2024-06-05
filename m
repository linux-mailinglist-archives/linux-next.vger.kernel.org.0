Return-Path: <linux-next+bounces-2466-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4488FC233
	for <lists+linux-next@lfdr.de>; Wed,  5 Jun 2024 05:34:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED3EA1C22541
	for <lists+linux-next@lfdr.de>; Wed,  5 Jun 2024 03:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FC8A62171;
	Wed,  5 Jun 2024 03:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qaYmm06f"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307192207A;
	Wed,  5 Jun 2024 03:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717558479; cv=none; b=JusP9u44+2szf53Ob1fER+G8qGbUfdgB9InDpISynvqd1Od1xbUiWgNlneh1UAYuDK0ECPGSpcvy74ZFUAYs+Sl4TRAXTTSyy6wNRqsR3L9KzjkWRtXCLkFpdAYyjpvYDDwd+BUcGHGPwjhGrflMX7LNwhQSxMtQd7HWHPgVTJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717558479; c=relaxed/simple;
	bh=U59iG84MYHmbG6u1nymrqdGWs1z7iIdINCxLQxmkHRM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Rw1/8O48J34170NKv1TqivhpKtAVg6JHaptqblWgFEyoFSkcPNmtssyWMR2T/iFJ/llI57ZOZphNZ6GOd/0mHKCMaK0NklwpuTwIfvfcD5HLOdzA1d8uYy3x8Tfgjkjvw8eUQV1C4owPhJpn/n71Hu+Ag25eYzK5QZFwpS+AjTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qaYmm06f; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1717558464;
	bh=HSs+hOyrBb/YBLXqsNqLW1Lc0Q9jnKEcGHVvpB8+GgQ=;
	h=Date:From:To:Cc:Subject:From;
	b=qaYmm06f62olcnqMftCcCQplZuR+RDjhm+jLgv8UEZ8JeY4lRq4fpSxgYLWPWRp77
	 +vPKhbiq3ue6B8oae0VJODBm/+k2AdYyKCky0xsM7CKUktJR9O3aZiVqw2OyKIsmPp
	 wzXK10AIRD0kfBylCTnV/LPTGX7Tvx59zDMoHfzJX0SCOJFmKIBEfVz+HFt8m6TwGs
	 TztlDg1XKtheWaUB9PeqGuLMDGaV4lOA7nYX43fNiui4SxY4VUy5CLf52fS52fBui7
	 /U5ro84QsNkG6wd3L7vnHvtVnAvaC7oIzuJOULIUqXWwG+KpvB/+E56HpXVQe7/qMf
	 NKEj3VtBSWzbA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VvCkS3bVnz4wb0;
	Wed,  5 Jun 2024 13:34:23 +1000 (AEST)
Date: Wed, 5 Jun 2024 13:34:21 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: Ramona Gradinariu <ramona.bolboaca13@gmail.com>, Ramona Gradinariu
 <ramona.gradinariu@analog.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the iio tree
Message-ID: <20240605133421.2af4b076@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bQjtAcn5xY1/d+H.L/i4Muu";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/bQjtAcn5xY1/d+H.L/i4Muu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the iio tree, today's linux-next build (htmldocs) produced
this warning:

Documentation/iio/adis16480.rst:419: WARNING: Lexing literal_block 'root:/s=
ys/bus/iio/devices/iio:device0> hexdump -C /dev/iio\\:device0\n...\n00006aa=
0  09 62 00 00 ff ff fc a4  00 00 01 69 00 03 3c 08  |.b.........i..<.|\n00=
006ab0  09 61 00 00 00 00 02 96  00 00 02 8f 00 03 37 50  |.a............7P=
|\n00006ac0  09 61 00 00 00 00 12 3d  00 00 0b 89 00 03 2c 0b  |.a.....=3D.=
.....,.|\n00006ad0  09 61 00 00 00 00 1e dc  00 00 16 dd 00 03 25 bf  |.a..=
..........%.|\n00006ae0  09 61 00 00 00 00 1e e3  00 00 1b bf 00 03 27 0b  =
|.a............\'.|\n00006af0  09 61 00 00 00 00 15 50  00 00 19 44 00 03 3=
0 fd  |.a.....P...D..0.|\n00006b00  09 61 00 00 00 00 09 0e  00 00 14 41 00=
 03 3d 7f  |.a.........A..=3D.|\n00006b10  09 61 00 00 ff ff ff f0  00 00 0=
e bc 00 03 48 d0  |.a............H.|\n00006b20  09 63 00 00 00 00 00 9f  00=
 00 0f 37 00 03 4c fe  |.c.........7..L.|\n00006b30  09 64 00 00 00 00 0b f=
6  00 00 18 92 00 03 43 22  |.d............C"|\n00006b40  09 64 00 00 00 00=
 18 df  00 00 22 33 00 03 33 ab  |.d........"3..3.|\n00006b50  09 63 00 00 =
00 00 1e 81  00 00 26 be 00 03 29 60  |.c........&...)`|\n00006b60  09 63 0=
0 00 00 00 1b 13  00 00 22 2f 00 03 23 91  |.c........"/..#.|\n...' as "bas=
h" resulted in an error at token: "'". Retrying in relaxed mode.

Introduced by commit

  d6de8052f4a0 ("docs: iio: add documentation for adis16480 driver")

--=20
Cheers,
Stephen Rothwell

--Sig_/bQjtAcn5xY1/d+H.L/i4Muu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZf3L0ACgkQAVBC80lX
0GzCNggAj5k8ME2V1fXUwJ64yPtqdxiQXHhz82uMcbvgA87+k9xg2CqDnzIU0CnU
OfxZnbiX9RvxUlmfEPqMjEpLHc8VWDq59IPW2QxAO1Y0sxoZfl/hpaq1oZPXb8x4
Ze/2YYjPjZLapKdC0f9ZxDpJNb3dklbr1KC+Yclc8kLjdZonL6Xar+GziJVPxZIW
pEH8JAAkQnQrOoEBWM+jnd7uM9u95mDGBUp+UPZOYyVx5x+MLzreBYTmcau3snbs
Y99B5vVfgHjRfnC6/guKeXJjQRpXZGYhgwiOBqB2PV/9FZ6WV6kFEvXHsB5whbdC
hYHt8d4u3/Z2uIKLg+KBgyfAa8nuUQ==
=eSBY
-----END PGP SIGNATURE-----

--Sig_/bQjtAcn5xY1/d+H.L/i4Muu--

