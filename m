Return-Path: <linux-next+bounces-3805-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D576977475
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 00:41:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06F60285DC6
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 22:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFC171B78E3;
	Thu, 12 Sep 2024 22:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VC11qvXD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C93F2C80;
	Thu, 12 Sep 2024 22:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726180895; cv=none; b=lfLWfq7k/Hep3hYuEosUzHZ9+9i/K/kMnJOl5ny08kk/balAqjy6zO9JwnbUY26ge9uHeaIETlaCrgZNaDFIAl0WgfSwKAeR82lX3Q05MQis5lgNjny66/UYAjwvBvmzTDRQ8unrVUdBiTX3bb2pEgRNs9uG31BubvZ8FQoWu/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726180895; c=relaxed/simple;
	bh=ry685pCesqwnQyQwb7R0SLL97lPXl0XqBdap+QpkJ7E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KogJ9HNt4/f6SwZYLD3PjtNFWXCzTaujrI7ubyQ7fA0CxH/iPwD9K5m1BCNX98l21wNnDERSlTZQJ4Sf3vyhPZVd4GkzUwtPN/2P14KxFezVi6zpR5KCFxWECHPV+k3+ZG9CMVbbl88S7gy+jgnFEpST7enDoyOaEMqlDgv6nrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VC11qvXD; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726180886;
	bh=Zk9Se9BwKB2NiXWGx4kZzHV/ArCAmfaCoNnyOjlh4/8=;
	h=Date:From:To:Cc:Subject:From;
	b=VC11qvXDVAgr5iFNakul/aQ42VPjSOYr7JaaDo1qMujbP+b0kTp65pHdWh7Q3zgHC
	 YkpQQBrKAzHUGeipDJrlZZB4ZPXrjZaatjCRv7lyc6QJtIr1eIIxlTD7Z7ofeIoKZF
	 ayWmM7EeNAXBGxdkallmR4p0eVo6tcfXWqKS81UZDrPBewKyjc4kP3nnMvnTdLPGwa
	 w7xTmuX3EmehmD+j4TTQKM6geAD+QCpxSFjH+vnYvO9wOSMuoSryz/M1j+OlL36sDE
	 TcuWN9cDk2WJEN/16t0i4VQ153v7h+WCbQsB6LBoXrOpc5SdK4NQzQwhdtL61EmXBq
	 65TBdjUfrnxJw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X4XVG13thz4x8c;
	Fri, 13 Sep 2024 08:41:25 +1000 (AEST)
Date: Fri, 13 Sep 2024 08:41:24 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the loongarch tree
Message-ID: <20240913084124.169218d9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OCv.9m4YOVwee2jF90+qbKp";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/OCv.9m4YOVwee2jF90+qbKp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  357da696640e ("LoongArch: KVM: Add irqfd support")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/OCv.9m4YOVwee2jF90+qbKp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbjbhQACgkQAVBC80lX
0GzGiwf/Zz31oNtZEampuIzhjXwj+jW1oIA1MDQ0UlrfcyN+j922vLT1pLU0cNum
Bc1Oy6O+++rbmTFtv3DR4NI8N5oOxfXaJqNdfjRpESJ7yH33Pit45gCT4jhxyJVH
EDmJLyEbo38VGzzBezLKUxqDj8tyILCCjq6qRqsPU1WffoUBC4tyZTdsxHDfpjh4
wkjWN5s+ofgxtERWv1zJOj+KsNKgYnh7m2gn364M70rsGZEICi3X1rrXBSLNyorQ
DQXfIJGKakAzPzVoG27YV4anxuiai0nUwC7b1EyUbIAkVv8cWPEkEPQ7cMQgER2F
vMR3PbquHb5lIL6rS3JYqiV/KiOvFQ==
=0rB1
-----END PGP SIGNATURE-----

--Sig_/OCv.9m4YOVwee2jF90+qbKp--

