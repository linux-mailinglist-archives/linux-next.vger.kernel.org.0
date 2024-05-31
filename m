Return-Path: <linux-next+bounces-2432-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 782F08D5936
	for <lists+linux-next@lfdr.de>; Fri, 31 May 2024 06:06:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 909981C22C30
	for <lists+linux-next@lfdr.de>; Fri, 31 May 2024 04:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F14D828FD;
	Fri, 31 May 2024 04:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="hiSUtbAB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F0D187554;
	Fri, 31 May 2024 04:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717128393; cv=none; b=oDgfqVz0rdZD7CSATmXuAi94w1AXvZKAPw3kmTes5DKosabs1Vo/Wk6Fn4KuGwTL40sv7Fo8nafs7OS1aLClQYVcDWs/kuRyqVAJ35xllhShpkWTDw54GCYopT64rSAWcm4gkpP4iuDjotRt0G/yNnObHV8DfrLShJPEG3b6+q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717128393; c=relaxed/simple;
	bh=W/beC0Lg8hTQ0Cnsha9nLi79/0TKUBmSVnG3bl32q9A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=abRb1Lf58B8q8D0fEU2Hqr4uy5lEmiMDftJ8z0rbt+PxrkuGBg/lEV5B4uA2QARE1whQoOkmyk7/Jm1r3hlr2TGR4/ZegL9yr/hfAjQK0zkNrUUyUylpYFszkDlL6JzKgEBFe9HtvANFO7opJ5QuJJeh3O1oD1rtBuptNKxqZLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=hiSUtbAB; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1717128384;
	bh=3Jq2pWNDbbLkWCzZtS0M75onAxGRDfpRuDvRccdaAzk=;
	h=Date:From:To:Cc:Subject:From;
	b=hiSUtbAB/AvP8E9jJn0am81z5VXDryClE5+9MWz+eAOEkyHCH51gY4Ji7ClBRD+p/
	 Wsb6UFcfeLbzbPxnkZtWlM7kCHMxOiXLNMv/HIHI20BIW4pR334NSi+hWSOEpxvXqO
	 vfHr/rQXIxjVnXjuQuM4GvRJ4pYp8x8bbOq0KYwCaTNb+vGuPjYWP6ZCkB6YPBQ4fu
	 AIN18NoYJt1YyYCGTV+qR31YarPMIOHQ5PkP1LiqMnLIBau00DnKXMteZTzj10pidQ
	 UzKfc/ZPVoNmO4kdO0NlHvA/ZGk/X62oqQ01W4JwpPPKojgLYG0I8cpXaZiuZQU/ho
	 q0yCpG+8QIv6g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Vr8gh29whz4x1C;
	Fri, 31 May 2024 14:06:24 +1000 (AEST)
Date: Fri, 31 May 2024 14:06:21 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: Adam Rizkalla <ajarizzo@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Vasileios Amoiridis <vassilisamir@gmail.com>
Subject: linux-next: manual merge of the iio tree with the iio-fixes tree
Message-ID: <20240531140621.264f0848@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/77uBBWuWW74Vr9XPqBfa2ox";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/77uBBWuWW74Vr9XPqBfa2ox
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the iio tree got a conflict in:

  drivers/iio/pressure/bmp280-core.c

between commit:

  0f0f6306617c ("iio: pressure: bmp280: Fix BMP580 temperature reading")

from the iio-fixes tree and commit:

  d58479ff81c0 ("iio: pressure: bmp280: Generalize read_{temp,press,humid}(=
) functions")

from the iio tree.

I fixed it up (I just used the latter) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/77uBBWuWW74Vr9XPqBfa2ox
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZZTL0ACgkQAVBC80lX
0Gxoewf7BmUZwxfd7Wh6MEAwH514y3ObMGtjKDMPDw1H6bdKw/8duC50pAin2GDb
58kf6CbbTcfEoZyWr/iuMRWWgK5eBbvtEjPF1m2lE3OH8DdoE2qjafardJ0nTDN9
ULmrE4Som349wyLW56/75t9EaIBGFQumdFUD7UnGW+zrUWcpN1QnulN5Cm4Hbx7M
ILgOop7LdIq0vd7WFDGFd/q3zzrC/ddZGszxCXBJVR+0tmXK5Jf05dAcJcNYl56R
39nHus8z2lWgXefBEBl6tR0NeFywg3J7E4ze9XZROfScgJYlywhj5L1OKXu2OrE/
mo8xLDPys97X5gL80jBYyosMiEH3ZQ==
=fRZy
-----END PGP SIGNATURE-----

--Sig_/77uBBWuWW74Vr9XPqBfa2ox--

