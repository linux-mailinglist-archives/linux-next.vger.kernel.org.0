Return-Path: <linux-next+bounces-8456-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EC2B96E15
	for <lists+linux-next@lfdr.de>; Tue, 23 Sep 2025 18:52:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 661323BF4FD
	for <lists+linux-next@lfdr.de>; Tue, 23 Sep 2025 16:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD2312F0690;
	Tue, 23 Sep 2025 16:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SVfEa2Ih"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C1064A8F;
	Tue, 23 Sep 2025 16:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758646369; cv=none; b=m6BPf18rWIJ5SQElefhkc2sa06nIrm8lvhPLX4Xo+C0VHL7Eyn+VwhMDRcUJE7iRbx2OufwmmLQCt0h+DcRo9vw1qa4DYxJNAgEsUD5BvXrj2K8II4Ni3JTzJeVBkHjNM41sxzEQVRhclRakeTqm4S6DZGtLBZMhx2zz+dw5mqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758646369; c=relaxed/simple;
	bh=OHtxc/CqAXybv5yik9nAZbCsaPQAm3nEiFYcq1dwyOc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BPGwOsH1N7fn+PCKa41xMXnhHSN3XrGWO4qQWvKG/ot2PKz7dvGIArnI1ofwGcjSlb7Tnx9luhNAP0Wpy0Ql6JWSUu1PwCIt2I0XN25DSgn6LVk+jYE6mWzd8S2wqARAt9MUwZg7JPcG5YSWz9gv52LblfB+MHJT7SaDtPc3/Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SVfEa2Ih; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDC0BC4CEF5;
	Tue, 23 Sep 2025 16:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758646369;
	bh=OHtxc/CqAXybv5yik9nAZbCsaPQAm3nEiFYcq1dwyOc=;
	h=Date:From:To:Cc:Subject:From;
	b=SVfEa2Ihup6IoUE6YAeihhlw8Mkqs+k+l61YtjJhyLMELrRvShf8dJNKD1a1YVFUk
	 3wbY9Lj8J77LWAWw0fs/fmNAaPjWTn4KUqf0uWI0aGEGUZvs2dNMJJWn9qvZ+ZwWQJ
	 sGCb5eEHMW3CHDmcUyi6g/z1VUZK65sEk1uj85i7mO8pzmAmGxY7vngoupZdfzXtik
	 BvEmpopLh53/RCqUPipPTQne+05WXWYTjLSw2La7zw8HZP58/BNiC1Qsp7kuf9ERac
	 ita+llcbZNm/zPiTghbMysYzJZK0k2kwkAqFmEM+OFn3tWvWAW2TtYJhbFuth6snN+
	 EtmNk5NmSpQLA==
Date: Tue, 23 Sep 2025 18:52:45 +0200
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 23
Message-ID: <aNLQXdu0wVXa0t4t@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z3yVIjN5s+xAmAkQ"
Content-Disposition: inline


--z3yVIjN5s+xAmAkQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

There will likely be some missing -next releases Monday to Wednesday
this week, normal operation will resume on Thursday.

Changes since 20250922:

The mm-unstable tree gained a conflict.

The arm64 tree gained a conflit with Linus' tree.

The bluetooth tree gained a conflict with the net tree.

The s390 tree gained a conflict with the net-next tree.

The kvm-arm tree gained a build failure for which I did a revert.

The rust tree gained a conflict with the drm-nova tree.

The rust tree gained a conflict with the driver-core tree.

Non-merge commits (relative to Linus' tree): 10672
 10857 files changed, 521318 insertions(+), 200190 deletions(-)

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

--z3yVIjN5s+xAmAkQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjS0F0ACgkQJNaLcl1U
h9AEHgf/ag4RgWoahK465Vy36RGrsfMM0il4SppiYw64AZIIwNQ1HhqleSMT78JT
1rZh7+jVXCdHv1bzvk/EXRowiEekrVtcWUcF315ar4IHQp3yimVX5F7de+RsEPYT
9lAop+Mcwtu+L1U6CeDX6ECoi4+7L2gPKH4wX3Eju+ltb9Tt3S9is3SYO6WaC9oC
yPjRZVRK23uhEB5HOC0QBiTl9BmmKiy5CGRG7keZs7awVh+auxFc9ZEp9SZ5somm
svMR++i/vrMTJvx6RqGCYfasuMwx7cDVL9Q/a14qGZIQnSRvctxmxpyJleOWq/r7
j1ZstEnpHrIqp9ZAgn2G2eXI7KH0rg==
=17+O
-----END PGP SIGNATURE-----

--z3yVIjN5s+xAmAkQ--

