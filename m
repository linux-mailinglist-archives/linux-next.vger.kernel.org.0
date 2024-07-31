Return-Path: <linux-next+bounces-3172-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 675B1943861
	for <lists+linux-next@lfdr.de>; Wed, 31 Jul 2024 23:59:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 987631C219B8
	for <lists+linux-next@lfdr.de>; Wed, 31 Jul 2024 21:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 668F216D4DE;
	Wed, 31 Jul 2024 21:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="aaaThv1N"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE1E16CD1E;
	Wed, 31 Jul 2024 21:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722463137; cv=none; b=GrHwmj/Tw8TMeWqnX1zo0sAZ9Ma0JgaksaY21RuGRc+o8iY5hjVgZj1FiZc62vWPfuwhi36hgEdATGSqbfT+/7KfNTJ4apRisPIt3OxbQ6bXzyZ0OXsFiVbUZ+axwxf3x7kUY/XM0FYodQbveNRlmzrAU0PIvWUv6OWmyJaWhfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722463137; c=relaxed/simple;
	bh=+t6NNYK5Yzsc4IcBa+tphoDqTii/V85hlzuyRXoIX3o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=A18p3zpPEwM9GRN6onyBQ+RgYlRfC9hqnGm8twWWhjFsM7EVQiEGp3jzblk4pZPj2Sv1NlW5W4LVGg6vymIZrNSY9gp7SCx0yiLvGHpshHDTmWzmSDoPnF5r3rwtPgmhG6EhpBL/wkvylMdHr8PwGXbjbFNqPCovvqiohyYiKTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=aaaThv1N; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1722463129;
	bh=6VeT15qq0tj/5Uvd0Y/ZKa1nxomCWg2VMy+EMis9uzc=;
	h=Date:From:To:Cc:Subject:From;
	b=aaaThv1NKExyjOdfq/kdHBscTECakvzmtiwHodBe6PFJm0g4Noco4iozEH5qa79yL
	 H4F4Td3NoIdalzme/wEDBCknM+F6mKv1iUb5oLbzMqudTXQTt0ePbBmDahpjGQkCuS
	 4s6gl/7/2i4vSzxgLEeOM5+KfqNnx6aH3A43/yL2rA78MJ8Y5P2qUKREl9JDdpzQ8t
	 tPttIhEjEPl5sW5k3rKA37e06e/s7udPHf+GQGgYoYKVdGv9bMEXvEN1i1mwrwPo5M
	 S7ieOk1Vcl40ld6H5W8Erg7JwsYDn423unlSKIf37Ixa1F6UK0Fh3OeyHaI+3w61s9
	 t43z+8gTVPCkA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WZ5Zw6r7sz4wc1;
	Thu,  1 Aug 2024 07:58:48 +1000 (AEST)
Date: Thu, 1 Aug 2024 07:58:46 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: Antoniu Miclaus <antoniu.miclaus@analog.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the iio tree
Message-ID: <20240801075846.18156579@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+YsoNM8A+he6b6zKQsBbGD_";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/+YsoNM8A+he6b6zKQsBbGD_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  c66b5a1983fe ("ABI: testing: fix admv8818 attr description")

Fixes tag

  Fixes: bf92d87 ("iio:filter:admv8818: Add sysfs ABI documentation")

has these problem(s):

  - SHA1 should be at least 12 digits long
    This can be fixed for the future by setting core.abbrev to 12 (or
    more) or (for git v2.11 or later) just making sure it is not set
    (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/+YsoNM8A+he6b6zKQsBbGD_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaqs5YACgkQAVBC80lX
0GxdOQf/eDA8XoDIJjLNq4qtOFuuqCx7UgUzcnQnDhbjgiIn5SaQW/X7vypYF6FU
1LhkEBuQb6AbFKhltF5/Xzqht73kxqHtdtUgy855zLyhyZrpBhfqLwdQE3ElcbtM
LMKaGCyNgzVgEFI+oYsRP8x8beSCXTQUunerzpV3f/2Ft5cFvkTviqPDyq2XgEVW
/YY5Jo5QPlf+xV1WUuy9j7qmVkE5JB47mRlOWoiPYQDYY2YvSIS4P2J/XCeLtMhm
PXN8fcfG0A/fdPOSyCcBKZzCP+vH419W/F8S8vkJzfWwxi6GQSygXlx9XvGhoHLz
C1PLgbjTrrfHjpTX4szD7XLGuUG3WA==
=pwr2
-----END PGP SIGNATURE-----

--Sig_/+YsoNM8A+he6b6zKQsBbGD_--

