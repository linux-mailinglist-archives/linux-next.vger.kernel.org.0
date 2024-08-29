Return-Path: <linux-next+bounces-3494-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74431963B2B
	for <lists+linux-next@lfdr.de>; Thu, 29 Aug 2024 08:19:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30BFD285C73
	for <lists+linux-next@lfdr.de>; Thu, 29 Aug 2024 06:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF774146D6B;
	Thu, 29 Aug 2024 06:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="o6755Avv"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CCA4437F;
	Thu, 29 Aug 2024 06:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724912352; cv=none; b=ueKheNzZAk+XdPppcU3PVRetr5nBib0h/ethLeWqnxLEZjP072WQKPMon2mqnnq95F0bmuwNAgfR2U4EXMtx7bdp9XZ5eI81SbVkR23AQWg8V5QI5t2ThAtk3lN7JL5oxfRGtgWs/4hzJRtQeK6k3dY0/Xb7EUPq93Kya4g/tIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724912352; c=relaxed/simple;
	bh=F7hfqPWjK21LZIqX2HeEGyEIMzaabpmrDGFyoaCKs4I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Acf0KId5pFswbuqoj8MrPwzEeScDHTQPjVSdWq+dn0g2NMooSS7SsppfRrW3ipPLcfKrBdUlHzwJ0hCyikXnZLqqhQ6bX05Vy0GBjTXV0zrOh2hI+69NLn+2JWQlolI57BVK5sJ7aksFziuutZ54mROBz48Cufn77DcAP/Fvmgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=o6755Avv; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724912347;
	bh=FTLoSfIY/76bCDQY4KNtTlpgnhOXm0p6GHIEoRkMapM=;
	h=Date:From:To:Cc:Subject:From;
	b=o6755AvvQ6e797w4v3VDr8b1QCFud64Ua2tb3J1JwEMCYQMGf3Sqn77LXPAuFG0Lb
	 fUOUfM4aQCyAH1af1QkeyAE8o0L4+pXlc9AG+Z1SerfElwjFR76NAQzVkXlcoHFo/j
	 aPzW5XAVEtwwa1+RWDpzt3VkPYJ5uuaNJFS/ZQzZSgHMnNwe5beaVNRDPuTrF+J6Iz
	 pVZwLR9FDtx9VW1eCeTdhexXOM0sUYGq5gTWDg0PNwGd2FKGb1xH8YfpYGWla+BA5y
	 jOhvC2UxnE4JL6Qrhov2cwZh0wOoAsTw0a9h7veBpco3h7Vmq9uEO4EjgeHbGPRpZ8
	 MvMcgVzYRs2Kw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WvWMH3zb0z4wbr;
	Thu, 29 Aug 2024 16:19:07 +1000 (AEST)
Date: Thu, 29 Aug 2024 16:19:06 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the vfs-brauner tree
Message-ID: <20240829161906.0c668570@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jhqU_aJZeeEyo3KuuaA0.dR";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/jhqU_aJZeeEyo3KuuaA0.dR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs-brauner tree, today's linux-next build (hmltdocs)
produced this warning:

mm/slab_common.c:385: warning: Excess function parameter 'freeptr_offset' d=
escription in 'kmem_cache_create_usercopy'

Introduced by commit

  18dc9b395108 ("mm: add kmem_cache_create_rcu()")

--=20
Cheers,
Stephen Rothwell

--Sig_/jhqU_aJZeeEyo3KuuaA0.dR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbQEtoACgkQAVBC80lX
0GxdQwgAnwLfAg1QLp62KIOKHJX8pKrlOPXZwE71c7kMxjmsL9ReDkFQY2A1I82i
kGRyaJmfObz/3GZnUthPTyoOjRdUO2oqH8l1nTv0KJ6YYGdt74nyxaKE+6CNLcc3
UhzZrFtkpcvPdqlkzzYjnGwk5tiKcVNZIZXKNWSSUQ6lsoOvg98RIyJGFhFJn/ML
0E5Bg68MrNy9IdMOCTBFUkFTgjck4Qn8Fltg/H7NacRchguYH1JukaM1Z37v1lq0
Mt4kU4djxtt7doqXR2MxNdzfobv0C7DKRkjc80lPv/c20D8sStEIuLRD04oGDYk/
LqkD3CQGgmnQ1VoP57wENaE7Pze8Sw==
=oEDQ
-----END PGP SIGNATURE-----

--Sig_/jhqU_aJZeeEyo3KuuaA0.dR--

