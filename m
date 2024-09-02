Return-Path: <linux-next+bounces-3553-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 22514968F7D
	for <lists+linux-next@lfdr.de>; Tue,  3 Sep 2024 00:21:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C536E1F231B1
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2024 22:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFEEE1714CF;
	Mon,  2 Sep 2024 22:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="nwv2gfdo"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B695A1A4E71;
	Mon,  2 Sep 2024 22:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725315699; cv=none; b=uYSkGMdMdKIhOgN50YS5F+icXvWi9dy8SKVqVs5ltfRI5r8/IeI2PE8Hfb0MlqSQw5AVWyffPrtrXpr4JZDdhdx2GXO94PmMaHlQI8FE/IhAAJ256Cg6Hw+kYnaR+XFXhY9wacInh5KCKlZvgcGHjEFHKIM9PhFyOwliAyAHCGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725315699; c=relaxed/simple;
	bh=alGtO/Y230EfO7ZIVvYPU11RKXbGWW/fsPcy7VEwKfI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=QYz+7O1vQnLpycCMzNNIoR7/tE0d49NL3bzekTzJa6ioJsHt1/JEcF0az3JNYT/Q+ESOZwnVa9zQQ1/vAAyv82egkQtstybeto502fvxB+gGodu0F2AiVCHUoYLRKwsB6WMZo9RCE1RbrayYTS/3fyhzSQY/68Hqt79miof+RoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=nwv2gfdo; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725315686;
	bh=WE5Jy9WSRtNkGYcGcu25y0YZo6ZWS8OW6ZTZfN5uNRk=;
	h=Date:From:To:Cc:Subject:From;
	b=nwv2gfdoLIqrKCiku/eS0OmfCNbTGA4QRBhlpLNdNO6I4tG/qb8Qe6qr2w7Jq1Zz4
	 dyrLQYEkVLMUG759YJUbnAGF1fHBjqtbqK0Wrf/MzZO0FxpvCItcpKK8mgeg0vb/Ey
	 GgNEESZFSBj0HIk4y7LYYvS71+lx4o6+Wt5/XOblljv9TyCI1VlqFDlRyX53ViYlW7
	 gfDY7L+IqJ8QyYFlNPsEvGdNXucs5/o7nBa8JjBFyhtkkRq7+yZ6PYRHB96+Qe9JJc
	 KBUHoZJeiUByM9UkO2OmqK6/sFpVqljYvbSlJARcqPaPZkLnb9XlxmTwIxonDTQ6fg
	 MbOWrOO0sTHnA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WyNWn1kz8z4wb5;
	Tue,  3 Sep 2024 08:21:24 +1000 (AEST)
Date: Tue, 3 Sep 2024 08:21:23 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Adrien Destugues <adrien.destugues@opensource.viveris.fr>, Adam
 Lackorzynski <adam@l4re.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the pm tree
Message-ID: <20240903082123.55b34831@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vU8Qd=5+sVi59j+BFiky43F";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/vU8Qd=5+sVi59j+BFiky43F
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  5506544dc2e4 ("ACPICA: Avoid warning for Dump Functions")
  7afea7bc49c5 ("ACPICA: haiku: Fix invalid value used for semaphores")

are missing a Signed-off-by from their authors.

--=20
Cheers,
Stephen Rothwell

--Sig_/vU8Qd=5+sVi59j+BFiky43F
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbWOmQACgkQAVBC80lX
0GxTdwgAgr5EOt2R0hipOhl3cc0/7yY7JDIeMzDE9vxkRYOjDyAGGyxmpbnNKhfh
gzLK1NXeEHd7N/1inzC8yHtOFqBZnIjHthYpIqs+mN/Ncoe81zBpV31L6LdUgd/y
8OpO7kLTh8sZO9kBLFATja5g1OFyw9wckHUjiIQKavMnklVxrFnlFaL8eO8YuaKd
EckevccYx5+hqNMe9m4VveFDWfC6YOd30YJovyTS9ZmWbIFbzIcJwFyFpA4sj/qN
xRSATcbejXEWaJw+e0idQEYGvfOOyW1klk3X1CTFrek0ucx7HumUExyXrSI2DCg0
UXVU2nwwGPpWyxEjw0VSg1EmmLF/+g==
=AIQj
-----END PGP SIGNATURE-----

--Sig_/vU8Qd=5+sVi59j+BFiky43F--

