Return-Path: <linux-next+bounces-3188-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DEE944289
	for <lists+linux-next@lfdr.de>; Thu,  1 Aug 2024 07:06:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02E541C20B00
	for <lists+linux-next@lfdr.de>; Thu,  1 Aug 2024 05:06:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A10D8143733;
	Thu,  1 Aug 2024 05:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="JKHK9KDr"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0F513DDD5;
	Thu,  1 Aug 2024 05:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722488479; cv=none; b=SmixztvdVmE7m5UNGnLZgAT7KCr7xdVNfSlKlDRsTipSjyibrNUo7GVX0vg4vRBZtcn9vTntxl1tVfEpr6FjlW/UAo7N90QD96oP/zcBOZh3x61a0DCAjMehRw6rUf5NLO7QIzmAANUovsrqQOaOCRD3F8mE4CEVef6HvtE/+68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722488479; c=relaxed/simple;
	bh=0C4iid9vNy9JMn4F4h5L+fE+NzcaKGe2J9VCpg3c9pQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=V5QNDbHZPG/mM/CmNW38+WUeHYhKwEKA0Yyum/Bemm9X/998N+tSKvb/xg/CUXrlz73McN+YEeNPykxk5zoIllDBF+csqE0LuectCj32+fsUoAWDWk4MN21IzKYl3146ZZStFyZCeM3vJG7nXFY+z3mNKwc7I5l4bPHGPybUJsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=JKHK9KDr; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1722488473;
	bh=n37R9Mnk4aeOfasAkqnEa1nRWjmyotKTlTOimBdOFlA=;
	h=Date:From:To:Cc:Subject:From;
	b=JKHK9KDrod1s++5HzqlwibOFWX3zCE3eoi9bEq+iR+X0UiZIQn4bbtW8sFxGvioIc
	 CAuY2DBs5CgBcfsyYMqABjiQCAQm0GLytN+mKEiFzbUJ4lDV9VbQxbM/AaE8G8a5ry
	 rppZWoBlbtHiM4yZP/0B2Pqds+DDUDHzeF6pU1KNiaW5fyjHaRTGStOdKb+n3IrLSS
	 XVca5ZmGhbitO9N0LeFqhJIFJqnt0CEm3Ij+6ofwUcOwjA4C3O+fQkF+dCVNpxHoak
	 sve1psnkkMlCG5o8nWaB/Q0m8nfuPpJ7g5WNLUeti1iBSZnW2w/m1YBdRV9jVj/Axa
	 TttopC4lIy94A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WZGyK4xdPz4x82;
	Thu,  1 Aug 2024 15:01:13 +1000 (AEST)
Date: Thu, 1 Aug 2024 15:01:13 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: David Howells <dhowells@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the vfs-brauner tree
Message-ID: <20240801150113.4826dc18@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/McLBkQP_Y+yKy/fit2w9f0R";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/McLBkQP_Y+yKy/fit2w9f0R
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs-brauner tree, today's linux-next build (htmldocs)
produced this warning:

Error: Cannot open file fs/netfs/io.c

Introduced by commit

  af6519cfd7c2 ("netfs: Remove fs/netfs/io.c")

--=20
Cheers,
Stephen Rothwell

--Sig_/McLBkQP_Y+yKy/fit2w9f0R
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmarFpkACgkQAVBC80lX
0GzWrwf+OA9tjpN6nre5JwUXzCuX2DR/5plrxZEOmcjhZCPWfGryV5ulDhVwM92Z
XqX0SuXfpqeQmnJLDuiCiSRO5985Ln1w9BRB1pGQw7YKTTExG3O6xYx++BxKyae5
kHhiofk22aKXKQ8SZfC8D2QrerUuRyI4tHsD4Mcqsv4tasbKSvE/ZD+fu/ZQ7yQj
tNi5bP+RmQfX+10Ny/Ta39Pxi0N2wpLB6cWIOfL7h+zVnNLz9QBViT/Iow9DzTSA
JsM7lKWPozbTamxOjlh+9rlnBagEqRrXC1V8smwSz/XOYNyjZxIcj+8T4xWbldcv
xJqsdsrakYk5okgDB9UJTCZR9rFUBQ==
=uRq5
-----END PGP SIGNATURE-----

--Sig_/McLBkQP_Y+yKy/fit2w9f0R--

