Return-Path: <linux-next+bounces-7830-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18968B198F9
	for <lists+linux-next@lfdr.de>; Mon,  4 Aug 2025 02:39:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A15DF3B2C15
	for <lists+linux-next@lfdr.de>; Mon,  4 Aug 2025 00:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EB2919F424;
	Mon,  4 Aug 2025 00:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="p3Cm9v5Y"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AB515A8;
	Mon,  4 Aug 2025 00:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754267838; cv=none; b=hca3Y6G98i2wcq4EX8gSaYOfoRccxkbfzU5GszFjD2Fw9JMa/LYj4En1wwp+qayjpFTOUt847fdub1b13kIL+RnUFmYnMtbptRK2Pu1Xiruzzqqy7gs7bvA0fgu8oBiO2eno8ChufkYBdzsc0pERMZwAkJGlJnaMSIpVVKnz4wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754267838; c=relaxed/simple;
	bh=x83m7k4BWuSa0TpdMPWm3ES3lvww9G8TsN7v04VdvLY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MaU/1iFAktxQRbSccSegIxSqrQeHeBnWoGpOrIMhhgWCfvw3oKxZl3OU+5mp0ubbnZ9gk5MUVKTdZ9dNiFGK14dUqqWtjrRpflcNy5jo4tmSTSqB/EXFEY3zzIEQNpgYytC8NQFkEuX94WAVacJBXmR+AydpHGrvwATjHA2b46o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=p3Cm9v5Y; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1754267830;
	bh=VBkYCUAHlBA600WuNGxF012bSpoq6yk+AD/XPesy31Y=;
	h=Date:From:To:Cc:Subject:From;
	b=p3Cm9v5YPGwY6xeX5JxWYKeKJNhvzRzboLm9ku4QmoAtbF3PHugLv5EVksqzjLfB7
	 S3kVRg3ibkThX857Hk7eNM6DL6iI6CLBwJDiGFzlftdqxohGQqsRPhrjYg2MI4U94k
	 5FT3hw6ceBrdnbXzVY8D2/zt+rgyzmE/TBJ2oxQDMtcwpXWCcEEX/E/HAH5/IxBN5r
	 xZMjY/7LRHuZDpiyILAqPy/sTe/NuYnPZ35t09ONI7UF8Ofg0PDy6vqxGu/v8nPKKM
	 RRxcbBIpVrcuFqB94ZNpsd47g7D+7tFRHalFySkKCdQRyK9Ijl9W5mutUybZz5XVCS
	 qHoR4QPJ1VFcQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bwHgp3WHGz4xfP;
	Mon,  4 Aug 2025 10:37:10 +1000 (AEST)
Date: Mon, 4 Aug 2025 10:37:09 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the spi-fixes tree
Message-ID: <20250804103709.26ce4f17@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/d8020waB21ODfy9x0zNm4S8";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/d8020waB21ODfy9x0zNm4S8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the sound-asoc-fixes tree as a different
commit (but the same patch):

  ffcfd071eec7 ("spi: cs42l43: Property entry should be a null-terminated a=
rray")

This is commit

  a735ee58c0d6 ("spi: cs42l43: Property entry should be a null-terminated a=
rray")

in the sound-asoc-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/d8020waB21ODfy9x0zNm4S8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiQALUACgkQAVBC80lX
0GydyAgAhdqDoHlboZ0Eg+wSOOmtm0+7fWXB6erK5lb+qZV0j+T5U99iKFVkpCzu
5RzELyylu9wyqi7CQa1k5cFWK//WMQWQAlpd9TfGnwWBf3OdzOM+s6evP86eCiRE
5vNF+mWqHtIR69zQ/Cd/39RtUVhJ5QyPK00r5h4MvyVERzTb+RfyoVFB1YzZKzWm
LGjo3MjVrJLz1D0LwUcJERgi4xbnogXk/nmUC2VP8IpZ0DI5TbPWk0mSrjZwCC50
6j/oXN9ouGgbZL5nTEAsYbHOazy6ho3PrrEquKUCWSKZKBLnnDwnlIMVt+thewXn
Umt5dhq7k8FhqVohtmSx+2FHkQHr1w==
=gTcd
-----END PGP SIGNATURE-----

--Sig_/d8020waB21ODfy9x0zNm4S8--

