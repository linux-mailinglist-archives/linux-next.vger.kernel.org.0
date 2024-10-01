Return-Path: <linux-next+bounces-4050-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AE298C6D4
	for <lists+linux-next@lfdr.de>; Tue,  1 Oct 2024 22:31:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A9EEBB20DC2
	for <lists+linux-next@lfdr.de>; Tue,  1 Oct 2024 20:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B62B7DA9E;
	Tue,  1 Oct 2024 20:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="IH07M7fS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624F429A1;
	Tue,  1 Oct 2024 20:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727814667; cv=none; b=NIDWIfMDvtQhe6NuMO+01uQEw4kCHq+A/IOBcomyoneD700xoPqN5K/wXSGZxnpKCAgO4XZhtByjH0dClWrvz0wbYaPh4iQTN8uMZR5xJUGWR2Kkc8Xu7Jj/zr2TnBHQzBB930jQWQTHFayKPbs+ivJJZ6p4QJQoQmRlMYQFZaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727814667; c=relaxed/simple;
	bh=O8Fx2QrfbMld0AUFvcyPGkgnBqo+DoysuO/fa4e42xY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ojqBOErkX4jChLuPhHlQe9aveRiw+YKPSrCZNc3p+9ZUgZJKB8hXhTdEpCVkw8xmPAlYlzQGBP/KkrKPhP2UtIuAh6dJ+8Y2ttnRXkUfZbCIvTS6TK02CqQBnjXqIm+pU5fL2rYTKdahA5D8IDvfqdFmRjCMkD1kqtfbZrH7nDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=IH07M7fS; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1727814660;
	bh=0g+gtIg88x4Xw1ttjvFH4E+ogZ1o85QI4qk/VoP/zkc=;
	h=Date:From:To:Cc:Subject:From;
	b=IH07M7fS6mx757YmriJtdli5Ta6HWwNnUMXS5FKvj3bpLEOEru4Pw9QR3FLBb0on+
	 TZYuSt1nVNCNRSDAf32aAPoGYxj6HlmrGBBZc2SyhonQ8q85T6osoIISBoIFFs6eMi
	 wwvM/9McElnDMI8jLXNpsIgIpXsDyYtbtijEPx3GitwZoyhW06OdD8HnVBgU5fUrzf
	 wrrkhXTAFcoHBlcATsFzps8EG/iZqgpuQUdthTXpW02deJin93HSBnF9p0yft4Dv8R
	 QlqQC6xnyUzCFfGbNPXuPbAPoQSElPNVskDAkJW9+bA/Rpgj8u2yUgr/bhUesGFdWX
	 X8/RwKS0LJ/HQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XJ8j01XCdz4wx5;
	Wed,  2 Oct 2024 06:31:00 +1000 (AEST)
Date: Wed, 2 Oct 2024 06:30:59 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the ntfs3 tree
Message-ID: <20241002063059.7e339c58@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/B73Pr_/DxrSMSWTh4XJc+zu";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/B73Pr_/DxrSMSWTh4XJc+zu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  bdd6baf7408c ("fs/ntfs3: Remove unused al_delete_le")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/B73Pr_/DxrSMSWTh4XJc+zu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmb8XAMACgkQAVBC80lX
0GzJFwf+OFFIWIbKthsZRcPNisY7F9dC+mUercO20PVu6oOhrRh6Ac+0i9fopyHQ
IDvjp+s61FY/0mtdDT6HiFdspkeIJSczSGUvC9r1o1+q9LsVggA3T3DcxPnEpl+B
aYD9Og58vEmigwKNzNJH2ZTY3mQFTjIdsnZ2URBi5C9QUMIudlv02Wzh6fp3CfPV
5i1Zftcp+EKm1PM2r3g/g+tfls7G02w9JKFsQVoFl57KLIGZXTIVrJ+qekNVbIrx
qAGh6Bc/1aos+UVhcJZ0IR8/rlXIQNdAI2n+zUwhfrmyZjFIZCnaww0ihPOUtZed
bffvamGdq9hVA08QHQL7jGoiUy3VcQ==
=8DNU
-----END PGP SIGNATURE-----

--Sig_/B73Pr_/DxrSMSWTh4XJc+zu--

