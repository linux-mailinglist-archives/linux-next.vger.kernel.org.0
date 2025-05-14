Return-Path: <linux-next+bounces-6757-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4CDAB6049
	for <lists+linux-next@lfdr.de>; Wed, 14 May 2025 02:53:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 231A54A4856
	for <lists+linux-next@lfdr.de>; Wed, 14 May 2025 00:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 263F34438B;
	Wed, 14 May 2025 00:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kWf2iTXm"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0289478;
	Wed, 14 May 2025 00:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747184011; cv=none; b=hGwQ+J+cAgMUN1CNszker1KAH81ELQnwf6T6btjnLqBF6bAY88BwHqyLW/Im/h9V9/QAiAu8cE2rI5D/7JoDePaSklahK9ZRJfxaFCMZINvclKqlyyYfAm+OGQPmFoqiA0iTcfAJNrtkgaq2Pc71uOpdL2lSEu8ub7tUAXXWvuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747184011; c=relaxed/simple;
	bh=MqMmIQzzVMmSTCGobUV65jzvWUs0pGVO5GSFKnSQesA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lmmE9AvIQrGui0ZKDQV3Hv/Ej/wval9qPJM8M/vsWty3J1IKk8eD/lOBKCX/p+BgGIZy/S5S7joN/KfkbsxOvA7y+/9VZ9iYzMO2diLx7m50hPn+etCIk8b8kwA5Y3y5d83d7/PUz9zRiU8tFMt8gLSECb1ULroqb82hhAO8vxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=kWf2iTXm; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747183996;
	bh=f11ZgLcGt+NtwI4ofpUR2yBdoXOkSHP3zWdsxt89vTk=;
	h=Date:From:To:Cc:Subject:From;
	b=kWf2iTXmskEyyEWGJoLr+LBHmN23UoxzgavanLnCg9BGP7D/1oDxAI/OGtQssrK7m
	 CTVT+XURfLfupcDRmCsWliDpIghlHyymEGdWHK4oX4vv+UTO/36QV1wjn9c386mOp8
	 aVpJwIPFbjhkXHHTzcTPDobBnBRh3B+16eOJIgN/NnuPFaf0/nq3PfWSJIeqSqDZbt
	 Rbu3ihw36b+yRd7J9cqGR6P7MAmIIvaapbyv6MOUoGeLjnEAIR2EY5SV4zfKXUYH+L
	 s7M7CAcx0sLo8kEUBf0QZ/WUIszCfZUBCyfXTl6wW6i/pqM/iJoVXfKT5hRxjEoyto
	 49AHs+BLoFHPQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZxvwC25sCz4xPf;
	Wed, 14 May 2025 10:53:14 +1000 (AEST)
Date: Wed, 14 May 2025 10:53:13 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miklos Szeredi <miklos@szeredi.hu>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Joanne Koong <joannelkoong@gmail.com>, Kairui Song <kasong@tencent.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Miklos Szeredi
 <mszeredi@redhat.com>
Subject: linux-next: manual merge of the fuse tree with the mm-unstable tree
Message-ID: <20250514105313.5e2c367a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XeHL7JYcJiw+JgGAHL7Hh_m";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/XeHL7JYcJiw+JgGAHL7Hh_m
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the fuse tree got a conflict in:

  fs/fuse/file.c

between commit:

  04a1473f8ff0 ("fuse: drop usage of folio_index")

from the mm-unstable tree and commits:

  0c58a97f919c ("fuse: remove tmp folio for writebacks and internal rb tree=
")
  3a7d67252c63 ("fuse: support large folios for writeback")

from the fuse tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/fuse/file.c
index 6f19a4daa559,b27cdbd4bffe..000000000000
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@@ -2349,7 -2145,7 +2145,7 @@@ static bool fuse_writepage_need_send(st
  		return true;
 =20
  	/* Discontinuity */
- 	if (data->orig_folios[ap->num_folios - 1]->index + 1 !=3D folio->index)
 -	if (folio_next_index(ap->folios[ap->num_folios - 1]) !=3D folio_index(fo=
lio))
++	if (folio_next_index(ap->folios[ap->num_folios - 1]) !=3D folio->index)
  		return true;
 =20
  	/* Need to grow the pages array?  If so, did the expansion fail? */

--Sig_/XeHL7JYcJiw+JgGAHL7Hh_m
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgj6XkACgkQAVBC80lX
0GyCjQgApV6uV/030wC5wQhsw6VXLRIJm1irE7LAlgEOXBIrt9VidkyRqHBMHxej
4jMsOZsfX4/ji+sGX1OIPDpULGoD0hz8E5FBdRJDdzvBTyDZtF6BryXvm2/PcLbv
TElA0tQ0LQ6Od22UxpRONZa9DNUWboXYY0GwX7lZ7hbmqJFHTIz447k6DfNynFiJ
XGXKdEurTWUPa1Yw6nhxJA2a6HUfGeN7/CHIGLvf0VKAomZSes/uE7nKWfo/dIC0
xKyZ0SpzgiYu7DOy19XQ6fnJV5582o4tsCqVyTtKz11QhWtrx1K57Q6wBYSY3Ksg
Uiw1gSDPs4wB/o1tgezJVOk6pDxtrw==
=UqhK
-----END PGP SIGNATURE-----

--Sig_/XeHL7JYcJiw+JgGAHL7Hh_m--

