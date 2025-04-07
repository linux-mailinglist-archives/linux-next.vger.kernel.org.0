Return-Path: <linux-next+bounces-6175-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8513AA7F18B
	for <lists+linux-next@lfdr.de>; Tue,  8 Apr 2025 01:59:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E830B7A4B96
	for <lists+linux-next@lfdr.de>; Mon,  7 Apr 2025 23:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FC681C5F06;
	Mon,  7 Apr 2025 23:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="JxOBTACx"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA3314F123;
	Mon,  7 Apr 2025 23:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744070333; cv=none; b=ZR9TdY2aPPtW41fa8tFqd8VjML74QAFPFopHw3PeNJ5pDs6ccg3yEszJ48fy6TckYkVOAzvekxQlvYQR+Whckdz17mq3nt2zwhWgHyfWUyxRYPyjPTDzUSxd8yERGQOQbfDvmZyAw1qX/BwW5jkk3MAWFQv+MjKiewl0ftzSdj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744070333; c=relaxed/simple;
	bh=uiy2OmMU8PLT3kHqxOZNBjuXy5CRQaTqhVlYxOMTB5A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=JxCFhdGpoQqkvRBoxBuNtLvu7sRKOL4A5X2JrFaYfzgm32AJZ+7/vHA428bkPZub1y3Rpt1EffgRFimMMNRD+/5WlPS5z8mWlcGALnK3djk70VlqHHfGkQ06ceJXu/7rbNNPcK5LotSbHoSH5xHH+GfdHQlmbOKAQ5S0S+8hsEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=JxOBTACx; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744070325;
	bh=U9DpWsV3eaR7hzXy7iqaRb/N/5grlljJth/VtH22R4I=;
	h=Date:From:To:Cc:Subject:From;
	b=JxOBTACxBSCcg91sM2HAHc/TnYyBSkFoYfHnjKmMpq47ICZ2uwFCQSlgL7lKB96yP
	 UmSj3sRW/QpPSRJg3s71r1nln35u5Q/Pan/+CNVZ1Aiuiw5kLYTOKtmWOL0bc2UOJO
	 CsxZzvwQwEUScRHgMu4Co7syWnMVKhHcq6DccnQSJs6vW3EmncPXhmaAK7ckB6vGKg
	 c1YqUFoGQQRvb1eN6tBWkRCKmxIXSXFypZwYjV+wttGhMC5HRmI35qolgKGmJogweJ
	 RsCy0EKXJS84r/smJYD0wmK42/vdoCTd24N3NEVX6x6JgHT8SfM9NWH4O2lA8821Tv
	 JxlgzYgPHa2Fw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZWmPx0y1dz4x2g;
	Tue,  8 Apr 2025 09:58:45 +1000 (AEST)
Date: Tue, 8 Apr 2025 09:58:44 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Brady Norander <bradynorander@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the sound-asoc tree
Message-ID: <20250408095844.29c9e584@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rM=dx1DF4P2_yvQvX5OTK1j";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/rM=dx1DF4P2_yvQvX5OTK1j
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  2b727b3f8a04 ("ASoC: dwc: always enable/disable i2s irqs")

Fixes tag

  Fixes: a42e988b626 ("ASoC: dwc: add DMA handshake control")

has these problem(s):

  - SHA1 should be at least 12 digits long
    This can be fixed for the future by setting core.abbrev to 12 (or
    more) or (for git v2.11 or later) just making sure it is not set
    (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/rM=dx1DF4P2_yvQvX5OTK1j
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmf0ZrQACgkQAVBC80lX
0GzqgQf+LTFraCC+qJ6kIgqiVfCMZZE5zh3MpDy6RWTIBXb2PqKAeISOW45o3rhu
wTxENnqqVjQbIXnofxJZ/1wgw68vTLodJCxJXK3lda3gt+bVIZ636ccStS9K7+Bz
GnP4pVt1k/GHashrNf7UC4sJtWRi6bXRJzxGNTKbn25W7Kqmo/nh8oxMd1jP7N6F
l9cSFf2o7XYwPqFC0aRWDvdF09H4uBHDzKAFbKqo9wUL3i9Yj1QfG71z22DVYeR3
Sq+aKDyjknzSMauw/U0zn6qfw7P9eFRrBBlGG8cEmGQlg9IG/PQxtj+m9w7FqON1
wUsTyy6VhkWBZiS47HmPTJ5NOJFQJw==
=5rIB
-----END PGP SIGNATURE-----

--Sig_/rM=dx1DF4P2_yvQvX5OTK1j--

