Return-Path: <linux-next+bounces-9689-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8420ED32178
	for <lists+linux-next@lfdr.de>; Fri, 16 Jan 2026 14:49:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D60E03004877
	for <lists+linux-next@lfdr.de>; Fri, 16 Jan 2026 13:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22732274B53;
	Fri, 16 Jan 2026 13:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U1VPBLnq"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F165C230BD9;
	Fri, 16 Jan 2026 13:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768571381; cv=none; b=kjuQMw9bDuikCIxgEXu2dpoYJlx9OW66Ohte9Xx6egZTCl6ySL3umFWVf9AsC0mo78vVYdLPo00WqSsTrQlqFPnQzLjc3nmBwYwAyNjpt6wJYvjbmSQ77JSXt16WZuzR3D+A6W9aYtfANH+l1pD/T+0pbsxUaRghpi/fQejuf2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768571381; c=relaxed/simple;
	bh=I/f++J7L0sXt18ka6gEu/9VsAU3TtfyQCiktrtix8Tg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tlqBkEjnpXm8jfS/nVptK5KPSN+oC5E5pofqsQE/pmxU/E97bTvN9B9PdASNSar/DXqOvZJo8AagClQ0VAnVEfDfX0cAFsAoeKkXEP/VGMDagbajKjufK2hTsua43YkB97lIal7KCU7wR1P5nhDgGvtCU3q63yeMR7LTvfh0b5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U1VPBLnq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C79A6C116C6;
	Fri, 16 Jan 2026 13:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768571380;
	bh=I/f++J7L0sXt18ka6gEu/9VsAU3TtfyQCiktrtix8Tg=;
	h=Date:From:To:Cc:Subject:From;
	b=U1VPBLnq9ab7kxomAToT7ogrSS4SfQKySu28j7FbpU1OGT1Df9NeNGL1yytTOYOdZ
	 VJRy3OOsm7tuz2CNdifxj/ocjkoiyNBX841Cm86OwRTRZdWQtSkLjgl9YPjisxnRLY
	 kQjB57jmoQbIGXBs28GDe4rKpcGOAm7uwPQWJYi+1xsya+6IqJief35Z1GU21HbLFv
	 3p6canOgFOebNY4BGupFRvS4fP5Kkn8HUT8TaWPJriaJuhscAqccg03TOYT2NMN684
	 oyu5bvGx7ImasJvzMz3SqOIG9Ju8M6BQz8ZnutPrQI0LDexNxBgbNImaqEtvqmdk6/
	 aggzT3Hj0BtpQ==
Date: Fri, 16 Jan 2026 13:49:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jan 16
Message-ID: <aWpB78IspwczpLby@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JEMkA+mYF9VMFRmC"
Content-Disposition: inline


--JEMkA+mYF9VMFRmC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20260115:

The cxl tree gained a conflict with the cxl-fixes tree.

Non-merge commits (relative to Linus' tree): 6117
 6133 files changed, 378823 insertions(+), 112960 deletions(-)

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
and a native build of tools/perf. After the final fixups (if any), I do
an x86_64 modules_install followed by builds for x86_64 allnoconfig,
arm64 allyesconfig, powerpc allnoconfig (32 and 64 bit),
ppc44x_defconfig and pseries_le_defconfig and i386, s390, sparc and
sparc64 defconfig and htmldocs. And finally, a simple boot test of the
powerpc pseries_le_defconfig kernel in qemu (with and without kvm
enabled).

Below is a summary of the state of the merge.

I am currently merging 405 trees (counting Linus' and 122 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
Gortmaker for triage and bug fixes.

--JEMkA+mYF9VMFRmC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlqQe8ACgkQJNaLcl1U
h9DzWQf/dVuFdYpmSMpKjda5xcNB0DpR5LJrnQjq6ICwjVl57yeCv6coH6O9umcU
hN26pVb4YiZ+djBd6C7BiShjecG9HoaJZPuiB2GKDQmAFj+bX70GZK7eegn60N++
tV2gQfVFosY9vdxgqpNjeBYKmqA/UwlvpP0VqsxHXV8h6woIs7iflg2G9m3PweF9
G62a+pxCbjmUEGocp3MgbbQyveW26YVZwRPcr3F7uBZWfH6hda07aIgXrEq1m8Cx
+j0SoDmItmwlAKgo7AKWEXNFKmEs7pS0Ejqfjs6dwE2HtDQr8X+7GPpnic2aj8aR
sY1tfrkrTN+HLbRZk/XnM9mIrZ8HzQ==
=S8w7
-----END PGP SIGNATURE-----

--JEMkA+mYF9VMFRmC--

