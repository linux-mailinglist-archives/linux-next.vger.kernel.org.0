Return-Path: <linux-next+bounces-4893-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E6E9E8790
	for <lists+linux-next@lfdr.de>; Sun,  8 Dec 2024 20:55:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 668EB18853B7
	for <lists+linux-next@lfdr.de>; Sun,  8 Dec 2024 19:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E6021537CB;
	Sun,  8 Dec 2024 19:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kAmTLqLs"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B66976410
	for <linux-next@vger.kernel.org>; Sun,  8 Dec 2024 19:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733687725; cv=none; b=MQsq53c18HgsSBwZM9zn4/RE4yzSPZinOhIuks02av+2POr+1ZVCEtNfUd42LelKEik+lLobIPos+v9NTQyEw13Frzzc4GznX8KodO0DKkfwHhEmKQIViSeOwUIphdr9ML0A485T4ncEsfZtCGci9+eySde0ezo0F7dNVYsXF/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733687725; c=relaxed/simple;
	bh=Mt14XQUw+pLdD/m3gLanTNTfsbK6qEleGLdMrDRQc4o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XGb5WrQtjapiDycddYh+ecRSEOH1gTDxtZcg/KLZNN2isyqEtwKwxyslWLMJT2DoDjCZmMW8rimBljyEHJAUbXjPcKMCjs5utuR8pSufMVfenDXf9yWV5FbX1R6SKXZKqD5ahyaVcUlNIzaP5RBCgp54cwl7o+IUbaWW96tDUhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=kAmTLqLs; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1733687707;
	bh=3uynoYLu2c0UOdmfVkpLAfWNoXYaEhXGv1f2vo+5u80=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kAmTLqLswDkppfna0OOV+KbnOwMwBEeceEN2Rkg6glvQugld5Wy+1QJZwo4LXu1M/
	 b/KB7K6iGHuDMFEQhmk7OuZ8sbGaQ84ZOTeisvT9AYW0iCjepyBFoVwQk4KIsfQU34
	 TQwGhEdS9qiLeXYKGFdmGQ8SMbqDTLP7V56OcZE7U4kWXPRDjnEnC1kGgnlWxA1301
	 qrdwXc19MdrzshqFalLnAJPPR1HlW9dMys/igYGUX8mt5aXzVVr+bbXC0vpGT2jPAK
	 KVXJ+XOYpUPY6B+7j8IRfo8hZ2PU44kTTdkkjWYuFHY0s6pLtdeq8VvAyR1aZXvuFo
	 /+t5UqRxih+6A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Y5whC4YR4z4wdF;
	Mon,  9 Dec 2024 06:55:07 +1100 (AEDT)
Date: Mon, 9 Dec 2024 06:54:51 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-next@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, Mark Brown
 <broonie@kernel.org>
Subject: Re: Add crc-next tree to linux-next
Message-ID: <20241209065451.19f5ecfb@canb.auug.org.au>
In-Reply-To: <20241202013154.GA25618@sol.localdomain>
References: <20241202013154.GA25618@sol.localdomain>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//mbvjeIkqTm+XQTA6xSHQOF";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_//mbvjeIkqTm+XQTA6xSHQOF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Eric,

On Sun, 1 Dec 2024 17:31:54 -0800 Eric Biggers <ebiggers@kernel.org> wrote:
>
> When you have a chance, can you please add the following to linux-next:
>=20
>     Repo: https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.=
git
>     Branch: crc-next
>     Contacts: Eric Biggers <ebiggers@kernel.org>

Added to my tree form today (Mark added it to his last week).

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_//mbvjeIkqTm+XQTA6xSHQOF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdV+YsACgkQAVBC80lX
0Gw7QQf9ExGNaMvpfXt7kyqsSvxgToAgLRKV4URtXrLst8xPQkjuYshminZRJzD5
Uk0hvlmRt6EptjN5vSQi/E4pAKx5kDxfjVRVsHueLT6PP7R3SCHgSs9fsu2uyGjQ
jNnO2AR8zxGkb7yLZoB2mFn3R4IAGSVlKF2vWhLwgwm1oe2x7DUqPg/rS/7BFaWO
qSzg27sMyQ7VzRwUqOiA7r+Ik3ThOVJf9GICsoRNJi14pRC/P5pd0uofoHxX4/9T
JGQy1rlATnPlJGikcsIHpVVUeCUALeMCyG8s8p084OOOTClP/PfgORQ4Vn8W+ad0
6dHOOUnuA0r8M39g8J7FA7TFOCOTzQ==
=mJlB
-----END PGP SIGNATURE-----

--Sig_//mbvjeIkqTm+XQTA6xSHQOF--

