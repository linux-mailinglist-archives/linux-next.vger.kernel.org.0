Return-Path: <linux-next+bounces-7273-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E27AED13E
	for <lists+linux-next@lfdr.de>; Sun, 29 Jun 2025 23:27:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B5621894D64
	for <lists+linux-next@lfdr.de>; Sun, 29 Jun 2025 21:27:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC0DB23E354;
	Sun, 29 Jun 2025 21:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Vjxpmmdw"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE021DED53;
	Sun, 29 Jun 2025 21:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751232411; cv=none; b=QzN927CSqgHAkNHq+IB4ExYVuazLhv5LgjK9rdlRleXrqwNjPUpa8cQ8STydZVLWrYuZSHfQ/UCkNtpTaho5txCWrAwM6PpZoo6BpagMqCkZCe49RwD0bTqrURe2xHLhAgp+NZoAwNB7ecW1oDGAZMJ/o32VNstnGx3h+1a0ZZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751232411; c=relaxed/simple;
	bh=wTQ1eAsg5kQ5stUwEA0w3kqTpLuMOwC6Ajhu4JZs5EE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=CvxF7QYxiOReiECnJpRoIgCEW0J2QM+EjTntWenSLEU9OfvzRdL0i1gFhYnQOpuIVysBlAU9n3YNu6P3fiaWb9ww1yn18o5gNmWR6/6L4lHSkzX17aUBcU+duE/DbSNGn/CSAeGQDrCvB5P9vmnK23k2qyqMuqD+PXdsXj5rWmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Vjxpmmdw; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751232407;
	bh=pZFkq5FT+tRY50SEmqHBQcMbnCm8IgMM9gjuXXs6OGE=;
	h=Date:From:To:Cc:Subject:From;
	b=Vjxpmmdw5d5zLX4J2P2xvyI4lUHAGsoUepheSAaamwcyS1fDwkDNh0ryZARDhdAAk
	 m7/NZIdZiJvtRSrrqAK46z9cHhsggWy8v+OjSswze581zTmY1SbExIDxqbMRWtCffm
	 G+YL77A5sneqOXq+2BGM2IPGkzjqpzLUG+0a7wf75UnuLTeGu3oc0u+M2qqTUXZ4ZA
	 t+scD5GTbQb+6D2VHxvk5Ur9jdbwjDI/0DeLypbbuleK/6SK1P/7Ji7yxLjI/aroJM
	 0fNlFLlzNqFwETgWiPM680esBq+MLdqOjLPrMWcJpat/DvkTypyVvsPNEhUAdr3GlU
	 mSEKJhbhb2xtQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bVj6G6q22z4wbn;
	Mon, 30 Jun 2025 07:26:46 +1000 (AEST)
Date: Mon, 30 Jun 2025 07:26:46 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Drew Fustini <drew@pdp7.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the thead-dt tree
Message-ID: <20250630072646.23076119@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iMpEhUwFcSiYm6Oo0PFXdJj";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/iMpEhUwFcSiYm6Oo0PFXdJj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

ommits

  66cba75806a3 ("riscv: dts: thead: Add PVT node")
  9c2f4c0b2731 ("riscv: dts: thead: th1520: Add GPU clkgen reset to AON nod=
e")

are missing a Signed-off-by from their committers.

--=20
Cheers,
Stephen Rothwell

--Sig_/iMpEhUwFcSiYm6Oo0PFXdJj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhhr5YACgkQAVBC80lX
0GzLxwgAjQIvZl/hEUOn2ZreVOIF5GAGXd2fIvgwXlHKnmWsZDpbz/J3qpwm52TZ
TQtNkC2Nh/aw8D7EZC+oP97KHSjNVVUDoEX8oo+hrg5a9vAsqJx1sDBgKzNi4HFz
PZS7992Ck5290nMjIET1d7tUzmOqPaMdyp695ltbmULiNa+OeD5DsVfcuDvTIzej
n268CGDqDTVXVk4HsiD01t8hJqoeGt0BMPyBCY6Za5oniaYupEw3gEc8ptuOKBWp
drQcyQfnmJ6Xdexffc3+mAR5NuCvYdSYGavIZmcav/pXC2l8Gqvet/pdhQvJ2cnK
Rvu1l2UUV9ms+eNG0Uh5n/ILCoqJrA==
=l8tu
-----END PGP SIGNATURE-----

--Sig_/iMpEhUwFcSiYm6Oo0PFXdJj--

