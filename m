Return-Path: <linux-next+bounces-2714-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9342091C739
	for <lists+linux-next@lfdr.de>; Fri, 28 Jun 2024 22:17:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43BB9281CFB
	for <lists+linux-next@lfdr.de>; Fri, 28 Jun 2024 20:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B8765381A;
	Fri, 28 Jun 2024 20:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VJUBETHI"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1F450249;
	Fri, 28 Jun 2024 20:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719605796; cv=none; b=T80HGxaLgtP62bVsydAUaGssXf0L8NDBFB6zPnI6JvYg9BMAvAm0Lfw0Av0LZmzLIRkP9xNIt3suD5gyvm8Ov2aRtQKOBjSDNluX6BfZNHWips6TTc5T4IsGpzXRUCqLBFW0RQPwlH7Xcyl72e72zuhKTPy+cWVsUavvhcFbxoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719605796; c=relaxed/simple;
	bh=+hjZmy+i/jia3KZUtnP6na3L9fbAC7hhffAvdTALoqw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZyH+364CS+dIDHOSc/Ewp40+biy9QcDKDs1frs/1QqVWJJOm0Cy2NIONXVaVdqCxnrAcWjhCHUYwQ8/myp9Z+QGJuRsnLCkiZPEmefQNu5oVzQDRogHzsF/mUEa8XLjrQ95VXhD07382nVS86qIXmyMcu/83VY9swEd481nTQU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VJUBETHI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03119C116B1;
	Fri, 28 Jun 2024 20:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719605795;
	bh=+hjZmy+i/jia3KZUtnP6na3L9fbAC7hhffAvdTALoqw=;
	h=Date:From:To:Cc:Subject:From;
	b=VJUBETHI6mmuvFLtAZuoA9q3idnwXYL725TsMJa3ENC/fl56m0feHGifpqC/kTmo2
	 Zz6v0JG7Yviq6GQGi2SYtRIEfhyTY7cDenLXRpLZI24Ww7iVG8nrOF3curc5FmGa+w
	 zpKKYlAEYMd0+B9iMNRPHx+VHl84GG6pPDtcUwZjm+NA9ysfXFMcUQtyxJbWrt5rs8
	 /V67qxBrKYmmdOTyJX34155fF8soa9Xzzq87zjdCorZ3LQ3quhOpjd8HKO4H30vBV3
	 PU4BUfF8Qhnr/LvAJoQHd9pADBNTTS93QN3BX3Vp3ylmDuom31WTNOI0bgGGXaWqkG
	 GQwlPMx1t04oA==
Date: Fri, 28 Jun 2024 21:16:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jun 28
Message-ID: <Zn8aIDP2A-EBbZaa@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GtAAJVELQfreE8oB"
Content-Disposition: inline


--GtAAJVELQfreE8oB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Stephen should be back on Monday so normal service restored.

Changes since 20240627:

The risc-v tree gained a conflcit with the risc-v-fixes tree.

The btrfs tree gained multiple conflicts with the fs-current tree.

The drm tree gained a conflict with Linus' tree.

The drm tree gained a build failure, I used the version from 20240627
instead.

The block tree gained multiple conflicts with the vfs-brauner tree.

The kvm-riscv tree gained a conflict with the perf tree.

The drm tree gained a build failure due to an interacton with the
driver-core tree for which I applied a fixup.

Non-merge commits (relative to Linus' tree): 8590
 9252 files changed, 783165 insertions(+), 159592 deletions(-)

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
directory.  Between each merge, the tree was built with a defconfig
for arm64, an allmodconfig for x86_64, a multi_v7_defconfig for arm
and a native build of tools/perf.

Below is a summary of the state of the merge.

I am currently merging 378 trees (counting Linus' and 106 trees of bug
fix patches pending for the current merge release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Status of my local build tests will be at
http://kisskb.ellerman.id.au/linux-next .  If maintainers want to give
advice about cross compilers/configs that work, we are always open to add
more builds.

Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
Gortmaker for triage and bug fixes.

--GtAAJVELQfreE8oB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ/Gh8ACgkQJNaLcl1U
h9DGCwf/TmWrPzKQDBfhihxbIXYh37GXlciDBwkhG6BHuZn+vX/pWZ4uYWHcCoqW
UaxNc77ZhIeUTRegDBiG8zqTPaoD17fYhAliFeYwInlETkLtNFFFYenqEvgDYd9B
3XrKGFi7NetLMcO/k2o3TdbJf1+dLZrcIV5xtg6x7TS/+G56rwVuKCv2nF5L9kCZ
Wmh/p+b/xzSxbORhwtoi03tshNl9N8+G54H34teBfJrnswqKfL4B5ktkX7e3j8Mg
NYpqkgzGpeS1FOmOIbveAL2IUsJuah6a/gHStwP74UaGDL2iszWEFvzoi1Gg/pbb
MuJ5tZoyCoOxzTT7wRL6zIPYktikIg==
=rOpE
-----END PGP SIGNATURE-----

--GtAAJVELQfreE8oB--

