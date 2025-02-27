Return-Path: <linux-next+bounces-5585-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F3408A473EF
	for <lists+linux-next@lfdr.de>; Thu, 27 Feb 2025 05:04:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB2E93AC090
	for <lists+linux-next@lfdr.de>; Thu, 27 Feb 2025 04:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95EF324B28;
	Thu, 27 Feb 2025 04:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="tqsm4K2V"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4B1BE65;
	Thu, 27 Feb 2025 04:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740629084; cv=none; b=gpbXlMHzlarieb5As3OlG0YJfFAbmuDprHYlyQ/EB6opkObc/3BaEK3bxVqMIHNP5k/2YeFNfCsObfjwovQyhKFxpZoA6qaGIiQjzUi/l6ovnb2TN+ykm5+ahK4/u5NUYfINAel6Dmp+7Wk2W98rSxt84OfvNFFTw62T8nL1/OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740629084; c=relaxed/simple;
	bh=L49AgEInu75X3a5lu/WbDpQesPjoT1koyxZbS6v/y4c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VtcGJ2W6CJA54UuTCAeRScOJwWQBovsBzXK5di0TTzFKNMpDFqShRlGIoVhrtw7VJDZBlTgHfA2GqlKdRv+8AMsSSwbH0N1W+pccf5YThBuSPogZ4kQJ93i+YYap6PSMhzL/7trNvkciZrZvIBuE3OA8zhJtldsSUE4boA7unjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=tqsm4K2V; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740629078;
	bh=CWz+QXeFH2u89wfikyy369PYPjDdtcy2aCpxfPF6ySk=;
	h=Date:From:To:Cc:Subject:From;
	b=tqsm4K2VvK1RHCJr03BmQAV0HWZzx4J8vdBAJUfFKUvOY1TvKnkSVrhKL0svYsRgK
	 pPmnrvooOEmByluYvktwXgbVlknvJ0VWvLTz0nRIbvZcJwHIbU9h3eOAVPXFSzvSp/
	 S0kDgMtOrB9kuGPTQw/86b4Ut0qoQQ9+zupIsgqpbwosIY+NZ7X1NNA7eD6DszAOG1
	 sGpRgGFEE6ARYylvQvo5aOPU9oSiSknaEK+opo/Or21OA8nfYe52kPonILJJRk7z3Y
	 76vFDJZz2goM3KVWqLfyJrnkhb+v28hfCR97MBP6QovajPfkDhKudoeijcQfT6KpL5
	 Oea8nfMqtwTbQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z3Hm65Qkmz4wcT;
	Thu, 27 Feb 2025 15:04:38 +1100 (AEDT)
Date: Thu, 27 Feb 2025 15:04:38 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mark Brown <broonie@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the spi tree
Message-ID: <20250227150438.280465e0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oJOY+=EAvUgN59ta036dl8Z";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/oJOY+=EAvUgN59ta036dl8Z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the mm tree as different commits
(but the same patches):

  1d2e01d53a8e ("spi: spi-imx: convert timeouts to secs_to_jiffies()")
  32fcd1b9c397 ("spi: spi-fsl-lpspi: convert timeouts to secs_to_jiffies()")

These are commits

  442b53316118 ("spi: spi-imx: convert timeouts to secs_to_jiffies()")
  d569a6881325 ("spi: spi-fsl-lpspi: convert timeouts to secs_to_jiffies()")

in the mm-nonmm-unstable branch fo the mm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/oJOY+=EAvUgN59ta036dl8Z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAme/5FYACgkQAVBC80lX
0Gz+rAf/W4mpbfSRJHNLUM+ygQe3Ltcywmvv3CDna37vyzLXMKZS6VVAQtMxyx5p
wVHjk8bI7wz2JV8clJ3H5c1Mw/zWn5YlRGt2vjE0Gx1TBnPo/PJHhwuaz8SNxckt
ku+gFNxqptB7Z1SKir6Cxoer4In01paXx61uKf7azKJr5Jr9B/aT4s1UmVMB84dI
qtXDZ4BwqhDJCEgw9mC7Q3lQjEYubszStCSUmfaPQ0nmAe4c+bvj/9GljlduOyIl
ZXCWX9ohtzWvnhudrYfs9f9zVRb6jaK1A18dgnkXJg/AqpraUkYv9ncDFyVm6/vt
tdJyF/YyamzZr404sRTORYZLg4xzmQ==
=HPH4
-----END PGP SIGNATURE-----

--Sig_/oJOY+=EAvUgN59ta036dl8Z--

