Return-Path: <linux-next+bounces-8496-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 90035BA092B
	for <lists+linux-next@lfdr.de>; Thu, 25 Sep 2025 18:22:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 823EE4E38AF
	for <lists+linux-next@lfdr.de>; Thu, 25 Sep 2025 16:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B5483054CB;
	Thu, 25 Sep 2025 16:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xp91sYnY"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1377921E091;
	Thu, 25 Sep 2025 16:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758817329; cv=none; b=sLKnKfUN4IIR131Vb39k3sbwVmqWs4m38YYVUPAcB3KnzwJBPvEDjnhh8KSAYGht5+jI6fu/LdDyx37s9wq5gUVVgE4P+lDxZjm0aYpcD1UwZ8snI/B6wowJcmm/ahg93SWQWrAO6jOHPzS96QG6jpy85gywXygBn+YI2ul3P7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758817329; c=relaxed/simple;
	bh=MiKF/rJbWNT/8DYY6EGv9RerLr5WPceWftYDuPGV+oE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cm28XzWl6VaSs0EhaXUeBNhFFkkdxp0/44nsWgBCHZDtHf05aFZ+71Tegrd9E/HAjpYcPKNUSFQmwUgLyTdFPX4hbiOHFkCEEnF401lwB2yq9XH/IZJ5W5LZF8dJ54PFP3yM3VItbtN9t4EF5NzrDVzpPWBMnMVX3IH01tzcRuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xp91sYnY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB7BC4CEF0;
	Thu, 25 Sep 2025 16:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758817328;
	bh=MiKF/rJbWNT/8DYY6EGv9RerLr5WPceWftYDuPGV+oE=;
	h=Date:From:To:Cc:Subject:From;
	b=Xp91sYnYR/wQ2I8BLZLoe+hmsAykdbinT7SnNkFkqfedaxsYVFC2/qOGSMle8M7sG
	 xuwdcjxrz6em++RPLboyTKI7x95Gtifq9EZUsM6AtoedvnwL554qoLikq0Y9wBfEpO
	 DqgJ7dnnWdN2sRTq0ukUv3pNte0p+SDz3/LoNjEf+4AFlngjpdz3RNisU01K1he3OV
	 qxwEAopqt5lnw8kHHzbs2Sb78ScBOq3tTFJGgo02R+i9tfjjiF7QMf0VNc4GfR/4Q8
	 UcblJ/VAVqNJCWsB3IfBVPAJ8fmp2rWqmFkWPk2UsUe8bfmghU4VuMUwkoYLwtRUiJ
	 iDNPIumjuGsUg==
Date: Thu, 25 Sep 2025 17:22:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 25
Message-ID: <aNVsLfsG-PWbf2cg@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a98odGigYL5Ku5Pg"
Content-Disposition: inline


--a98odGigYL5Ku5Pg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

There will be no releases next Tuesday and Wednesday, and Monday might
not happen depending on how things go.

Changes since 20250924:

The ksmbd tree has a missing signoff.

The ksmbd tree gained a conflict with the cifs tree.

The vfs tree gained a conflict with the vfs-brauner tree.

The riscv tree gained a conflict with the mm-hotfixes tree.

The arm64 tree gained a conflict with the kbuild tree.

The tip tree gained a conflict with the bpf-next tree.

The kspp tree gained a conflict with the s390 tree.

Non-merge commits (relative to Linus' tree): 11065
 11166 files changed, 534210 insertions(+), 205637 deletions(-)

----------------------------------------------------------------------------

I have created today's linux-next tree at
git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
(patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you
are tracking the linux-next tree using git, you should not use "git pull"
to do so as that will try to merge the new linux-next release with the
old one.  You should use "git fetch" and checkout or reset to the new
master.

You can see which trees have been included by looking in the Next/Trees
file in the source.  There is also the merge.log file in the Next
directory.  Between each merge, the tree was built with an arm64
defconfig, an allmodconfig for x86_64, a multi_v7_defconfig for arm and
a native build of tools/perf. After the final fixups (if any), I do an
x86_64 modules_install followed by builds for x86_64 allnoconfig,
powerpc allnoconfig (32 and 64 bit), ppc44x_defconfig, allyesconfig and
pseries_le_defconfig and i386, arm64, s390, sparc and sparc64 defconfig
and htmldocs. And finally, a simple boot test of the powerpc
pseries_le_defconfig kernel in qemu (with and without kvm enabled).

Below is a summary of the state of the merge.

I am currently merging 407 trees (counting Linus' and 406 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
Gortmaker for triage and bug fixes.

--a98odGigYL5Ku5Pg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjVbCwACgkQJNaLcl1U
h9Cl5gf/Z9q5AKiHxaDeaC8iE75maGrrmk1Igl4bdBWzhHs4K2R2GuwD4DQPBxtQ
Z3tq+v55kauKpKrXywRlAxCmKXOwbTcjggI6IJP8NbIz8j2+53asgDBSwOJgiczW
yGsl/LLZWbBGXdhnYUkBAQKFzY09eGQheTeR2nkZ98zXwhwXC8/40GmPwIZxxtUJ
uZPa++Fab4r2GN0fPY5LaafiCZpbRUqQ9PSCCpgQcsyoj4GjZeBHh0dUI/oZDC15
zRaCtD5NyU2nff8RMNBuWaSieY3Un5BmHHxlV/BSetSjsjWXPz6ohSoJn7qEyN9Q
pegDjRbdSs+K0lMh22UuKDRdGbmuYA==
=GIs4
-----END PGP SIGNATURE-----

--a98odGigYL5Ku5Pg--

