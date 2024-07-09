Return-Path: <linux-next+bounces-2874-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A252792B25C
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 10:42:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DCD5283353
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 08:42:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A50E6156654;
	Tue,  9 Jul 2024 08:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="KsZ33xOe"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCE415573D;
	Tue,  9 Jul 2024 08:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720514411; cv=none; b=SUnqllfrLq6Uh1E8onrtWGC+o06Yxfda8rWZ1YsXtl85KwgCFBn7ky7A9X+XsMAJKH/0m/cAqXbm9yDqZfa6Wl5gF9DEmzdKbGcYl1HCi/lXDdWIFmYJKcCvAPUfZcU4c6/d9sSTRJpWvlDv+Hg2y3rWKQfiw18tdmIY7oZTB/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720514411; c=relaxed/simple;
	bh=y9cnUr2Hhyo3aXF2dhsc/sdk8CJQm6ZcFFHK60b908w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=cmvroetQbSG2nwsnVw96vzR7vpgUhqBKYMkN8tgB/hJ/+OZy32hpLFc/AMGVp/4D1JriqDQTQ0Gw2QGyjLhXS1KjzT8BjhpEyYtlJo8vJ6cXIEh+h2VogzHTbov2JeXfaoTns3/7lYpOA2t+8YAqcWL/SIm2Wcv6qkYQU9STLpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=KsZ33xOe; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720514405;
	bh=5ShoYFOMGU+1vmB1rgdQgvzyxsF69OqkcwfJBnXZki8=;
	h=Date:From:To:Cc:Subject:From;
	b=KsZ33xOePV868UzIysKGitU/KHKBxf1RVqPY1Ct2O8ObxSkFoyaALfPJi08scVehH
	 wrJwxOfUvQ7uemgNtHIW8D31g9F/UzQSiCK+/RUOQQDlnd4W65bZu44w40HbO7OcK5
	 RJKwnZklz1pYGd3JFeBh6SROV2voEYMoFXGP57I4T1K2BR+vFU0d+cHM6PBTuER8hK
	 UFEzBWYDfqIfyrHzeE2bIYuPLQwwwL+yUJNaf9corxVhhAn+CcMyxNzQ136ZELaAcz
	 80EYNaF0X8+MG0rh6rFrEe++Ox+nx5MbNLCVBHyc0CkBPFNCp856HKdhHvYPYyzn74
	 UT0aC1nINP/SQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WJDvT5tsHz4xQW;
	Tue,  9 Jul 2024 18:40:05 +1000 (AEST)
Date: Tue, 9 Jul 2024 18:40:04 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Nicolas Pitre <npitre@baylibre.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mm tree
Message-ID: <20240709184004.60f94726@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rapPalzJMwbDFUFj46ja6p1";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/rapPalzJMwbDFUFj46ja6p1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm tree, today's linux-next build (i386 defconfig)
failed like this:

lib/math/div64.c: In function 'mul_u64_u64_div_u64':
lib/math/div64.c:211:2: error: #error "unknown endianness"
  211 | #error "unknown endianness"
      |  ^~~~~
lib/math/div64.c:219:21: error: 'union <anonymous>' has no member named 'l'
  219 |         X.v =3D (u64)A.l * B.l;
      |                     ^
lib/math/div64.c:219:27: error: 'union <anonymous>' has no member named 'l'
  219 |         X.v =3D (u64)A.l * B.l;
      |                           ^
lib/math/div64.c:220:21: error: 'union <anonymous>' has no member named 'l'
  220 |         Y.v =3D (u64)A.l * B.h + X.h;
      |                     ^
lib/math/div64.c:220:27: error: 'union <anonymous>' has no member named 'h'
  220 |         Y.v =3D (u64)A.l * B.h + X.h;
      |                           ^
lib/math/div64.c:220:33: error: 'union <anonymous>' has no member named 'h'
  220 |         Y.v =3D (u64)A.l * B.h + X.h;
      |                                 ^
lib/math/div64.c:221:21: error: 'union <anonymous>' has no member named 'h'
  221 |         Z.v =3D (u64)A.h * B.h + Y.h;
      |                     ^
lib/math/div64.c:221:27: error: 'union <anonymous>' has no member named 'h'
  221 |         Z.v =3D (u64)A.h * B.h + Y.h;
      |                           ^
lib/math/div64.c:221:33: error: 'union <anonymous>' has no member named 'h'
  221 |         Z.v =3D (u64)A.h * B.h + Y.h;
      |                                 ^
lib/math/div64.c:222:21: error: 'union <anonymous>' has no member named 'h'
  222 |         Y.v =3D (u64)A.h * B.l + Y.l;
      |                     ^
lib/math/div64.c:222:27: error: 'union <anonymous>' has no member named 'l'
  222 |         Y.v =3D (u64)A.h * B.l + Y.l;
      |                           ^
lib/math/div64.c:222:33: error: 'union <anonymous>' has no member named 'l'
  222 |         Y.v =3D (u64)A.h * B.l + Y.l;
      |                                 ^
lib/math/div64.c:223:10: error: 'union <anonymous>' has no member named 'h'
  223 |         X.h =3D Y.l;
      |          ^
lib/math/div64.c:223:16: error: 'union <anonymous>' has no member named 'l'
  223 |         X.h =3D Y.l;
      |                ^
lib/math/div64.c:224:17: error: 'union <anonymous>' has no member named 'h'
  224 |         Z.v +=3D Y.h;
      |                 ^

Caused by commit

  7a3c42cc4fc3 ("mul_u64_u64_div_u64: make it precise always")

from the mm-nonmm-unstable branch of the mm tree.

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/rapPalzJMwbDFUFj46ja6p1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaM92QACgkQAVBC80lX
0GxBVwgAgHuPqASRv0/BBKUWaI0FG76ok4ilXZt0mP7bVT0zxhq8YydZBUYfpkD/
be1bUE+pVJ5Zk2lINRyqYhF1aBHDjKVqcWEKNcQp1XI2mL6qzcmxuE3HFwiK6Efu
0yi24f4GLkKwYVwRlDkT3LKM073T4SvrhJO7UF2U/fY6fruJ0Te3KFJ+MAUq6/du
vtcWDivTJ6EVxbXQL2xZId1fADBw/ThJ1qglxc5bkyAGIw8Xo6iaBZZD84ie/rc1
1fp4QMuP39TcHz3+FrDc/C12SK+A6Y//eqnAc4ZYFFMo3+O5gw5Yca7/rd1dYbdp
fKbTSBrHUiBNv1Tm+b5TOnKYRIu+uw==
=I2em
-----END PGP SIGNATURE-----

--Sig_/rapPalzJMwbDFUFj46ja6p1--

