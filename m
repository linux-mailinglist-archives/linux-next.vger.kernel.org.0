Return-Path: <linux-next+bounces-8592-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EB102BD9C03
	for <lists+linux-next@lfdr.de>; Tue, 14 Oct 2025 15:36:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3350A4EE7DA
	for <lists+linux-next@lfdr.de>; Tue, 14 Oct 2025 13:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52927313E12;
	Tue, 14 Oct 2025 13:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mp74ILYG"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2725530C377;
	Tue, 14 Oct 2025 13:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760448977; cv=none; b=CpHt1MUB2zi/3zCiP43gEShMCFWNEOBbH+QPI7KtFRO3czHrly/YeBR5xku0jmgMynU4UqJisEiFJcJcfyGBrl2RZLOOzch11WNmsNIvSm/9M7tybOjN4idF/zoiESXun4nVQE1Rr848cvAJITvmb406r3k5pRM4tV3nkDOSTpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760448977; c=relaxed/simple;
	bh=oKCw8YV70P2zm514uT7yXlbtmdnVlFy7sgUsdT4S0jY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bfQpQgGBbITP05xarHy+UX3faVptU67lo6u8AAqvHqE/KIpL0j8vDKqmkGhrjPLfTwAN3jKxhftmL3Zho5Po+hFuhDVy1QWHzATrq7OYvHOR4+slaQLR62kie6wMKMMjtwhTKU4OU9L6f08TcyezGfIhw1VNsDxauile4ElBCn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mp74ILYG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DA49C4CEF1;
	Tue, 14 Oct 2025 13:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760448975;
	bh=oKCw8YV70P2zm514uT7yXlbtmdnVlFy7sgUsdT4S0jY=;
	h=Date:From:To:Cc:Subject:From;
	b=mp74ILYGYW5qR8nkYUXa7IT4h0dHwrEaH2iowR2G7LhUhgEfUDCry527Bbf8qymmx
	 +C24sX/RenDNx+0aryjmHWH4CfZw3gXV7qeqqQTj3HLS4HkQvhvSlEt4Ikiom1t77G
	 pNVjXufkTzczXKwnCUL4gWEUCa5jaFKJ3wWAe4f6GZwhiZvmV76zFJQON7/lFdavfj
	 U8mDJCLKVhEm1PMQQT2SLHIA5C8NOOJMPb2q798GRxlzhzDOQe2fDfyhdfcOb3F8tR
	 dAHtN5VD3Kly/gtVL8N49HapIHOinLmqbmi1Y/2yzPSKOenRt7LOgp0YRKQgr09Rwe
	 FQM34Y95xqsaw==
Date: Tue, 14 Oct 2025 14:36:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Oct 14
Message-ID: <aO5RzDCU4IaXtG74@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GG6xRBgCE8zXjAV5"
Content-Disposition: inline


--GG6xRBgCE8zXjAV5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20251013:

The drm-intel tree gained a conflcit with the drm-intel-fixes tree.

Non-merge commits (relative to Linus' tree): 1270
 1258 files changed, 39877 insertions(+), 17497 deletions(-)

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

--GG6xRBgCE8zXjAV5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjuUcsACgkQJNaLcl1U
h9DqiAf/dBVw78GyL9fo0E8M29ZKr/lSdIbQhzfpvCWJrGAiqsdBJqtCNZc5vI5N
1WzEGOHK1iJQFh291EgpR5M8upnzMKQqKKgVapjOwXwGAPTLw4KJoexG2CdD7YqN
80aTrt0W2ybjdFHhsEPeMqx9i08uYgBAntsrdeI1rgLOLsx9oox4dp7ckl11KUNf
45Bsy4yUCDhFy95lWZmYMjEgC0G/Es8b1SAp0VTou2cedQ2xnRxi1OI80Bon0iik
uQoFV9bSiMlng1mCoyMcFriwTkIsaEZKG5NRiXiu8KnLLMQdd4qJSfdSw5QI5YYC
EJBCWsoq4ElA2cWW4wgqXW3t/cNl5w==
=Dr+K
-----END PGP SIGNATURE-----

--GG6xRBgCE8zXjAV5--

