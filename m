Return-Path: <linux-next+bounces-8217-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE3CB483D4
	for <lists+linux-next@lfdr.de>; Mon,  8 Sep 2025 08:03:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4305C1899726
	for <lists+linux-next@lfdr.de>; Mon,  8 Sep 2025 06:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4781C22B5AC;
	Mon,  8 Sep 2025 06:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="sWhnU5oK"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3332629D;
	Mon,  8 Sep 2025 06:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757311398; cv=none; b=heN7PFt8toaodlSz7+QTX71uzdd/id0H81nKQE9z4vVeCXZ9Zh7MF7lIjk2+Aj6pxsKIymIfN4YQaVkeZWrzLzwLp41Ohro/e5hCsvhxlAtlBO60qswTn20gSexnGpvBPZvDDBd2QpjQQoVLaH74JtEQmnIyA7Xq4Pc8U+KsrPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757311398; c=relaxed/simple;
	bh=etjr0lTjvHwGh4tQ2WHoN52OZfJ/rtnCgnzvW7i/CMU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lwx7Ok09KtQI95QpFG5Y9vxIZYy/FDID3H8rKk2ULZi2VZodlLAdzP80PQMuXSJteTkgiMi/oxVWy3vb9asqkZ8gBwzKSGJ/qyxJutWlGjVauGbHNcLoiWHnHDufuZBvlbRzCi2oY5Fkvb/hF6NdhXTs+qQ7AY9mn6EtVMVrfwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=sWhnU5oK; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1757311392;
	bh=pJEop1wsJO+c0YM4/NVm8heO8pc715KjpSTAtFraTOs=;
	h=Date:From:To:Cc:Subject:From;
	b=sWhnU5oKAxwfJAMcNi9VDa4nfgg4k7Xn4batZd2cD6kt6i+MG9jsq09OlAzMv77Xy
	 AaFQSo557BiPZUe5iQbKesybYACeILlT3zQD6EZhxUgmDNLzHt/TIZfdB1rZ2/r0MJ
	 uxYgPZ1wGUQZPpJp0oyXX0U8YWkQXSKuKwUZcgk/DQPeDgi/RQyHBYI/MFNIFrSYa6
	 GkFjPRkxN9E/iHWHT254cT4m+1/G/nngt1FbBp0xY5G2Wu/KQH1rDEMGN2VOlWjsWU
	 Pcz0fQQXNc1zKvosQJJ6j15AwHNUq5WfWfsdbcavETmNjlnQZqXtOEOfIz2W71Crqg
	 zC7yvCuxkG5NA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cKxFr3yR1z4w2S;
	Mon,  8 Sep 2025 16:03:12 +1000 (AEST)
Date: Mon, 8 Sep 2025 16:03:11 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the extcon tree
Message-ID: <20250908160311.2184ebbb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gZadgCRIM/2yxp6oEbssIzX";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/gZadgCRIM/2yxp6oEbssIzX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  9f65e74d9185 ("extcon: max14526: avoid defined but not used warning")

Fixes tag

  Fixes: 45af3ddd1cd ("extcon: Add basic support for Maxim MAX14526 MUIC")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 145af3ddd1cd ("extcon: Add basic support for Maxim MAX14526 MUIC")

--=20
Cheers,
Stephen Rothwell

--Sig_/gZadgCRIM/2yxp6oEbssIzX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmi+cZ8ACgkQAVBC80lX
0GyNVwf+N3Pl9R7BrQe4e7lUkIXg0Qsp9RXFPkpn3x+nubFvOHcB0NGhBUEmWVpi
28VjpEZQtLzqPHi5CN92WNq2jTJmzZY4glK2F0xN0bVUq5q1eRquKourl6Bm2cEs
brM6lFwmI37RSm9sQq6WxJe0MzN2o9k370A/lda7oZatHqCO71nFM1RN+v8W5mlB
dfWPgoHunYr6AQiQc4oyrFGU+qFOAaOc3tA8S13DtCnu40xfn+5AXMzrWDolNKXF
7/4aCJfOcwhPHXjyd/MxVRuN89eh788F/dRxbRig+qJU1NBbo54gcdjRJMeOZU2o
U5kabvn4rgRRlNySjxdVvm/IQkT3LQ==
=R5NG
-----END PGP SIGNATURE-----

--Sig_/gZadgCRIM/2yxp6oEbssIzX--

