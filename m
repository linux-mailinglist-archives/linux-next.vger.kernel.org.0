Return-Path: <linux-next+bounces-2180-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E84358BC6BD
	for <lists+linux-next@lfdr.de>; Mon,  6 May 2024 07:24:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1DB64B20D73
	for <lists+linux-next@lfdr.de>; Mon,  6 May 2024 05:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7176B45944;
	Mon,  6 May 2024 05:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="sW2qDGXi"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A7245943;
	Mon,  6 May 2024 05:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714973063; cv=none; b=oB7tbphzmywqUhwxfyRIETQcEA74/ZOpT/+1YuFoObQqJOV84aEX5KzJAwZuE7b9GGjrrqB/UKde+rhZ3n9OyOuZ4rEp+1c9irbOKvOusqHirAYAQmy/0iFpx/OisTCnheEZ3nl040bhD2Kf65F09742hrsBafIPxLZCOPhlxd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714973063; c=relaxed/simple;
	bh=UBlWh/23IODwS+2dMvr646TNxHOQzNK+SPk/ihueHWc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=es3q5VC8rUvD2xwDoXZtz0OIGeF7KDZIYRp03+4Sgm3CqnduWpKnoLepWJo0VYJoEjEf8PlK9VerWU7cu2mcI+9S1C6ARRivmNluLvWwOTHyqju/5yuqUf47xX0ccBYHvmcrSXIUl3af64RmasCpXGcj8/4gLaqrAD8vgoBF28g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=sW2qDGXi; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1714973055;
	bh=hTUeAv5BTJ/MJHhy4rjYFYf8xGyzDF2d8lljtk8bEu0=;
	h=Date:From:To:Cc:Subject:From;
	b=sW2qDGXi9QdY0SvemypWzMuEacRKShoQGEWkzHnaDMjXzKdVIEGFWhZyVllhIwaAg
	 vgJmAPsI4VPNoss6BVAwpWufTjC2klTwF1YtbvTvf9Dsch4OGQqki75vZZncyyxCJ3
	 8IIFQQqsL8xCvoexV4HU1G08FkZCToT0HLL1i9tmqqPtQPRpXlmHWCUWKeVMgiJiyJ
	 HB/LWyHTD3pmRYrzkfOlJrWFpgRxPk5LjlN+653CDN9UP1nr+gvlhkKxZ4m5JDsK09
	 WGAKlI2hwk/fM3kEeIcHRFH+KzPhviA2vdUu5O9wQFAN3OvGWgchr0MDe7S4sREZZc
	 E/oaE8Ov92h1w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VXqb335wZz4wcF;
	Mon,  6 May 2024 15:24:15 +1000 (AEST)
Date: Mon, 6 May 2024 15:24:14 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the slimbus tree
Message-ID: <20240506152414.5796b14b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/i2haGHiHsfIjUkqnIKBknj/";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/i2haGHiHsfIjUkqnIKBknj/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  b12bd525ca6e ("slimbus: qcom-ngd-ctrl: Add timeout for wait operation")
  772be93c1c24 ("slimbus: qcom-ctrl: fix module autoloading")
  f6c637ffe528 ("slimbus: Convert to platform remove callback returning voi=
d")
  5e8e32f81813 ("slimbus: qcom-ngd-ctrl: Reduce auto suspend delay")

These are commits

  98241a774db4 ("slimbus: qcom-ngd-ctrl: Add timeout for wait operation")

in the char-misc.current tree and

  35230d31056d ("slimbus: qcom-ctrl: fix module autoloading")
  880b33b0580c ("slimbus: Convert to platform remove callback returning voi=
d")
  4286dbcecc3f ("slimbus: qcom-ngd-ctrl: Reduce auto suspend delay")

in the char-misc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/i2haGHiHsfIjUkqnIKBknj/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmY4aX4ACgkQAVBC80lX
0Gx4Ewf/ftkARfrgdI56coLCzQcLroDvX5zcxGn+x6AKRmoEGo4VpAsiMeZjbrsn
+mDBeBPUv2ptL9if1KSFHPS2ezEi7hd81QEUqKBDkuviknKJKJsXKhcLMpTsP9jF
cjoGJDKZ5S3bSiX8qOl0RaoaSsCwuDt0BXpiWjyWKl2BorSFQpXAVAXZ/ckD3ZG/
1YyG3XErnKiKW7yMtU5UI2m3Y/Fng3onItJmkfK/hJdka4fvQk6Qr0IZOoZa+jAX
YYH4DnlXHU9N5doi1L2dD1BcEbUhuMgubepSuanZ3c6Mx0TE1fbJA5se3g+gyAzt
dAtyj1OSuGFbtnI8VB5LZpw/5i47GQ==
=D04Y
-----END PGP SIGNATURE-----

--Sig_/i2haGHiHsfIjUkqnIKBknj/--

