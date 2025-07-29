Return-Path: <linux-next+bounces-7732-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A652B14566
	for <lists+linux-next@lfdr.de>; Tue, 29 Jul 2025 02:42:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A6971AA0259
	for <lists+linux-next@lfdr.de>; Tue, 29 Jul 2025 00:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E0ED15CD74;
	Tue, 29 Jul 2025 00:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="nHq8Grgu"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD763C26;
	Tue, 29 Jul 2025 00:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753749770; cv=none; b=KPf9tgbSKqBy60/6UfdF/VjQJ7BgRIHwFXuhaR1ZFXUM3Az5SSEZ9+8im3837pwSG26mzHbPsnFf/Pp44yO04LXhr+3B1H5ESCrfU9ZEZwSq1jkeeswHdMKeN6Zqr+eJ5L0oDsh3LaqLH8fJ/WDLlx5U8ctdTb6zZ3VdnDRFNqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753749770; c=relaxed/simple;
	bh=HRoM/IQpuAuPC5tM3PT5YpECRsG7WwtstYBNiKi0MsY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=q2DBidvnx7KJ6UhUkxXgWxpUiBMOA0rrUNYjzawQSn/VeRg64LzB3ljPBmaiuQ8j1kezea8sM52VlSV9nYuFZ8Aj+dnrjkhmGJvl1nahNh87jPyi3XN4HDACYiR76hIZSlKYj0/ZhhohYUhSHLEC1Gwri5U4JsWmIFO7lxdhY8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=nHq8Grgu; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753749558;
	bh=j3G4lVK4o4PGBsMHI0IFX5rZVWQHzL/mRDjo0wL2nbA=;
	h=Date:From:To:Cc:Subject:From;
	b=nHq8GrguUgUpgvATl2tur2GQDKbjUeY59PhfhOaT5fpS0S2xzEx4Pm38apD6RLZv9
	 Smw6RDkghDk3qYh7dFurYid4H2AtlzXcIYvqIlJxLWZVXETu3J0I91WdP9vFRg1E3W
	 OMYgqYqOnqyqxsJ+p3swf8pNEmfJ/40IA4FswTQZniuEdqtFuh5JnqbL4DrzVJo6+3
	 YAOt3FoY48rSKngv0vP/zBy++6OYML+gdLxNOs7kNJbV2N6SudxUnQCJtJpTpyxwoE
	 Lt0gp6IOd1Ci42duW5C3EbITjxplJ0cR5Ikw2oMqDTiPUt7aFNB34I25IuXvAx+WOJ
	 P3/jZcSDwH9XA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4brc12408tz4w2K;
	Tue, 29 Jul 2025 10:39:18 +1000 (AEST)
Date: Tue, 29 Jul 2025 10:42:45 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Paul E. McKenney" <paulmck@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, "Mike Rapoport (Microsoft)"
 <rppt@kernel.org>
Subject: linux-next: manual merge of the paulmck tree with the
 mm-nonmm-unstable tree
Message-ID: <20250729104245.6be6957a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/N4nr1AIWBjxdW+fb3g+zk/a";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/N4nr1AIWBjxdW+fb3g+zk/a
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the paulmck tree got a conflict in:

  lib/Kconfig.debug

between commit:

  c2d288f7ab13 ("kho: add test for kexec handover")

from the mm-nonmm-unstable tree and commit:

  d19e9fa61f60 ("lib: Add trivial kunit test for ratelimit")

from the paulmck tree.

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
index 54f11c2713b9,d69d27f80834..000000000000
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@@ -3235,27 -3225,17 +3235,38 @@@ config TEST_OBJPOO
 =20
  	  If unsure, say N.
 =20
 +config TEST_KEXEC_HANDOVER
 +	bool "Test for Kexec HandOver"
 +	default n
 +	depends on KEXEC_HANDOVER
 +	help
 +	  This option enables test for Kexec HandOver (KHO).
 +	  The test consists of two parts: saving kernel data before kexec and
 +	  restoring the data after kexec and verifying that it was properly
 +	  handed over. This test module creates and saves data on the boot of
 +	  the first kernel and restores and verifies the data on the boot of
 +	  kexec'ed kernel.
 +
 +	  For detailed documentation about KHO, see Documentation/core-api/kho.
 +
 +	  To run the test run:
 +
 +	  tools/testing/selftests/kho/vmtest.sh -h
 +
 +	  If unsure, say N.
 +
 +
+ config RATELIMIT_KUNIT_TEST
+ 	tristate "KUnit Test for correctness and stress of ratelimit" if !KUNIT_=
ALL_TESTS
+ 	depends on KUNIT
+ 	default KUNIT_ALL_TESTS
+ 	help
+ 	  This builds the "test_ratelimit" module that should be used
+ 	  for correctness verification and concurrent testings of rate
+ 	  limiting.
+=20
+ 	  If unsure, say N.
+=20
  config INT_POW_KUNIT_TEST
  	tristate "Integer exponentiation (int_pow) test" if !KUNIT_ALL_TESTS
  	depends on KUNIT

--Sig_/N4nr1AIWBjxdW+fb3g+zk/a
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiIGQUACgkQAVBC80lX
0GzCfAf+IbOjNeGimeVe3MQUbwgE+4x0jEhrNHD/2rj4GpbwGe5JdwS1ILM69sbb
6qfi+mGhZS+39P9LnqB2AAivYh5bOtSNkgVrs9sG8pSzIEj02RZphCSGJ91FhWsx
jjzVkivo+kUeq+CYxuR7B4xPHHOiXFT26PdkbmXS82nEmnlfL4T3emqIdBj6T0/H
3rKU+EBtmDI8m/PMndgoaOr6g5M16fTw3HWPQDjhDT1UfgKZWuGxa8RzkJ1Ium2O
OmYV0x6rXT4Irzkxtzik7gb03YHsA3FmPj0sWSqTVpdpJr+C5fqivoiHIDj3WWBw
vkf5VtBQnD78GkZfpM1FbCw2fd14aQ==
=1eAP
-----END PGP SIGNATURE-----

--Sig_/N4nr1AIWBjxdW+fb3g+zk/a--

