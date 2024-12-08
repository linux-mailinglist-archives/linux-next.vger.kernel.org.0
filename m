Return-Path: <linux-next+bounces-4896-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 259689E87C6
	for <lists+linux-next@lfdr.de>; Sun,  8 Dec 2024 21:32:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14739188520A
	for <lists+linux-next@lfdr.de>; Sun,  8 Dec 2024 20:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6125D13B592;
	Sun,  8 Dec 2024 20:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="bQ16Ij6O"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4299460;
	Sun,  8 Dec 2024 20:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733689936; cv=none; b=aDIXrGBkkglSQEJBJLVqxbjMNTP5KcxAxEByjtNUfQSaq6oeBD2oGpSfpurc8EwtMBNWwJPEXIWLzYwAZp0a5Cs+/OnBq+DjR43keouNlG6VZ6HBFJyi9wxj3m9HNhUWi7gSVE8W8hkU1VEwP1saZIBS56KWbOwuvzA7jcUoUQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733689936; c=relaxed/simple;
	bh=6scDLrGGVas4MTv1lP1hIq3yfTZINBTLTveM7WAn/P4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=je5T8wSrSZy0prJhYIxERfaDEdVlKV0Wr3dBzJYKuT0CjESfpssBQ2Nq3HMtOpOVqP9IlEg+pm1KiGFYuwBQYkWMRePfyG9uBdYYaKRKYCGBC0w98dSfhdVz3oYMF7IgXU1Xoq9gu1rHRxsxk7S3sq8rWA2AUREX5WaADghZrLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=bQ16Ij6O; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1733689927;
	bh=Uwdm44294jAMPNsRKFIJnLYdkgWkRDsJC85FQFRZciU=;
	h=Date:From:To:Cc:Subject:From;
	b=bQ16Ij6OymzGSNKZ+ioXBMqD8N8/k6EDZdyA2Zmja1x9qO3DSLfKcjIDmk4S4Wii4
	 yyZuphxNli5D0pTps2UGX7eyG7huhEMaEsMFIUkZaLcHey21ZttwEF3sq9Uu6aVM5/
	 VDVjtr9sWvaIoinDIzlAGoUX4m95watm0ZDteeOVk8y8A0A8jpFafiYoL7T1UdVqB/
	 elBiweSykSzCP5BcaOIWcNXZUwUCgPL72YWhMJQm4Tx3uJyFJgA11Jxk6INCGHgnOd
	 HpVUb2rrs2wbSPmO1p268G56MzznJp2tQqAZSSlk/weYZHZT5aLdBFqnuxrwzQ8Vq2
	 L3q2iL3x3SMFA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Y5xVv4mhWz4wcl;
	Mon,  9 Dec 2024 07:32:07 +1100 (AEDT)
Date: Mon, 9 Dec 2024 07:32:11 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Conor Dooley <Conor.Dooley@microchip.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the riscv-soc tree
Message-ID: <20241209073211.562ca6cb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gJI0FZCYI6nOMaVpE05CDoo";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/gJI0FZCYI6nOMaVpE05CDoo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  c813ef3c5f6c ("MAINTAINERS: drop riscv list from cache controllers")

This is commit

  6bad1bef26ca ("MAINTAINERS: drop riscv list from cache controllers")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/gJI0FZCYI6nOMaVpE05CDoo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdWAksACgkQAVBC80lX
0Gw12wgAnYw6ddg8E/skQZwS1RsJQyWlToIBw6xVPUempThsll4Cmeq5UlYKHtJo
J1IEhpHuOJK5Xjp6DXq1FZoxoh12jAiAmXn/lF+OH1bzfoA41kXFVyRBEBwrsjRb
6CUu4E1os9cWiKwHk+C33B0XCwPYfwRnh0Qe8BmjN+FV8HZPVwPpoewOeMo69xGE
jMbvqlZn7GAsSmOPkOnG+G/NpezNbkJnlTIl/0fdTdxnEpfaEJJqxauc4bmUTBWU
/1h8GEefbSyz8ewO2YS9jbjAvWia1+ZJQp1WWVIwJ6GjyzLSQxBdADfTl8yS/Zax
wipjdmR7I9S3VsCap5lJtVdRe1jfQQ==
=BeoF
-----END PGP SIGNATURE-----

--Sig_/gJI0FZCYI6nOMaVpE05CDoo--

