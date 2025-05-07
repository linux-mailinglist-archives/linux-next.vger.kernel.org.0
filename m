Return-Path: <linux-next+bounces-6560-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E7126AAD29A
	for <lists+linux-next@lfdr.de>; Wed,  7 May 2025 03:20:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58795467429
	for <lists+linux-next@lfdr.de>; Wed,  7 May 2025 01:20:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE1C52629C;
	Wed,  7 May 2025 01:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kwGcWyuR"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B9D4B1E4A;
	Wed,  7 May 2025 01:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746580801; cv=none; b=ZmNzcP8sSnaO1Oo7IF1hQHgsFQvIYjBcuT3/uKQ5gRJlBuRJvWsnR0uT7dPwLewB9v7MJi080pJmg6fA0nUrZmjfIPMPtRybRpUD00pdNlLYnlHhcvbaTU/Obes2AnKY2/yHxwDn7FJ7L1uJwLQbwTmOQMKkJJaY69+wLAGB+CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746580801; c=relaxed/simple;
	bh=OOa2j0pTKOqCQi6X69jQeEkORF8efFL9HlCz4tQo1v0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nA0NeXyr+xu2I9/v+lPLgYvISLHxmaIANoAJ2GVJGvENIjVlvHpNbEPJc7ebb8ZOy7BGDYtVXGeqt41RXlJ0aL8GvgXwp5y++4wgXl1GRaN/Sl3GKtMpaPHryK6GiABbY56YSuFPokvCzSPXntrcCF4CjvHkdF7QFi/FRiJp1h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=kwGcWyuR; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746580796;
	bh=W7j2hweyyyxTdvu0u2FUQ0c9EoD+y0eh1M5rPKT5eKM=;
	h=Date:From:To:Cc:Subject:From;
	b=kwGcWyuRxbasZsVgt+m/RH3iRNtejKizgowS7Ss710s1wX/l1cGNYXfBsU7pZrC9Q
	 T1RS8niy3x5z/JTqy7mKI7VzlbM/6O6uGVudCnbxFVdXZS5WLTv0JJTaJ/r3oOmgRP
	 xeAzr0V9GRG5T6QciiJgH9Rl+Wr0TgD5NranhCyhyi4KkFYnRofsdo0e6GKXVoIC67
	 VCc2O+L1iH+PC42R1gLY1FVcd3C2dakeX9slSgRxqLNlOhsoBAr/yRC8F7BVFB0i5G
	 e0v38u8GlBJ0DZ4p/6OyrbUoLd5BU/aZTsA+jpBAlbLa6AG5dxzjZSPBCMJyGLNevS
	 04gXUWP9xZazQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZscrD5Jj0z4xN4;
	Wed,  7 May 2025 11:19:56 +1000 (AEST)
Date: Wed, 7 May 2025 11:19:56 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jonathan Corbet <corbet@lwn.net>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the jc_docs tree
Message-ID: <20250507111956.69847ed6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//acuq8PhwV48MbjbB=RRFw=";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_//acuq8PhwV48MbjbB=RRFw=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the mm-unstable tree as a different commit
(but the same patch):

  98d2ea56614b ("docs/mm/damon/design: Fix spelling mistake")

This is commit

  7368fcda3f61 ("docs/mm/damon/design: fix spelling mistake")

in the mm-unstable tree.

--=20
Cheers,
Stephen Rothwell

--Sig_//acuq8PhwV48MbjbB=RRFw=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgatTwACgkQAVBC80lX
0Gz5uwf8DIGbCNosVbz8gGXMAlt5cnFSyWtPvB7EdVX09Rm13R5R97TctJghUp2j
5ZIeLQupjfOOPJLmSegRryd+8GVXj6fXF636Yuf4wDfy4kjZTKOMwphffsp84dY8
gg6m6QRiIhFM+U/1hKDdrQo6lsA2D2IF3xbnhzZM0Zp6KeTPEUp/4xxTmezO33Th
NBvBA9LThRaEJdfhkZy0ypLRisSWHAx5dyYGVM1b73NJMbjEQ9KBS1q2lfqfSwaH
SelC4+dlixE2+dx6bRjiKLfOl8aLWX7N2tL3+4ZqilH3ZaPBPYnV4lvMPgp2DNav
mfQ37J91hKshWej784puKYhner97ZQ==
=zALS
-----END PGP SIGNATURE-----

--Sig_//acuq8PhwV48MbjbB=RRFw=--

