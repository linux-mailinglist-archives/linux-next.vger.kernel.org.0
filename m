Return-Path: <linux-next+bounces-5269-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AADA2A17490
	for <lists+linux-next@lfdr.de>; Mon, 20 Jan 2025 23:20:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8133F7A2D07
	for <lists+linux-next@lfdr.de>; Mon, 20 Jan 2025 22:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41B541B0103;
	Mon, 20 Jan 2025 22:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="GXZxK/ip"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B9E198A36;
	Mon, 20 Jan 2025 22:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737411614; cv=none; b=hR/h3D7FT0qRDidonHa3eRxR3REX4EtR3epYDQlh7ygk5watBFPwjOpEzi9M4TxEodLFgNqOP5fn4wFefvHgRgy5iTeZabXciySuNqfD7QK6pxU5ah7e0eaysEs0OChoRKIEs8b39LNU89dW0nZw97vqhwL6xm1xQlLlxew29+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737411614; c=relaxed/simple;
	bh=kHUsLiZRQelWA4YlKdjLL+jrnLHZhTW999gtUhJdcaA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=czct/jWSJi00JrAhJfbn406LGuAFC7pyisipC0z4hyZdziSHIhAhoywHvouB54j89zD9wOJRNDmkVpsMoyCVGXpyHmfkF7mYsdt0a+Vd4Tl9rDl+LPMTNyF4JRyHYITnP1bEbjHO+CdaFnn/Y/mD8voGXGAY1V+yU45KF1rFufM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=GXZxK/ip; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1737411601;
	bh=8u6eKujKd9mzmjkXo0wlwOyoOBBu9yRNAShTKXzXnK8=;
	h=Date:From:To:Cc:Subject:From;
	b=GXZxK/ipY+eVvPmBGXtqQjoFNsCZh765qptr090mFbglTZWii708CyVaS1i/U8u90
	 ZpszrQ5kkaFGcO4lUnHxNYhyRWC0ZAMx22ANc6Sv6S10uI9CcgDBjUtPfg8ZA5lQU3
	 pg0+f5xucc64gXd0joSuKVNA/+eBMn1b+1mKsb4i6+zJ9FNAdULAmsbI1y3xboltXe
	 hHUrCFDDOhA4lM+T+a4pJFBhP6LDdApabRHcvkw/M1A5fDq8UHw52t4ILn3q6dbbq6
	 6mB6CdLmIqFRI1UlpWBNPqETxM6ZVH7cPfZo/OEoQzQovsrrG3u1cpLW7qb0rFne5n
	 UH/zLyTw5Ay1A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YcPsY3m54z4x04;
	Tue, 21 Jan 2025 09:20:01 +1100 (AEDT)
Date: Tue, 21 Jan 2025 09:20:08 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the vfs-brauner tree
Message-ID: <20250121092008.33867520@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DReoOGaz1Cv.q5o=FHvsTYy";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/DReoOGaz1Cv.q5o=FHvsTYy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  0ef3858b15e3 ("gfs2: use lockref_init for qd_lockref")
  160a93170d53 ("erofs: use lockref_init for pcl->lockref")
  24706068b7b6 ("dcache: use lockref_init for d_lockref")
  5f0c395edf59 ("lockref: add a lockref_init helper")
  80e2823cbe59 ("lockref: drop superfluous externs")
  57bd981b2db7 ("lockref: use bool for false/true returns")
  8c7568356d74 ("lockref: improve the lockref_get_not_zero description")
  74b5da771c89 ("lockref: remove lockref_put_not_zero")
  cd1db3448474 ("fs: Fix return type of do_mount() from long to int")

These are commits

  3e652eba244c ("gfs2: use lockref_init for qd_lockref")
  6f86f1465b59 ("erofs: use lockref_init for pcl->lockref")
  8c32b87c4f88 ("dcache: use lockref_init for d_lockref")
  63440d1c6dd1 ("lockref: add a lockref_init helper")
  25d8060418b4 ("lockref: drop superfluous externs")
  6d2868d5b6fc ("lockref: use bool for false/true returns")
  d60f2280a1b5 ("lockref: improve the lockref_get_not_zero description")
  4b193fa75eff ("lockref: remove lockref_put_not_zero")
  4f3b63e8a8a2 ("fs: Fix return type of do_mount() from long to int")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/DReoOGaz1Cv.q5o=FHvsTYy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeOzBgACgkQAVBC80lX
0GyccQgAixMlrzac3Vd+jZB0jGlvuWHSVKs8DmbrX3rXKnPeV2iV1EqXFgCzRJQb
w3MfUjKWbPGr+zq1TQcXqYpKG9xRdcTnmwdjntoQ2cyU4P7p02kTU56na9YFMuBr
bZ7EUTY2RDyUQQ+uicbE+8YAI5HXKU54VW21Ag25+aS5O1XNyTinZX4h8yuU8bWB
1B958zOKeuz9vUwIgHwsKwhoUvWmSUW7VHoz/T41BsjnfybA1extNZub/ckK0zHu
k0Ke9pzdhGbDVN7wqaCo7eCCuBddcgrdEEVWYVWFK2nzC8norl041UzvxD0hXOj1
saXuwHjKFztAbr/8zqOzrFFizcN9gA==
=0hrP
-----END PGP SIGNATURE-----

--Sig_/DReoOGaz1Cv.q5o=FHvsTYy--

