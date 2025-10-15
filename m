Return-Path: <linux-next+bounces-8596-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC14BDE716
	for <lists+linux-next@lfdr.de>; Wed, 15 Oct 2025 14:18:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 308E24FAFF2
	for <lists+linux-next@lfdr.de>; Wed, 15 Oct 2025 12:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 672B4322541;
	Wed, 15 Oct 2025 12:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y+8Oujr3"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEE32C3276;
	Wed, 15 Oct 2025 12:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760530715; cv=none; b=c42cJ/HOUyOjglLfaOwBwGXM1XjLsqNchba4zLBOPZ4CS/BqjmYUIjPxq6Zdtbq03HJUiiiAl3zX4a4IxLwJwjCIwAWIpjuUrH4QUYLRf8LRLE6KVaUHLm1pQEiZCun4LYClQzbOn2SkM90UFi3y355xxTMpln247K4FQf6u9Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760530715; c=relaxed/simple;
	bh=e5C4kbfwJrUnnkqgslj8tP+GxCqGvNYEU7v70aAIXjo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rkD2YmQYVrmvmEprUBB1gYPuypdolow5EnJn7ppntwFJG10pAasa7JSqKuxN83UlW+0de09gUQRoTh6mL6wR0cYLylba87b+G9+UXlaabVRLDFebBlM4l+t5nUMKwV0YqbXl0bcXXzYgXVWupn4uU3++ls9T/bDZqvvM4yxrUxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y+8Oujr3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A1CEC4CEF8;
	Wed, 15 Oct 2025 12:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760530715;
	bh=e5C4kbfwJrUnnkqgslj8tP+GxCqGvNYEU7v70aAIXjo=;
	h=Date:From:To:Cc:Subject:From;
	b=Y+8Oujr3XZBBbFjL/Krnjoynz+x0c/gUHAeKJ8epoA0H/1QMQZTQrr1MfsaGSnsDo
	 xs3yBV4NrXamNo3hytwDa7VnhWwSvKWpRsv16dx+WStIS9x+8i+29ra0XmOSiOXBUz
	 4OYjLyBr+oM1GLyDCXkF4OwpyDCsN8nEWmtoAcBMErqnHW3CJFeDjB59copxgLfLXa
	 4pV5fK4iRtjE3TavGnDFuudVbgLU4O1ecM9A+ymwyDW2Q4OJGCom6TvJk6R1NpI/0K
	 J3eW3AQ3Navtp7dHhr2NStD8X/x1rDGPPQwwG1iIKSnSgxSedU2j/6EVWQDXZD8mIL
	 MKPFW3+7bCXxA==
Date: Wed, 15 Oct 2025 13:18:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Oct 15
Message-ID: <aO-RFzE_WWMIzdzv@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MAAR5Z5M71IUtBfi"
Content-Disposition: inline


--MAAR5Z5M71IUtBfi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20251014:

The ext4 tree gained a conflict with Linus' tree.

Non-merge commits (relative to Linus' tree): 1594
 1744 files changed, 49343 insertions(+), 23493 deletions(-)

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

--MAAR5Z5M71IUtBfi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjvkRYACgkQJNaLcl1U
h9BB6gf/cLzmNHGThep0+xJcuDrqAyvPflbWMkFUWaZlcN6+kgePAn7yTeOOjSjH
FWziqgcY5+57PMssodFxPpCre8mL9e8gmz6nVOhgGh9rx0N/cT8rz0yJ2/mTjYyp
THMPfF+KNm1FmmF6eTL9sbsARudUZnF/Uxx9r0q/YEaxCiI98YewNlYrq6pMM8Z+
XQWtm4Y6L2oyWTgVmUtHz5/5QhSxm/3sLRccq+6pOp9dBol4gPCa6/D3XiowjK7/
tC8R4ROx0mT1cNQLzqMa6RWFlZ9hL3H3SxU4bmmOKklwDQMJfNwUONhaY7Mo7WEI
f1ryFc5BWVzuoRgENhP8Tdj6TyIFbA==
=otUY
-----END PGP SIGNATURE-----

--MAAR5Z5M71IUtBfi--

