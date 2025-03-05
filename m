Return-Path: <linux-next+bounces-5646-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDE2A4FA28
	for <lists+linux-next@lfdr.de>; Wed,  5 Mar 2025 10:33:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D11C03A9B10
	for <lists+linux-next@lfdr.de>; Wed,  5 Mar 2025 09:33:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E10D1FDA7A;
	Wed,  5 Mar 2025 09:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="KeV51H9g"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDE2204086;
	Wed,  5 Mar 2025 09:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741167206; cv=none; b=CfHLF3WXw8AopMFeW61euk8bkk9H7fI+pMzopvzfQJYyvYKSbJivFxH2l8DCuEgvEDSDyUGzxhESq5XLZawMz8X6VBKB3M4P7eq6ZxmZlPgx7+xpuibzakGlYbcq1jBSLmbEL5U/ydKLniEuzZ/QCnroDLUkfHqI1WhgfMXKT7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741167206; c=relaxed/simple;
	bh=cE3BdINxmDVdlp4p98lix8XVrGl0TyJDlwMDc2Hi2PI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mbxHYgtULGLK/bXffuR2qguzejx2glsFCQf32+UOjJRVkkzFcSATFKccVj2QgawkNN9ReShjJoYYJnat6TgtVowjWViLKGu2hA3altPwNqn32bNdVQKN2T74f01qZk8N+XJePKB5WGje9KW/++UrWh/5EmS5lQNb5cKHZpFioOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=KeV51H9g; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741167194;
	bh=dMTMkXVe4wJDdMfe6l1hUtcjcjB1pXE4cvjDuqj/YWU=;
	h=Date:From:To:Cc:Subject:From;
	b=KeV51H9gPIqMqMLELcBw3ccQzp7Doh5XXMppJVURQp32ycTB5gXeKwnSNYduRC68R
	 D/4JTXFbd3JXVdCVt8TWUWk/f2hU4DufcoH4LsWv+Y2Dp4XwnqZOx6xbuzV1lH00+c
	 DsFcoiKhPZl5L95P/pM/neW0GvycTa+FTH2kH80xiEsyDkAr+lOJqlSWh9OsbfVeYq
	 qv4ZaNraf3VAK8mvP3jAPv5o432np3PUol4IUU4jLo4fyCkZqGN93rRHVVDzCQbv/i
	 RT299UUATfgZ4o/uwpDtFm0BZHlptXOx1lMC0LuffCQh1PxyjBpfD/fMyBHtHbZw0r
	 elzfPBiGn29nA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z76mV18FBz4whq;
	Wed,  5 Mar 2025 20:33:13 +1100 (AEDT)
Date: Wed, 5 Mar 2025 20:33:12 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: SeongJae Park <sj@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the mm tree
Message-ID: <20250305203312.6f30e9c2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/uT5l70R1Nr5me0zgpy4dEhy";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/uT5l70R1Nr5me0zgpy4dEhy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm tree, today's linux-next build (htmldocs) produced
this warning:

Documentation/mm/damon/design.rst:342: WARNING: undefined label: 'damon_des=
ign_region_based_sample' [ref.ref]

Introduced by commit

  8a2e41c7ecfd ("Docs/mm/damon/design: document for intervals auto-tuning")

--=20
Cheers,
Stephen Rothwell

--Sig_/uT5l70R1Nr5me0zgpy4dEhy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfIGlgACgkQAVBC80lX
0GwdCAf+OO2WecnWsRahsERETJ5D0XBRZAyF9vVjbhRx1KGa6FUCnDJj8MxD4zoT
k07mF6pr49oyAxyGzvNCmdMiyeZTxBHKqrxEhavVDAj1RHhV1zn7LM80x5M7ctwP
w1prldIPh1ZcuTPEhUBVgbX+yakaRWxleZXStsAr7NxkkizB5tNjsl+gsqwlVfc/
UBugISPKEoA8KKEaIAkUSdFemZCLQT/8NNR6I8wYA6BV8c5o7BZlhCwZXEzI08cA
1uyLEX5AdmmfxaypP8usWCTxNfjt/baA/pQasxE0GFGPv0/Q35ASg8R2f8IZPAFg
d+3HqKRKPsS/u+3BXKdExz5lVWotYA==
=YFl4
-----END PGP SIGNATURE-----

--Sig_/uT5l70R1Nr5me0zgpy4dEhy--

