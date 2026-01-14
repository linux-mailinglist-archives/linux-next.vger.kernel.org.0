Return-Path: <linux-next+bounces-9649-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E66DD1BE1F
	for <lists+linux-next@lfdr.de>; Wed, 14 Jan 2026 02:05:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C71D83016DE0
	for <lists+linux-next@lfdr.de>; Wed, 14 Jan 2026 01:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A805B1A08AF;
	Wed, 14 Jan 2026 01:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="pWkMy22e"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8A850097D;
	Wed, 14 Jan 2026 01:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768352745; cv=none; b=CLk7LLtqWt34AX2jYkBwSnzdM6bpH79hn4F97n21B5H0bFgGXKmp6gNEwY7+wu1LrkovQqbLoxsG8l3sWfdo7ZjUlZNHRE22NEc/8Sjoig6fI6wIL9srxWNJ8dJKtPWJJFQlecVm6pj1B6VklsCBfsmB5WHWg18rhJ47KG5ipHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768352745; c=relaxed/simple;
	bh=/eLCTpllydxgqHxbczNnJsR4dpTl/PX2kmJ5K06GHrI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=NMsnZh4f5I/opzftQmZpNOGxyr+qg3xt6JYsudL75rV13B4R+Q1rv5b+TCXhs4TyiaU2uwwKeMpn1K0ReMP8yLIwn0d/iz0KiFHVLcO+yU4OxnPbfEB8B5haH/elymFLjMnHQNhVs9ck/s+phXtvO1IUl1phuoaCEVZVlI6PO74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=pWkMy22e; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1768352738;
	bh=XW9x/M17stQb/1GZeEVPOGmslkBSf8lNa/COtMVFSpU=;
	h=Date:From:To:Cc:Subject:From;
	b=pWkMy22eOIyBquLk0PTRmkHI3PQai9cL/j4yWMe6y9Mv7ubYm+f9roHaibv9/Exwa
	 ARjY1G1LQnlq5jOaNHIkPI5m442vJBfiR1EWyrDiFMAYZPfLmYy/iL5u/fNpQ98/Gd
	 +eTyiyIP7AC42wV3GtfVDxFglfZfrdCXge5Acn5QIHGFHbGGyKbwNaj8+o37v4Ubqv
	 zV7x3EiSGRD3EGrHb2RMMy3Pvq/rRVCcqbSnNTmrxDLPPAVcDCKh6PVfJn/GuGKTiP
	 ijNF3UaNQtN37CtfTb1NBl40Vab2sU3U0WwAfChb0BdOJ0IPUQ4o8vAt8UfXWyDR/v
	 1dZCKAvJMarCw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4drSbQ08rYz4wB9;
	Wed, 14 Jan 2026 12:05:37 +1100 (AEDT)
Date: Wed, 14 Jan 2026 12:05:37 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Conor Dooley <Conor.Dooley@microchip.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the riscv-dt tree
Message-ID: <20260114120537.0b55d4ef@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/x1L9Dy5iDPQv6FClaQ8cbTt";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/x1L9Dy5iDPQv6FClaQ8cbTt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the riscv-dt-fixes tree as different
commits (but the same patches):

  a36b2aaae742 ("dt-bindings: riscv: extensions: Drop unnecessary select sc=
hema")
  fff010c776f7 ("dt-bindings: riscv: update ratified version of h, svinval,=
 svnapot, svpbmt")

These are commits

  eb766d282af7 ("dt-bindings: riscv: extensions: Drop unnecessary select sc=
hema")
  6f5d8490ca03 ("dt-bindings: riscv: update ratified version of h, svinval,=
 svnapot, svpbmt")

in the riscv-dt-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/x1L9Dy5iDPQv6FClaQ8cbTt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlm6+EACgkQAVBC80lX
0Gy/6gf7BEKOjTWt4X0OKnplGbPKWR4TKL/E4r8SFtRpm1bgJSS/T+xPJWykZOt+
7tNt1yEfnohj1wEux401g+90DKh/PNDZXbZ9bZPbi0nkJxg/1MzzsMoLiNPA68Yf
ZjugAZ7Brqb9/iUb/k8unIi7ho4XYhxcxykZomAP+XA1gyDCW8TN0wDL4k3Mc6nc
UJ8puNdWIZuDrFqnpxsqzIknU40zQ+0U6f+9fEYhZ0ksdu2lZhMf74VqXtYHLHnU
GkPYbpTZzOa9zU9NSFGZeyIT+mRRTgpB2nyp9bVWW03MgbRxQ6Ru+ddW++pDBrgF
Th3PIdCn4KAQi5Iz1Ip8F0cuOMhbQw==
=rIX+
-----END PGP SIGNATURE-----

--Sig_/x1L9Dy5iDPQv6FClaQ8cbTt--

