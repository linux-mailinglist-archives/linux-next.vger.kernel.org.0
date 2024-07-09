Return-Path: <linux-next+bounces-2870-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F41F292B1A9
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 09:58:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BF3E2812DD
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 07:58:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AA5B146D7D;
	Tue,  9 Jul 2024 07:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ZwZp9Dtf"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1B012C478;
	Tue,  9 Jul 2024 07:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720511890; cv=none; b=ACU6jxwsQcFyfDekhRUfcy9F2HNWUltj4aXFu180PS1AL5z1lvyaEABRBrUzXVxMzLbGPdQ+dpDgnRvYs7zqW4DscSpGBd2HGaE8AGKUEUig2rXOV+JHZxFn+i4/Ytpplwbf9NZ0A8sqCgJDP6CpWbndw1akDwjHyl5lB0CEI6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720511890; c=relaxed/simple;
	bh=9cW7sQX4Ee2PIL31X06vcKNfrh94ngJ4D74dp0beZSw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SDDIuqcS2CfzHYm6Q7YWyPp5Wt/XOoVcyuGmBmOZMx6oBeFFQA7omz/6unnlF/twEnBhvBezjrQkzL59hXr/uLBb6EUrIGGu5o1MphII99FYAFLFf9SGslw/3rBysAWTUA1/PMep0p5bt9T12h83b6seDQqJcIrTCUJhvde9I54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ZwZp9Dtf; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720511884;
	bh=WNy7ZuwZ2sUtmBRVrCqSKYtGy4m2BKgcdSiwYEATmpE=;
	h=Date:From:To:Cc:Subject:From;
	b=ZwZp9DtfHrHG29O0PwjIcoEnd0Q9tzL3pesAvWucV/O1HoFhrjigTSz9Lnp+dOAa0
	 uHWZ8WHTMPxHcWtvj/5pAXHlOLctgg/I/P7xOREpjDSs1QH+O5jjCjokkrn4n2WnlF
	 JGTObmwjiSQZBDZEf17/14TuDVZYvvkSVQe+wJkxB6FmUQ/HZwfgZNMcK20hAE81bP
	 x0bDdyd/HV3kBKczYRjE99I4absy64RwZkVepEEm61GNHsGOZrP3DFL8l3yB/mDJRV
	 gXO8q9ufq77q7067vw2yHjr+9cEtw2Tbq5AvqGMRnkgxex5nf1ADUlekGx1QpYCqAn
	 572c8xx+OqrnA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WJCyz4Y2Rz4w2K;
	Tue,  9 Jul 2024 17:58:03 +1000 (AEST)
Date: Tue, 9 Jul 2024 17:58:03 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kees Cook <kees@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, liujinlong <liujinlong@kylinos.cn>,
 liujinlong <mingliu6104@gmail.com>
Subject: linux-next: manual merge of the kspp tree with Linus' tree
Message-ID: <20240709175803.36f8bca6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qcOr_DR=iMkXoT2OuDs2tZ3";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/qcOr_DR=iMkXoT2OuDs2tZ3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kspp tree got a conflict in:

  kernel/kallsyms.c

between commit:

  7e1f4eb9a60d ("kallsyms: rework symbol lookup return codes")

from Linus' tree and commit:

  21b4564fedad ("sprint_symbol: Replace strcpy with memmove to handle poten=
tial overlap")

from the kspp tree.

I fixed it up (the former removed the code modified by the latter, so I
did that) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be mentioned
to your upstream maintainer when your tree is submitted for merging.
You may also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/qcOr_DR=iMkXoT2OuDs2tZ3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaM7YsACgkQAVBC80lX
0GwIvAf/eSokduLCFkiUm0VI3VjxQ5l6EOv5sWiuWd6e+ogG7Bx+H5IR4eW/ILuL
lC6jIREbFxZvTSpX26NWoT9wz3XwWp5e0os4aWaHAfJIVFFtn3WV3qhyi1SldVtD
WTDckClVNPaXO4mp8qqQb1r3JncXgKD7DdOWzhcOWJ8Y1FKJ3ejoqDPZalP1KEg6
Qv8UryngT/Rgz3U+qvO6mUTmhbK4L0SXBR86pfXxJmX2GHP6uDMPBL2+uJS0jeZE
pP798gknfYXGAT6vC5oGBuHrvIwpE1mStrPcEFAOhkUs19VZNZ3k7WlCgfeStyIs
CISiihqs4gGmzdbxGo0Umvf3Rpk5rQ==
=tKSh
-----END PGP SIGNATURE-----

--Sig_/qcOr_DR=iMkXoT2OuDs2tZ3--

