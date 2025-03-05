Return-Path: <linux-next+bounces-5662-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 798A8A50D73
	for <lists+linux-next@lfdr.de>; Wed,  5 Mar 2025 22:29:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C26821889C86
	for <lists+linux-next@lfdr.de>; Wed,  5 Mar 2025 21:29:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C5021FCF68;
	Wed,  5 Mar 2025 21:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="jjIPGKBj"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300D44A33;
	Wed,  5 Mar 2025 21:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741210147; cv=none; b=twc9KwfOwU5lg2rgJTpxZB3M0/HaW16worvexP8s9VLYyF57tuW75xDlzdAoSmBREY1l9jWptqnrfvRnKsoEAHjtJ5VXXJcwFO6DbuKZ42hY7wTTTRjYj+1B+RHZywMKFhPd0brSwl1d9zYsE7pQbnYJ8tZPVydKnJyZ7ZaNaRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741210147; c=relaxed/simple;
	bh=/ycZifpoYMGgo/OTBukQ+iP6eovuaxiykhHZFk4LjZI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nEQ0JNVh2i4IOr0OTJABJ31tAgVWj4F0wN0YJUI09ei6Q8o4U+T+hGEWBN3kGINoDRfOygppHlPTF3c2T2k4vZ8jYfBQRBBWiCxTCr1SIxxR5p6K7xyhA18czlwPLQRC1vXwGO2LVUxtp7CVDzmMYBY62MrkBHGG2aRXSAwynN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=jjIPGKBj; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741210139;
	bh=fTM49q2nvit5KrqOcttP4Ikm3g+mm+rVMbFiSBWrKEw=;
	h=Date:From:To:Cc:Subject:From;
	b=jjIPGKBj6+NxKLjmlQ2dL5N9Y3llH8j8drNylX504x9KxpYatN69BaVadC8omZcZM
	 Bs0PHKnMdc3oqtHseC6RULchAhP0P9p9ZOf5U5FBsVJukth/3q8r432C8YbTp4wGi4
	 znS0BVF8s1c8qmPVtw0R3IpFjMJ3fdW7oU305O4+Fw6dySzA3WELkvvc2hrMc1F8Ip
	 nO6i09dxc/Sby1lb1XzXCfpMs4+hm9OUfxdhzgl5TGMTPwV4mf96SN71bkJodfFKno
	 icgqB49fGIHHwTGLUGiU9UvqfUDO7SPR2KdbvQgYpHSLN8qsmn0jcCuXuPKVAlUVK6
	 3HnL/RjdSJc1A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z7QfM54Yjz4wcQ;
	Thu,  6 Mar 2025 08:28:59 +1100 (AEDT)
Date: Thu, 6 Mar 2025 08:28:58 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Dhananjay Ugwekar <dhananjay.ugwekar@amd.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the pm tree
Message-ID: <20250306082858.70e08bc7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PS.9gjzTPLJLeOQDqpFdF=D";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/PS.9gjzTPLJLeOQDqpFdF=D
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  f6c0b7602909 ("cpufreq/amd-pstate: Fix the clamping of perf values")

Fixes tag

  Fixes: 305621eb6a8b ("cpufreq/amd-pstate: Modularize perf<->freq conversi=
on")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 620136ced35a ("cpufreq/amd-pstate: Modularize perf<->freq conversion=
")

--=20
Cheers,
Stephen Rothwell

--Sig_/PS.9gjzTPLJLeOQDqpFdF=D
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfIwhsACgkQAVBC80lX
0GwF2Af9EjTZlHJRCOO+yyPWq1a7EaqU9KRW0iMADcO+Y2u8LXJDBGAgzTSo8KNM
HD4BPWrrPsRuc6AqDPmmUp3yGP7oyaz+YwVk8jZqg0QpUNGCardiVjxhypIdTq1+
CnG5Xb/h59YTRzkShGi04FtKUoZ1QAkTp5HL27KAONV0vjX08vgyD+phIhog/73v
xMrKMCX7dIiE0ZCiOR8yMsdicedqCUhz64+aToYkqBrcIS9AlXnGiSG4WFoWGSX5
/Ytso7fqoTRGSrhaCypaZIH794fbZLzZSHlNSO1wwjwzzoNFkY65OoYMSMs2c8ee
4OKIrD+VhjCmZgJfD0UgtJy3VfnN6Q==
=bY+W
-----END PGP SIGNATURE-----

--Sig_/PS.9gjzTPLJLeOQDqpFdF=D--

