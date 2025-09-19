Return-Path: <linux-next+bounces-8389-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D4559B89A55
	for <lists+linux-next@lfdr.de>; Fri, 19 Sep 2025 15:24:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BB6427B0593
	for <lists+linux-next@lfdr.de>; Fri, 19 Sep 2025 13:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ECC4256C7E;
	Fri, 19 Sep 2025 13:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n7WTsGYw"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB682405ED;
	Fri, 19 Sep 2025 13:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758288256; cv=none; b=jviO7AVdtAKNNW238MywSG7ReaBNIPTT5N2dIEJJByaJVnjI6TAUI1IdGpsOkXyIbvscV1/6MwPR8ZooZVjTWYbsNjk3IhaShyv+SVGs3seEa+a8rfCNPQIGuhB1r75WvAHhpwpSGX2YuQLhzv3pJLsaDTtSVXj0wUVyg8/3Txw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758288256; c=relaxed/simple;
	bh=7vdoIaUgnb71UmnnZPwIt4dtceROwSkABNJlpXxEO14=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bqn47GJDIyTKnPiSKgiyOcmG/btGZkeDoNUkCKwRYg+N1IYGImPgWjP5gym06gUz8Vy4hDzWGLhuLkt0CntrZ/Nn77CyaIY4dO54wZixjD1ObtQKXdZeGlUdpRfIvte1ajKfBvAkfCK9P5hmcVXj3+gQR+cifpO2xY/49v9FTps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n7WTsGYw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AE0AC4CEF0;
	Fri, 19 Sep 2025 13:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758288256;
	bh=7vdoIaUgnb71UmnnZPwIt4dtceROwSkABNJlpXxEO14=;
	h=Date:From:To:Cc:Subject:From;
	b=n7WTsGYwKnKY5r9LBJPak8L/zUl3eUQZWPNZnBNBV4UaPXFmq2lNnhNnj5G3E+JuN
	 xuX9engsVp95Jn/zLM4mmSya8Ghiccp+l3ZBhOEzGf5hzcL2PgKdhskcB0IIsiM6EZ
	 N1KvR4lF5zDBeYQdtYtchIZnbd83q1rfvLrIjLThi//q769Fp9pGBxY8lAyZqRVj2k
	 bUG5phJNJDSWh9y4XJmyT3gFJmTPJ9LJVcgTQb8KhQw59lqGKklA7eIuPb+jQ6OeGG
	 XocazGISC73MFjj15j8dePeF8JacT6Vnj4MONkvJ0pP7+P9Jw7wyfJHwImyKLkMXiB
	 pVE1VDG1jTPPQ==
Date: Fri, 19 Sep 2025 14:24:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Pu Lehui <pulehui@huawei.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Subject: linux-next: manual merge of the tip tree with the risc-v tree
Message-ID: <aM1ZebIASOW6VH2d@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="03ERQMloR+5DFRMy"
Content-Disposition: inline


--03ERQMloR+5DFRMy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/riscv/Kconfig

between commit:

  205cbc7148424 ("riscv: Enable ARCH_HAVE_NMI_SAFE_CMPXCHG")

=66rom the risc-v tree and commits:

  eb3b66aab72c1 ("riscv: vdso: Untangle Kconfig logic")
  7b338f6d4e3d6 ("vdso: Drop Kconfig GENERIC_VDSO_DATA_STORE")
  bad53ae2dc429 ("vdso: Drop Kconfig GENERIC_VDSO_TIME_NS")

=66rom the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/riscv/Kconfig
index 31db5768e1e97,b346678ef6c55..0000000000000
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@@ -53,8 -52,7 +53,8 @@@ config RISC
  	select ARCH_HAS_SYSCALL_WRAPPER
  	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
  	select ARCH_HAS_UBSAN
- 	select ARCH_HAS_VDSO_ARCH_DATA if GENERIC_VDSO_DATA_STORE
 +	select ARCH_HAVE_NMI_SAFE_CMPXCHG
+ 	select ARCH_HAS_VDSO_ARCH_DATA if HAVE_GENERIC_VDSO
  	select ARCH_KEEP_MEMBLOCK if ACPI
  	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE	if 64BIT && MMU
  	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX

--03ERQMloR+5DFRMy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjNWXkACgkQJNaLcl1U
h9DCbAf/Q4gHoOo8g656TLGKzixGdas0R/jIf4uIFFCAYoFlw3ZPRDcQppj1F+vF
KSxZk/4g+FVmduVz9LPoW5VqNJEEffYKiuqA8uhUAHY6f2j3zlgLdktWsSiJMQTc
6OICBRCheFQi4KJsrY15LtxaXRZ1J3WlI3Db3G6aPxBmoG6aU9RuVhUXA376hLL4
gxL6hOmcgpqgGhtq4jEN3gnQPaul/0Qvr2MRuBq26KUcd4DN89F1OlxkFzEnlo6Y
1rz99JvUoDEtAU9MCx460yGYVJBMHgSmJxxFfnaBN8Oq/gvBGSM06PjwXYpVp8IE
8uPzgLiZ/mUg22DG9woECTYa9/HH2w==
=5etI
-----END PGP SIGNATURE-----

--03ERQMloR+5DFRMy--

