Return-Path: <linux-next+bounces-5389-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C590DA2B99F
	for <lists+linux-next@lfdr.de>; Fri,  7 Feb 2025 04:22:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DFEB3A6371
	for <lists+linux-next@lfdr.de>; Fri,  7 Feb 2025 03:22:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B77BE16C687;
	Fri,  7 Feb 2025 03:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="smm/e1U5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950E84EB51;
	Fri,  7 Feb 2025 03:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738898531; cv=none; b=M8VO/kNm/qryqZe3oD6JOYpqsak08caR59XOta4mnw1XvZLHuFSns4oERR/4O0EBe+tXnMMAwPWvTiYqqanr+DI7sEY3X8TSHI6pCbCPagzlFww5SlBrtuWvSouzFD1x8tq2Jyi47qStuvMVTUuSDiafiOx/jjoPwed+h95MgDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738898531; c=relaxed/simple;
	bh=+hA2hRWd/YVlIbqHU3n1pQUJ5I78G7XG6cyfw+tWCYM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=K0rupVXSUmfw2RzLUNfsapjAYC6vRWvPx/IpQJvzsR3DFOeNLm9SmDTuod5R/eiuop6V4XGNkHW9b1ZK6FbIqIeBjpfXXRd6rl8UhnbYiRir+LcoKnbeTFzc7GI1l+WNctXE4Y2OzvgSUUprLoEgLCv5jIT7y0y8OHGcEEskF7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=smm/e1U5; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1738898513;
	bh=XmN+jcCj+jUFOZ3QBM+zG9UgpSQDqQDhocEgZlDHscc=;
	h=Date:From:To:Cc:Subject:From;
	b=smm/e1U5MxpZJw7m92b57PXM9qlTYd79MnE7y7pKSk7Oqea/06ELnJaEpY4MTQu1J
	 2DAPN7rRYMqSokcFMSx7Pwu1Racx2IVgwmawQUGbuC7k2mLEKXFCFICoCEbf3bph5t
	 57HvGOD7otDpGCNtovgUfCSlH386YuXVZTTvdYaelEVCuurL1RyGd7Eydq8WqIO/4s
	 95SX4GSFcWjJWKW4NCALFg+Ir6PrXHs0+gcOG/U5zsLiHJTsoetSWfkv4IOgBFi/rK
	 ZW+j7r1lB2DY3Dzf08YJMVUHYRcisv4k7fionoteCTLE3/N597TLZR63aTTQkcHLkQ
	 lXYqQH/GHXpmQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ypzm06XMLz4wc4;
	Fri,  7 Feb 2025 14:21:52 +1100 (AEDT)
Date: Fri, 7 Feb 2025 14:22:01 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20250207142201.550ce870@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CO13eDYE2hSrQzooTNLi81+";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/CO13eDYE2hSrQzooTNLi81+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced this warning:

/home/sfr/next/next/drivers/gpu/drm/drm_writeback.c:243: warning: expecting=
 prototype for drm_writeback_connector_init_with_encoder(). Prototype was f=
or __drm_writeback_connector_init() instead

Introduced by commit

  135d8fc7af44 ("drm: writeback: Create an helper for drm_writeback_connect=
or initialization")

--=20
Cheers,
Stephen Rothwell

--Sig_/CO13eDYE2hSrQzooTNLi81+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmelfFkACgkQAVBC80lX
0GxOswf/Q0ZqJRSFGLds1Zw6WvqNfVNgDGFqUiCGDvQ+/uoLJgxlN1BrZ2srXEK8
2hcTn6gWE8r7syqa8crjQlLfDQZyPx+l/KBFs+8Or20jsBpXQQTbd/Koy5IALnwm
C7/n70kWcPHUoAaZY9l9KimnjROgaMRO9RdvKHZz2/3J1kTxm60aIUVMEVPaZRYl
8RjtEcsnCEB/A14bR6L5Z8lCikNwBU/ghJvCUDpIp2y+/gpPCNyS5mRLEdIXruFd
g3H1ggVluOM8TQUMZbB6GmjDDBsNxep2MgoU8oqODuXOWcXYfUAsIdGbWUlMd6jE
zzAZdAOktfD1FqOPCPNw76LB6t+bKg==
=J2Az
-----END PGP SIGNATURE-----

--Sig_/CO13eDYE2hSrQzooTNLi81+--

