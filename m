Return-Path: <linux-next+bounces-2213-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB648BF2C4
	for <lists+linux-next@lfdr.de>; Wed,  8 May 2024 01:58:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 790E91C213C8
	for <lists+linux-next@lfdr.de>; Tue,  7 May 2024 23:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E5668062A;
	Tue,  7 May 2024 23:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="jZucxqg/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A66B1A2C06;
	Tue,  7 May 2024 23:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715123800; cv=none; b=WhIYPi4eytLSFeSpJwiCD2smQFisZpU8NP3H61eOGoMTtU6Ol8v6x2q56YKqoXLrC1FIqROBOY8Vqzep1qD+G/KN12qn8blfF5Wxwu9qsgDF8WCQYBFd1/AWPQIihiNUqX/ixFIIv1UNhuI0rXiF2llCBi2fOudKSEDeYbsQVCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715123800; c=relaxed/simple;
	bh=YumvVvqReLYKoW4wwlEP0/V/rN7kO/ivsqSVOjkIvCg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=E8UufvMckRnGnEX4vEXqj5/UOCyaCDO7NUu5zGH8gnNfaE822W1r31u0OoiJ0PBwJPg1zvdvNi2GzIEtYGDCokLYw9q614NkHnLgYjH1J5hm3nchUE+f4T2LNOsgyIMT/eSA7PueQwybdhBzn/MbbsdqOJzkgjd0Sg5HMgVfRHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=jZucxqg/; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715123793;
	bh=XV2g+5XSPcq7e8sRPcZijxcMrUgWgzXLkFao8GfRXak=;
	h=Date:From:To:Cc:Subject:From;
	b=jZucxqg/EcpmEgcs4KHTt+F4uZGc0IVHMo45DJkCQypilJEa9EIJkWTE/yHWFSy57
	 KLVTXGm0R5biJgMvpHpPgErKMMYGYUoqHIxc/ASoU0vEWAY8vTUxPk343NBQBqGz1z
	 AyxnF742gtOuCMg9N3bLO4Wcp9yojEVHZhu3xrucu4x1fdi6uUl8y3ZK3UaL2gRLxa
	 ps7jkK+GXnBR74xi6NZ9JNmA6AMboqkfo9nz0s1YpDqb8z/AKhe0qOEet/hEdgyrAB
	 e3VI98njAbCORPXDnHopf6UfZbqoEU33PsEReLWklKoZWcYcHn2Ax4a/HjcYMPO33r
	 YS7mOO5Sm7g3A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VYvKs3KP1z4wny;
	Wed,  8 May 2024 09:16:32 +1000 (AEST)
Date: Wed, 8 May 2024 09:16:31 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christoph Hellwig <hch@lst.de>
Cc: Alexander Lobakin <aleksander.lobakin@intel.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the dma-mapping tree
Message-ID: <20240508091631.1ec34a25@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//4TjJokJkJIemIax+.tT4wC";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_//4TjJokJkJIemIax+.tT4wC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the dma-mapping tree, today's linux-next build (x86_64
allmodconfig) failed like this:

net/core/page_pool.c: In function '__page_pool_dma_sync_for_device':
net/core/page_pool.c:406:54: error: passing argument 1 of 'page_pool_get_dm=
a_addr' discards 'const' qualifier from pointer target type [-Werror=3Ddisc=
arded-qualifiers]
  406 |         dma_addr_t dma_addr =3D page_pool_get_dma_addr(page);
      |                                                      ^~~~
In file included from net/core/page_pool.c:13:
include/net/page_pool/helpers.h:373:62: note: expected 'struct page *' but =
argument is of type 'const struct page *'
  373 | static inline dma_addr_t page_pool_get_dma_addr(struct page *page)
      |                                                 ~~~~~~~~~~~~~^~~~
cc1: all warnings being treated as errors

Caused by commit

  8bf4d7154d4c ("page_pool: check for DMA sync shortcut earlier")

I have used the dma-mapping tree from next-20240507 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_//4TjJokJkJIemIax+.tT4wC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmY6tk8ACgkQAVBC80lX
0GxhKQf+PxcyvYJu829pKTIX9GLNDUrPhGIJ/QQm0+8Lhx3FoD7IlCIMqa3HsUPI
sd97Ju3+wPPtke0mVb7O+A4xwdGqdiixYVtFUPjwMLxHMZGsS5hVLMaUO/tyC6wx
n/KBglFmb/2NNXyS4pFHlvmvt0bSWaba9vaMWz9Jook8MvS+0EUiIBXV0YZFCHND
Elbom+vRb5n3NeYFk6s9kRFWKWfN6mVXAbDTn9kScH7llzV+Qap0QjwW6IWszwxh
z6ip11TEfXs5dFkopSfWBNiMuJDoD+g3mzMpspNejs0J3D0B4xMAuEore9poaqFe
7tcEQTNja0njIJOWYwxZvX85nWQqhQ==
=64Vw
-----END PGP SIGNATURE-----

--Sig_//4TjJokJkJIemIax+.tT4wC--

