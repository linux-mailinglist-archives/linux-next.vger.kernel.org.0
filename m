Return-Path: <linux-next+bounces-3302-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5352E94FEAF
	for <lists+linux-next@lfdr.de>; Tue, 13 Aug 2024 09:24:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86A231C20A55
	for <lists+linux-next@lfdr.de>; Tue, 13 Aug 2024 07:23:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BD0E3BB32;
	Tue, 13 Aug 2024 07:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ssLhi4jI"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A6F77102;
	Tue, 13 Aug 2024 07:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723533749; cv=none; b=rDsTzepPbKLQLX8SPgdJlVrIgo4UHGGcN1BYE4lgFmZ7MJJzDeG08sH9Yvn/id9Xn8dO7hZilv4h6wyKzgjcF8eeH8VGM6BhervNuq0y6EgtI+mbkgDJhnLHlM2lFYWi4TYUQ/Zm9wExVjEx23X3f8M3dI94qEIrdzaIozyyGdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723533749; c=relaxed/simple;
	bh=65n7sQOXnHbixyzOt3UwlzWwiIz9VctCqm8ZyJMHicI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aZY4tmnxaeoqO11xBZazFfPsDb3cobQiGh5nPbGuAcEqNbWCoWTKUIprzdT2cYoXYtFyKeychQz9gErG0ySGiAZjYNVbFD2nVuMgBCAckaDKyzXrL7zS/YYJq2JShqju08peIPvWjvNjwbgeiV4Y7nSDzpNHdb+8gMVK7S4aEoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ssLhi4jI; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1723533742;
	bh=ewekOOaHzIbDs/eFE+pez0BjMVr5jCRSpYioX75FkkI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ssLhi4jIBRf+fE3l4tNUyHphAibl4qSJxECDYYxF5PtiustkQmufmr4OF7CxRcEAm
	 5C+Chj61UjkoNk/97Ca1Y7E9oXLM02UQDW+a1LgjG93HbNDUYXNMhArqBRfmUPJ/Dq
	 QMHyiG+eOumZrVBOAcwAWyZqWFuHPigOSAPcBahKNVKWd4Us8IfodDg00DO18DZnfR
	 naZ+uTGu9HBVGKSqI5zmUMgsTmCJ9C6pQIOGnglQ887AoqCLzzXR/LU//lTmEBulEM
	 eexImqFDCe8kM4nd3woADIAPsZzrr5G2+3P74nm0KqIgNODCPUPguHrzIFpbBFhtJb
	 Ds55HxpEHP9EA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WjjWf11KMz4xCg;
	Tue, 13 Aug 2024 17:22:22 +1000 (AEST)
Date: Tue, 13 Aug 2024 17:22:21 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Bhoomika K
 <bhoomikak@vayavyalabs.com>, Pavitrakumar M
 <pavitrakumarm@vayavyalabs.com>, Linux Crypto List
 <linux-crypto@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the crypto tree
Message-ID: <20240813172221.21aebe0a@canb.auug.org.au>
In-Reply-To: <ZrreN8P-WO-DsM5B@gondor.apana.org.au>
References: <20240812104235.6eefb365@canb.auug.org.au>
	<ZrreN8P-WO-DsM5B@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xbGJEteCAS5dLRGDKaaNxem";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/xbGJEteCAS5dLRGDKaaNxem
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Herbert,

On Tue, 13 Aug 2024 12:16:55 +0800 Herbert Xu <herbert@gondor.apana.org.au>=
 wrote:
>

> Thanks Stephen.  I've applied your patch but I kept the macro but
> added an ifndef MIN around it.  This way it should work either with
> or without Linus's patch.

Good idea.  Thanks, one less thing for me to carry.

--=20
Cheers,
Stephen Rothwell

--Sig_/xbGJEteCAS5dLRGDKaaNxem
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAma7Ca0ACgkQAVBC80lX
0GycIQf/YBhOBBqxjg+XCjRX4kLLZBoVXFXaQh3rWBwZl3Iwrx/P/dA7mBPrYWrw
L28bpG0vUQf0jSIPQtS39SGybteosMm7Fm7IdAWO4HFtie1ik0tbvIjwsw4WcY0k
6EnYmsPOlIwXJ/cv/ckjrOGsIRNjuima/5YilV3KrRSrrti5sEaJcf+8FAmU9CAT
CcKygXshAR/RgPNm5EMNGpeav35McDBwwEBvsc87uwjP6mESCSdJzez4cn1oZXBO
K7c0GHHQsp434Lhpbyao1q1jqaI1kkMF3tM7+Bo7vbwwNHt4Hn1iaH+rsAlSBmLE
0UZp97yarJn1iZJ22Zjkd5efW8571g==
=CnqU
-----END PGP SIGNATURE-----

--Sig_/xbGJEteCAS5dLRGDKaaNxem--

