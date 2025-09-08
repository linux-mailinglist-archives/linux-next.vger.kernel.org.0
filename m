Return-Path: <linux-next+bounces-8228-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFE5B48668
	for <lists+linux-next@lfdr.de>; Mon,  8 Sep 2025 10:08:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CD9C3BA5AA
	for <lists+linux-next@lfdr.de>; Mon,  8 Sep 2025 08:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4D762E7BB5;
	Mon,  8 Sep 2025 08:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="DCno8bJ2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E045C2E7F22;
	Mon,  8 Sep 2025 08:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757318884; cv=none; b=sqd6J0g/RvreV3QoYrQHbpfpUGIQ+I8pLpUqI3Vzalfwp7PSr8+W0Do3GF36g3yHRU4VBqPBqMEsVOOL3bDcS95HI5fYcF1MunHYs/ThkXMkIE321Om7reexClwMK8Jjee/WvTQe1yVoWxuYEZqFfOA3//qFSXo4h7ht+5FFeIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757318884; c=relaxed/simple;
	bh=rdE1nQws9HsRgT6VvYs7TCQifPpxeWt+Lqas+E2f3QY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dWc8/MZwE9kjf8+6eQeir7JqZEXUChxVAJcFgtrGjtNzZawXJNlQVS84qCniwIw/Rqc9mj7SY/7CwP/MzGVkR9+u44mYekF91HaIfCcwugEK7l5U5BfumCJyV2DDkTC1mMBeMh8xyIDgIW8UBELaE6IWjx1Mitu+aMcntNqY1fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=DCno8bJ2; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1757318880;
	bh=WqyneKxOozJoorNMR4vR002uWwP0Kd6vyi3ojX2RdGI=;
	h=Date:From:To:Cc:Subject:From;
	b=DCno8bJ2VOuImXe6/BVIIgdsO4oC9l4thRJYvDtU/a6BDp4FwcZwYY1Hf9NesH94e
	 kKZR2zhvC+nsG7vGJArxgFaZmIJSPySBJ0OSWN9vXtZJeie/JV+C0zmJSCAhueXpOC
	 Zh5DLK7ckfiSd2qKPVXhDN5+G1xTVH38MJvsJMiVCm67/owsEBA/EJ1JE16fRPZ1KF
	 DB6A+y7a0GkEDP1pbm4Qxfeu4osPlf0yAYbtuzEb8Dhp30nw4u/W2TrG1ByjPQ8xFt
	 sKeAeZ/VCJODbcQpqKpTZFkfZTvzB7AtFHK79RFZDR7zTFTOgD0xHjU759ppNSneeh
	 jMeUs1N2D7+EA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cL01q5R4vz4w9Q;
	Mon,  8 Sep 2025 18:07:59 +1000 (AEST)
Date: Mon, 8 Sep 2025 18:07:59 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wensheng Wang <wenswang@yeah.net>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the hwmon-staging tree
Message-ID: <20250908180759.5e30d1fc@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Jh4.9IAQkwrWFXBcpHNGCwJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Jh4.9IAQkwrWFXBcpHNGCwJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the hwmon-staging tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/hwmon/mp29502.rst:4: WARNING: Title underline too short.

Kernel driver mp29502
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [docutils]

Introduced by commit

  c8ffcc694fa4 ("hwmon: add MP29502 driver")

--=20
Cheers,
Stephen Rothwell

--Sig_/Jh4.9IAQkwrWFXBcpHNGCwJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmi+jt8ACgkQAVBC80lX
0Gwy8Af/V6fqk8b6UTDaUv8BlaXpmbXrP7t8ctLnE8q9vImiK7AECEdsYCeQ7W1V
IHrz0/pLRZYSgfGLw4n9GrHeRQ2Ehjx2PU9pNNUkZ5bVys+8ozPqQ78nTySyn28e
Tw7f65QXeHQGZ0j5RMlep+v6YEjkaTclto1Kavc6j1AyzwdMe11wXeRtnr5wsPZJ
e4qI/5dWS099+bWMQ1IdrcVMPMmEUr8gFEIktCU8qOIcyo1zScR0UwvEtvWl5GJy
OER5wc+IOlCafLKty4vidcqGpPTjlEHi5gmzMCvcSTpUu6rVa4FJALSS4ellns5g
yWIl/Ae7/c06r5I3B/g/+n360Gq+OQ==
=/7Hu
-----END PGP SIGNATURE-----

--Sig_/Jh4.9IAQkwrWFXBcpHNGCwJ--

