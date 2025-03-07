Return-Path: <linux-next+bounces-5680-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC68A55CB4
	for <lists+linux-next@lfdr.de>; Fri,  7 Mar 2025 02:10:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C57C01884748
	for <lists+linux-next@lfdr.de>; Fri,  7 Mar 2025 01:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BED3614A62A;
	Fri,  7 Mar 2025 01:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="BdRgdTRy"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C80EAFA;
	Fri,  7 Mar 2025 01:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741309802; cv=none; b=mZCkr6oPbB2CgdSUhX9BcjBLFnv6surpbvy9vzB+T/jpqCSVL1Ia4i5C+zDITfQ8q7gmEKz+BIKQsWlU6nGbXKTw9Wvlv4bmA4YfK3uXObXeEloTzpLsT+BH2DwKOp1RBIxCUHBgrZdJQSguhmqVkxEI1guEx4ALgms40ARMRkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741309802; c=relaxed/simple;
	bh=kQHiT/+tnGAjHfVOupwlmJRVRsTVouIUcyIsswwrwzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lS8MkHwFBkYwloCwDZaFB1uCJgUqzx9OLucOB3VIsRlBEu9yu9LtBYMBKujRyoRJV2lCwCpF514Jk9Zop0I+D2SMfvw8YTaucctzeE4M9PbwIP/PbUYw8stfcgDE2QjVFO4yOxzIKduRMHtpsR+UkjLfTfYUUkcEAcPsRye8lec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=BdRgdTRy; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741309796;
	bh=BJ9FQjBK0iPM9zCWhA27A3nTc/CYXoM2APiu0/H6r18=;
	h=Date:From:To:Cc:Subject:From;
	b=BdRgdTRyYrCbHAlFXg8AovE6WI2vZfqis6FemK1c84GL5HZUuRI6yRUVlWuNNW6zo
	 egn9uJkXrFkAahoTQSfEthy9BHkXcb+DnD4xjYTbwinpU3tTwsrdNTO4jDkU+9b7Sc
	 +FPLRju5fI+hvzw2e7YaOrysL3VCg5wGnJFRy1zogv8124p5VtbZ3FYUIVbxN6PtKs
	 o5gwZyMX9HJ0ABNhg0jpeHlJ0Cw/1UcUtUlxHiwWIIge3A5c11VAHq9kRXfivDTlVV
	 QFJlSo27tKf2hQ1wSse8FsHJdZM21CGx7Mv/bvyJycVJG28D7mi+ZS4OcFDMYvpPei
	 9c84dh0TMGSGw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z87Vq2lVXz4x3d;
	Fri,  7 Mar 2025 12:09:55 +1100 (AEDT)
Date: Fri, 7 Mar 2025 12:09:54 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Florian Fainelli <f.fainelli@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the broadcom tree
Message-ID: <20250307120954.351dd8ae@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/B=r6jVDdyEw7VYbERN.W4G1";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/B=r6jVDdyEw7VYbERN.W4G1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the arm-soc-fixes tree as a different
commit (but the same patch):

  d0b7662f9a68 ("ARM: dts: bcm2711: Fix xHCI power-domain")

This is commit

  f44fa354a071 ("ARM: dts: bcm2711: Fix xHCI power-domain")

in the arm-soc-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/B=r6jVDdyEw7VYbERN.W4G1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfKR2IACgkQAVBC80lX
0GwqKgf/Vras2HyGkXQy8bLVkGjsZqBPaHc0hW+CFQwl8ZMBaKODtAbKzhcT7iUV
COIY2btPkafkZ1KgjJpjQHLL0aRtYybs8oGlP2ne9VWbrj6FODc9oppSnk7ceDIm
PX+eg93zbDEN99l99o1yPh12WcwOK+E7+ZaxRlA2OcgjpkWi81MdR89iAbjdEytF
/SaPM1FJgzY3QUBSYevG2mJVvipsmwTA23utc0wKIVmX0nUgfeqdYjDLkoT3w4bO
s4A7KcbgcwQSFB82+89gHhnf44fXGRVPpfew2z/aYS00EAJxzzq/3NErd2vgRBXh
Z1pith6W28hKPEz/0jHk5pRhOOtiHg==
=rEIt
-----END PGP SIGNATURE-----

--Sig_/B=r6jVDdyEw7VYbERN.W4G1--

