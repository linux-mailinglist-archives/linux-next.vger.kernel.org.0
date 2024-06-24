Return-Path: <linux-next+bounces-2646-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EAE915504
	for <lists+linux-next@lfdr.de>; Mon, 24 Jun 2024 19:07:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B4DF1C218D6
	for <lists+linux-next@lfdr.de>; Mon, 24 Jun 2024 17:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35450142905;
	Mon, 24 Jun 2024 17:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UcY41JrK"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0B81EA87;
	Mon, 24 Jun 2024 17:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719248816; cv=none; b=q0yVkozngzAwIxDm3elwoylugNNljlakc1JtCWnCekQqaLSa8HY3KIOrl9EWw9GPxIVkXOJfghZoOEwewrpGBue7TePypNA9NeYXpNWeD9AqemKv/9mSlawr6A/g9Pg+01BfD2QXsOlEziyLVDSeBuKgQb0gsekZi8zy5+ouWeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719248816; c=relaxed/simple;
	bh=ME0jqVGIC7eiVMAqx/gHdWA4n8aNbVyDsjNLmQ/tI74=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eugCW0MlKh6AIGQBFtOjK82O2j+34/rGsJURBArm+j/b86KKB7ZhDtuZisi8ytuzx/L1aNyoWtqbTKY8BxUbfGwV/YGqO44W19Apbfn2m9TrjWyJ0SIdlyvJb6Ge+z5j2iXAWy/ZtJ9Lnp81OjNSwLXTOPuNfDXvRI31lkO4WO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UcY41JrK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77F4AC2BBFC;
	Mon, 24 Jun 2024 17:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719248815;
	bh=ME0jqVGIC7eiVMAqx/gHdWA4n8aNbVyDsjNLmQ/tI74=;
	h=Date:From:To:Cc:Subject:From;
	b=UcY41JrKCHRySIz2Cm+h87TfIts5oZ9ouVpa1A1KBmoA5RwA+Z+eMCJ26lX+mJ3Rt
	 b3aV22+58zAitgDtdBiFbbK3sRhN758tK68+q6JJBq8wwXT32VoRHvKGNV3oU3ODgP
	 1IE7tFHKxGltHmMadcani6o/HSD+XD1aNfcsWVUmRvU4MkjaMFsxKtS48ZNY/5vEsM
	 Xl6UiUT5KPjBtDfkl0l2e5ksPYs3MTC5YGPhX9ZdjDb3dXRzr2gf/9WbQ9rQBNLwNg
	 P0tqv6JSivvRy3x4bBvA8jfnDI7QymQBMTWoNwzYP7Yv62XNVmaeEGx0U14bre+see
	 vEbQKKLpT59uw==
Date: Mon, 24 Jun 2024 18:06:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Borislav Petkov <bp@alien8.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Perry Yuan <perry.yuan@amd.com>, Xiaojian Du <Xiaojian.Du@amd.com>
Subject: linux-next: manual merge of the tip tree with the pm tree
Message-ID: <ZnmnqjCZ_dx0xXjw@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4klZvQdydUy1+7yP"
Content-Disposition: inline


--4klZvQdydUy1+7yP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/x86/include/asm/cpufeatures.h

between commit:

  c7107750b2ffa ("x86/cpufeatures: Add AMD FAST CPPC feature flag")

=66rom the pm tree and commit:

  78ce84b9e0a54 ("x86/cpufeatures: Flip the /proc/cpuinfo appearance logic")

=66rom the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/x86/include/asm/cpufeatures.h
index 6c128d463a143,6007462e03d66..0000000000000
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@@ -465,12 -466,11 +466,12 @@@
   *
   * Reuse free bits when adding new feature flags!
   */
- #define X86_FEATURE_AMD_LBR_PMC_FREEZE	(21*32+ 0) /* AMD LBR and PMC Free=
ze */
- #define X86_FEATURE_CLEAR_BHB_LOOP	(21*32+ 1) /* "" Clear branch history =
at syscall entry using SW loop */
- #define X86_FEATURE_BHI_CTRL		(21*32+ 2) /* "" BHI_DIS_S HW control avail=
able */
- #define X86_FEATURE_CLEAR_BHB_HW	(21*32+ 3) /* "" BHI_DIS_S HW control en=
abled */
- #define X86_FEATURE_CLEAR_BHB_LOOP_ON_VMEXIT (21*32+ 4) /* "" Clear branc=
h history at vmexit using SW loop */
- #define X86_FEATURE_FAST_CPPC		(21*32 + 5) /* "" AMD Fast CPPC */
+ #define X86_FEATURE_AMD_LBR_PMC_FREEZE	(21*32+ 0) /* "amd_lbr_pmc_freeze"=
 AMD LBR and PMC Freeze */
+ #define X86_FEATURE_CLEAR_BHB_LOOP	(21*32+ 1) /* Clear branch history at =
syscall entry using SW loop */
+ #define X86_FEATURE_BHI_CTRL		(21*32+ 2) /* BHI_DIS_S HW control availabl=
e */
+ #define X86_FEATURE_CLEAR_BHB_HW	(21*32+ 3) /* BHI_DIS_S HW control enabl=
ed */
+ #define X86_FEATURE_CLEAR_BHB_LOOP_ON_VMEXIT (21*32+ 4) /* Clear branch h=
istory at vmexit using SW loop */
++#define X86_FEATURE_FAST_CPPC		(21*32 + 5) /* AMD Fast CPPC */
 =20
  /*
   * BUG word(s)

--4klZvQdydUy1+7yP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ5p6kACgkQJNaLcl1U
h9BV/gf+IyBdZ108YiWqPp6OdY+fl10ivWtGa96tpjUhGmBj/9kQDQbWr/k5fJEU
ER+E1ouGYwjmR6XO0Y7XuCGSggpcGTtXQKzqms8kYg+E6s6uQxI2P+5nkwX7p4Pa
i5wehtb/8USpNi5cp2RpTCn/DDOauUnGdFB1KoYkdBXw1tQYt4imcjzwsB5bCj0l
HRC011cCcgcDuD+ZucXF7h8y/L3IORm2K77Bbyem0eQPySBzPwlajOd26tmcM7im
GKWqFp8H+YRMNsE/pInAFzpXt/flSdJkxU7tJ/FGaL175NhuNTcX7eC4lFIO5Zh4
ApX5YnecR3u2C8DY0ATmKTiGG+xdNA==
=NgFk
-----END PGP SIGNATURE-----

--4klZvQdydUy1+7yP--

