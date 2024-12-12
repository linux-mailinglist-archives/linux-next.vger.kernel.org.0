Return-Path: <linux-next+bounces-4948-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3151B9EFFEE
	for <lists+linux-next@lfdr.de>; Fri, 13 Dec 2024 00:16:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 831AD18871F5
	for <lists+linux-next@lfdr.de>; Thu, 12 Dec 2024 23:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB38E1BEF82;
	Thu, 12 Dec 2024 23:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="OAO7ltNr"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74FD1898EA;
	Thu, 12 Dec 2024 23:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734045384; cv=none; b=IttmuxjnRspajnEXVphgZJuL2Fhnvs6WFa7bev/0uwTJxkjHzc0h9ACf7nLMiOzfUNcS+TQLIqmIZluJv7rUc89jJcjC829BmkeM60XGX3Bs2FJNd7H0QURbpdcb/KV8t6v1xmVQVi6mNya7LQbHmchSuGofS7n5j2LkA84c4XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734045384; c=relaxed/simple;
	bh=Bs+piBVlxlRv7AF9B1MLjeYYT+OcrzyT0aL/s46qx5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=bm1qrK4DXTHLUSIuahIt43SCbtSMZu4KtEN7pZ7QMSGiFFVUtteeBLMD4IRGPJb8U9CegkA7lL8BEJn2+iuoHmByMxNHCEvSWRszaXclLmSZp6EH9fPWA7VWJaRXQTLWKam9lu1RQTbaeAYj6qL0TlRGuQWAzCtHk90nYfTqbIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=OAO7ltNr; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1734045372;
	bh=BFGUPjLdQW1z6+M5vBNyeKr0/Ym3K6GZiky7PljOqMw=;
	h=Date:From:To:Cc:Subject:From;
	b=OAO7ltNr/5g7g/+C5A3P1pDLkK9knwSZcr8Lm3Q3bKuvoxOCdjWTN6q84qb16KeL3
	 SFpzsCJ3e6RP+e/RMnT9nNj3M2eVHslb57JdCH2CCpLOpfldGFyiucRILhvTq1zpho
	 2l0x5NbCWPCDPYOvw+uSWDeormrU50IwUOLcYlgKvWlFE1tiDbOUFf/ykKjZo1Ihtm
	 Lv6ljFb2yFZ9/UqA7S9sMf8k+VMbCbMpGunMiXCZgZ06cp7l+E19QIhQ8tanm+Lqgj
	 Psl6Ex+7xvXuEhNZw5zpuKqgjtbU5PGLjQO6S87A/E/Xi5fFawDhvCCChqkO7Cn3eu
	 GKC1Jr9GKB7cw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Y8SyM74b3z4xCp;
	Fri, 13 Dec 2024 10:16:11 +1100 (AEDT)
Date: Fri, 13 Dec 2024 10:16:02 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Gao Xiang <xiang@kernel.org>
Cc: Gao Xiang <hsiangkao@linux.alibaba.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the erofs-fixes tree
Message-ID: <20241213101602.745dc685@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZIGc9BPS3_oGeWD8TfRqk5S";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ZIGc9BPS3_oGeWD8TfRqk5S
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the erofs-fixes tree, today's linux-next build (x86_64
allmodconfig) failed like this:

fs/erofs/fscache.c: In function 'erofs_fscache_bio_alloc':
fs/erofs/fscache.c:201:30: error: 'struct erofs_map_dev' has no member name=
d 'm_fscache'
  201 |         io->io.private =3D mdev->m_fscache->cookie;
      |                              ^~
fs/erofs/fscache.c: In function 'erofs_fscache_data_read_slice':
fs/erofs/fscache.c:319:47: error: 'struct erofs_map_dev' has no member name=
d 'm_fscache'
  319 |         ret =3D erofs_fscache_read_io_async(mdev.m_fscache->cookie,
      |                                               ^

Caused by commit

  34cff83201d5 ("erofs: reference `struct erofs_device_info` for erofs_map_=
dev")

I have used the erofs-fixes tree from next-20241212 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/ZIGc9BPS3_oGeWD8TfRqk5S
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdbbrIACgkQAVBC80lX
0Gycbwf+JKTwwZ2LSwziWk4KlYy9mLw3cW0woqexFsywnR80Aoda4wHG4/H1Ltii
1k2o3lXU/KddIS1oz53T0MfPySR9Ey3Y5Vx3UHXP/orD9+/20LcXJ7MZzw3bolS8
OmvvkWQhNwk7lHq/ca6LSefZB8h2kF/TGnZ7CVaxF2vbPr7dsDM2UtnR7pwXl6HY
ek+uezwM1zrUT+mLdKIm7HdkSYKU6EXHzU/Hm+UwI1+oHZ7c2/iTubvThaZ8oJA/
1dN71PSw3SPhFP+3D/VcjFQl4m6h+oF8xarg6tC3TfzhSEGjgiP2IN4NEBVoQhpa
P8q8tg2T1ntUJJtUqRxCjIembKJGnw==
=mc5r
-----END PGP SIGNATURE-----

--Sig_/ZIGc9BPS3_oGeWD8TfRqk5S--

