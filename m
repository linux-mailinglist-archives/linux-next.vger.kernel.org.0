Return-Path: <linux-next+bounces-5395-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E115DA2E0F5
	for <lists+linux-next@lfdr.de>; Sun,  9 Feb 2025 22:45:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3464C1886474
	for <lists+linux-next@lfdr.de>; Sun,  9 Feb 2025 21:45:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D10DE8248C;
	Sun,  9 Feb 2025 21:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="tjTn8HP6"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396D579CF;
	Sun,  9 Feb 2025 21:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739137532; cv=none; b=bl2iuvsushIMSH4CDbyzMvnxNaRmXbQ8hO3A2NXNLu95tactoRtxIPMBP6mA0yEz9TliuXUXklYzFyPuetW4Zpp/0+BifolFo540v0ctCVHbqv/qHy+pWnSPDGZ/wofCCb3iHI0L0Jfk+VWBhyApCyoNvdN99Jd8XsI0VpGKqbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739137532; c=relaxed/simple;
	bh=rgwema1bULlKD4YDLf8mqmtN6DArGahRMX1EcqxSIZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RhnxO+Wp6UoOKxHwQO//dCHc6I9COGAgptE48VWnnnMHLwPKOHn2+imM6qgRLKupqBAvk4H+xZKx77Zxrm1PB2AclZIFMjEywUbz+N3+SPI48wbSIneQjS0i1t8m0xMU5paJ+hrcJaRkBk9SBVE1XNkDBnnA3dzAvse1k70r488=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=tjTn8HP6; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1739137523;
	bh=9DACVpbfbt92p0tLS+2tccC0bCKORCEoNenkvZqePuE=;
	h=Date:From:To:Cc:Subject:From;
	b=tjTn8HP6g2dhC3FT4rEDNH+5PstJyUNtKj5y08yYXcONhoZGpKOZSuhV2d4v68Jz9
	 bTaLvnFxNsO0CfXkq5FMH2jBlOfD92q+zwTZvEKH5Emvx67L/lL1HJ2D031qE59gAh
	 ZOaSkgEn+C4gQQ9A0OnvsQVjFlQovaacsNQ12GlwYSGXsqS2kxYC+kvZ5JvNYK/++t
	 iHT/DkXKEWaR15u1sU9I3CdN2JYa9SID3RlIyKQTPPrAIiCV0l8zwWXHDFs1Ku7Mhe
	 gb1bSZSfNkxXYcEjFp6bHOs67vkLfmsKDAJACBSw3Hz9CJDIyY1hFeVlgn1vlfCSEX
	 AAxx4W6LJBvcg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Yrh8M1bXfz4wbn;
	Mon, 10 Feb 2025 08:45:23 +1100 (AEDT)
Date: Mon, 10 Feb 2025 08:45:22 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Sterba <dsterba@suse.cz>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the btrfs tree
Message-ID: <20250210084522.411fa330@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OoZdqI+v71HE8f7MS3nBRWv";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/OoZdqI+v71HE8f7MS3nBRWv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the btrfs-fixes tree as different
commits (but the same patches):

  d49c7ee7b7f4 ("btrfs: fix hole expansion when writing at an offset beyond=
 EOF")
  63430933e307 ("btrfs: fix stale page cache after race between readahead a=
nd direct IO write")
  92a6e5b7138d ("btrfs: always fallback to buffered write if the inode requ=
ires checksum")
  fc33c65b2253 ("btrfs: fix two misuses of folio_shift()")

These ar commits

  194b36e10b77 ("btrfs: fix hole expansion when writing at an offset beyond=
 EOF")
  3b0a08f28d27 ("btrfs: fix stale page cache after race between readahead a=
nd direct IO write")
  509b100f0d37 ("btrfs: always fallback to buffered write if the inode requ=
ires checksum")
  01af106a0763 ("btrfs: fix two misuses of folio_shift()")

in the btrfs-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/OoZdqI+v71HE8f7MS3nBRWv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmepIfIACgkQAVBC80lX
0Gx+BwgAnnL3UXB4FDfFOdR3j3+LcvzPOW1Pl7LE/HxE11T4UCQYEp3OzT7H6kMU
4LtHW99rpVeEZ8K3MuDz8ezIeGifGk1mSLhtlbhwHUW3as0KenLJrF4kvsDQ/79h
bKfZxX+vF3izbbTA9AzMxvJ+50n4Ep6+v8qH0qkXkZSr/IRcpKRuRN3BRqX4Go8/
XR3XNWxZZJBwUKnYrMS1T7wWTzcYG7M+npN2Mbchykw5fbOe+WcX6njHR94O1gYa
MXugepAsAEp56ymKqeWBPA4eI8NH1jLCPlIisEYXKAHvsTphaHk4SbZPVLBom4tj
xmARWLFxIrfOZhK4Ozqho6OEavBb4g==
=LZP1
-----END PGP SIGNATURE-----

--Sig_/OoZdqI+v71HE8f7MS3nBRWv--

