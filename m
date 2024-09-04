Return-Path: <linux-next+bounces-3572-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3FE96AD77
	for <lists+linux-next@lfdr.de>; Wed,  4 Sep 2024 02:49:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B16BB1C23845
	for <lists+linux-next@lfdr.de>; Wed,  4 Sep 2024 00:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F101E522F;
	Wed,  4 Sep 2024 00:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="moE8o/b5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465FC65C;
	Wed,  4 Sep 2024 00:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725410950; cv=none; b=VM3bpMfrk5G4w/oJOTtelF+EFdGyhJV2cFJS869rEKfxtqZkBq9wRCpl0KEfQ44Kq9PARi/0HnBA9gSwLXlG6GU9YkFwFuoUVGh/pF5DaJld+v+Hh9w1oSkJPyrGYLPKzaIZefHiCTgnucAc+3MU0zlvS88xrLzyqawMZUx6ja8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725410950; c=relaxed/simple;
	bh=fHOWPassQ0uJo6ImFLuJSSxhu9VkXo/wTvhsG3ytJgk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=PlXnTwEo8uRAiwqU/jAFd9jEby/lOkh5iCiultkHEQ+REco/U9D8iqOF3gY8yRVMQ198uxXGRhlsiDBeHtn7Sr4NeshqoeZd4+4AXiuuKyxgSM8TIhe3+gk6k2dZw+PsoLGE+TCor4IcGzim+kcyggymJkqCp3kSz7zcvkAUe8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=moE8o/b5; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725410941;
	bh=RjISWToipsRFPj/NlmChzdQ56QeI0mSC7uktuJ7U9pU=;
	h=Date:From:To:Cc:Subject:From;
	b=moE8o/b57zoUOosn7Zkx5U8FCfov5CSvNiDPX9hiE8/aysuhAlW8snCPYG4MNKVYO
	 D5ntCI6Dh+u1ptu5fUP8sqkpnRthtgmtCals99tDqL5/zDtNcN80NyQ0wg5iuTQpo9
	 DL7LkrPgyfJ9vznRt6LGjkys/zREZ/PNx0A/5Z3fhvBafEPJt74bsffKouLLbhAtgD
	 qZLc7LpU0wDFcyrowpfefoRv3mfc0OS7XOrGozX7iea2o8bpDf0/c5ksEImKgqus5B
	 pIkmNce4BZXkLzban00uDl9NRZ0rYFIzKDZYAEYhILOnYb5MJpQUqEsSzZoqFOgnBL
	 llWmDoabrk/9Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wz3lc2CQRz4wnt;
	Wed,  4 Sep 2024 10:49:00 +1000 (AEST)
Date: Wed, 4 Sep 2024 10:48:59 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, Herve Codina
 <herve.codina@bootlin.com>, ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the arm-soc tree
Message-ID: <20240904104859.020fe3a9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qiS_Gxe4VjCx=owKBkW+PIE";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/qiS_Gxe4VjCx=owKBkW+PIE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the arm-soc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/soc/fsl/qe/qmc.c:25:10: fatal error: sysdev/fsl_soc.h: No such file=
 or directory
   25 | #include <sysdev/fsl_soc.h>
      |          ^~~~~~~~~~~~~~~~~~

Probably caused by commit

  eb680d563089 ("soc: fsl: cpm1: qmc: Add support for QUICC Engine (QE) imp=
lementation")

I have used the arm-soc tree from next-20240903 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/qiS_Gxe4VjCx=owKBkW+PIE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbXrnsACgkQAVBC80lX
0Gz/ggf+M4Hek83RZJwrOPiZAPsXsSdrdGJiTbwlzZhMN8rbFilT4bJIuD0S7LYL
y3I43OwNYWstaI/Ley2w8pB0l4VLR4gpcvNRvxxu/0RkbbCG3lnBMzWcz5wLUa4S
djNnWsk9tcmexEEpxE7ScuSOfppb5InQxQd3rW9PifhCoy6m34dmu9SEbp4PCpOJ
5oWLyMLnOdJvCHxkzL7hzanavih136gjMn/yj25QunKrSrngTynv/CBAktpxqbSv
gtB90v7XAsZg/uoc9fCZPGsIe3wE/ZfQjVRf+OPi7Y9j66af+yw49gsxV6wpyy8L
sqyuSJzmhk325nMS/urOWFpMcaRObQ==
=peiV
-----END PGP SIGNATURE-----

--Sig_/qiS_Gxe4VjCx=owKBkW+PIE--

