Return-Path: <linux-next+bounces-7790-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED61B16CED
	for <lists+linux-next@lfdr.de>; Thu, 31 Jul 2025 09:53:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A42316D871
	for <lists+linux-next@lfdr.de>; Thu, 31 Jul 2025 07:53:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6419029CB58;
	Thu, 31 Jul 2025 07:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="IuY/TtYJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA432989A2
	for <linux-next@vger.kernel.org>; Thu, 31 Jul 2025 07:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753948399; cv=none; b=PUqzwXQztJDDrFOKCbGt9d0Xg2NFcZj8mR5mGX1anNZx88kQ9zIm6AGpTY2rurYVzSxlHxP5XAD1idLgtX/R5TZG2F8PlXkDqQmLJs5krNADrJyLGz7DBBCU0gqMykR1iyt6UrxI4PudZP4J33Am6BFl8kqEK/BUko/6uGbQr5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753948399; c=relaxed/simple;
	bh=RWrsEETiQfH6gr3qVHcwqQutvmG9kYY1Jbd5NMz/a14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QfxPLdNJDxvKL2zC/w5jaDCEXPW5OMjkzOK6o+d+bBvBh2sB6orFmp4kRo0fzOih0eYFMBbLePUabwr1z0llhVkD6NoxmNBiFdfGNrATWB3XLYZTknri/YegQeyQ4XFJ059/4rtaJgVq26wi6l5nUXQ4105SQ8gXQ7Oe7RI+Pdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=IuY/TtYJ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=lhuj
	dQ3XdYKw4nuX17WLCP/FshRyGZ6aQUu78QE36B4=; b=IuY/TtYJgePx96+4q2OZ
	CIH4LBbQKePClRvd/+XoPm2t+p9rPxhbO1no3sD//EoD21StjlfMQLLu4byUJoYw
	3jD0Q4tAyS1Xfj1eOf3bOPNbrs8F055kwckmH078Hvqv+aY/s7ynk0zPyAqyBQM0
	wU3L8rqgZLQbtPXi289EN20yR1SQszKNXmN50cDpUnZ0hvgXK05o0hlWZTGdy6i/
	BM0ro9AiMTHOi1r02KggB7TCpcN9jPtWKJB1dPfMcpoTL7zVWGLrTVXFp6svOzjW
	AiknWoNO2uvGVAAtJX6aFXKOdl/2H/ITHgLCeoN7FcVhlxtcuRwj+TQncnWZWHqA
	kw==
Received: (qmail 254040 invoked from network); 31 Jul 2025 09:53:06 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 31 Jul 2025 09:53:06 +0200
X-UD-Smtp-Session: l3s3148p1@FvGA7jQ7QrogAwDPXyC3AG0QzsW8mHdp
Date: Thu, 31 Jul 2025 09:53:05 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the i3c tree
Message-ID: <aIsg4Supas6vh8er@shikoro>
References: <20250731094944.4c547f36@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Cx8MrXUZ1HPjxIxI"
Content-Disposition: inline
In-Reply-To: <20250731094944.4c547f36@canb.auug.org.au>


--Cx8MrXUZ1HPjxIxI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Stephen,

> Maybe you meant
>=20
> Fixes: 733b439375b4 ("i3c: master: Add inline i3c_readl_fifo() and i3c_wr=
itel_fifo()")

Absolutely correct. This is likely my fault, sorry for mixing up my
branches :( And thank you for pointing it out!

All the best,

   Wolfram


--Cx8MrXUZ1HPjxIxI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmiLIN0ACgkQFA3kzBSg
KbYGKA/+KvR7JxIezyF/ZfpwKgiX4jEJZPJk5tIyUpWlONfDP+hPHbNGm0tFaKpA
jOOGGy68q874t7l1jaZsRejyjlBuREd/un52ZZU0C3w7xJJ0SDTjO1lMNb+8iNtL
17IEVFhanFyE+zLMn0nGUVL2ZkgQ6bQGm9yK0wyJQ/thob9iC9EDt3pqPyIglVz7
M1O8HJ3IkesjjuZinnLuoMmqua7z5FvrFNhkv2ZGse5KilH2Uacd6M055s2LXdrv
H8jIh9JoSQ4TNanvzi9F2nqk8E218EqV7xLw/uQjpMkH2oumKse0akoWmn/ZHdxv
ct3LgWPZ1Xg/F9blCt7yXBPpWXjrFXZMHqN18+R3OBCtAv+vTN6XVh6z7h5DDX8G
04+AVbOYeqnWwFbG6jEnuqAa5LR7NOGgkhhRYti8ig1sPBrtklvbunsrH8zZ2Da5
Tx+NwTtcZEbl8ce2emVxtcK4dTetAHcCbOg9ygprSLFOIEddEhdMHbrMxd8HxIAX
Yi+bBMxwpS/fdgopUTORHjtchrkBnKfSfiX1GRYPZua54vjqlvIKrp/1pAnHlYwN
4KRVqkpQpQn4tvnK2bhll2pzdKt1eD7N9Xryu5svs3Xof5l1zilLsGm0tXLE525X
G/ljwNoRk+cc31AOZiCESSkETpFziwnhEKNpMU3ClRBUyYlf24k=
=IULt
-----END PGP SIGNATURE-----

--Cx8MrXUZ1HPjxIxI--

