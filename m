Return-Path: <linux-next+bounces-2741-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B777691D774
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 07:36:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 727AD2865E4
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 05:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 248F318622;
	Mon,  1 Jul 2024 05:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="aXRloJET"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA6510E6;
	Mon,  1 Jul 2024 05:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719812170; cv=none; b=KTfj+g90xaMD5qUvEhy2oYAG5aqm5U8wp7BxWQBoQhVPVRpZ4EJXMytseGnEG064jxpCdMgNSBBLitPlKuKnr/j0Rw8EK6LA7+DXZ6/DZyTI8bun77xrytXB1bFNAa5jh6nlKuE5XDO0blf4bxI7+B+jMap2ivbnTYIgEbzXv28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719812170; c=relaxed/simple;
	bh=2iDjbBpBCs0Z+GmD4XCCll0RA1Uw1wnsoYVcYb1eXL0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=M9EkiKiRWIBWEFi2DRYMnA9I0KKpU2YHfRnud9+la9p0zI+JnJLgjOEqaxN3+sKn7LgrPArQk/M6XnI2fSB8FLwAFXj9lt+eYh2gyDRik8eymza3vVktezX5zl70VsHWS05Xv7+iDsG2mLLXAVD2ZnW/bEdoYTntx2H+gD0VJ+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=aXRloJET; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1719812162;
	bh=mG3twNGjBuulteJm+hAOFMzAjGGhhprN5SNkrDLxZ3s=;
	h=Date:From:To:Cc:Subject:From;
	b=aXRloJETKRgVse3ubJuHYlhNaZZUb9DaojGOMz9qbpqhCojeTy4RhhSm7oD5cT94D
	 UCMYJ8iGAMgJKyVYrIPurWHwG/VnGedU87baXRAn5q7E59d9qGTRuqhfE9zVam+F0C
	 w6F7cJoMeTUtoVelTxcA7ijZuNjEm1w+K+fWMUqk7k7ITOsbdk/zG4f5vS6oP0jUbU
	 wHufbl2Qix9lzjN1oFXBw5bzd7zwqbb8OVEp9EULPef7jW/Fa33hASImdg7vDCL53i
	 EQxvKHrSUtcRRQTvIGt/DGGjTs4dmnMUd9VzL47SsM3/DINKYM+kSAqBmKgw14PXmP
	 dPtDCGNsXBrmg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WCFBp0NJMz4wx6;
	Mon,  1 Jul 2024 15:36:02 +1000 (AEST)
Date: Mon, 1 Jul 2024 15:36:01 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Leon Romanovsky <leon@kernel.org>, Doug Ledford <dledford@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the mlx5-next tree
Message-ID: <20240701153601.50d3f442@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IeYJXghODnCgqs_sQMV_ApY";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/IeYJXghODnCgqs_sQMV_ApY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the rdma tree as a different commit
(but the same patch):

  78a6cbd5145c ("RDMA/mlx5: Use sq timestamp as QP timestamp when RoCE is d=
isabled")

This is commit

  0c5275bf75ec ("RDMA/mlx5: Use sq timestamp as QP timestamp when RoCE is d=
isabled")

in the rdma tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/IeYJXghODnCgqs_sQMV_ApY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaCQEEACgkQAVBC80lX
0GyTtQf/WiBxwEA7QgepYi6jhVxrAc52SfMTS2R3CFws0HH4ly+W4RIQTeHOpw7W
m7BOiqwIaHV+BjpOyGnerydLVn/JytSAmHOG3k13NmppuMv9S7p4XPisG/x8jwNi
do9TJmsxBUlcd7Qy//y1FvTCJ8Sxp1jgmPl7pQpf7DAcF5pJ8PhGxcHY0fyOlhRE
oYxxh4A4tib/aqBq1s2T6gI87oaW2kzw6Q2pDvdHXMnL5PGcA88W4dSnkPjgaBq5
mgyJK7xoIcIr1Jdy/h8favBsuIza5sJzszuCtA+U2PahOAQBbABuHHAjeLQSKeNP
YRM0xxUpkRTai7/li9PDM6OJD6VRGw==
=pTef
-----END PGP SIGNATURE-----

--Sig_/IeYJXghODnCgqs_sQMV_ApY--

