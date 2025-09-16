Return-Path: <linux-next+bounces-8328-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEF9B59588
	for <lists+linux-next@lfdr.de>; Tue, 16 Sep 2025 13:52:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA0813B525E
	for <lists+linux-next@lfdr.de>; Tue, 16 Sep 2025 11:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EE38307492;
	Tue, 16 Sep 2025 11:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tEqBsvqP"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4787F2877CF;
	Tue, 16 Sep 2025 11:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758023530; cv=none; b=Qt4oKidPrMxGTvMpiwkeSa7G0MhD1h20WCf8HVX5SyLR4ReLKX7/LsAV1AUy64JMx0csuMJPJVJus3zYiPjgmLBj7o2Zf7NCnZYk+/YV2kRQha+Kl6Ceoeo1Zbiij7lyfPz/Rgpq6O5thfZJpsHB2h3vweirlUH+IfgbdSHmGfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758023530; c=relaxed/simple;
	bh=uJbIiJv24vaUhiW5Rf3jsrKdADpkLVXM9KALYs09blc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V8mLjveYMnjail3ZoN6553knHndHE4PX448Ach7arh1v5lq6c/HUiiEGHeccrcS9zvVfDQqPgBfLSxD7BkLM4xdht/S/QxY4cAJJRvYAARgPZKDoLxKIwLGNp+Xok4i2PMgJslEcc97xvqV4ReIxLJbFZSDla2PfFQy1/fwXqiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tEqBsvqP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20E81C4CEEB;
	Tue, 16 Sep 2025 11:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758023529;
	bh=uJbIiJv24vaUhiW5Rf3jsrKdADpkLVXM9KALYs09blc=;
	h=Date:From:To:Cc:Subject:From;
	b=tEqBsvqP+0XFFUiJaDHBDRqlOUHQfvJhmrLmq+ONXPNM77t9YpceYPD1CVO4kFyh9
	 D64YaTeOUs1IWAQzuWvZjEjMEdT7yC8buvEIdHBIthZILoFPplvgyf+WKYl36jXjPl
	 mInJ/AbSPN8gJAVKyewZwV+RgdI1nupdKBkhH6tOH65IMgt7gp5UFDn3bRbgCEaXPB
	 K5u3wSvpoj/8ugvoEsXVof7kLsCbQbUU2IM5LsgDhz0qWktHSxsyjzdWyNRvJff73j
	 1mgDF5RYsyXXARAFxzQUT2PmMLybOllhqM/lLKOhsPv05mVlU06csNDwyun74vQDQr
	 0Jz6hXPbp5VQQ==
Date: Tue, 16 Sep 2025 12:52:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Babu Moger <babu.moger@amd.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Xin Li <xin@zytor.com>
Subject: linux-next: manual merge of the kvm-x86 tree with the tip-fixes tree
Message-ID: <aMlPZcYlk7hRlMkE@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o++B5AeyijXALTFS"
Content-Disposition: inline


--o++B5AeyijXALTFS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kvm-x86 tree got a conflict in:

  arch/x86/include/asm/cpufeatures.h

between commits:

  2f8f173413f1c ("x86/vmscape: Add conditional IBPB mitigation")
  e19c06219985f ("x86/cpufeatures: Add support for Assignable Bandwidth Mon=
itoring Counters (ABMC)")

=66rom the tip-fixes tree and commit:

  3c7cb84145336 ("x86/cpufeatures: Add a CPU feature bit for MSR immediate =
form instructions")

=66rom the kvm-x86 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc arch/x86/include/asm/cpufeatures.h
index b2a562217d3ff,8738bd783de22..0000000000000
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@@ -495,8 -496,7 +496,9 @@@
  #define X86_FEATURE_TSA_SQ_NO		(21*32+11) /* AMD CPU not vulnerable to TS=
A-SQ */
  #define X86_FEATURE_TSA_L1_NO		(21*32+12) /* AMD CPU not vulnerable to TS=
A-L1 */
  #define X86_FEATURE_CLEAR_CPU_BUF_VM	(21*32+13) /* Clear CPU buffers usin=
g VERW before VMRUN */
 -#define X86_FEATURE_MSR_IMM		(21*32+14) /* MSR immediate form instruction=
s */
 +#define X86_FEATURE_IBPB_EXIT_TO_USER	(21*32+14) /* Use IBPB on exit-to-u=
serspace, see VMSCAPE bug */
 +#define X86_FEATURE_ABMC		(21*32+15) /* Assignable Bandwidth Monitoring C=
ounters */
++#define X86_FEATURE_MSR_IMM		(21*32+16) /* MSR immediate form instruction=
s */
 =20
  /*
   * BUG word(s)

--o++B5AeyijXALTFS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjJT2QACgkQJNaLcl1U
h9Abywf8Cx3bVmLRE6DmhIYhL3zv0Kx2o7krQsdmmt2Zb29EDLufknvHmgVw6cTx
1EwvDqxx0OaynKFyVs7VswIfEZw416laH6Q0+4/j+AvAUBHApi3Quocd6hMo7WpY
Zg21cGBS7wkiNdAbQqb8mIp/56WCC72J2Scm16hml7XKBSSTJOcMYqCwV8MI/WUw
IMweaQL19hL3uKDHUPD2WWEtwIseJ64XoF97cOSys19IDcrFgww7qgHkmOXuGY4S
NkyuGg4sZtS+7tzQylSf6Vkzydm9EN9mzLQGpRieZ/r6OlUUckcnjFLibIJ3em0M
xSPQJ0n0ZVrydUjgD/CbNbZp+APpXQ==
=Or9m
-----END PGP SIGNATURE-----

--o++B5AeyijXALTFS--

