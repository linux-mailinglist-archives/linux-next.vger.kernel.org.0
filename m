Return-Path: <linux-next+bounces-242-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2B0806500
	for <lists+linux-next@lfdr.de>; Wed,  6 Dec 2023 03:34:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D7AB1F216FC
	for <lists+linux-next@lfdr.de>; Wed,  6 Dec 2023 02:34:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D75310783;
	Wed,  6 Dec 2023 02:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ts/PcCcX"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9214F9E;
	Tue,  5 Dec 2023 18:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1701830039;
	bh=BCM+MfXUrTzHO36/7tt8Uv/b1nQ71LO63G+QflHlmmQ=;
	h=Date:From:To:Cc:Subject:From;
	b=ts/PcCcXHPkTWYhkFWg/7PtlAz3jyhv/lCCwSvFFJqrrx60/3TOt2DN0GeZeYICWI
	 RYRLY/vpRV5w3qrH8ok4WQmnlL3xONIvacAJfpsJevUzYrFX9Gmk5tDE9s58CCfNfq
	 D8hrU+oxmU5aUdTpG+jm5aaB1bmoZH3GRLL4sxPpAwGownwMglZkobVOGO+n1Y1jF/
	 9nlvN5yEgDi1XJv+5OsA6ba/+hrlORcKOgmt2U8j5k14ZadAS14QsyQUmnQypKiZ32
	 ZDczFF5vxjG/aO+PldwkuOBPHA4ChmLN+DTZB6Qi2w68E5S7tNYx/sSpEMTR/2N2jT
	 lOSJ3kRJ/affA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SlM0l21tsz4wcH;
	Wed,  6 Dec 2023 13:33:58 +1100 (AEDT)
Date: Wed, 6 Dec 2023 13:33:57 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the asm-generic tree
Message-ID: <20231206133357.2aae6f49@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uqlLKZjeeR++b7cjLeHjKlC";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/uqlLKZjeeR++b7cjLeHjKlC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the mm tree as a different commit
(but the same patch):

  235a59c373b1 ("mips: remove extraneous asm-generic/iomap.h include")

This is commit

  83e9a9f1e7d6 ("mips: remove extraneous asm-generic/iomap.h include")

in the mm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/uqlLKZjeeR++b7cjLeHjKlC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVv3ZUACgkQAVBC80lX
0Gx77gf8DqhSdROWbMGFPE8XU1BVs4exB0FYJMjO3yhkD6P6QvtHBxMKy+txHmGV
2Y85SDOBSu2vcDX1Q3TozWVuTAz7cSycoW+0c4pRum8VXydFNU9l3/LhHhsCeqQx
p8X9mkvDjaraOHju4HKISSKjlDwwl/LHN5B6XM1dFGdK1o6rJw/ax6RWT0Cx267c
Sh+WEpyhRgzQTnldvsXXbBkd6a/eZjGHSnvEx9YsVrVYyyKP0WIJ1n8g627wbM9Z
bY+SaudvgaFQW8MiLLXjHvk8XEbuBrY2z+m+KEHtmfyjktXmGsMTA5zZ7vYaACRi
y35+QD2woP01Grty4kS+DE3y3zCpDw==
=DqKZ
-----END PGP SIGNATURE-----

--Sig_/uqlLKZjeeR++b7cjLeHjKlC--

