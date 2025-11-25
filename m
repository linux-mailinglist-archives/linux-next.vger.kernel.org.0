Return-Path: <linux-next+bounces-9201-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB85C83708
	for <lists+linux-next@lfdr.de>; Tue, 25 Nov 2025 07:17:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 699C24E2BDB
	for <lists+linux-next@lfdr.de>; Tue, 25 Nov 2025 06:17:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7311922424C;
	Tue, 25 Nov 2025 06:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="fW52L9YD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F79EAF9;
	Tue, 25 Nov 2025 06:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764051431; cv=none; b=MYWOKF3UwPoLGCbLV1+v0cZuY9oSEXAA3qGLOLDMdXObXSXAeSC1oJtLin7nVmeV6wYJ8iyo0JUO5i21hvedb7ulVvpFGrtKtzMMQTXhMVetiWaW9NJoOKDWZSDCjm9vLBYSTAcU40N86iEQT59+xfIt7lRng2Q3b6uamgjMvJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764051431; c=relaxed/simple;
	bh=wdo6dIFWNXLd1pIxgajuWuJCY6Bhk5btOqrFfL7Hkvc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ocyaMZSHQkzcFvs+IgYpIkWDuIYt/WJdU1z074lkQpsQ0X5rlwy7Mpnnwzwc2EQtNa8McnEP8YjFB+HHJtRyL6O3i6GLyHfAyLPgOOsg8LJuZvtHBH1yckazIKi1oMNw8eO7n9uOo9iubqN2TJ0d6ugdLCnGn8uDac4QJ4O3hXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=fW52L9YD; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764051427;
	bh=KZqP6/AZRCQey1NFmuCXhozN3EwMQb6aym/d3wZuaK4=;
	h=Date:From:To:Cc:Subject:From;
	b=fW52L9YDZFBxvFJf4R9D/bIMN6iXR0rxV5FKlP/A+qUQ2R2BMuX5UwY+GU3yJkNOK
	 EEF3aLiwZAZ/4E4J/bT/2LgmG+iDblu16zvAloZFeBfYJp+S9bmWPYGP7TV7GFEb8k
	 8KPlul/51bIOqlX8oAJzgPt95SmLfhQNIXCi6h96L1F7V304Tpxu5mTg49OG3uXcMT
	 TJSoUhz6zYKeY7NSnvsGDhfFojZ2Ag4ZbIzcK2M9FFnzsrkSjoGzSt89R8IWDwPKt9
	 c70V8IHmjjNdjCtU7dPbj6gdlU+JQqFPeG06dUN9kONgGFJSp0Qj7yOH5VzsvnbBO6
	 5/aQqKLsQCU+A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dFsst2YZbz4w1g;
	Tue, 25 Nov 2025 17:17:06 +1100 (AEDT)
Date: Tue, 25 Nov 2025 17:17:05 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Srinivas Kandagatla <srini@kernel.org>, Greg KH <greg@kroah.com>, Arnd
 Bergmann <arnd@arndb.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the nvmem tree
Message-ID: <20251125171705.7912ab65@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EoVt=K+hKOgQc3vx3D_ZZ+4";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/EoVt=K+hKOgQc3vx3D_ZZ+4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the char-misc.current tree as a different
commit (but the same patch):

  8b6322da3c1f ("nvmem: layouts: fix nvmem_layout_bus_uevent")

This is commit

  03bc4831ef06 ("nvmem: layouts: fix nvmem_layout_bus_uevent")

in the char-misc.current tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/EoVt=K+hKOgQc3vx3D_ZZ+4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmklSeEACgkQAVBC80lX
0Gz9mAgAm9i5xWOF3dhdq0eIr0QOBtlffd4NdTtdsrMQw0RYT1WCiEYGStWpEUag
XoKOVu10WZt87z4MIUnAvi5IadbFVkfDCusp16T/JIDx5HtMc9HyAiNFxa74wNLq
4t0B8c6zy0n41pLmv2gxcb3KpbAXQwg+VzHYI1MO89KcwxdaEy7WJqwDoCaJmBNK
fIlKFtaf43RgOF3fxXb6q8rBhTteIL+OHwgHwwlrTdQP7HMUKz0tNJRDLtcFjCGy
5J39ImtG5KJ0Ws1yN0qfgxgqpqzmZoWkLNg4mz2QQZPMj+9snLYU2AFITBM8cDgx
eQ1qTjqEwSImetdM8Dg3j4BkAMamhQ==
=iXxZ
-----END PGP SIGNATURE-----

--Sig_/EoVt=K+hKOgQc3vx3D_ZZ+4--

