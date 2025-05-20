Return-Path: <linux-next+bounces-6849-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9543AABD884
	for <lists+linux-next@lfdr.de>; Tue, 20 May 2025 14:51:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07EF23BDFEE
	for <lists+linux-next@lfdr.de>; Tue, 20 May 2025 12:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A111127715;
	Tue, 20 May 2025 12:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ToVooSWT"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D2D33DB;
	Tue, 20 May 2025 12:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747745501; cv=none; b=c9jFNPUpJzrXbHW6poRL0oFi+rPqNGXv4Ymms0kEXXig+yBS1fFE7zs4kHCzuePty1pdqbF9bvJL4HFikNpx09v7/x2GSY/iKgUZGh+Nwz/GaCQfdmXQDyhzDSzIQV6IGrSoHLtaIZZCN7oSvNnfYjhEg7x227v8RmFqjq4WUUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747745501; c=relaxed/simple;
	bh=zumAJWDYQnat4fWlVZatfH+lvx8bhMaBs8mkDL2dsO0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Q94ZwTdjhrh/ETIQLk+8lESW572sxxfcPMw0TxwzG/W1+NzJFTOhCAR9PCXE0CLupo1zkJR5lTlQGklV4axLR6bw45/7w9x6CIP+YxUEvH76S8jvScrAWcNfEVcMePDSHXG9WwEkbm6PfgpgGYeFaxdYLVaYLLXarvAjpr+Cd3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ToVooSWT; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747745497;
	bh=CgmhPoW2ZqWVTc1tVVoXjvFrm0yS5Z2k+W8bO0bU1P4=;
	h=Date:From:To:Cc:Subject:From;
	b=ToVooSWTG4j8ETG8sKglnSmtuDMHl9qp2HEdXUoSRS0dB9Db3YRSS72UQMts+yHVQ
	 0W0jL/sXdGKXepxUPckHelNgNUqJFP4/3AfI+WxBl+JOCZJY3Z4drvCobmG9FT5tWD
	 szkK9CC4iFiUgwmLSKPdE4YHbs27N2lUbT6Y+Nf4344BsRTF+GtULGVU8ZQofCOaLa
	 FbIv6tpq5iVZaiWYB9uOhA/UOh56nbTSm7tbqsIoJyRczDVjLrZR2E8hxa6gTaewAT
	 d+wMvNcv1bbJkKMTKbg+leWSfpO4U4DExrUBqe72e7CkyJY/yNTRiIMRqPkCNjl58q
	 m6luJpm/HYNtA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b1vZK3hfnz4wcg;
	Tue, 20 May 2025 22:51:37 +1000 (AEST)
Date: Tue, 20 May 2025 22:51:36 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Yury Norov <yury.norov@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the bitmap tree
Message-ID: <20250520225136.026acdd6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RTnanEaF2re=MxWFOc_c_FD";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/RTnanEaF2re=MxWFOc_c_FD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  abdf5cc6dabd ("net: mana: explain irq_setup() algoritm")

is missing a Signed-off-by from its author and committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/RTnanEaF2re=MxWFOc_c_FD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgsetgACgkQAVBC80lX
0GxczQf+LdX7XoVkCO0l+uvGYnoQNOAKo8SR94Ar7gUe8q7Lj0SpY+g0/STjdo5X
bzYWU1VT75tqFdS2QCQjPjWsjqAupFzbt3RnrVy46ouKg+OLoC+Jtn96dR0It64B
U/paCZl6luabeH9BBDUpgINRaPnGGmNLhmwkEkcYSEgE3Pb2BmGZ8ALKeK7emBan
oMsxpug5VIxO9GvRgpwU6WIqYwryYacC8X/Hr2u3o6yI3wblCBXUqHXEZsZCty5I
wWLFpPWixzWqIaPpzGxziWjNi9NyZ5mw7WbxL7pkh4gBNEq0Q7PxfgB6TfHoW1Y8
mwMaRpI/P9TBOgDFfshPmh/H5jDh1g==
=1sGF
-----END PGP SIGNATURE-----

--Sig_/RTnanEaF2re=MxWFOc_c_FD--

