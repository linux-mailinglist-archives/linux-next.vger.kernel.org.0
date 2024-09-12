Return-Path: <linux-next+bounces-3781-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D24AB976349
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 09:48:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 108061C23039
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 07:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73F77189B8E;
	Thu, 12 Sep 2024 07:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="boD3rB7j"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EB115C3;
	Thu, 12 Sep 2024 07:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726127334; cv=none; b=iE+q52O/Bkvm6r6ukyJINlxpKPMzleFjuxa5IxV9ZDrhbTzP7A4M0YbVrwLBU5gklWS0H7pnO15kbDET+/dtBvCA+eW7bEY1W6ZzXdGZ8J6V8TvdLAOFZb7V5hLWqtbWNRGjiUIet9spu75yTuKTXsSVxOLWATjA0y3irVxZ/DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726127334; c=relaxed/simple;
	bh=CAm/mS2gLX/R3FNRNguZJXz4ezo4t1bOYdrnrGDoj3k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=S3+a9fPvIoWsYyVicSDuDBgTrzrBpGL4cCbd1z5ci3ZAvNyYbiIyQcLebsGsxW5zu5WU8bEj+FPkgy7ZgmvdhQPBrLAA1FsNBLC6fIhoV63Alv9zqeRTEUOMlfxkashtKLaW8SPTgI9UNn8ietrqpBMrounmtv5PFDlu8YF5ETw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=boD3rB7j; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726127325;
	bh=5BRdqdb7cXlQrgtJggfdrmWKrXLIFwxwcJBL3yXmwDY=;
	h=Date:From:To:Cc:Subject:From;
	b=boD3rB7j4FfbxYMoqgK2N1C4pFng2R45QnGa5jXkiodZ0hdGcPijpX82MVpH8JDWp
	 XilILIsBoU5cachfzxpbVLTh0nP1oJJovmpZ6zvex4IKnvcFiHx4jWXIaQExd1lOiR
	 0tLZF/hN9Q9OMWqy+EI4FUj8RQk7L2nyfHnOj9xB+x2XvHwAx/9xLfGRn5vCB8SAEz
	 9Q/yLfiaafs10Taa9UN8Ob9F8eAPoaSlqcXwqnWGoaGz28xs6B0rmXGwpUsQA+T8Ht
	 FT6/M1rW36IdRd6KrK0ft6+yXRLxcCKwi9TfLxju8NQwFsBo1+AHwe15njXwKLz8UN
	 QhrjHzOHys0UQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X48hC6QWSz4x3r;
	Thu, 12 Sep 2024 17:48:43 +1000 (AEST)
Date: Thu, 12 Sep 2024 17:48:42 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Olof Johansson <olof@lixom.net>,
 Arnd Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Nikita Shubin <nikita.shubin@maquefel.me>
Subject: linux-next: manual merge of the gpio-brgl tree with the arm-soc
 tree
Message-ID: <20240912174842.57a43921@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mv.Val.AidwDzeR6A/Xcw4J";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/mv.Val.AidwDzeR6A/Xcw4J
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the gpio-brgl tree got a conflict in:

  arch/arm/mach-ep93xx/vision_ep9307.c

between commit:

  3e0bae7f35c9 ("ARM: ep93xx: delete all boardfiles")

from the arm-soc tree and commits:

  4b2b0a2ce815 ("gpiolib: legacy: Kill GPIOF_INIT_* definitions")
  8c045ca534d0 ("gpiolib: legacy: Kill GPIOF_DIR_* definitions")

from the gpio-brgl tree.

I fixed it up (I removed the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/mv.Val.AidwDzeR6A/Xcw4J
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbinNoACgkQAVBC80lX
0Gworgf7BeGBjquUF0jtCNiiWk52YbV13fjt3FVmNhe12+r0sTgjg6Iqx33E04Gg
Pp6eYnxp5ohf+eAx2UhsN0aN4es2a8G6WW8uEib/EzM5Rm2S4vIC5hJvAe4lLRx7
jS13qMH3YX68kZXX32VGCcH6TXTJSBR+WrQoOa4IzhMX3Ev39p1DZyKi53MUPFEv
8wAT9q3wuu1KQx+cjIvehywpEtYkqCYHJQLchtkWG6rEEa6OWjNYhagxgl8m82Ra
T9Q51BdjLExsLcg62cC8LwSxS8kSGcwapnS4joV3TivDMubPtCnt6lYOzopClteT
np+9yk78eoNVPtB0LHA1wi42JJlKVw==
=YGQH
-----END PGP SIGNATURE-----

--Sig_/mv.Val.AidwDzeR6A/Xcw4J--

