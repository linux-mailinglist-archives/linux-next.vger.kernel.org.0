Return-Path: <linux-next+bounces-8875-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B0433C39126
	for <lists+linux-next@lfdr.de>; Thu, 06 Nov 2025 05:16:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 46D194EBF6B
	for <lists+linux-next@lfdr.de>; Thu,  6 Nov 2025 04:16:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D49E1200110;
	Thu,  6 Nov 2025 04:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="llcLsLYU"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C81F23FC5A;
	Thu,  6 Nov 2025 04:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762402572; cv=none; b=GABs64J9KJA5cnhMK/1/r8iPQhg6YbIUbuk7aNLralx1t/RTSx8wvbkaJGJHfZOTtWUaBQEe9zJmZfEePSqoX7VGYydzTTD3W6wOvJmSiM8aAGT2nG8HhtBa82TUH2XRM3oU4aoR1xHDy9rl9dNOseoc5lmeo7pmH67Rrco2c84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762402572; c=relaxed/simple;
	bh=z8r0/UHrCAS+ggl8iWpv5mb9DDQ8Wn1uBKaa8kiQZJc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=JSj8UhbZ/t6GDw8bolaKhXcDhofKEBoG+v2MVhyxe0gaUzvvslc2CA6HKPPW59X0u3XvyDmHavVNaO378uNQYvLqTCh5aawKvW14vagnznouEx3l9z9S+NpcZuVoE2NT5UHipmaBfFqqgbKOzrt7wHB/tt33ed6QR1i4ntdT3C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=llcLsLYU; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762402567;
	bh=xUu6wEpn5sykkeo/aZJ4nU3VopqW/04iob6Zy9wGR00=;
	h=Date:From:To:Cc:Subject:From;
	b=llcLsLYUv945sDAofkRoXL2+laBArzuXp/6WcbXy7rwoYThWoBmzf1GreeM+EjDQk
	 zUAqyXVIVgviV4VeuQiK1yXqm17p2QHDF45CJhC8sKb61Je+OQSqdk0l3l8VDBVAhB
	 NXH/m6EFMgL0qkFqsw5aZyapRy/qJhQqyfQmAHdkXn2SqpN6R4oTVPg7TJQMF2Uej1
	 AmK99kCPSZzJnFEHYJWliv+D5arL8vIl9C1MN8CIFFQSgF92+zesT++l4ofDytIXMw
	 VQmUN4QsREGlq/ls5vubhrMqJBUzGjfoEnE2anHIxsBf0WLeapHvPE88pwrzuFw7Ex
	 7xVFT7n58jBcw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d285340bNz4wM7;
	Thu, 06 Nov 2025 15:16:07 +1100 (AEDT)
Date: Thu, 6 Nov 2025 15:16:06 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Matthew Auld <matthew.auld@intel.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings in Linus' tree
Message-ID: <20251106151606.0b5487ca@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LCKl.SxW3=o/IFaQjzQm06o";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/LCKl.SxW3=o/IFaQjzQm06o
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next build (htmldocs) produced these warnings:

WARNING: drivers/gpu/drm/drm_gpusvm.c:1229 expecting prototype for drm_gpus=
vm_range_pages_valid_unlocked(). Prototype was for drm_gpusvm_pages_valid_u=
nlocked() instead
WARNING: drivers/gpu/drm/drm_gpusvm.c:1229 function parameter 'svm_pages' n=
ot described in 'drm_gpusvm_pages_valid_unlocked'

Introduced by commit

  6364afd532bc ("drm/gpusvm: refactor core API to use pages struct")

"make htmldocs" was not reporting all warnings for some time.  This has
now been fixed and these appeared today.

--=20
Cheers,
Stephen Rothwell

--Sig_/LCKl.SxW3=o/IFaQjzQm06o
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkMIQYACgkQAVBC80lX
0Gx57Qf/R/Qdzd73oQZ+2X1nK+0X8tBkPSjTyERWg/G/W7/ehu7yDM+JWBz7fONI
k6La/mMLI0IWmvosY50xh/F1aqiJTTEvYOQ5OMqhi4xv/gHVzSV9X019CkV/ok0h
4hRHAZdzyXtWfz8k+IPxWs2VQYThxPaMj7uPqxNeRjEI0/Hn3Y8oDkWDq0MZIVa/
ahpCkV1+gyWr7kVZkYsz2My3vW8p03Gw1Fecn5NIVIu17PYOHxliSi/vTJv5Y2lq
UnMrpMHkG0KguV+oNhrRYUadJi0uI+yF00g2tp7nsGJn5be6cpPpJpCB1DWv65EB
z8lbfwqt+LDTIuqxE0rtwyLjYfiOEQ==
=KKYG
-----END PGP SIGNATURE-----

--Sig_/LCKl.SxW3=o/IFaQjzQm06o--

