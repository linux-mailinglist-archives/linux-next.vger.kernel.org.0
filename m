Return-Path: <linux-next+bounces-4123-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4098299388B
	for <lists+linux-next@lfdr.de>; Mon,  7 Oct 2024 22:51:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC1B8B22BD1
	for <lists+linux-next@lfdr.de>; Mon,  7 Oct 2024 20:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F35117624D;
	Mon,  7 Oct 2024 20:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WpBc3NQU"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B38E41C7F;
	Mon,  7 Oct 2024 20:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728334308; cv=none; b=ltPkFUEX+J1Ef92Uq1kd7p3H4pDHLHZ6gz6wy90E1Hc3gNzRy2DYEDNEJ8QdXiJWbMJzJ8IgALYWZHtxOLaK+t2c6i4qbkrt26yEEWtsDaGzgAyolUBpXyLa6iRItDM16vFEy9XAkJH+LXje5TBKyGGLHPd1BXhadLHCCwHEg+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728334308; c=relaxed/simple;
	bh=pNzMZQp7xxmtAJ6EYh10F6qScrJGqDIUHNJAbNo8+eo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ufgcOYSust2r0Q8fU3TTheFwrrDveUXJbwcbjm6iXx9BfB9RghkJkcCAp53vQluE10G+lT8XTKxi3Bfam+g5SlecTwM7xFuUIkl2JH/XzrjvLtOxJ4vjcwW50NY3nECDKsW24LiHTnNwFE86MSvobkB5ILLHLiMbLhxcFM7WzMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=WpBc3NQU; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728334303;
	bh=dZQ0UJcEJ6A2ihOhukBk8OGhLVM0q0RnBDsMFFzW92k=;
	h=Date:From:To:Cc:Subject:From;
	b=WpBc3NQUwZohfdG8wlwLRW6rTZ/rQpl2+kx0kacCph68EjB6/7wD8/tlxzVltBy+F
	 hkE1gIbSUYhemJQW4F2oxyxPuHbreS8Ey9N/N2pv7oAuObVjWXF7hECP1PzgDNp1Y0
	 jgGzFPN5iJEYR4VvdM7OjDK3cZYgkVwXBIWWr6qmCkmTo/2i/X6UO7+9z+DDQEYIPx
	 o5ZGQziFGmFC2efNtY4jz0cdagu10+Mh5tPdbpaf532UXsVr88YKh4B77HFRKT0mn8
	 QD08l1gijERDEjrHhRaaO7Dr3jpOf1TYDlbgK9+o9yRF43PxoFECLKQGqIlpr4qRj2
	 GFH07nY4uO4zQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XMrt74w56z4wbr;
	Tue,  8 Oct 2024 07:51:43 +1100 (AEDT)
Date: Tue, 8 Oct 2024 07:51:43 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>
Cc: Leon Romanovsky <leon@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the rdma-fixes tree
Message-ID: <20241008075143.6d444ee3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BaQfL9Ppn4uLEOvW3KG9n08";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/BaQfL9Ppn4uLEOvW3KG9n08
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  3630aae47658 ("RDMA/nldev: Fix NULL pointer dereferences issue in rdma_nl=
_notify_event")
  b53f62a213af ("RDMA/bnxt_re: Fix the max WQEs used in Static WQE mode")
  ff30f6617674 ("RDMA/bnxt_re: Add a check for memory allocation")
  b5b35e04a1c7 ("RDMA/bnxt_re: Fix incorrect AVID type in WQE structure")
  fd5b49d3ce98 ("RDMA/bnxt_re: Fix a possible memory leak")

are missing a Signed-off-by from their committers.

--=20
Cheers,
Stephen Rothwell

--Sig_/BaQfL9Ppn4uLEOvW3KG9n08
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcESd8ACgkQAVBC80lX
0GxCyQf/TBTBoOsq7pJlFA40rSxjYKNlABWZD/FKKxijIScKJq9btlE+kQDpP6XY
sTZQfgHVWOnPBEUUABvMF3WvTaRGUvWDHoZ4h5pwDMAiN9hkoSozp/IepjhULcst
zn5jEp1C09VaWY56oSKaxQqF56e83Enda/XRsH4gkoHzFASSG9gqne8fJgdX3XrM
FspWIMIaJToJFo9Tv0d6gE94v4CMAkO/7zCJ+kKWkuCss5o4u+l5rB3eFHfPRKhH
R+JFRkczkDff2p8iEDLBj9caKpmvujF92h/LoswiFaW+WiK0i6BLYs+xMBUmSBD4
vkbOp7MQbBFnNtyKorDx2RA5GnB5ww==
=7LHQ
-----END PGP SIGNATURE-----

--Sig_/BaQfL9Ppn4uLEOvW3KG9n08--

