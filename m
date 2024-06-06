Return-Path: <linux-next+bounces-2477-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D3C8FDCDB
	for <lists+linux-next@lfdr.de>; Thu,  6 Jun 2024 04:38:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CA97283907
	for <lists+linux-next@lfdr.de>; Thu,  6 Jun 2024 02:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C561199B9;
	Thu,  6 Jun 2024 02:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="fgPHgB1d"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9365D18638;
	Thu,  6 Jun 2024 02:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717641483; cv=none; b=c6QSqk3oCE1NgVYINtpQTH9AVo6chQvuEwd5csHoHsK0NCL4FjbZesgKeR0qUqu/HlcS7l1hk/7Tf+u5//bRuh7KZ+YBV1x79LEJUp6otx9S+bmuXZmUXJSfD3hoDa+ns6k/L8ckNZJ+IxIZhhS9dbccqHELOgnCaGK306RbApQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717641483; c=relaxed/simple;
	bh=q00fbyXWbku008T8lIzi4IMyV7RDrJvronr10vODt6A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=V0NNr7HTf8NfejsUZM+gre+hFna4GnvoR7DHYO4phsF+aSnDxG0tkrHr2srz3zUfRv1HAJd+IKuXcmHLok3I1STIX8pZX9ZmGf1IjsxHFw6Tp3GASzOukyvSxuLVvZJJ7uh1SWelnGl4aRUzaC2YUie2KRrcrxn58Wod8ZyX6fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=fgPHgB1d; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1717641479;
	bh=D+Cfu7ALBMW2PLLit63JOjJ2fwsMyM7p3hV2JeqvN1M=;
	h=Date:From:To:Cc:Subject:From;
	b=fgPHgB1dNGZPoYt8ZBTtTQTaks0yZHTKkFjCcTNlU3bNM8QQ1viZxcuUL8azMcLMA
	 p5dYpOnA0UdvD22iyFNN66EEwd/c0QdVCU88udAOeTxQqepA1yG2TCzKtEL/L+3mHy
	 DpDobhVjAe3J7/VX45MsRbozzIqzUFDzq53N4OyCqj1wI5AmwdwvBLuiyD3uVggYlp
	 SkDvjkiHhUUwRNZjlGMWBG4Y3MvSE/X8+Qev166VyBxEztDGDEHJ3pPt7kzWamnoM3
	 QyUa/WMhjFpoEaT3zo1kBNSRdlrRZnrX9hho/nrftt3e2p6CtVCjpKbDz1j6uA+A2T
	 Eb1jNZThR2X2g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VvpQv57xzz4wc3;
	Thu,  6 Jun 2024 12:37:59 +1000 (AEST)
Date: Thu, 6 Jun 2024 12:37:59 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the memblock tree
Message-ID: <20240606123759.2a86c8c9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Cta1QLGl8wU=JWk7Bc=ti1d";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Cta1QLGl8wU=JWk7Bc=ti1d
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the mm tree as different commits
(but the same patches):

  731b11684819 ("mm/mm_init.c: use deferred_init_mem_pfn_range_in_zone() to=
 decide loop condition")
  e62a627e845d ("mm/mm_init.c: get the highest zone directly")

These are commits

  dcd8c5e5603d ("mm/mm_init.c: use deferred_init_mem_pfn_range_in_zone() to=
 decide loop condition")
  6d60d854951f ("mm/mm_init.c: get the highest zone directly")

in the mm-unstable branch of the mm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Cta1QLGl8wU=JWk7Bc=ti1d
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZhIQcACgkQAVBC80lX
0Gyk4ggApJTalVDS9ucCyEh6FpPSF89jyv42n2k78Mvj1sf9O4YFDQIRGrpcXjga
bI9zIFR4F0erIq56QtBPxDuYJBPSeO7/ZAqDAimgmMh9S7vKBhkygO4thFDf7pgU
3gqI1XvGUx7lhDwVXwVas5xoOY39g6PEUTTMDF4oCrZXRpDaQgDjRaZfR0taVyFG
t80UCCxpItaMIDtxdYmVAEldkfNEEbGyGvUN0QImV4HLRCLuD4us0Pos8OpjoeFN
NwhOaT9qNRlsiAKkMTs42/Y/rV9al89OOBb/pUENlLsbxYW5kuYW11Juagp5ThUT
gmktyhW5EjfHmBTGV/5ojDWQavpLAA==
=AUJ/
-----END PGP SIGNATURE-----

--Sig_/Cta1QLGl8wU=JWk7Bc=ti1d--

