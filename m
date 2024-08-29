Return-Path: <linux-next+bounces-3488-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CD596369F
	for <lists+linux-next@lfdr.de>; Thu, 29 Aug 2024 02:05:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 975CDB227E0
	for <lists+linux-next@lfdr.de>; Thu, 29 Aug 2024 00:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E739728FD;
	Thu, 29 Aug 2024 00:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Top2SdrZ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896A123BF;
	Thu, 29 Aug 2024 00:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724889915; cv=none; b=RrcRcIqIVfay4vmP2RJJpoIIAWmuM0/si83CV3xg6c8eWb39hI+n6Ik3MvNLsXIjFfB8vusIPrrDc1LfJfUdvZLhZ3am4RJIDjr2kMPTgd7QBNLzJKY7Lm8P2hoYn/lz/MJkQHGkUE4DGYZPgWGMv9HDt3QJxeV7N4BIo5+wrn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724889915; c=relaxed/simple;
	bh=k6k+GxAqhykNa/Lqj3DZQHPmJMoDp40ctlCqL9jK81Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=d3VlmnK14z2D/2EqPShtUvMXKqKEYdYuz6g60yAMxon+ZMT/YqdAlLieeL9yop3WJOu9R7sGxqAKJ+IH3unHLmYu+Ykjho2/rnUoTZHM0T+DJqC4dKH30ZOedXb17ysMFaODkO27yRs7CyFyvkpZcrHVaf+ihJzYUUMtzz098m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Top2SdrZ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724889906;
	bh=ebz+CGhm18yLaPBQMwN751pZAee+Q4cGE1j1OO+imv4=;
	h=Date:From:To:Cc:Subject:From;
	b=Top2SdrZJ6/7+wRO6gxMaHdoo7L4+OlYpkRcXbC9/CKvvtEV5qjAnzOgq7WVjWTEW
	 Eh6hRBAxHdtdfFS2n0z8rB8ZkoJ8kyc7by2/Sjis6wEoHrGAGalk9BjLY5PGJr7iQB
	 4Xe56vhuHxIqnbgYWy37kfDEa9eYfkCLmPQKl9maKlsD20eiV1TnfrzrgotDkVtxIt
	 XQAxnIQqVTglGJID1dcPkbcLwJiWWH2PxQIwT12EH4Ib8OVYtFf31rcAWFsG4npZDS
	 FevoeCNOF5fYV0/AbBpuiWHS5Fd344ZCICQnWnNDd9DYCSt9SaiaQG3tx8wIcDWPvl
	 oUiRbaxY6gPSQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WvM3j6xM0z4wxJ;
	Thu, 29 Aug 2024 10:05:05 +1000 (AEST)
Date: Thu, 29 Aug 2024 10:05:04 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andi Shyti <andi.shyti@kernel.org>, Colin Cross <ccross@android.com>,
 Olof Johansson <olof@lixom.net>, Thierry Reding <treding@nvidia.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the i2c-host tree
Message-ID: <20240829100504.091160a4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/s1rnsEBvowx1QXFt/BBZyAt";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/s1rnsEBvowx1QXFt/BBZyAt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the tegra tree as different commits
(but the same patches):

  6302d41b3f7a ("dt-bindings: i2c: nvidia,tegra20-i2c: define power-domains=
 top-level")
  20b9b216daf8 ("dt-bindings: i2c: nvidia,tegra20-i2c: restrict also clocks=
 in if:then:")
  cd07e699cea9 ("dt-bindings: i2c: nvidia,tegra20-i2c: combine same if:then=
: clauses")

These are commits

  fd16970c9d67 ("dt-bindings: i2c: nvidia,tegra20-i2c: Define power-domains=
 top-level")
  e0c7b7fcaf77 ("dt-bindings: i2c: nvidia,tegra20-i2c: Restrict also clocks=
 in if:then:")
  69a87db435a7 ("dt-bindings: i2c: nvidia,tegra20-i2c: Combine same if:then=
: clauses")

in the tegra tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/s1rnsEBvowx1QXFt/BBZyAt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbPuzAACgkQAVBC80lX
0GzkRAf8CWtn04XBeEW72fLT2tDO1Ix4uDfg91GMLHjbmJlJHVlTM10HKlexqo+Y
4+IbMFhwGyGLRv7LZtzv+Wq7yFCWydGcAlEwM1AYjkQYnt4zSj8H3Q0afAe5qqZZ
Facj0RxxivuivSn73r7lGrgP1SGF0i8ZLksT32BaH42L0F8c19Xoyk2rQsHs6vOC
lhuOgx5uapncHjzaLYC9NgjN8kO/qOBxEADcslG290NJQjEJ8yXA+C/oo/mrOaUK
9DHl7pdaYCLwmnGTrBDQWmWjN4qRFzMVVFHNb3T3rSjCoXxG5zNETp8VqSOI6ew4
jHg6jFEKsh3T3Sk79IrrkvOJ5jo8Eg==
=FsJO
-----END PGP SIGNATURE-----

--Sig_/s1rnsEBvowx1QXFt/BBZyAt--

