Return-Path: <linux-next+bounces-7763-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE49B1567F
	for <lists+linux-next@lfdr.de>; Wed, 30 Jul 2025 02:29:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31D493AF6D8
	for <lists+linux-next@lfdr.de>; Wed, 30 Jul 2025 00:29:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59D2D84D13;
	Wed, 30 Jul 2025 00:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="RE0Nqw9k"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7E2290F;
	Wed, 30 Jul 2025 00:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753835383; cv=none; b=UCw7Orpm2XHfbRkkrjWb93iejG0iJW0OBmJIM1x3sN69F6Gpp6C28c4IxiSOP2LAFhw8BBr0maKMeurBid+3nlpWHRCw+gpWtUSXJQtUpYYt3NPW3w3Qp9dIfwIm6Gep74gC+hriNNdxiesyGBSVkQfNZ+UguZL3S4C4uIJJp1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753835383; c=relaxed/simple;
	bh=XYFasknZk32uGAKl7LQ+hveZuZNsa9AOC5PeoM1d/7c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=djttYE4L2HwRqmxg47721CyBhHdO92O/lkvEtGoayIBSCrOwQV6iVsF/5P6AHZw0g9nBThbjllXIcp6MEip9J/JcubXQj0dnrAYNhUdjrP1Jn4aNVpzEXrywfBgcuh3ix2eb0M2S3cMMfNPw1s8Gd8CLYZo1c5bI3HKsssik8VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=RE0Nqw9k; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753835159;
	bh=MSlCwx1gEE9AsSIwltpcL7wIUH0dl9DJ7I/zv5IelgI=;
	h=Date:From:To:Cc:Subject:From;
	b=RE0Nqw9kcjufROkpz27ymZSMU+o4YUvSdd5R0TITTjByUgYfAPi3OUeh6mgXylH6v
	 hQHLyXYFnjFMJkPaOYv69n93Mf86PCSoqJEKCM0fhz9DIAoUKU/ZgeafN7/w9IXXyk
	 mCo7L9n+iB7DctQRQNzeOk/vxasTcVpNlX1ecdgvPen54wbhIhVYIoCW4eWhEQ8UEr
	 MIOxA86hqrL4icnFTcbB3CO0GbeKAJpYkuknhCz4NnF2b2qd1qYfbJSLZLpCahjza4
	 Aj6tYTHckacQamGDdJ4bSogzbHWnXJVCPvlaqaehdydZhAMmZn+YcS9aG6rz3T+Xij
	 oeT+Q6CDpcI+Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bsCgC1r9Vz4wbY;
	Wed, 30 Jul 2025 10:25:58 +1000 (AEST)
Date: Wed, 30 Jul 2025 10:29:31 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>
Cc: PowerPC <linuxppc-dev@lists.ozlabs.org>, Vishal Parmar
 <vishistriker@gmail.com>, Brigham Campbell <me@brighamcampbell.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the jc_docs tree
Message-ID: <20250730102931.6334022c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+/tkyWy/rkEDMHrJaY+v0_9";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/+/tkyWy/rkEDMHrJaY+v0_9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the jc_docs tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/arch/powerpc/index.rst:7: WARNING: duplicated entry found in =
toctree: arch/powerpc/htm

Introduced by commit

  c361f76da696 ("docs: powerpc: Add htm.rst to table of contents")

interacting with commit

  19122a7c28ed ("docs: powerpc: add htm.rst to toctree")

from the powerpc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/+/tkyWy/rkEDMHrJaY+v0_9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiJZ2wACgkQAVBC80lX
0GyFgAf/e8O/qM6WHKkMC0MFGF2+dwbIDoaQrTn+Gz9GVqE/w/+4A3ObPaxNLivb
OilnG1b0HtuXqwfhMZ02wD2SpkaqNqs4a7HPVLFRaNjLoul4EjQcEcsYBXyYcwJU
mXz5ZLBMPuut5MJUrLHF3HnTIKp6ajtTgnJ3H54AnFVMo8cjI5G3lkTjaE2jspzI
CZNjygQA1QBNYyn8YGgVhf2eQBl+XunHkb0kSY7J/9/saoRyAPHYOz3EAzD4hsP9
cdCmAchh7JxheeJvvTjM6ju3ZIBff+u/Ff+zJmsfwEfAbZYU2IVFuFAg4b8Qenmx
QC53XTdsOIRtrvXZLpqybDZSUuf59g==
=zwVq
-----END PGP SIGNATURE-----

--Sig_/+/tkyWy/rkEDMHrJaY+v0_9--

