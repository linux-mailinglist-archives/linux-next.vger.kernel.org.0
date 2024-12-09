Return-Path: <linux-next+bounces-4904-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A49239E88BD
	for <lists+linux-next@lfdr.de>; Mon,  9 Dec 2024 01:44:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA8B8163ED6
	for <lists+linux-next@lfdr.de>; Mon,  9 Dec 2024 00:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A30124A0F;
	Mon,  9 Dec 2024 00:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="mDanIQq/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DBC4409;
	Mon,  9 Dec 2024 00:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733705057; cv=none; b=aV16M4gxhMyUy3rkY1zVARQW+Sg6vB2EfwEX5xWBQqkMMIGIVOMZeP0xVCnOoWfXI7uHt1x5WzhptcZbk7cajWzV954s0aBhPNBiPhDJLeHklhu/0MIlEHSCS+1+zhS5beQjynsrmlT34jWT+/rCiUucyULckeHKUaJXtCPU+bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733705057; c=relaxed/simple;
	bh=HMfX6H6ovWZjnsYBpklr514M8LHt7hqDtKGYaSLqd5E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=n4JZA4TEMtHBVWlJQ8LarPCWvRf80qUcmJGmS7bUfO/XNXzpvmQhP4kYlJtuRoHF9nuub7y9Q5hzMmdkWSvvhzznSq8xkixIYxNN9i1hlxsFr6jZetgWik+WbzdI5m26+tFDhCtZxGztpP11nFdKDiBcAnqY/l7EKqCch7RFkfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=mDanIQq/; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1733705047;
	bh=VuSwFZqdOcsQZu89mOF5nFlUiHL0MQb4vOkyE7AqXgY=;
	h=Date:From:To:Cc:Subject:From;
	b=mDanIQq/zkrZQoQLLW6W+TVyMVA8a35BSq7eVZzxhBbDC/nPvXDarh7ekFwfXBiw0
	 l8F2kHW9N/62sy8otBLILFPjmVyZqKDVzjuIWT486+TambAUVvq5kdGA4NGlt1TsEJ
	 4Itk1u+wYKHa9bnA93SRnnAmlk0L9Ofhw+NneNzzmgkYCUd4BbVpx2ndoW0OfQCeGL
	 Sf5B0PjXPahEB7tvu/lmcDEtVFlmTDCT98q9Vp4R6B8rjyLDo1Mr/GRqIYEVdkYK54
	 m5kFyY1+Nhrz5r5NhdKPPczd7xY3UW4Xet5+qlgb3Q+ZEIowtz8pH1n4dhGBgqYvDd
	 qv+7LeDt1JfLw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Y635f01xyz4wc4;
	Mon,  9 Dec 2024 11:44:05 +1100 (AEDT)
Date: Mon, 9 Dec 2024 11:44:09 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?=
 <u.kleine-koenig@baylibre.com>
Subject: linux-next: manual merge of the devfreq tree with the origin tree
Message-ID: <20241209114409.3cdd6fea@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4Z.WLYMMjDCKDgZhT0svLCG";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/4Z.WLYMMjDCKDgZhT0svLCG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the devfreq tree got conflicts in:

  drivers/devfreq/event/exynos-nocp.c
  drivers/devfreq/event/exynos-ppmu.c
  drivers/devfreq/mtk-cci-devfreq.c
  drivers/devfreq/rk3399_dmc.c
  drivers/devfreq/sun8i-a33-mbus.c

between commit:

  e70140ba0d2b ("Get rid of 'remove_new' relic from platform driver struct")

from the origin tree and commit:

  1f8ac4b95fee ("PM / devfreq: Switch back to struct platform_driver::remov=
e()")

from the devfreq tree.

I fixed it up (I just used the latter versions - only white space changes)
and can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/4Z.WLYMMjDCKDgZhT0svLCG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdWPVkACgkQAVBC80lX
0GyFUAgApSp+6urcjF1VTkBgbnBhlR/XtWzqD+gBNKvnKlH6XzXIvw6xeoBw9ggn
nU888FSJ+6i5caPIg863xS3GjEYj+NSgl9y4dCv78/eVtszM25MWRZLyRCtUARxK
IVwgxxDwgxjTFyII8Q4cRDETFhkZYWsY7qPbQOJ6YYQW/8s618BVcz28yqX8iUYH
b0J3C38dFQRb86nrRuSr6YZg+Uql9VSK2cJ5A6TcLpLUT8TPpX23MYJikch5qeoB
SeNZULlxv5B1n4yq4WV7vIrYt3rtNlNBckr+2ZZhHEiS4xuSefPU6ROTi23+yePr
hQDht6tAWnD5yaSBeBvbZHvRcFDqVw==
=ULsB
-----END PGP SIGNATURE-----

--Sig_/4Z.WLYMMjDCKDgZhT0svLCG--

