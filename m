Return-Path: <linux-next+bounces-2844-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E05092AC47
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 00:52:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B84B41F229E6
	for <lists+linux-next@lfdr.de>; Mon,  8 Jul 2024 22:52:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48B5914F9DF;
	Mon,  8 Jul 2024 22:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="D6P78czQ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0748E2EAE5;
	Mon,  8 Jul 2024 22:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720479163; cv=none; b=ZjpTRuwZSGM4zl+iUBjZurlTrBb3d96wCxe2hN4Mc90uM/mXQ484ITLhR62dYIGlOJXtFnaU/pE0SGUNQZk12xfx6V/zEtKvoKGWNZqEAQ9YEPORAvmWRSTVYdNERtLsGZGr6gkD1ttEy3R6/IP3AVMnMwqnugIFRX+cMSQ7OyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720479163; c=relaxed/simple;
	bh=zdgn84TjlMpphOw9oMR446Ua2/KrSt2it2DmjQwp8qc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=CFrdww0V7nwK/nC8bHRjhECkxhkROBzh1dIikb3xtZC+y4lhBw4RXs1KSaDJdn2v5NO4Jx9AGX+lG4+7ylM5MB5OxK1BrioZnowXpM7u4kFQNtrf/36XOY3iQ8rZpxii679VmL1FPf/Wcex9H49rTShq8dxs8q+565fhBnx8aHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=D6P78czQ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720479159;
	bh=zdgn84TjlMpphOw9oMR446Ua2/KrSt2it2DmjQwp8qc=;
	h=Date:From:To:Cc:Subject:From;
	b=D6P78czQxNWh5+Kyz+aaGB3LxWpIlceo0aZEAePhVIB97nqnImWIhh0W6X8fMCv91
	 tO8+V6Ppph7f/PerxQK9gGZzze+s+1RYWflSVEk5XReFUNAcyReh58zqobdcBWi/q7
	 IGqRD6jOclJDclaI9Xpat7be06Xz7nDZ1o/9OU899LWQo4BO/sN0o6PKrS5wIgD3Ls
	 Ggp+WrJbjct6PGgtUC8GVKGO/2V4P0EN505ZRITMCJVblg/3uT759HbTZQ1510o6HY
	 zpXPH6f7XwryDyjUyLCqS2ZDUoBIf9RcgtgcmXfMk32KpzWMhkfPm6E1IjWKEloRom
	 fL6fZKjHQvkeA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WHzsg2QWWz4wc4;
	Tue,  9 Jul 2024 08:52:39 +1000 (AEST)
Date: Tue, 9 Jul 2024 08:52:38 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: error when fetching the drm-msm-lumag tree
Message-ID: <20240709085238.1fbc301d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bRZO1NnApjCsw8iiRTSbWDY";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/bRZO1NnApjCsw8iiRTSbWDY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Fetching the drm-msm-lumag tree
(https://gitlab.freedesktop.org/lumag/msm.git#msm-next-lumag) produces
this error:

fatal: couldn't find remote ref refs/heads/msm-next-lumag

--=20
Cheers,
Stephen Rothwell

--Sig_/bRZO1NnApjCsw8iiRTSbWDY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaMbbYACgkQAVBC80lX
0GzVegf9HK+iyY6v6N+dJfnbLoQfwGIHZ4rndR52qNaF9KwHOWyI8KzsoUZ9FoCl
zXJ0k0gPN3x+Ohn1HIFzgmUg4ABO9e+eAt89c9wJ4Q/SkXIOfRBnhVKgmmslOknW
LEr8ITX4gIjxfsAA2VN9StC2h6V1DEXJwLyEdM+rsQ/5vz1Lhv5JFq/kAK9/IYZY
tJmYIrO5dCWbuAt0Sh17k9BnZp31ehrLc3YeHsTcmLlXE128M3kG+yANywNOFRyz
GrR+NxF1mvPHY/+euSML6WOxwLPBacnyN/8cBNF1EuLzXdGsbaiXrZzVZ0R7ophN
yHuvkgaALGa742Wf7eSPKXvC0uQCPw==
=NrLd
-----END PGP SIGNATURE-----

--Sig_/bRZO1NnApjCsw8iiRTSbWDY--

