Return-Path: <linux-next+bounces-2509-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C64902FD3
	for <lists+linux-next@lfdr.de>; Tue, 11 Jun 2024 07:18:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C48601C2342F
	for <lists+linux-next@lfdr.de>; Tue, 11 Jun 2024 05:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40AA0170838;
	Tue, 11 Jun 2024 05:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Wbrbn+Kv"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8698C04;
	Tue, 11 Jun 2024 05:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718083113; cv=none; b=hy58aRiVqiBG9uD1k3YOas5T2XBR6I3avdRiLmuSen2iPNK08bnKpZxHrrJjJ2AeP+Br8HPy+B8Q6mZ3V4rP4/e/xe09AS3KeXbKFsOn878/bnLXcXMei6Xux4oofOeLNAO/SYCGYd1iIjUfpdbUUO5rk+uYpAWToqB2WnJp5DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718083113; c=relaxed/simple;
	bh=hxIzNsI/4HZB+box96h7x/1yVdI1GpGf7t7URJ0loGU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mshWIzBMw+dFuDbSbU+GkDFngkMqfviwark/4qEMJvAX18I5HKDTxK7+OnBLxxkegXz6qnaUJjQt6/WLn++e6JW47pkiE+ZGrT+Wcg3CZMSCXAEgiywWaEGs0MdC2QF8Dvon1A3+gqJL1plau1dzOsDcs5nwLuf0jn80SPFBE0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Wbrbn+Kv; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1718083107;
	bh=nJ0V5If3rTGQEPhOZbB6hCYkW+fOL1CffbrEfeLVsBA=;
	h=Date:From:To:Cc:Subject:From;
	b=Wbrbn+Kv4nvN93fm1S9CoZvbd2TKJGuIsPZPmg84K1Nm9hSi7Gbmt9b18DFYnyWu4
	 NfE4z3u+IwHjMUB7/QnrnCQB5+j5YQgMueWgc74QA9hJZNmXlHHtKT1Ydp0dufTBaF
	 sksqDeERv/c4LQjDB/epIjWRgca1cZuGJpROF6wSfiqBaIh05musgmLv21ppOxkjY4
	 AuDuj+/G5raWbqtjUn9ZXMgPE/t6qYv7ld/0erQ2r2aZGw2e0oAvE9wvxlhFhxmHqI
	 U96GBsyEjrHXyCse9M8d8CGnc5bspK/TW+fm4dMlpi4DBOpiNdTP+4c6V3GqPMS4Rw
	 0JZeG5W4NPxCQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Vyxlj6kMdz4wb0;
	Tue, 11 Jun 2024 15:18:22 +1000 (AEST)
Date: Tue, 11 Jun 2024 15:18:20 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Ke Sun <sunke@kylinos.cn>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the iio tree
Message-ID: <20240611151820.63a404bc@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CfDRsgY6wqNZTr1oTBWixvQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/CfDRsgY6wqNZTr1oTBWixvQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the iio-fixes tree as different
commits (but the same patches):

  f8a5217d06e2 ("iio: dac: ad9739a: drop COMPILE_TEST option")

This is commit

  75183e461ce0 ("iio: dac: fix ad9739a random config compile error")

in the iio-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/CfDRsgY6wqNZTr1oTBWixvQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZn3hwACgkQAVBC80lX
0Gw/Pgf9Gb+2AWqDNDy6wsjFfBsw+Ffab2no/Flk4R/RRQTW0bFdZnT8znnnYykf
Uub+lZjdVlZyvxn4UNNQn0DHJ1Nr62a4uoLCC/Rh9r1FoV0SG1HcY3xSvWDiLQ0d
hbSK7gOeWK+Ac0AgE9tue4EAUHwq8JczGpsvlAHmwH9dBE+/reyOytzJaUJpud2B
0lzhlwrtRoWiRH1uSk8E5tDOWetmzX56VXXSlWzi34IiU1vn/o4LyuxmSWrO7/IP
JkDhRa3EC8YR15NIZp3bNflARtsoc4OBCysSMs5cnlDYDd+w45opAPH5/LJjw0uN
LwKEXGuVMdRiLnmSrelJ0txcG6U83Q==
=SxQn
-----END PGP SIGNATURE-----

--Sig_/CfDRsgY6wqNZTr1oTBWixvQ--

