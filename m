Return-Path: <linux-next+bounces-3668-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BEA970F5C
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 09:12:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30BA41F22BB4
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 07:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5750D1AE048;
	Mon,  9 Sep 2024 07:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="XAd2gK2t"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B545541C69;
	Mon,  9 Sep 2024 07:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725865948; cv=none; b=BrEym4BSGxX3AZOnghHPAQ2Ia3i2bcgMUMcZvIEjq9qG4KH7YkPlIuvig+CFSI4uWhFBv05wgG+kg2r93jBvQV3TiHbmpMjT38F7b8LjN6XwDeh0UEUk/gozGkTng+a4ce4mVRPJMiF2BXFuVOj662jx9LrJcG8edtWRBoxz4YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725865948; c=relaxed/simple;
	bh=rAjIxexzHpxFUBZyW6mQg/Om93aOi5auuBMwrQuPYZo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UVHSJbwACqFz9rJAR2f+DTheYjEpz07LKEDAdEMveed/I6dTgZBDjHl7/OR/08FPCKIYZ+3xPARL4Pv5uJ9SYuX4FnntAEnrQZPageMkHePOTW9ePdppEajqKqTRIpZ2c6JAag+9zfzdQmYq2/jtDiguS7T7ZYEofpbb6QS+ey0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=XAd2gK2t; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725865942;
	bh=m4rCD94CoWLVB7CnApt4cxyYM27pcGRyAgpIg7H3QM4=;
	h=Date:From:To:Cc:Subject:From;
	b=XAd2gK2thnyRqAH/AwUtz8ZMFoogjyxqJrG06hQYyy/ecXYuQdtbI6Qw0/GeKuSSd
	 VB2s6xIgugd/6LFkp+PEZAoMlsd1g60sl7Rg8lLXmMw010W/5xeBqC7AyExCRyrBpJ
	 VL2PuC+ORwtJCVA9VDQLvMmWnxJrUcPnMoS0XVBi3u2rMgqx4T6ewipU0ZoPXHWhVw
	 AEKHgoWwdq9gO7lh43h8bPBRUtgOHBpRrm4gsGl+KnHg75e4EknE4bOsVn2inhEj61
	 9TViMF0gkDyPMVIYkEN8ljTEzp9/CkBQJHujZffwojIwtGvfnwMT2bDY1TeBHo5+B/
	 tRQK9saUM3tTw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X2J1f2HBNz4w2N;
	Mon,  9 Sep 2024 17:12:21 +1000 (AEST)
Date: Mon, 9 Sep 2024 17:12:20 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the slab tree
Message-ID: <20240909171220.32e862e3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DB7LHX2LecSCHK9KqMEoV8u";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/DB7LHX2LecSCHK9KqMEoV8u
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the vfs-brauner tree as different
commits (but the same patches):

  c0390d541128 ("fs: pack struct file")
  ea566e18b4de ("fs: use kmem_cache_create_rcu()")
  d345bd2e9834 ("mm: add kmem_cache_create_rcu()")
  e446f18e98e8 ("mm: remove unused argument from create_cache()")
  0f389adb4b80 ("mm: Removed @freeptr_offset to prevent doc warning")

These are commits

  f2b8943e64a8 ("fs: pack struct file")
  d1e381aa30cb ("fs: use kmem_cache_create_rcu()")
  ba8108d69e5b ("mm: add kmem_cache_create_rcu()")
  a85ba9858175 ("mm: remove unused argument from create_cache()")
  6e016babce7c ("mm: Removed @freeptr_offset to prevent doc warning")

in the vfs-brauner tree.

These duplicates are causing unnecessary comflicts ...

--=20
Cheers,
Stephen Rothwell

--Sig_/DB7LHX2LecSCHK9KqMEoV8u
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmben9UACgkQAVBC80lX
0GyGVAf+JrTB7CzJgGsIhojTgE8t/s5NGdp22OZqdn7SEA2CJ4IneJypxXod77ql
SLWyjJOWDp731B1PcQvjyzQdLcwJg/I+3kbcbHAEwfheRU5yZr9dHoMZQd9t31qG
yp84xdS0SzLgY4UF+ukBUN0gqBVZ6V4HON4nU1VA/OrlaSz8enfkUgma8ZPRSpkc
Fod/ZWrrtw1cPv0Ghd0jpzax+2U+/TqnHS5w9sEEYtZImL4egYDh5A6I4Hlp2mFt
/w1B7yswtE2ZSpFFjECG4CJb67VGMKZyQ+oim1fo4OHwKhTxTAqP6+lzXdNkMEEj
nGJmcLeJrvOEy+v2DQyYUe/1iXp+2Q==
=XaoI
-----END PGP SIGNATURE-----

--Sig_/DB7LHX2LecSCHK9KqMEoV8u--

