Return-Path: <linux-next+bounces-6540-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D32FDAABB1C
	for <lists+linux-next@lfdr.de>; Tue,  6 May 2025 09:35:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 764424628A3
	for <lists+linux-next@lfdr.de>; Tue,  6 May 2025 07:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8692D23BCFA;
	Tue,  6 May 2025 06:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="snruClU0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F40A23D2B7;
	Tue,  6 May 2025 06:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746512537; cv=none; b=J/iGp55rq/5jQ5t5zYs5YWYXGcbNgDnoE01hLt5YJcFoG8v6uyEg9g8qA9bBr6ai4A9bZb67JfU6C3HIUH3m4Te1ijfY0IZHuSqeDt63HtlKs9cnT1JlaKJNBx2ytZ8qJjUcJC75aDOpX+QMgYZJjD36/qRxcH5855Oy57+DkaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746512537; c=relaxed/simple;
	bh=bVW0yWoo7Cy8L7af25rANEL41vXAv3yJuQx+e90o7SY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=t5X7np03WiXckA55PHfi2eBLuXCxSxwxa0Y3xvmv8E08TzjyC2Qn1fX9YuFaJFbJWLtMte7nia1DTEPs+FrG3VzCZ/1DTmfS2OcsnbZvzH5oH6/lqVgDGfBQAF48NhbTNjokzmJHTgdfDgS92+GJFiEN0lXFGkoa+HDY30G9HoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=snruClU0; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746512531;
	bh=xiiJ4HgmgUy/Q2z4qx9pS1/GtAjQ68UkIyXdDJOZ5Nk=;
	h=Date:From:To:Cc:Subject:From;
	b=snruClU0WCjBsEv11zTjRE7FPtQLnf9Bl7zWPqFn/nQCyhrkRjRlYgCYzvWZ/13p1
	 fZT7nNQnw/hP0XLqgAfyHCiAiqC1wfKAZlYQ518oAIuyEzreTURhUMy7Gxqoia8d1b
	 5q+Utok2o012hiFc366MR2NZY+tvnVVQ/LFSE8DfTql7DSJRwAgoFPJzE6+FyFRJ8F
	 ZebrWTJ6wgx4JilfV8VHxsWi/vMe1brYaAGHhe1vX7iQXWdk3Y2L/k/aLjlO75eBF8
	 FQHsrq8RpQZbm3QFWwMlJD53AA+mMAVxmUa+OCiilYc9CCNFnG+g3Yo1dPHCQw9Jas
	 KjmTMo9ujzUwA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zs7bR0PcHz4x0L;
	Tue,  6 May 2025 16:22:10 +1000 (AEST)
Date: Tue, 6 May 2025 16:22:10 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Svyatoslav Ryhel <clamor95@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the extcon tree
Message-ID: <20250506162210.4a0b0139@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sgEOaJh0hOXU7OV.5r6.aux";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/sgEOaJh0hOXU7OV.5r6.aux
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the extcon tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/extcon/extcon-max14526.c: In function 'max14526_probe':
drivers/extcon/extcon-max14526.c:252:74: error: conversion from 'long unsig=
ned int' to 'unsigned int' changes value from '18446744073709551614' to '42=
94967294' [-Werror=3Doverflow]
  252 |         regmap_write_bits(priv->regmap, MAX14526_CONTROL_2, USB_DET=
_DIS, ~USB_DET_DIS);
cc1: all warnings being treated as errors

Caused by commit

  0367e6929cf6 ("extcon: Add basic support for Maxim MAX14526 MUIC")

18446744073709551614 is 0xFFFFFFFFFFFFFFFE.

I have used the extcon tree from next-20250505 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/sgEOaJh0hOXU7OV.5r6.aux
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgZqpIACgkQAVBC80lX
0GyV9Af+IPx/LicfhmbAP124YUrRFrYWr2ZFcnK5CuPTpeGRUHA/aDUuBwfjzLJ/
MB7zbcUbsivT9i4fSCcJe8uX+WJfzkfzmGxM5nvy88S7ouI+lI9kK2Q7pEISHne8
j/pIWTPRvl9JwPUB6hnSswmh4wzLWt1BpLiiNDyVLz2hPiRgWnpzWpr/siZ8Gm0b
U3BqH+wc413BB12MQ616wkyRAHPeelD1dyR6N2/laUB7q7c06FC4BnVl9szWIpiS
4Sy/iCXF74TK9TJqJ4c5TZNt1qm9XAN8a8rGgqgGlRiuYUyoSz5fVQWML9Zositl
WanjWD33gcya6fJ3m+gBXOpfOibmPA==
=XkcJ
-----END PGP SIGNATURE-----

--Sig_/sgEOaJh0hOXU7OV.5r6.aux--

