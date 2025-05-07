Return-Path: <linux-next+bounces-6562-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5C3AAD40A
	for <lists+linux-next@lfdr.de>; Wed,  7 May 2025 05:22:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D7001C00D1C
	for <lists+linux-next@lfdr.de>; Wed,  7 May 2025 03:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C14E5139579;
	Wed,  7 May 2025 03:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="OeFxs6Sf"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F43D1B2186;
	Wed,  7 May 2025 03:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746588174; cv=none; b=r0uVhJ+UJuWa9PDXaq0VD/6ezzn2Rww+kpHbj03p8JNzBMydKlrUgAF1Rz5LilJxVb0GTholH0ZBscgyRNfrg/g1QDbhkJnOUo/NVvFXfYq5wp5qTRQ1oRWnQZw7mC1/jq72omoraH5bVAoK3P+tQGbVbbQK+8N6VWcykyqTnOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746588174; c=relaxed/simple;
	bh=Qe44C1hO1Dlz+QljxSDs/x+tpr6AeSvmXU53b6tgHuU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=onf2k6ht/6vxNfPVcgMclws/Qt48/alZBLKH/G5ng2JG3kOQoywJn0DZB69fjL5wD1v/44Kjt2cOEYHNJcxXLeiq7O25XNtQDTnGbv+6VIUE0n+l34oM3PJwXJepxRuI/xEpTImZudtTheq5Mvsjf6xeWUqpDuwfmLnekS4eypE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=OeFxs6Sf; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746588169;
	bh=6+LdfxC5RdXId8MeCoah2zhCj8ioo3EpL/mIC9q/ayo=;
	h=Date:From:To:Cc:Subject:From;
	b=OeFxs6SfZWx7dYYwcg4md4FqsNCgjAoKpkfNWasxLucr9At97zRLcr+V/afysgBwn
	 7xSPgTv7y1/txi6ZMgZAJLjz639mOm689iF/SSWIZIlc0Gfv+wfipy50lIKG7mk6uy
	 521yZuFHcTnYDi7sO+W8Yv90G+9coF2YszvQTEi6iBJU5Igj7cdyMTfztZUxYQumHu
	 2cG6Sm8s0C5k5TII9uhcfvPldjy54TZiK6KycIRiBPq9SWEM5wPusXHLR2HKVqf6GF
	 gCXheokuoReoFDB9vAPqcYbtRV7S+TQENojhZ8ih7JV8xUSTho4wF9IOTaBXSaG08Y
	 0eb4CnDbb00aw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZsgZ044pNz4w2H;
	Wed,  7 May 2025 13:22:48 +1000 (AEST)
Date: Wed, 7 May 2025 13:22:47 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Richard Weinberger <richard@nod.at>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the tip tree
Message-ID: <20250507132247.3e3076e3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_N6MCupcUKe1ZPJ.nIa5OE7";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/_N6MCupcUKe1ZPJ.nIa5OE7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the uml tree as a different commit
(but the same patch):

  48199713a6a8 ("um: Use irq_domain_create_linear() helper")

This is commit

  7633b8b1e793 ("irqdomain: um: use irq_domain_create_linear() helper")

in the uml tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/_N6MCupcUKe1ZPJ.nIa5OE7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmga0ggACgkQAVBC80lX
0Gx0LQf/ZWR+efCwg4BX9JMArEQvNLr335hWrELqWdW70btQVNer/Wq97JczzOC1
vkgVOnWZjoZt5HVCmZOntF2GCrAKzk6+CrgjXkgiFagQa87dE8PCPHR2G9ezwPgT
vjxw5GO5ekGhDYl9t3ySIvwXjMlDot4tRk2Krvswc2/GDBGU/W9M9jFE7KKS1nad
hHZJHiZ2qKaLTzqATX13vrCkZBmr4/D22L6+ixIA9fhd/fApoVoa4cdKp7vk4Lgx
uEAwP9J9t2mKQ1JWJjBk07x7hQC3pk/t3uZeyMFnVeZM10/AqGyjz1plCneJpAov
I2gxHLfMcy1Snpy8TucfL4gRX8tAGA==
=2Mvj
-----END PGP SIGNATURE-----

--Sig_/_N6MCupcUKe1ZPJ.nIa5OE7--

