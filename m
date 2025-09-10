Return-Path: <linux-next+bounces-8250-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20390B50F77
	for <lists+linux-next@lfdr.de>; Wed, 10 Sep 2025 09:32:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DBA51C81E56
	for <lists+linux-next@lfdr.de>; Wed, 10 Sep 2025 07:33:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A9AB1E5219;
	Wed, 10 Sep 2025 07:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="eXoYV+ZS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B63920E6F3;
	Wed, 10 Sep 2025 07:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757489565; cv=none; b=T2JOlYA8NA18yyNdneDzgG6kuOAMT8FswGspIWjBhdGTZTJQSavyaAB9TnIzOB3uNO+z5eRY2BZkgU3YxXspI3k0gClva8MbuUbpR0XvzqCcxg6kCZb5U9fgPgAc7rHeW5WcTJsMDDrawNEde5FiroX3Fqyb/is3jw+ygUt5X8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757489565; c=relaxed/simple;
	bh=cNnqhoxdg6frKUHAp0uAvy8mj8b5kvtLDtzWSIHpTo4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IuZ33ek4sCM7yRj29yzF/j+1uz20awFXuji2BpH2P5D7hyYaLIqIyhTcX7DRTHzLU3cTJssRFKbMlzu3pHfCIZyPWCTgbK91qf/PVb8mrE3vNJINzEe9hJrz6hcRH9mVRdPyh2Azq2hTsmBoWU6ilRjo12qmYN/MFS84+XETx/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=eXoYV+ZS; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1757489560;
	bh=DDjQG2kzRUcg34BRx4dGy87ztctw9ocUAFXaIrrFn54=;
	h=Date:From:To:Cc:Subject:From;
	b=eXoYV+ZSk1KFh9UI4LGQ/xVhN1Gboh6VYXsLNmDmE8LLXJjbisGo/up0H5Am/VyV/
	 LpjUUznUbQTO8YFJ/AdI1nCwesMp4/9iO1NU0/Nr0kn3xB0ktmEpBc8+WXLEWt28Dg
	 8/OZ/+1lqHb8bRhIeKGVpL+XJ3DCIVTkjDz3Ow52riUxAhNmk7tdMbPilFqBO3fxha
	 NppRwk5YbwpGdLvuOtmbfSUHLYQ3Z+VY0Z+kHNjluWuUMvRbRA01iSPemW1Vc0GgOi
	 x13q4J0IlgGLZ1bsTRrAP5N4govvbFIH+HzwKyBS7n6SqAmc/h2eaw6/rb+UXM23lZ
	 MZWZCtEZq9n7Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cMC881JmBz4w2S;
	Wed, 10 Sep 2025 17:32:39 +1000 (AEST)
Date: Wed, 10 Sep 2025 17:32:39 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jane Chu <jane.chu@oracle.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the mm-hotfixes tree
Message-ID: <20250910173239.5e7f4d4a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yr.rBbgnyA2/s19T9EJGGEF";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/yr.rBbgnyA2/s19T9EJGGEF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  61979fc7ec31 ("mm/hugetlb: fix copy_hugetlb_page_range() to use ->pt_shar=
e_count")

Fixes tag

  Fixes: 59d9094df3d79 ("mm: hugetlb: independent PMD page table shared

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes tags over more than one line.

Also (looking at the original posted patch), please keep all the commit
message tags together at the end of the commit message.

--=20
Cheers,
Stephen Rothwell

--Sig_/yr.rBbgnyA2/s19T9EJGGEF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmjBKZcACgkQAVBC80lX
0Gx+rAf4/r+J8FSEIYsrpL0fZIfTXmg9FkCxtCkAHpykHpvBA8vf2QsuWdHKOXPe
5DAdM4j1zZ9VbsA1dJBo6h1lY4BYPLJEN0ViYMVFXdSWhOtfzszY68UquCiU+oWA
Jwk767IGlNs+GEHyJyh8jJ6MjbXv+DpYJmbNel476zy4K4FHIBNuGy9GOJuBcaf3
DQKs8AMozf6IPXhdOI9R2pTYhOTaDQQ1otlG4M9NmPkGtF5XgN8wwsR3apFaTt6w
VNQbrCT9nEJo/7ZwmC3x2+GXfhUsYTi9nM+bhr0N/xXBkPEPfJPSJHcfbCOHtw/K
W2q5wd8m3lL8AxU07vaGxZFZmKAV
=7Z9Q
-----END PGP SIGNATURE-----

--Sig_/yr.rBbgnyA2/s19T9EJGGEF--

