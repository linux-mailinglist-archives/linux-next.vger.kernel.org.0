Return-Path: <linux-next+bounces-6968-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D79BBAC72B1
	for <lists+linux-next@lfdr.de>; Wed, 28 May 2025 23:20:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC9401BA23D2
	for <lists+linux-next@lfdr.de>; Wed, 28 May 2025 21:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 356CC220F37;
	Wed, 28 May 2025 21:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Ahh5sO7o"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0F21DEFE0;
	Wed, 28 May 2025 21:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748467219; cv=none; b=qpxi5M0JHOogVqq2I7nvYlfgr0+5ZFXnnFatYKA9DesgcWsLierKnq/RAOzxva/faFrHrS+uzqO06MMgX9ahsYY/a6XeEAiySfFc6oQDA5qSVgUdpBq2AZPnJhtx8ufmGIucCWi3A5zCvvDr5MMrQt4Bnf7UUj8JlpkWg8yY5XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748467219; c=relaxed/simple;
	bh=hBXRGT6GrhOhIGAdjqFuCvW4akwwY1dwAMVpJ/6qBHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IwnOs1nDbWFNk8935JSerm4CQ/edMtgPsGvC7FpCWgFi4GydskqyIydJA/sYiwIYNdJHp0Mzm2tmJmJnaAS5Y1hDXdBYTfU/Pq2z5rQF7jB4sbeQSFVgCuKWCQgVVdlNyNzB2oqFMQt1ccFIl04Wh0Beu1+byMnuMdnoRXU4ROo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Ahh5sO7o; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1748467215;
	bh=FU3E7ObEL1F8BrHeIIj7P4UT68yZBmn83Ronv3oQ0QQ=;
	h=Date:From:To:Cc:Subject:From;
	b=Ahh5sO7os4I/R2boDoW6tt8qoA2pzUyhtROKMxjl9IpI9Jv3DqLBTImT8jj6yif2a
	 e9Km+9cgumqwybaDsLxnAuhCqLFK7PxOHzUTtYfQL6Yrosh8PC4KKZbMaOAYbLvWDR
	 XykLrzZtJzFA0tSpxCLWRexIExI32gC5RQWbW9ddlV1Da86AoIAQdIVhsZL6YIfSu4
	 R0cg9Y03v5be6CgJi7DZ3b0HH4Uj6UYueYfgoCw3fYkVt4wu/BNM7jwdzz3ndjGJ4N
	 N8obUryEMmvcdKWDQsUrursjSD6hPEHuZTjq0duJN7ClmSAu8/rIleF8iliT0t6FZC
	 ZdL67Y1TQdOEw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b72TW5Tqmz4wy6;
	Thu, 29 May 2025 07:20:15 +1000 (AEST)
Date: Thu, 29 May 2025 07:20:14 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Colin Cross <ccross@android.com>, Thierry Reding <treding@nvidia.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the tegra tree
Message-ID: <20250529072014.18f6dbac@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jn0GMIqyR=Tt5a8i4wd1cw8";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/jn0GMIqyR=Tt5a8i4wd1cw8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  0d4d6e699a4a ("media: dt-bindings: Document Tegra186 and Tegra194 cec")

This is commit

  5bc68bd3826e ("media: dt-bindings: Document Tegra186 and Tegra194 cec")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/jn0GMIqyR=Tt5a8i4wd1cw8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmg3fg4ACgkQAVBC80lX
0GwTiwf45HOeZL5aDmIrMX4BJPdu2vfrXknqx5wujz3iIT40iPCBFSIUQE/lt9nL
Pssg1uZmHXK6pRMZ/azVILtB5H4Ohlg9CVm0ldPMoZbF7ARTHBkRpQspMN7yElz0
PyqrQPMlXX45wmIHwvufJMN2nFw7HzApiyurdBjjyUvjRo30F6XpcHKjbP8aDtE8
XjDAaLssE6uU1WdYnFVB/OO5oQMf0jgtBb1zJRiirv1QgZDd3tlrtYUeV8+LlSNT
krET1l/OBxvqNoeXFmXIaolVmeS4ss0hMwhI0ZZ//9fAu5lLEWfHIzHemPe53+xV
xOKh+Yti7zllN8iHngXAO3PTGt39
=7COa
-----END PGP SIGNATURE-----

--Sig_/jn0GMIqyR=Tt5a8i4wd1cw8--

