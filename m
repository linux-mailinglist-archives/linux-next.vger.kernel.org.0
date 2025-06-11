Return-Path: <linux-next+bounces-7138-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EC331AD54FF
	for <lists+linux-next@lfdr.de>; Wed, 11 Jun 2025 14:08:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 686E0177225
	for <lists+linux-next@lfdr.de>; Wed, 11 Jun 2025 12:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA1A72797B1;
	Wed, 11 Jun 2025 12:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="I9svWKK5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E219278162;
	Wed, 11 Jun 2025 12:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749643654; cv=none; b=GJzHgqL1BVGapG0ZQmI//Ym7bxhwXLd/k2q74p2W7UpjIcPpCSaW5Vr6GKnj+ldpP9HUMKo6bzDNuZkjenlWHKKxMVfSPLKOvrDbTAUx9r1GK8KsfwRKKcGqHEB+ccbO1/2dIcKJq0gSQ4xfd3ufnmiXhOnLKwJ2NV30VZUurX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749643654; c=relaxed/simple;
	bh=5Roi02y6IfRbKPQXUhxZ8fzNwWGkFjgICiADM7X+jGw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mhK6aq4UYO7Y60V7ZD2+Erpike3nrsWrtviUGe+Qpz2cjcxCkvUORPsTpiX9gopb6VbjlPcqRJfD3rfPxDZvfEv4U6EPGIv2a+3+z5HEyvjDFuL5rPUCQXoYfgWxsdHANyiQAlkBC8kx90bbQZe620/YOI2ti2nviFIl+JrPc5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=I9svWKK5; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1749643647;
	bh=xAFewVtQsZ8bZ2CdUYUEhlfIIVlVaF9OsCXHFG/ouvM=;
	h=Date:From:To:Cc:Subject:From;
	b=I9svWKK5BzDeE6SsRGMfnFZHNZ7wvHL6MEtrFpK/n+wxt9JvN59XOf0+CcZomFTi8
	 HkIxkVKi+USauZ1J4DGWz79peOM2mP7K33FFITsM0IITYCdxJdmYDuc49uN1BIe+BX
	 yv+oYLsSxIjwdRElyJkEJuNVhaj+H5tuvTogEk3dB/NjSAliwFi7TeQoVkNAxnsvf/
	 zE1KhHTh6Af6oAD/+XuZqPHRNysyuAr8i0CYUstUaVmUI3d8N/dPPAUqliSw++b5h/
	 NYIr85LmV/bzEWpXuBc9Hk5cCcF4WHIjnpDWbmNRMfpqe31hH5jXVmRNwJ290kM+H2
	 coTcvLRXjeprg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bHPYC1yRSz4wcr;
	Wed, 11 Jun 2025 22:07:27 +1000 (AEST)
Date: Wed, 11 Jun 2025 22:07:26 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the tip-fixes tree
Message-ID: <20250611220726.14adbc09@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IhvPBCpTkvTma5F/3ANhTVp";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/IhvPBCpTkvTma5F/3ANhTVp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  3b7a34aebbdf ("perf: Fix dangling cgroup pointer in cpuctx")

Fixes tag

  Fixes: a3c3c6667("perf/core: Fix child_total_time_enabled accounting bug =
at task exit")

has these problem(s):

  - missing space between the SHA1 and the subject
  - SHA1 should be at least 12 digits long
    This can be fixed for the future by setting core.abbrev to 12 (or
    more) or (for git v2.11 or later) just making sure it is not set
    (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/IhvPBCpTkvTma5F/3ANhTVp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhJcX4ACgkQAVBC80lX
0GyYagf/VDPdX3QPBabQDByQfkxoN/OC97r2Y+XZbYZFu/GQNrnTZw6UwuHRyR4Z
AVA3a756Sk2lr9IJYD2otQKHKEEtFNjgXQGNbphV6jbvOj7pvHmjXE+2+LAY+tfm
hOdcV00wxk+qGafjuE+UdqvehA4D7dZPXRENYy1eSQt8Db0EGc70SvraKw+wODv0
aPrVgGP9Gi1FPge46kbdJ6+4oPWzCar4zrtanxRz93g1vlYSoik5KfG5ukdZRUK2
X67E99bHgcwNmAiFrQKeNNNfymwBWT5dCeMbw8zhLs/9kKD/myP5DDZRjYn9Tc93
AJWdPKRpd1jjF8OCgMIhvdJZVncQMQ==
=hEYK
-----END PGP SIGNATURE-----

--Sig_/IhvPBCpTkvTma5F/3ANhTVp--

