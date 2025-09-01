Return-Path: <linux-next+bounces-8149-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF881B3D640
	for <lists+linux-next@lfdr.de>; Mon,  1 Sep 2025 03:17:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41C5F188AB11
	for <lists+linux-next@lfdr.de>; Mon,  1 Sep 2025 01:18:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F01E86323;
	Mon,  1 Sep 2025 01:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="lF7U9cVP"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEC22E401;
	Mon,  1 Sep 2025 01:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756689470; cv=none; b=pNMMijEQiaUnJUdK5OKCAcwFIM0KaFOiIyYalv+MkcsqgNTZKyqucXmtPI2p1c5ecurlPVaH4kQlZ0Opo+RH2u7beM2Jpx4VsqdXq4udt8zmNTudZKqObH9Q8he6KsFvLqpWKwKo/orr9rJAAWlCyKw5z/LDWrBh8sAWkLk8GGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756689470; c=relaxed/simple;
	bh=6yd6s7JeRdGPpzBynREnbZ5VrxS701VVkjBATbeNv8s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=oyVebQRDbzHfBVzZu3kB+SQJYLB6CNhw3/Z8HjXVkRVyyPAXAmd9bLlVIf/mTt/4JW24SfV00yPioOWVy0CmKQ2urpa4HM5OcQ+8U9cuFIuEr97OwxnVFFpiROY4ftXs1F/qgVwOSSWoTiUytOrh0aCopB3wEC70NkubGXl0tS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=lF7U9cVP; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1756689464;
	bh=AIzKvR8HaNAISG1TXC45KaLr3GYpBc8h3a5mVXUqSJY=;
	h=Date:From:To:Cc:Subject:From;
	b=lF7U9cVPdbdDlpS237IGnuDNSo6uyFtGZaV4vqfcsvsU0u5q5I/UrCBx4+OF0LaUc
	 +usY+xmhftF4lK+C5lFD0s/L9zGU+OuuRMuMCqC5cjd9XNcDX4KAWwoTNr4nplT0a3
	 k9GboMLgSGISP73xh87BC9Y69y5c7e+vgVGXAjgK9s4Jhw58Z+K/oFic7K3+k9OREO
	 f2+luDh8eLng35tYKBsyHV3dnthAZ/90Y/+X9zcK9zjv5FE0Pcvm+XwcPAG7nKaixP
	 i8aPXSffpV0o4CQy9HoUwrIjnf1Zoj9J4bqvpUTQEqfv14HQ6WC1RzisYEggBcabwH
	 GIo17dsUPpmkg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cFWFg6x2Qz4w1k;
	Mon,  1 Sep 2025 11:17:43 +1000 (AEST)
Date: Mon, 1 Sep 2025 11:17:42 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mm-nonmm-unstable tree
Message-ID: <20250901111742.510947ee@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/FRIlZm8P76ggg9S39Bddpjj";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/FRIlZm8P76ggg9S39Bddpjj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm-nonmm-unstable tree, today's linux-next build
(x86_64 allmodconfig) failed like this:

In file included from samples/vfs/test-list-all-mounts.c:11:
samples/vfs/../../tools/testing/selftests/pidfd/pidfd.h:28:10: fatal error:=
 kselftest.h: No such file or directory
   28 | #include "kselftest.h"
      |          ^~~~~~~~~~~~~

Caused by commit

  df420f0a4946 ("selftests: replace relative includes with non-relative for=
 kselftest.h and kselftest_harness.h")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/FRIlZm8P76ggg9S39Bddpjj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmi09DYACgkQAVBC80lX
0GzVigf+IM3/XSj+mUEYDlhW4Z8ABUj3tAjMOgrvFamzFB//FeUgRu1TNXL+E3EE
ImB8WkUD1qZGH5jUko67egreXf7wTZiA1I5YdLUqSOmIOW1Zycnylntx1J5hyiMR
/WZhI/a2kE4f9AkJgOrZecF7tICJl0xIV24oAWimLs4Vcn7TzZFBO5FwFLK6KYGi
xGgOQUKtYI+1tDUwLCBmo1T3MKKfNl2+yom9ebR+q9+pEtM7faY8gBpg5qlCmbTS
FooJXqmOSmk1Y9+O78X9IxXVX/S1/ZUhJr9wVdqA9Scqvu6JQONxzztOvu6QinWe
r9iC5VVZEg4FsEAizoZuSWqKNnLFPQ==
=uhsV
-----END PGP SIGNATURE-----

--Sig_/FRIlZm8P76ggg9S39Bddpjj--

