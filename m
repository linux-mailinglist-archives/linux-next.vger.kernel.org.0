Return-Path: <linux-next+bounces-5535-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FF7A41296
	for <lists+linux-next@lfdr.de>; Mon, 24 Feb 2025 02:23:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 256173AAC82
	for <lists+linux-next@lfdr.de>; Mon, 24 Feb 2025 01:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DFA02629F;
	Mon, 24 Feb 2025 01:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="FteeSEa0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A8FEEAB;
	Mon, 24 Feb 2025 01:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740360207; cv=none; b=uYNRRIqp0EmCvCiCG4XkhfiuT1jUomnqDS3nRolFeEMxDFmZnpCC29ClUnfp+xVL37Jzath9+EcFoAvaQkKiG8rrtMew9zo40JZzmtoliNHS0e+lMHyWMRcTZ5sG1YF2iEnyHh1wkBZBMu6CJi2gzz7h+IiEOo34Kl6FhD9G2W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740360207; c=relaxed/simple;
	bh=los1eCdEmVxhO5Tf9dnTGtubMObQft7Y2uFyJjHxoXU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tiaxIx720uwj3mNG2Brc5MoUCJ6JJHtrReicUugU3fUlxJtSVFV4aU9MhPdPS+2L0b0Bd+Vg7k24JzO91TC3d2OL5D4xtEPfqzInn0YRUIMWYmi3sVGf6DIz7GYDf5Ia7x+oViEYeaGk9TAal0dY44KSnJswPKuW5q5J8CD5dBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=FteeSEa0; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740360200;
	bh=nj1U2uSVkYkz/+hDpbISu/uTHKxGKwkrZgTl8Rgqf5o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FteeSEa0zwN0uy+Xz37wVeDuCYGnSY7OIUdV+GHdf4XMOoP+WFQ2309u6lPEJyFSE
	 eFGyneDXhhvlXHVSEdU5p3oOyjvL/U7IZGVr+m9oTrK62jHm1DThSDaqX1e13UFe4S
	 KGqd1j92GuYC1YrnP5q3u8IrQUjFcS5odPGR5Bcsd/VA8u4DH4RYHHnVAThnSAudyk
	 UfJRjQYBVNwDCkhlSdEs84LIplMAPw7PAPwnX88c6dm1e7Eaw2sEpiA3EwtGLgqpAM
	 GbqS/W30vP0GhIGWCoXZo7jtJdaFTCg1P9kjTyjgK9XloTqNwTb7Ohw3OQnhJsK5p3
	 m2cXH+dUGMTYg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z1NKM5rc4z4wbR;
	Mon, 24 Feb 2025 12:23:19 +1100 (AEDT)
Date: Mon, 24 Feb 2025 12:23:18 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the pmdomain tree
Message-ID: <20250224122318.228f695c@canb.auug.org.au>
In-Reply-To: <20250220113338.60ba2290@canb.auug.org.au>
References: <20250220113338.60ba2290@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UTwz0u31u38k7c7NQZZokZj";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/UTwz0u31u38k7c7NQZZokZj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 20 Feb 2025 11:33:38 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the pmdomain tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> x86_64-linux-gnu-ld: vmlinux.o: in function `rockchip_do_pmu_set_power_do=
main':
> pm-domains.c:(.text+0x19aa103): undefined reference to `arm_smccc_1_1_get=
_conduit'
>=20
> Caused by commit
>=20
>   61eeb9678789 ("pmdomain: rockchip: Check if SMC could be handled by TA")
>=20
> $ grep CONFIG_HAVE_ARM_SMCCC_DISCOVERY .config
> $
>=20
> I have used the pmdomain tree from next-20250219 for today.

I am still seeing this build failure.

--=20
Cheers,
Stephen Rothwell

--Sig_/UTwz0u31u38k7c7NQZZokZj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAme7ygYACgkQAVBC80lX
0Gz9TggAlKSRBZLGUss58HGQ+4zfafAeoVGkdJuM3nSNNktPmvwbI5c+GAjpqG1i
9ErGKyORTUyh5RDNjYxnv04GQS2W828IvOndYDKR7R7ElFf8vmiw8fWh1/sT57RA
Y6pZNaBkbv0QNf5wSV5/zE3/pS6MNcI1GsnbrOWiziV2CDFFrTo2EYSFj8b8rxFU
FmYqfOKcgJKu7M25d64P5epgVdgtNI5sfGrGtWRK4vO0xHU4oEMaiXl0UaDP6Rly
0qHKadteO7tOshU8Vw5P2sljyYGzKh4s+q5gMzteY4pDd8aCm8qKOAU+P/WCrk77
l5Z9A9hWb8ogkqYunsUst7QvKs0qcQ==
=tWn7
-----END PGP SIGNATURE-----

--Sig_/UTwz0u31u38k7c7NQZZokZj--

