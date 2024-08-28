Return-Path: <linux-next+bounces-3485-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0291E9633BA
	for <lists+linux-next@lfdr.de>; Wed, 28 Aug 2024 23:18:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 80334B20F34
	for <lists+linux-next@lfdr.de>; Wed, 28 Aug 2024 21:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 418DE1A7074;
	Wed, 28 Aug 2024 21:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="g1N0/FaL"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877CF45C1C;
	Wed, 28 Aug 2024 21:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724879873; cv=none; b=i4azWemKZj38zd5zfeEkCibwy+5dQxBdRz5+pqyxWdlbjELz7RZnoOo4k4y+nU4ItwCns4jeLpYAMRGsMg/t+BIW05OjxVsUig2iIBqEMyQlGd3UvxUFyAXLuA80eH3BGHZexBNGPKbkjgYTDsz6QuHTF2ED1g0ANPaOwL+Kf/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724879873; c=relaxed/simple;
	bh=ZVfZ2i/TvdZ0nEAKXIXl8RsahsSdyvK8EQUXKrMhLHo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tHpxcwGvmd22I+dF9obs3DCluGZEex3BAk3KeDtEbatecfNrWf+0AmajibXWnww8roHqMUvlofBDciFdYzco08eF+IijuFt1BliDj3fui//wgukIqWLzJxtZWOWEXiGsgCRPmbDPWTUAU35AO6IQXJ/l8UnDscCvEZRSYeCulA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=g1N0/FaL; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724879865;
	bh=5YnuhiLmF5+sM9r7UPT9j2MRL68rin6zmtmR2Z1jufI=;
	h=Date:From:To:Cc:Subject:From;
	b=g1N0/FaLIPv7Y+iovPu9dIzkiUAjbhYkV5HDsp1JJRarrLNNA9qTYLmdcsqBRSa95
	 LnIgqwtyZ9a1BWcYjB5U21ULgJ9tNIMsF32uKFDfBx2Vj9jYvjwpLr5hmhm31VugBo
	 712L1jOuGJvfDdY/Dy4RXLlh04rqeD3fvpfJlVgofa8jbKHqwz7xwO5wMIH3Mdq+Fo
	 q55uzrfj2SEPrW++qFHdLn9m7j8YpGmUhOmci1TdTbGazzUIR5T7Xl6WUqZ+59kZk6
	 0GXgW2CQbUwuQ6nm+uCgw7WkHmglH7bSRAqI9dz2GDCEPaSdoMLeTh9q2l1ZkUdz+s
	 4x7SPTxQo9V3Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WvHLd1ffTz4wxJ;
	Thu, 29 Aug 2024 07:17:45 +1000 (AEST)
Date: Thu, 29 Aug 2024 07:17:43 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>, Joel
 Granados <j.granados@samsung.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the sysctl tree
Message-ID: <20240829071743.0b1052b9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CeN5Dwo.Ue4Hf8Xa82Ku/L=";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/CeN5Dwo.Ue4Hf8Xa82Ku/L=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  ed674ae9a6e6 ("sysctl: avoid spurious permanent empty tables")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/CeN5Dwo.Ue4Hf8Xa82Ku/L=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbPk/gACgkQAVBC80lX
0GxFAwf/bwoW7ePIGNYhXSR7F606lM5RglTpxEEwd2xKHTAWzXVjT9p+yV1jf6dV
wc7gVUCVqkbo5jeQ25vfkkv3F4a41ighSUSY7+XmOqcQTMePBuFPML+J/JNVz93n
bSXABWHOFeLTqfxcQVlMqzkWjOzOHSxatKVevM38iRw+u3fSBFrIAk5mUqlJi4oW
0xXRnItdxf7ENLcNpFX8hTV7TmflEqUd2VUcYYfD2IIMgQGQkiRsqC8BSdVqh2qF
uDHtxukQJJU/ERrNEzaxYWqioy4kgEFI12x8M0peAURaH8lK317fV87JOyZhCQ9l
kwYNjqYLxuS/ndW/xQek8Mvk8P0mMw==
=zJA0
-----END PGP SIGNATURE-----

--Sig_/CeN5Dwo.Ue4Hf8Xa82Ku/L=--

