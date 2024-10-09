Return-Path: <linux-next+bounces-4164-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28777995EF2
	for <lists+linux-next@lfdr.de>; Wed,  9 Oct 2024 07:27:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C74DB1F234B4
	for <lists+linux-next@lfdr.de>; Wed,  9 Oct 2024 05:27:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EEDE155A2F;
	Wed,  9 Oct 2024 05:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ru8OkJe0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05AE639AEB;
	Wed,  9 Oct 2024 05:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728451646; cv=none; b=oRqo5D9e2g5EN0jKO8kux/zzMo19vw49AamQeiHUAh1gE+SwdLzeMCocqBSNZL0qV9FS/iOfGgpppfyGlokjeMB/XJpEvbC8goQ8GSTsCJq4pe5odY+X471D1C3vH7ACmNmnJA4+BNy7mgGUNEPd+OAiCjNf5QI8gZ3uSVhayw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728451646; c=relaxed/simple;
	bh=nWFTIg6HdGsXPLnqq3XfiVmXDuv0g+k2hEIAVmrG9NA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Fdm/q22lVrvZLXVnvZuAji/Sh3rjr/y0/2pFvD9+rXdlg6tC4amb6TjwFyz/DfwX+g5sYqjsqafvVXIsFwrZo8bxMMUhaM9uVN0sfFIEvMlk2yAuiAf2u7CryuZrebkTxBg3qxpWw4KkD+gG0N21lj60S2ILZkE0RBl0fD3joHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ru8OkJe0; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728451640;
	bh=9dg/YYPzmi6MokzwYE8zxEA1fogwd0rrbrNb2PhMEMc=;
	h=Date:From:To:Cc:Subject:From;
	b=ru8OkJe012MB0nZqw952TF3PhBJBKJ684KfG7PswfrCtWG0YwOxmYR1xqLHInieKR
	 LpZ3JMD4NBTkFjSuBis9srjTGpzeEClSkloC68bM08cWYKOGPp+EuKYx0RqApQ5jo4
	 dX6ZrZiWnXXH5iO7pMlAc48adSZf+8BP4NqqJNEbVw6gxhx20gf0FkQ9uYHcx1uZi3
	 PHNm1Y9aDCDW7Cjt1hJ0nJB1U3+zEBkGBhOlgX1IhvudlMIeGZENd7OA8S8970l7bX
	 /wWOFHZOWT5IhIXmFi49BCUcBOZsZ3vyTCged92fV4zJ54tQ32A4jbxNVT+VPcAitC
	 hggc9yiHXOqrA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XNhGb64Kzz4wc3;
	Wed,  9 Oct 2024 16:27:19 +1100 (AEDT)
Date: Wed, 9 Oct 2024 16:27:19 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Shuah Khan <skhan@linuxfoundation.org>, Brendan Higgins
 <brendanhiggins@google.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Luis Felipe Hernandez
 <luis.hernandez093@gmail.com>
Subject: linux-next: manual merge of the kunit-next tree with the mm tree
Message-ID: <20241009162719.0adaea37@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/G+7Ixo8cjgDCTGHSvVbMQAU";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/G+7Ixo8cjgDCTGHSvVbMQAU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kunit-next tree got a conflict in:

  lib/Kconfig.debug

between commit:

  0f2016a962f0 ("lib/Kconfig.debug: move int_pow test option to runtime tes=
ting section")

from the mm-nonmm-unstable branch of the mm tree and commit:

  f099bda563dd ("lib: math: Move kunit tests into tests/ subdir")

from the kunit-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc lib/Kconfig.debug
index 409dd193c09b,0d6c979f0bfd..000000000000
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@@ -2993,22 -2993,6 +2993,22 @@@ config TEST_OBJPOO
 =20
  	  If unsure, say N.
 =20
- config INT_POW_TEST
++config INT_POW_KUNIT_TEST
 +	tristate "Integer exponentiation (int_pow) test" if !KUNIT_ALL_TESTS
 +	depends on KUNIT
 +	default KUNIT_ALL_TESTS
 +	help
 +	  This option enables the KUnit test suite for the int_pow function,
 +	  which performs integer exponentiation. The test suite is designed to
 +	  verify that the implementation of int_pow correctly computes the power
 +	  of a given base raised to a given exponent.
 +
 +	  Enabling this option will include tests that check various scenarios
 +	  and edge cases to ensure the accuracy and reliability of the exponenti=
ation
 +	  function.
 +
 +	  If unsure, say N
 +
  endif # RUNTIME_TESTING_MENU
 =20
  config ARCH_USE_MEMTEST

--Sig_/G+7Ixo8cjgDCTGHSvVbMQAU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcGFDcACgkQAVBC80lX
0GwAQgf/Zryy5ol4HCAOT18l1rTrthTyimCIhTs5mQwXD7Ra56M9C7BvOT1edGSP
fVYE7HtuN/ldJ3RZ7tnTIWuyou2cwwUkBGg2dOCLPZbJfk4Qinz4Bq5PW8TpIREj
KnXMDYgnePABeJKFW9XwtCXTziw/qtBr5IxsAUq9IogUl5Ro+zIQfql/+tm7kG4l
F58vp8nPI7WHiz/+j4jj6mjt8ZR/wwHEB0G6by98PBahP1kOR7QcoM8/HJ0ricBw
F2uwJHYGGNgpHLqG5CoDSCjLfdk+HoXsTgghMYq7WTOlD46TOueMVffHpEpUQPJT
r6pA6kGn7gra/aw7uPs3M9jmNdzxtg==
=07S3
-----END PGP SIGNATURE-----

--Sig_/G+7Ixo8cjgDCTGHSvVbMQAU--

