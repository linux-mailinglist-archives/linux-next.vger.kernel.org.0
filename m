Return-Path: <linux-next+bounces-8504-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 87ECCBA46C3
	for <lists+linux-next@lfdr.de>; Fri, 26 Sep 2025 17:33:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 96BF17ABB7C
	for <lists+linux-next@lfdr.de>; Fri, 26 Sep 2025 15:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B6FD21767C;
	Fri, 26 Sep 2025 15:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GS8cWXgw"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E6921C166;
	Fri, 26 Sep 2025 15:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758900761; cv=none; b=FSdIu9QyKToSmgPgjJJO4WqkEEl0pE4ETwmeXaGWgEV7wSFhHY+yn6Z4Y3e/0/aWYS2Ha2kAvUIUX6JPiijpyZONI43Dte01a8dp8Iwi8qgRpoIZkzJ9sX62oD6KBC3/NBebEdmr0KDgztnc7qdRO4Ib7njXEbeOehJ5wPWKfTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758900761; c=relaxed/simple;
	bh=yq2+nCeERZCb1Sgbe4eci6P9Xi+94wosE7TbKuPXbWA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RRF8ZB+9K6LMGgMuygSlbqsAfKN/VH4c4s+1ctLeOc6v/VwdBBjvvmPTP+5/bCP1CugsQWuy6gScfl/yY0rsyyrWu6fkUTMWcVBhoh8e2Q8i/jJ+zbKxxaBLfYCxovuu5DznshtgSMIB8fKzS7QRRnvTIjLgleuJGotKpMN1Hkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GS8cWXgw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2794DC116C6;
	Fri, 26 Sep 2025 15:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758900760;
	bh=yq2+nCeERZCb1Sgbe4eci6P9Xi+94wosE7TbKuPXbWA=;
	h=Date:From:To:Cc:Subject:From;
	b=GS8cWXgwdu0il8h8yOtnS+m7KNezPYJddcPEiTIORVKIsrqiXzwn10JJJb4HWFF/Y
	 ++hrU/QMhPIEBhlBYH18xT+ZkXBschDOA0VSoGIk/A5PYAAT2sWhq94z+gWgqyFEhj
	 4RP6534LTV9CLQhVGRMzTgetY9FcwAA3S40tDWzoZWKkqRSeukvYQJO7gRLb1OB53T
	 PXFI9DnlMrdawhTJhL96xiZh5mOG9rw2yTnFv2qLxdLsOpqV1c+oBjqXb3UiXQckWY
	 ugR1CflmQYKutP0D2gqg/7IZTYUUHmui9dDGxLOjcfmMVrKdGZa39ND+87j1H6Ciq0
	 piRbUHf/PbWQw==
Date: Fri, 26 Sep 2025 16:32:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 26
Message-ID: <aNayFYxBh0uIYU6C@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="D37Ez3ddLNdPxim2"
Content-Disposition: inline


--D37Ez3ddLNdPxim2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

There will be no releases Tuesday and Wednesday next week and Monday is
at risk, normal operation will resume on Thursday.

Changes since 20250925:

The btrfs-fixes tree gained a conflict with Linus' tree.

The drm tree gained a conflict with Linus' tree.

Non-merge commits (relative to Linus' tree): 11355
 11323 files changed, 545087 insertions(+), 209367 deletions(-)

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

--D37Ez3ddLNdPxim2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjWshQACgkQJNaLcl1U
h9Cc7Qf/XGm8MH4Sv5jfRUeimCryAA/mbgXPDFce2v0m8uMPjXYd1/VZL0OT1UJk
59tza9UdTR2exvIZaxoJqXp1G4THmBzQek84xRowxXCwPbkj/izTktB30s1dvRdo
McODgnawZ9eW36ghL2HFxMkucirvv0W2cAHX9lGk+VIC9FGjeo5sdm2N2trMkVJe
o0WUz2HX/n31QP/OZjFXCljA7mPpBQ4cwCc5Ref6UxF6kUqhBU9seljmrsz2XZMH
UCtL9BAqHTl1lcChbZiyhgzemZ77UgBVU/KXSTI5VfloaTMvKC/w95ak2RNqQjh2
iCLKYqxcAj6nm6W6SfR7f22tMi3QqQ==
=8v0c
-----END PGP SIGNATURE-----

--D37Ez3ddLNdPxim2--

