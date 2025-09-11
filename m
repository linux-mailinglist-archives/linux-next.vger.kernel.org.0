Return-Path: <linux-next+bounces-8260-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CA4B529CD
	for <lists+linux-next@lfdr.de>; Thu, 11 Sep 2025 09:25:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60E14580268
	for <lists+linux-next@lfdr.de>; Thu, 11 Sep 2025 07:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 706FF269B01;
	Thu, 11 Sep 2025 07:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="nDeQS9LW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24FE329F11;
	Thu, 11 Sep 2025 07:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757575520; cv=none; b=QumW+6yYlYpGo9xXDqCVy/ssrHP71RrOASoo2ueLlXnZgaJaFAotjIbv3TzwZ2SpaU3bqR1iMH49bDvd28s3tp6ecrKbX5JjAnJ4K5545zG4tvZ9HvcG1PvUbkUtfhBrpjyHUf3Xbn5Di2wHxcRJZi5g3ctQLkxwm5Md0ZIQEkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757575520; c=relaxed/simple;
	bh=F/gLBVJfQ3hPo6dDwNu/1P004fnInrpO/3TYP0vTRgU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dvoy+WMRLi4ZhzIfe55Mc7FzQaYy4vvWNWpJRJnYZdkNc1xIUawpuuZzISXsbBfLAN54R7SEDOfKLemF69IBSkIuliNUdqsT3xzmRISOnrpgcQqPBRWrQTkeyvWEO/Hsn02lMnXdWc/P0HaQR9OAlYSew9jEFb4ccf+NKpdAR/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=nDeQS9LW; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1757575514;
	bh=1kfuvh8mRs1w7I8cErPZOCdVfBI4xyrEarR0QjpoxQM=;
	h=Date:From:To:Cc:Subject:From;
	b=nDeQS9LWSulsPdqyYqBD/XnaOV5VOkUJXHqhYRBxbz1lNS9dtZHaCLGG7v1lMzqX1
	 Zk6hWUONaGj03yrGGIlm7x5668MBa/puLdOK7FRMMOlnOSS9I75pK2Sx0I3s5y7Nty
	 08ZpN42G2hu5febqh7u4a+iffH1P1AdkxPesOWZlj8X/xpWKXqeNdgzJQ5CflGX7CB
	 1rdGub1BzWxlD++WbW6Ee4DY9jP+ODyLHrxfbWJyaTMo+lIyLd2OAdck6B8JF+fQW+
	 wHOfsN5Q5cHuZa8YCoB5ze/vxuLLdUQnhnkYYG+LKaR0tcCfg4c4har/EMLKZNfK3a
	 psRVAoTML8y9A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cMpx61DbJz4wB0;
	Thu, 11 Sep 2025 17:25:14 +1000 (AEST)
Date: Thu, 11 Sep 2025 17:25:13 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the imx-mxs tree
Message-ID: <20250911172513.21cf1c53@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/h4eoHM6nQ1Fy=mCw3dogRTM";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/h4eoHM6nQ1Fy=mCw3dogRTM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  95c974004274 ("dt-bindings: arm: fsl: Add bindings for SolidRun i.MX8MP S=
oM and boards")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/h4eoHM6nQ1Fy=mCw3dogRTM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmjCeVkACgkQAVBC80lX
0GwUdgf/ePpnuq7du5Cy4/DGRyyJ1inEBRz8ZC9k3IwENw4dmmPGUevwtj06EKmp
fc/x6WBEhyNnJIfPrVzQmt2L1vzrROrMEaHuaVdKDfjyIBG4HdD5OrqFumffHI/m
kTjOeEo4uASulmBpGlfqCS9a3oUUv/0YfhC3DZavWZtmDAeftjdwJVPT/X8S5UNl
nS5cU4wRcXnB1ZF3YJynL1eOW0DW1lRtiB+mG3ZnWhrvm2eevIYy5ejEm/gQat+9
njvb89vVPPy09OhK/TkNSNqpUVg+7VEb62dPS+4aslkVJFSk5O7Irsimi2jmGx9D
guJcIgL4ZB/tfSz/LRgOmeeBswCdmQ==
=27WK
-----END PGP SIGNATURE-----

--Sig_/h4eoHM6nQ1Fy=mCw3dogRTM--

