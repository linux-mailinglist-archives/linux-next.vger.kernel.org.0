Return-Path: <linux-next+bounces-5519-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 842A4A3E6B1
	for <lists+linux-next@lfdr.de>; Thu, 20 Feb 2025 22:33:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AAC2C189B299
	for <lists+linux-next@lfdr.de>; Thu, 20 Feb 2025 21:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63599213248;
	Thu, 20 Feb 2025 21:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="OB7/3D3X"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A7E19DF6A;
	Thu, 20 Feb 2025 21:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740087225; cv=none; b=bfRzzrPJ9+nBfZ769UqHVCz/G8Ul7CoKhl9fjfi6zvKQc1ZRytc8D67Sn/9rnc1EXc93SThxs/kMLBq2JNEuwaH/MxDpoFuSV80YztacHvnBsshpB1q+MzR8T+LoLnJoQ6b1SDqXAWTqYxsW3m3NBjTXCHrPoZtbZWUW3PKu2QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740087225; c=relaxed/simple;
	bh=MeZPeDtFOyoiCyo51bFiJauQ91oSO9LxqtJ96Dngxvo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Pfzl2u2ou8TAHBGqPDu0R7xP4DPf6ClO0TzXUDwHNz6nrVfA1AdXi7bInbpD7F/iGRTDaXaWbPxj76kvEft23GEFfCxRIrPrX+JlFTw9splCU6kvoDubCkWA4gErao5Otx+XBD34x75pzLuTshkNF8p/MCMXpNtTwn/eHQHzcQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=OB7/3D3X; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740087218;
	bh=52PDNdWJ/jx+9zOcv0Lf5QYU7kDXgl2M/PRR7i06cFk=;
	h=Date:From:To:Cc:Subject:From;
	b=OB7/3D3X2EG0ghyCrC4TBkW+ffVIFOP74dMB53CBXWuaThwyNBL05AkxFNkDUarrq
	 4T7nsNwTArId0pZ189YrJn/Bync4z1vIBsLQWB388RVZwRLWbOixLotkXQSgs6LCR/
	 RSz8zXOJfB3/Vzn9Jaz1mP0brVyK7oj7iBrHEscnP7/Sz0U7PfuiN5aDORb/SJ1yMq
	 Oafu48vIZ7bqfZ+VVb/yXIjAd4KiWg4qSdiGEsqPrwHzKG3gfuSnVPP+qF5a1fCAjg
	 BTwnPPKr1unl/U00wNU3V1zIIf7t+ZPsc9/RRY4YOfMWJBNNVAd1roen+bP+yqmMiG
	 UbGXYNK1ahXtA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YzRMk4nxDz4wbp;
	Fri, 21 Feb 2025 08:33:38 +1100 (AEDT)
Date: Fri, 21 Feb 2025 08:33:37 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Joshua Ashton <joshua@froggi.es>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the bcachefs tree
Message-ID: <20250221083337.243123fb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0qkxuvk3YSUaRtsGkzr60zL";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/0qkxuvk3YSUaRtsGkzr60zL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  40e00a584732 ("bcachefs: Split out dirent alloc and name initialization")

is missing a Signed-off-by from its committer.

Also, please keep all the commit message tags together at the end of
the commit message.

--=20
Cheers,
Stephen Rothwell

--Sig_/0qkxuvk3YSUaRtsGkzr60zL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAme3n7EACgkQAVBC80lX
0GzScgf/a77TVtRUDpO70tIq/JDW9BnglZnKY34NdNEOUG1tl3Gj2xRlFNgN4Tls
R/MSFQOVGg8yVCL4UespwQWRrV7AEhP0eNpBct4OMEBsxRz+F+Dgf0p9ksJXGVF/
CZpf+PbXbmUowfOe0T5gZXEmS1sRJGueS8YC35WlHPh3tQfGx9jYRDDq3iIE9Cef
pK0gJyCApwySlbOUGNfG5u0oBwN9OGhhavmcZsykKt1welCdcwtFGQwq6HYvCNfc
Pm3/w03dP+xWas1HyMEU4rkHgbULqn2VCthK8MhRLRL8F3wTkEcBnxPXHa1PdDpO
FWmSIIONbTnX5Z3G7cvQMBNdCBevFA==
=0Grg
-----END PGP SIGNATURE-----

--Sig_/0qkxuvk3YSUaRtsGkzr60zL--

