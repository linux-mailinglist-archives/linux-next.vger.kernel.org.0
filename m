Return-Path: <linux-next+bounces-6262-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E41A8AF5E
	for <lists+linux-next@lfdr.de>; Wed, 16 Apr 2025 06:51:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 497D3168DB9
	for <lists+linux-next@lfdr.de>; Wed, 16 Apr 2025 04:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CC902036FE;
	Wed, 16 Apr 2025 04:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="AMDgOKIR"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A7B1CEAD6;
	Wed, 16 Apr 2025 04:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744779083; cv=none; b=uCS2N0RNsJt87r9eMrC7sng/5MUVtKwPK6aNfpid9lrmUl6Jy4dZTRhF0gx16PNaMzYX/WT63hYpOj6g1PVVfVtPc15aXrmnBRDZ3k6YrVMS6/V1DSDmnCRWebWhy/T4dxYOz8Wz/HmVtjbo1xfz5zvD+dM3l3qT1q+HJKO+j2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744779083; c=relaxed/simple;
	bh=I4SqPCbBRwxBloQYmrlhM613RmZ1/cfh+y6/8vA3wn0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BykRTA6S0l0SzyXuaaWDg5WC2QXWiztzg5NF3BOCr7aRvnw0OsyZIi8783I7h26V96O/Dhl5viOpZAOCTe/rkHbI7FBC4GfXK5r4/VALlALWqiSpadikXFzjETOjs4pXFdVj2NKDGuBRM5D9cIM2aff3h6QiKPV1xckCDRA5QGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=AMDgOKIR; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744779075;
	bh=tUrnqWwQSU5Yio5OYvPEauEBcGNjVZukfjCcoV+Lij4=;
	h=Date:From:To:Cc:Subject:From;
	b=AMDgOKIR1IA+qO3njwOOyfvLtR/iHyRlHSHYqVqPQceIV/jYiimDSqLXriNKacJ8Z
	 Pfa2ydIcUvUwvgLtupJnOVGsu+US+NRVuDNO0GOVOR1+2rmjbjY+RbkVUeyRHP3eSw
	 8vTo+MjdLBvG7FNTGwsd2qFI81Wizvx4TaseosWuI9nWaYuL26exgD8MmJeWyupgDW
	 KwgjB/Wj4STuB7i2IG635NX3c/fl7bszloyzC+e3F0aKevNNZ2u82forjzc+155Fs0
	 XTJdWUXjlswz/osh4S236DNK/PIBCDBIVOX2WU3Nd6fopna6xC7ruzhdzztBDC2i2s
	 MFIKIJNpTmPaQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZcpWk4g2qz4x2c;
	Wed, 16 Apr 2025 14:51:14 +1000 (AEST)
Date: Wed, 16 Apr 2025 14:51:13 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kees Cook <kees@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Mostafa Saleh
 <smostafa@google.com>
Subject: linux-next: manual merge of the kspp tree with the mm-hotfixes tree
Message-ID: <20250416145113.221617c5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3qQhWKIuWHaxYIhyUMvSqeU";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/3qQhWKIuWHaxYIhyUMvSqeU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kspp tree got a conflict in:

  lib/test_ubsan.c

between commit:

  22dd91185686 ("lib/test_ubsan.c: fix panic from test_ubsan_out_of_bounds")

from the mm-hotfixes-unstable branch of the mm-hotfixes tree and commit:

  9b044614be12 ("ubsan: Fix panic from test_ubsan_out_of_bounds")

from the kspp tree.

I fixed it up (I just used the latter version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/3qQhWKIuWHaxYIhyUMvSqeU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmf/N0EACgkQAVBC80lX
0GzzQgf9F+errwCQ/s83jZyE2cRdkdPnvYVCIUtKCycTiH6a9Yhn1d1qzxfLlryS
VqnqCJ3DOLf100jQ9/cy1ZtBl1TR7ozfqEpWi+XGZV5B9CXDy9p4Ctn8lNFHjrk0
rCYvfY1AYwPKOdq/9uIXJHOOjHLutuf8N7Ci9T+h7qqzxnd9nN66dBTYENERPS6i
osE9vbx84Hkxw0UJAImIFhIPx/6lQjxIjhs5uLBq7IzNbshkqJqdM+lgllzu69Ef
CT+I9wnmCZ9Eqby/bOsMEV1MDP1w8yaLsTA+OFQfyYHciyknhSrcAH97JUSW5D32
3UPjLhvWlJt9kH1/X/hoEty/RH0GLg==
=LhGM
-----END PGP SIGNATURE-----

--Sig_/3qQhWKIuWHaxYIhyUMvSqeU--

