Return-Path: <linux-next+bounces-8378-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5EEB869F3
	for <lists+linux-next@lfdr.de>; Thu, 18 Sep 2025 21:08:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 258311B26600
	for <lists+linux-next@lfdr.de>; Thu, 18 Sep 2025 19:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1995B2D3758;
	Thu, 18 Sep 2025 19:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L8CHWb2q"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9064280CC8;
	Thu, 18 Sep 2025 19:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758222485; cv=none; b=MWPb3ZH2v4ogUADZtKdVSGBdktk7Z7/dWr+tqZaRTp9Ti+P6KQRCdWjLQ5PR053QCCBWQGVX1cv9S2W8hxp1WXwos3CZXrwb34r+npkFfvjha8EehSonimYvfft+bJYur193p4VKMebzMySGdjHY0By2YpuaqJjZEX87uaeehfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758222485; c=relaxed/simple;
	bh=nWsU0VxMhLIb3J80cOn7bM83bbnPgkTyClgu0z22NPs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LbGtPLpqaY+tOx6dAJGAjsl7PYDaa0/p35hy0Wp887BdWFpQsDlA8YDZ1CIqS7hIHjsLWsFqQpgJ8P/O1Qbt2h3IjOBkXlAbIGftvSyXSapn4n1kHOjCpW2uucIHze6Vkq/w9I1TJSFozS7ADdw+9Jyd7Eg/kfNituzlQaz/c+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L8CHWb2q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6E79C4CEF0;
	Thu, 18 Sep 2025 19:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758222485;
	bh=nWsU0VxMhLIb3J80cOn7bM83bbnPgkTyClgu0z22NPs=;
	h=Date:From:To:Cc:Subject:From;
	b=L8CHWb2qwQcCmJLXLJ3HgOS6K2zWY8fSZldj72TW5CW73nI+3PfEkrVUeMRbMrSM+
	 MvgTNnXpQ6ukMU8IUdYZvlnaSLZawRdQv6tuxNfK5kX34j+lwYx/X/aOhxtuVkpeC7
	 Z42iDq6FfnmjMhRYefgttc+BrVTfZmciXuOo75q1xe8ZuVoOPydTDg9m1pukckn8uz
	 EKWdy+Zb/qPn8MIvIy79hOAr8HxFCB+jFb4QbHCLQlHSoKz29ya08gHMP/lClFxcUG
	 2d0+i4+F3vXJ08JkJHoDM+JWbD2+JQss3xFkXuNbfenG7Nbv0cJCez5c8hLe63QM9H
	 OSauP1M4dSS2w==
Date: Thu, 18 Sep 2025 20:08:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 18
Message-ID: <aMxYkXdK_V8DL273@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3DUEGP+FdTl4A3cy"
Content-Disposition: inline


--3DUEGP+FdTl4A3cy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20250917:

The btrfs tree gained a conflict with the btrfs-fixes tree.

The nfs-anna tree gained a build failure, I used the version from
yesterday.

The vfs tree gained a conflict with the vfs-brauner tree.

The kvm tree gained a conflict with the kvm-fixes tree.

The i2c tree gained a conflict with the usb tree.

The kunit-next tree gained a conflict with the drm-xe tree.

Non-merge commits (relative to Linus' tree): 9545
 9893 files changed, 447404 insertions(+), 184328 deletions(-)

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

--3DUEGP+FdTl4A3cy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjMWJEACgkQJNaLcl1U
h9BoDAf/bbFNBAXN/G/L+DWwZ+QiwG+vX1JQQgec2+Xj/gmePHc4RD+9V+ie/Br2
UeYnGz+/xfvd9Bx/I8HbYJNCPJAuxA20IyycJe9MeoI1iHhN8S9D9DP+2KcIaG1g
NFVzLJ0ifKKWe1AA4AC20P1VJH+SXQNCjlZREZa8scV3pB+2FJGGE/wZiNfqeYGE
/PAEWVJxu9wb4KMF+L0Ux4VnV69rPFO7OeA354m68Nvp4lN/dYjGfzMGSvojhvt/
H7F4s+M5OT7HeFYYffULElFgY0Vjg3GUxtOiVyW7uuSeuGkEq32mS4QHUqFrytNz
2owC7xI/AGNq0bGgrS8+23MAMcNnDQ==
=l8ZB
-----END PGP SIGNATURE-----

--3DUEGP+FdTl4A3cy--

