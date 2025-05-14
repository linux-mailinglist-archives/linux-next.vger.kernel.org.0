Return-Path: <linux-next+bounces-6758-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA19AB60B6
	for <lists+linux-next@lfdr.de>; Wed, 14 May 2025 04:25:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FCB0189D7D8
	for <lists+linux-next@lfdr.de>; Wed, 14 May 2025 02:25:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AFDE154425;
	Wed, 14 May 2025 02:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="QxOlZB5E"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9879228EC;
	Wed, 14 May 2025 02:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747189507; cv=none; b=Ka3KJbK6MG++th/P652nkhUa1/OpI1nUoZTuQ0kjgBjGYL/BJqcfpq+6N9y4OykpUAKrha98dd69GbleCTMk2vwlpfoM2vsMqi5sqFZCINECXInmKXtx7hp994LyiWXWUcBqwmi71iGhTWzqDJw+UPpjsgTFLgwoK+fYL9y9tMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747189507; c=relaxed/simple;
	bh=1nw7JaTvCiK0VDY952vOMIcVTbqFzzTfLwZpvm0h7go=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UHIylsOgcbVf4e7kBSi5+Y+dMCo5Qep2epVHr6Ld01vXdijd1fuz6tS5sXhwsnwN7Bc8q4EBdVpi0XjUAMwTe1SD6JAIyh5AULzg6VTwARIidlZByYD1LPn/elPJUg0R9HYiAr+A1wvAtyXWjHmecprLiFFck9S1JF7SyQA6sWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=QxOlZB5E; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747189496;
	bh=2Dhji9PtfPV6qapRPX3lmtA7EKGtvSAzgiVf4V3APcs=;
	h=Date:From:To:Cc:Subject:From;
	b=QxOlZB5EQn3SI9pLP2yCnGj505zyodRDQlXQBukxD9deWKfBK96BnOcSqMlMQmzPR
	 GTJ7nzGh/mEJPqszvqgAzCrD40l1qfrMCcm8WdfjA4KAFbuLeG3CW5HLsFa9SQkj45
	 fZi2LOPC+7mH2JmhrUpE4DRdh+XKbCJNcj+tCrZTLuIgATyCosyGTADOxbddw41wbv
	 HpK0Uom4uFB44G0FWGt62pES9BnWWLDDWpx0Rph85h9l7bj25IWn7JHUHds+mefnbU
	 WYicSc7rr+nmHhVKqEVAWS7IjKCOAKJ0nk7v8W0n54BEcyHtVJG/WaOGxsyTHBN7XF
	 V8Mv+HlzPlymA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zxxy05LSnz4wcj;
	Wed, 14 May 2025 12:24:56 +1000 (AEST)
Date: Wed, 14 May 2025 12:24:55 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jason Gunthorpe <jgg@nvidia.com>, Leon Romanovsky <leonro@nvidia.com>
Cc: Leon Romanovsky <leon@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Shay Drory <shayd@nvidia.com>
Subject: linux-next: manual merge of the rdma tree with Linus' tree
Message-ID: <20250514122455.3593b083@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aC+bucIarNVgNKKYM=N59_H";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/aC+bucIarNVgNKKYM=N59_H
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rdma tree got a conflict in:

  drivers/infiniband/core/umem_odp.c

between commit:

  9a0e6f15029e ("RDMA/core: Silence oversized kvmalloc() warning")

from Linus' tree and commit:

  1efe8c0670d6 ("RDMA/core: Convert UMEM ODP DMA mapping to caching IOVA an=
d page linkage")

from the rdma tree.

I fixed it up (the latter removed the code updated by the former) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/aC+bucIarNVgNKKYM=N59_H
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgj/vcACgkQAVBC80lX
0GxIsAf8DSCiUMY8JAjK4kH/JHHnUPTAGDI81S0z5AqEXhf7CjwFPVcbPV67B2Tl
CbIpucnIFe6WoKZjefjCqnBrB35An18srE57zz9udxmCgXvMezUAeOWVqaU7s83E
cHMhaOWtW2eJHwt+1Uv0n/w0yL0EocBvuHI+9IadrZxKCBrd2FvrvbKGTd22kcnQ
s29HJ1IzN6CJtUP+lM6NJWzUVsImKGdEakuAvzvUzO4ndN+CiKuiVphuz7s/7CIp
ifo+HnsQz/1EgB2GZGjEd8ikCYHf4ghnKEPdxa8S7HrlD0YWx6MA1aTTzYe18nk8
EZwaf3vU9wblCzDkn8QoI/pwuL7DBQ==
=s8wH
-----END PGP SIGNATURE-----

--Sig_/aC+bucIarNVgNKKYM=N59_H--

