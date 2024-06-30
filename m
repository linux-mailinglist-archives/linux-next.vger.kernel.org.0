Return-Path: <linux-next+bounces-2727-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8F491D4C0
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 01:24:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB93B1C208BB
	for <lists+linux-next@lfdr.de>; Sun, 30 Jun 2024 23:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 914894CB23;
	Sun, 30 Jun 2024 23:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qrybrMtY"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893E33C092;
	Sun, 30 Jun 2024 23:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719789876; cv=none; b=a+SloEYGD/y+BGhb9HAYHSk0sEtJRQXUMN+vtlS+zFN6sZALi74Qcu1jVeMxe1cupDCDhnZ8ciixSI6LboHkwixbe8bAYiQT00PxQhN9/8Y32Fybdpd7DYfVx+LQgrC6KOCFxu5t+j1KZwAXL/dvohkBDvAli2sEllIh4HAUQlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719789876; c=relaxed/simple;
	bh=BAruMKbaViSux0ir9zUouqxQqRe+0VMQXLOHzLgzGOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DxdrmZpxdK3U2XnFIbp/dlctgoCtRhBkkIONQiB5nwRuN8HE0kD+Sm8uz8kHy/EbogNj4QYzkReAqlcXKwM0+QrexY/I5f2eNCFzuSExZGnecicepyBAsCFEWk9vhS0mOpESHTcP9S7/IJRcVUGR+9lpK+gAYqjFNk6nOGC//ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qrybrMtY; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1719789870;
	bh=K84wuSbXLIbOxN3TBzNpAVc615c9ScJsvWreiVrmXHk=;
	h=Date:From:To:Cc:Subject:From;
	b=qrybrMtY57qrckTBkCMTMw6t+77OaxycXSJ0psZMaeTAnrbhNFkLKQpTeI+9DNZXo
	 hyJh5p83ZGh8cd8vuufHmiIUlHWf8RydHIFvnhbQq7hfbsV5CvoeiWHDnyG3fjK38C
	 r+rZGRfGEJviE37w76kUEicTzEFYnShmd7FKUqugVLbw2aH8V4fDY0DjdL/TCMdTBw
	 pqUxtNU0LIyrUgEzEr/olZzoVtmJK+/EchtwqxQJQS5EZ3G+e7ASQJDcnLCiJNoiB7
	 q+ItkLViNQwzqitqEW8C5Js5ZGEYehB6RSs3nxsJGKrCdIOsZh0NXimKn8MqH9AGZp
	 cJb1UsT9t+59g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WC4y63Pv2z4wnr;
	Mon,  1 Jul 2024 09:24:30 +1000 (AEST)
Date: Mon, 1 Jul 2024 09:24:29 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the modules tree
Message-ID: <20240701092429.308aded3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=F8V.6Tu6DJ4NxVmxCnCICX";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/=F8V.6Tu6DJ4NxVmxCnCICX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  1f3dacc0dcef ("module: create weak dependecies")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/=F8V.6Tu6DJ4NxVmxCnCICX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaB6S0ACgkQAVBC80lX
0GxWVAf/eMHdSqG2pkuruRmDMlmmqj3Fi265pVvy2jbI9vUPPlSRcr7qgcDAdlLO
nZI05+8C4twmueJmH1BShbG16AHzaAFbSKgqh9oWD76JvEJnm0jzRrbfILzGE2N2
9wwRc4LUv+zyhDFJ1skkmEcBKXD+OHlirjf2WDLj3ij8HQkfjJglVM8xbxqg6COe
ccD0D/G2AoU3tGesPhlZcwWhZp02CKBnhbM0IpILRcr2juGYqVIghnMzRb6OCEdn
2pk5gIeCDyyWw8IxcupAqjRo90lIz6ALPUXb8P/nANuvPYo3N3SNrcepsW3oHV5g
JgNInoJ6oN/1V2cCFrT1zEFPzepjEw==
=M5mZ
-----END PGP SIGNATURE-----

--Sig_/=F8V.6Tu6DJ4NxVmxCnCICX--

