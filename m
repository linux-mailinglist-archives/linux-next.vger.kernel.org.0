Return-Path: <linux-next+bounces-6195-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 148DFA83667
	for <lists+linux-next@lfdr.de>; Thu, 10 Apr 2025 04:23:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F0434A03E5
	for <lists+linux-next@lfdr.de>; Thu, 10 Apr 2025 02:22:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66AED1E9B1B;
	Thu, 10 Apr 2025 02:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="QE00JUtz"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA53F1E32CD;
	Thu, 10 Apr 2025 02:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744251611; cv=none; b=nElu2ViK3A0WEcBy4HG9EZcE2rvXfg1V1gNlj8nbQhN+WDrAC725Q8CIElmIDf8u6uqgbcH2kXCYG9hCGmce0jipwcdGNcnHbBFxYEONQMyb5gwsFnja8e9gD6PcYn8KzmOdj2aRkmKTQ+QVya4PH7EIBq+jYJ/ws8cDfsElHMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744251611; c=relaxed/simple;
	bh=bUkqiLfAP/k+IFyaQBzohFul3Uad4pjwsVFoXvMIUm4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=AxKiRsCCIA0fna3aPezJ5p2GNp0Ju4RdlBd9kVPF8m6VeUeFyiXx8bePcUiGEnXNgeua1KcHfFovOgH/j8+pRcgFHx+tErLWqdL7LxhDyfl6/0hGfi7E5YstHMmmQO5C/p1Jk8WXhftwSIoADp2mG90su8RPirUyAO/UwrtvIaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=QE00JUtz; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744251604;
	bh=EIGh7xVw9mJe7tfwQcjcshSTNY9R4WoIrtEq0zhtpyw=;
	h=Date:From:To:Cc:Subject:From;
	b=QE00JUtzwc7pCrVRYXnz3qL0SUGpvba8+G/fLI1FGVzOP6B4VJM26IYfbcrFnFlP3
	 FUku062M/dtXAWCeIEpnaTz+UQspGmgei4HxYLUwgvOrgzvon1q3CbtNuWWz02ykET
	 gouKvKt1dZ343BQbZuchZmx6I8GEICHkovOy2iIXIAo+6NJpOiaqzYhOhcRzmQfIE3
	 qU2qK4jx1IvaUIpDiiFXvVLPaE8ZLnsYI/PVFerMTErbccvb64742GKyx8+kYzVTTA
	 RCpOoZs65iPUF2aoMCw8r3FHM0mCs/hSaHlejPLst7Etm57JITtixzLVPB2egJTdly
	 fXB6YSH+a6LaQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZY3S404f4z4x2c;
	Thu, 10 Apr 2025 12:20:03 +1000 (AEST)
Date: Thu, 10 Apr 2025 12:20:03 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alasdair G Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>
Cc: LongPing Wei <weilongping@oppo.com>, Mikulas Patocka
 <mpatocka@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the device-mapper tree
Message-ID: <20250410122003.5434159b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/551n4GLkAtAk0HXFkm7t2tx";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/551n4GLkAtAk0HXFkm7t2tx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the device-mapper tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

ERROR: modpost: "__blk_flush_plug" [drivers/md/dm-bufio.ko] undefined!

Caused by commit

  713ff5c782f5 ("dm-bufio: improve the performance of __dm_bufio_prefetch")

I have used the device-mapper tree from next-20250409 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/551n4GLkAtAk0HXFkm7t2tx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmf3KtMACgkQAVBC80lX
0Gz8kAgAmXlyLAHb1KrPCiDS46XMuZGwYuYnZaLoFLxJWcroDDEANRP6LKvKDYmp
gBS6ru/ATiz+CjidNpUG3Gv8ikCC8am3X58QSW+sw+x5Eub/ssjC+iYzIVNtrqvc
VYfasmv8MvI7hy55n6MAD78aotli2rcpUF/BivXlaWKb92fmQV87owoVdiJO0O4o
rW6zbpoG6UX7R+FiYqnOVHsU0K6GF/1bVqfLPoOsf+mAIDZNQBReU2vgQGagtgKE
OuOJya+Oofqg60omWdXe90HBvGmhp4u4L0GwOdonmxxSzQ8YrCiWH7MCo2oYiS4u
hclG5AtE4NW2aHn25Y2vaI+P/P6geA==
=8YGT
-----END PGP SIGNATURE-----

--Sig_/551n4GLkAtAk0HXFkm7t2tx--

