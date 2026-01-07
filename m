Return-Path: <linux-next+bounces-9567-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E25CFBADA
	for <lists+linux-next@lfdr.de>; Wed, 07 Jan 2026 03:14:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6A02E304A96B
	for <lists+linux-next@lfdr.de>; Wed,  7 Jan 2026 02:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 982D9261586;
	Wed,  7 Jan 2026 02:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="oQ4TeERV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD4D265CAD;
	Wed,  7 Jan 2026 02:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767751878; cv=none; b=YRqKmNmgkZvt6fq7dX1cLAz21KhmqB506i0tZnuQPJT9st9lcRf62KN8wdvlJuifVh9kv/Hs1OPc2AM8PrcY4iMp0MzGTRLIWsJ3llPbN7AtXlIzP6vb+qH8q8TvuV1ubdIaPiRuPLsk1q4HwoZ7YbQY4J29rtyIbt3DjqaN188=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767751878; c=relaxed/simple;
	bh=+937GN33pfx0GXuZCPC2uXwUhx4WHyoeYF1a+KbaICA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=QXskZcJfuDmHGctu7POJK0B3MwP73Bdt+hTRH43Yk51z8C+03lnZFqDzaQNjz/OtVmbG7Dr0tI9s3g3B//1qlE3O0ZlGrON+oS0cWo+ismvRHzeBAggA5wJJ4OZmMCthsBD7Oa0kKsYuHqW+9Vc7Q/SLEmZ7H21+PdzJ/exqgTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=oQ4TeERV; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1767751873;
	bh=twbtpiOcgyDeFxbwY1UA80Aq7mw8adM1hIxtaNwhYxo=;
	h=Date:From:To:Cc:Subject:From;
	b=oQ4TeERVnn5ujFHqSA88iEZLXDv19UbQbdsC0x1ARnbg2gA5Qlj2XsZMx88NCvN7N
	 CjRxnvAfbUd210T+P3Rh2AbJVGMygWIaA0Wbq3FFS9wX5kkU58nI7Ir70aTnyadLrD
	 r379SNxwDGPpAROhXO4uFRwP5E9B3cF8evA6LXnDhM5I+V6M5rfvhMWwNkZ89CfRiM
	 C0v8twxr1WPeDr00c0rHkX2v64kfkfTX6TWJMLiqKTnF+2Kj1stkxl5Zgr3nqVP7Om
	 PhQmh0Zp5xOraKiFfPLQvpzbKMzbCtQkkD0QgtHUvkukALudfj9wkkZZ5Inl3cPT/f
	 IN8se2FJMzZtA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dmBNK3dvyz4wQc;
	Wed, 07 Jan 2026 13:11:13 +1100 (AEDT)
Date: Wed, 7 Jan 2026 13:11:12 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 "Cc: Andrew Morton" <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Marco Elver <elver@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>
Subject: linux-next: manual merge of the tip tree with the mm-nonmm-stable
 tree
Message-ID: <20260107131112.69183629@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IPFYw7+nKTq+VnqNGxJ28OB";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/IPFYw7+nKTq+VnqNGxJ28OB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  lib/Kconfig.debug

between commit:

  e8a6a3f8fc19 ("tests/liveupdate: add in-kernel liveupdate test")

from the mm-nonmm-stable tree and commit:

  9b00c1609dee ("compiler-context-analysis: Add test stub")

from the tip tree.

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
index 36564f85bc95,22ea11f24e92..000000000000
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@@ -2802,29 -2827,20 +2824,43 @@@ config LINEAR_RANGES_TES
 =20
  	  If unsure, say N.
 =20
 +config LIVEUPDATE_TEST
 +	bool "Live Update Kernel Test"
 +	default n
 +	depends on LIVEUPDATE
 +	help
 +	  Enable a built-in kernel test module for the Live Update
 +	  Orchestrator.
 +
 +	  This module validates the File-Lifecycle-Bound subsystem by
 +	  registering a set of mock FLB objects with any real file handlers
 +	  that support live update (such as the memfd handler).
 +
 +	  When live update operations are performed, this test module will
 +	  output messages to the kernel log (dmesg), confirming that its
 +	  registration and various callback functions (preserve, retrieve,
 +	  finish, etc.) are being invoked correctly.
 +
 +	  This is a debugging and regression testing tool for developers
 +	  working on the Live Update subsystem. It should not be enabled in
 +	  production kernels.
 +
 +	  If unsure, say N
 +
+ config CONTEXT_ANALYSIS_TEST
+ 	bool "Compiler context-analysis warnings test"
+ 	depends on EXPERT
+ 	help
+ 	  This builds the test for compiler-based context analysis. The test
+ 	  does not add executable code to the kernel, but is meant to test that
+ 	  common patterns supported by the analysis do not result in false
+ 	  positive warnings.
+=20
+ 	  When adding support for new context locks, it is strongly recommended
+ 	  to add supported patterns to this test.
+=20
+ 	  If unsure, say N.
+=20
  config CMDLINE_KUNIT_TEST
  	tristate "KUnit test for cmdline API" if !KUNIT_ALL_TESTS
  	depends on KUNIT

--Sig_/IPFYw7+nKTq+VnqNGxJ28OB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmldwMAACgkQAVBC80lX
0Gyzvgf/bI9LUKwMMB23fdqcU20eJKnGmqh6jSr+Bruut/bDerRz548cmpJhwuDt
zEKvCfqTfaPHWc47SIWRRy2x8sAQtCbuRjnrLnZZQwBTpyaqRXZ2VJvbWwLjE7c0
bLU40cPEWdfcp15iAwTT5cY2bFautILhQbOKwlxVLbo+xyBOeI4WJB8BVbCEKkOT
z32d0bcNt1GjyotKuHev+4/07fg2VPnWWwiAQkmIAIOlsRq+Vt1qFq3vPA9wWs2f
tJiSJYB5Ddczut/pIINnaoV2IWRuJTncZLXsg66lTebjAqgM1EQqQAwbAtdizV3j
tLjCJZehzuLl7Sq77S4lTHm9sdgemA==
=h74T
-----END PGP SIGNATURE-----

--Sig_/IPFYw7+nKTq+VnqNGxJ28OB--

