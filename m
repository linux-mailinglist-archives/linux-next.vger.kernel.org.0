Return-Path: <linux-next+bounces-6315-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFE1A964F8
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 11:47:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 65B2D7AB1AA
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 09:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78F84202F7B;
	Tue, 22 Apr 2025 09:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="pgmQYRpV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37E41F098A;
	Tue, 22 Apr 2025 09:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745315224; cv=none; b=alujKP/OokuxLmkCqz+ttnVruQnxGdI3NzaiFscGnKN1AHEu/2v7bA77X8lhgzvrDV7Byk5MWiz4fFXiCzPE22KrJ06nWvkNn+52lTldnkto6AEqhG80mZvtvPuniSVrfL482a9m/cTrF8g/YAkDbpVgaZqbzasDvezG+X9llbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745315224; c=relaxed/simple;
	bh=5tP7GL/IdOQE/eER9qp64t/bQCThmlFi+8PGX5utZRc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=bwJ1/Mp/Z2vIf2z8ieCe05GUq8WfDjL596Tj0JWA16M/0MKp55ebQrtzKnNvqDhm+aKv9VNn1nZVLZKB2hThRiChNEWFnI5A6/EZRmHO2YZg4k2as8ORUwxlKLzxesfCV5a4O2zmfeMLlQsi+CeVDkw3tFj66tb0Y3aAbz4mF20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=pgmQYRpV; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745315220;
	bh=U++yr4JqDmISolfx4CZtEflT/0RwTwSY9q6ujoOSo7M=;
	h=Date:From:To:Cc:Subject:From;
	b=pgmQYRpV0mNZ2Yb5x+ok/QZZ86jaUw3LmmqFp2L8RD/Dzct3DgPGeZGcGXppQj6FK
	 UvzDk7qbf45OXAJ75SBUreueoB84VnQ/UjvMupIq2fl4zm6vy3Jdxp+WTqaOyEu5If
	 rXtfODaaMhEmmmpF9BKn/vzUPmMgldtgsd9GBjWHkUPRKusw207vMASjgRlImpchbA
	 afBMgt+1D1YUpnkzVHSrVsXqmNfk2xM1hyjfmCzaxIxWfotf7IhWjT6VZkHUKeXwpM
	 uM3G2jSsW6fB5283s8oZW/fgMDvJlKmBt8LRuBNTcvGa2txonrX0spOuZXVQJxAzDW
	 2RdamlbzFOsOw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZhcpC65Xzz4wbr;
	Tue, 22 Apr 2025 19:46:59 +1000 (AEST)
Date: Tue, 22 Apr 2025 19:46:58 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: Kees Cook <kees@kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the iio tree with Linus' tree
Message-ID: <20250422194658.0325f6d0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/F5L0+UHM_L823ERNd+uCwr9";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/F5L0+UHM_L823ERNd+uCwr9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the iio tree got a conflict in:

  drivers/iio/magnetometer/ak8974.c

between commit:

  05e8d261a34e ("gcc-15: add '__nonstring' markers to byte arrays")

from Linus' tree and commit:

  aa83447daa04 ("iio: magnetometer: ak8974: Add __nonstring annotations for=
 unterminated strings")

from the iio tree.

I fixed it up (I just used Linus' version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/F5L0+UHM_L823ERNd+uCwr9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgHZZIACgkQAVBC80lX
0GxCewf+NF+FnuTsoOFERefm54k9q5JyX4wJ9zI7E5TmLiWtIYXKsBsrHArBU9qy
frS/rM4yxk4thBXbrtR5yM9bj0lbGQm3hScleCCDhHvUAAwgQC7p4KIePfNnOhMr
vNDf8kcsCOLBJp1de4wHdd5sSdw0rKMk2fCk7iwc1dXh7f5DEDMwNY3EpiaWg0r5
C1cAtRDO0d+8tNLi71SFl+yc5gtMckK65ysS2zrslHvwjMSy/0lmsgmy+IF1kvv9
BN7U+GMkMUBsi3XjKZf8ICGK2PrmYK/WqcwQGpU4B/G9BPoKXRMCa8/eJjzObt2p
qPGv/xID33xB6q7VXqZuSq3/d0OppA==
=Nxny
-----END PGP SIGNATURE-----

--Sig_/F5L0+UHM_L823ERNd+uCwr9--

