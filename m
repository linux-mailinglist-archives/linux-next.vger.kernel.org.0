Return-Path: <linux-next+bounces-2633-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B4E912D43
	for <lists+linux-next@lfdr.de>; Fri, 21 Jun 2024 20:36:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BD1D1B20CB2
	for <lists+linux-next@lfdr.de>; Fri, 21 Jun 2024 18:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FDDF1684AA;
	Fri, 21 Jun 2024 18:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EWq0DJ3Y"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F771607B2;
	Fri, 21 Jun 2024 18:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718994996; cv=none; b=bQbREoHiaBA129DF6iVT3HMHXY/AB2qXb0BElYRM90k/z00wlj7G+9xNKxXV2DOgIJo99XARIovquGA3vUyMHPoMobWo+HzEmCTUpv7x4JXlx9Wl6P3xKpwxiympV5sH4aJ2JtalIG+VRvBQrt+efBqCW5yW5UCpcWXuph8wpNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718994996; c=relaxed/simple;
	bh=Zk1Sdd8CeZyKxJweu3Yjmum2aIYv2fUbQWFU2b+mfl4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ttrQx9UUjaqOaeuS4bqxtjJlr6IB0u89et/W/GCwu+0gTWQqfd8m5okJzsMDYgWNcRijbrtNFC22c46cHT+19OGUxDsW4ez4zTOUZQBfn3qEqK421HWrbHbNJd/JeGBt9PXy/VXUsHgtKQNIi+vZMYVMQOegrpjwMfx+hVNSdjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EWq0DJ3Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B69EDC2BBFC;
	Fri, 21 Jun 2024 18:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718994995;
	bh=Zk1Sdd8CeZyKxJweu3Yjmum2aIYv2fUbQWFU2b+mfl4=;
	h=Date:From:To:Cc:Subject:From;
	b=EWq0DJ3YQIEFcMG2tjKQUSZ3vZFZKV3e5HuglsyQ1XpE9Ccce+Oxym79QGgGq/URq
	 sdEXRGlzsVlZBzKXnsd5jiVVhwPWnB8NN7PIWSnEnSj045C3+6sT//C7XbjVLBt9+Y
	 2LIxSveNNaEqNcfLPis5HWesq6O0o9/7WUOsE7Z7qjMldeHaSiqnOc0agFuoUyRy03
	 lr4tirSQSBRW9oirFrsKUmEwL6bhVDByZntXbzh4xGjWvliTiPr1qillUqyFsxfELJ
	 lWeIHLWAFmCrmI2nN2TzJlgHDnOUpsyhwYSOniVDBI0pTUwbWvIaTzEBfANAQHGHMT
	 cu95xUdb3ib7Q==
Date: Fri, 21 Jun 2024 19:36:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jun 21
Message-ID: <ZnXIL3OzztrGWeqa@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FMZpx69m2EBT12kS"
Content-Disposition: inline


--FMZpx69m2EBT12kS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20240620:

The sched_ext tree was added.

The drm tree gained a conflict with the drm-fixes tree.

The mmc tree gained a build failure, I used the version from 20240620.

The block tree gained a build failure, I used the version from 20240620.

The kvm-x86 tree gained a conflict with Linus' tree.

The char-misc tree gained a conflict with the sched-ext tree.

Non-merge commits (relative to Linus' tree): 6902
 7316 files changed, 623462 insertions(+), 126741 deletions(-)

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

--FMZpx69m2EBT12kS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ1yC8ACgkQJNaLcl1U
h9CxpQf8ChQlRr98FjbLk7kxIf0ismBoPm2K5LSH+k0D8cmoxnzz+7/GP6Wsv9GQ
vA/kgmkih4jmZ8Tg4xZSxITDkVnZ7z4caFDmLfv8mDAv2weRTk/9FgQTqXkerWS6
fkBuMMofsXZG9KPn/6KAAJT1fQitbRCMsa65nkSIHDggzdGdP53wt4PKCeQIqG+j
UifZc9HY+H+3iLrCctLj636Jd2T5qrIDvaDu70FBsEBem8HCv8apcXNjCNlSJMjj
b0pnJtkqaX3ZVtWruWp41mapBkOajX9sqZfIHnGwYo8MZJOHxd0bkWSifkU8Exgy
bTvJgBASc7dMiWEd9FhnHkJvrcSdWg==
=MaeZ
-----END PGP SIGNATURE-----

--FMZpx69m2EBT12kS--

