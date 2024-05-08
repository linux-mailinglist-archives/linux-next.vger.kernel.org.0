Return-Path: <linux-next+bounces-2218-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC958BF63C
	for <lists+linux-next@lfdr.de>; Wed,  8 May 2024 08:28:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF3511C20880
	for <lists+linux-next@lfdr.de>; Wed,  8 May 2024 06:28:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 056191F5F5;
	Wed,  8 May 2024 06:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="EGO3/6Ki"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938291E895;
	Wed,  8 May 2024 06:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715149683; cv=none; b=m3HOPkT6d7yoLC2z4+NxDgVQEfaWSgMPn91tM7GWyx/ntQZ0oNyFYYfijA72i8Mj/QcHZCa1VfIUvB8ePAcn58KDlG2YnrCGdXKEsWWf5IaV+l9HPHzyOk6EAdl5JW8SXxqicY64U/i6mtl+gCeWuQOUPq5BhOvD3McfmFHDKtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715149683; c=relaxed/simple;
	bh=J+KWJReAN1bvmIc1+CXM6hmmcHsVMfMWZdaStKHUBvE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jJ8HBmsOMATGYWugBQ3Ki/JG2JNlcuF4ojWwHJgYy+V+WkqTHuv01Ppof62lVijAIhORYl8zDj15VthL8cjWM+HRAm5cnuCzbnpDRR7QKNLXFXmkvenKnE0lEJ5PoRPVIcK1e+34EnbjHOF/XlBnRyzzhDVdkEL/b0adkidIM7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=EGO3/6Ki; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715149678;
	bh=ZOz3Pw+/RdehelHDH4oMi407Gjkpc5RGsdvGv7lRWY8=;
	h=Date:From:To:Cc:Subject:From;
	b=EGO3/6Ki2hUFUvQJYX+4FD8/VbI/0EHGM+EytzymiYn/r8yq76HOgCl9jMmmtT6zi
	 GNYSqDduBy3W5QmRIRBA/F2YTgqVjp+Pyygi4lR6r/RuyGA/+A8eAspJ4/x4lIxIj7
	 YEgqYStcphwt44DcT3VtjD8stFzgs73bCDPhVLGy0bkJsfKZwH57ioeJ2OHawnFfg4
	 JB5iybJfxaKxBLEWgShDME2vsWnGGo+uBMi3kyremYG0enZd8GK7NSILKIBSM/nJiz
	 37zHPp1xB+PGzc+1rQFuSqCvuqjbW9MhuhuSANxulajxL2QvE4GAjj0uLnFZkJSLPD
	 J915AIHJZvUpw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VZ4vf4461z4wd3;
	Wed,  8 May 2024 16:27:58 +1000 (AEST)
Date: Wed, 8 May 2024 16:27:55 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Yury Norov <yury.norov@gmail.com>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the bitmap tree
Message-ID: <20240508162755.7d339509@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/M+b7W10N57o7hlPYGocOAf6";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/M+b7W10N57o7hlPYGocOAf6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the bitmap tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

lib/test_bitops.c: In function 'test_fns':
lib/test_bitops.c:56:9: error: cleanup argument not a function
   56 |         unsigned long *buf __free(kfree) =3D NULL;
      |         ^~~~~~~~
lib/test_bitops.c:60:15: error: implicit declaration of function 'kmalloc_a=
rray' [-Werror=3Dimplicit-function-declaration]
   60 |         buf =3D kmalloc_array(10000, sizeof(unsigned long), GFP_KER=
NEL);
      |               ^~~~~~~~~~~~~
lib/test_bitops.c:60:13: error: assignment to 'long unsigned int *' from 'i=
nt' makes pointer from integer without a cast [-Werror=3Dint-conversion]
   60 |         buf =3D kmalloc_array(10000, sizeof(unsigned long), GFP_KER=
NEL);
      |             ^
cc1: all warnings being treated as errors

Caused by commit

  777c893e12fa ("lib/test_bitops: Add benchmark test for fns()")

I have used the bitmap tree from next-20240507 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/M+b7W10N57o7hlPYGocOAf6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmY7G2sACgkQAVBC80lX
0Gx/jgf+OUuwfQGiGCZdigyuvJ0o7JN/Jss0aYukv7X3kxIBKrDOaemLQ+C9BmKI
hzNURVn3i1q/z71pWftqurKDi68l0mbjb0hfPcCrJCdoOpiQO0jcqNGPQM4kU0Qp
xotZbJ1mQFjyePoMU9bzoxswfap0Tkew3seFfzQ2LJ50gPYhm8TmFeg1Teqb4+4B
By2/pzGkHZIQhrlfRte6PNnxo1n5uwb/DVzTbTi+gu+o+jiVBycg1v1+mlQH335Z
ogJfHd/ECaJgqNwl6foeX7s+Xq1EVUvEdklwHMBBiDlRZPsmTBbasAl87phZczfg
CTlBC1O6TWhBu301lnwcTe/McNieOA==
=o6W2
-----END PGP SIGNATURE-----

--Sig_/M+b7W10N57o7hlPYGocOAf6--

