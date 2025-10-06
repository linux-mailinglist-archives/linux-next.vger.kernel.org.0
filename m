Return-Path: <linux-next+bounces-8566-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D13DCBBE0C5
	for <lists+linux-next@lfdr.de>; Mon, 06 Oct 2025 14:38:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90A813BB497
	for <lists+linux-next@lfdr.de>; Mon,  6 Oct 2025 12:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D709627FB03;
	Mon,  6 Oct 2025 12:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YykK2iqf"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD758273D81;
	Mon,  6 Oct 2025 12:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759754315; cv=none; b=o90MArw3XAf6aqFWQ6MDHlkS1i/Im9zZOiF0v5YElLK63ZyoE06QEzFmCMLw2LqTPQH1JClj0z+I1nLnhEc7eCsodKtCMrSm5jZzXnFl3sAYVSRbV4nsJpTgjh7dbQQPZXMFdthxQtpwqKqP5DlGsBVrJoRdfHIHGqcW3qu0zU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759754315; c=relaxed/simple;
	bh=3eePWms8AJLSvmuQ9iMNET+qIP5WSFVbrXu5t1ojWag=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GXqiJQLdQhJ6AiOc4ekfvuh2PLg8O9nxqZ8EmwJDFaNJ9wZC0J6RqzEiN6QLwceYLqGz1hGZ/cOEf+vR9hp/vWBTY0KeO8wvrJL75fpxaucEFfEE/dii2Sb+glstYygV+qlBUqY72ee8W4iH6FLJ4k+j8Hk2KyF5ab+2YQuW+80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YykK2iqf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CE68C4CEF5;
	Mon,  6 Oct 2025 12:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759754315;
	bh=3eePWms8AJLSvmuQ9iMNET+qIP5WSFVbrXu5t1ojWag=;
	h=Date:From:To:Cc:Subject:From;
	b=YykK2iqfQnNfm3rS0ZXTaIQvH0RXnjqJGf8+mtrYaJqIgNSaqqlEL1UpaDfsMm2Ph
	 hVks88/sTvvAHBFAGF/CsISauv7M19I3P3F5AE2cIatCLY+EVn1phSq2BkK3TemSjS
	 tGQ0tA7PiIdWmIRTV+LNqABlEGZdlE/8Dxb7wI6pkis0eTvd7hgKAKopbGMAoXNqM0
	 efYZPFqA+POGGQCu8sgitR8Jre4skOE7BODylhR2bO0awVrkQWi+705dNGlqoyAXdl
	 rz+9M8dREJJid+2sWlGdU9L1Vo9u8tW3zoSJJ9o/L6q21WnaIiA/8T9vusHfP/vnhi
	 YV3AGm1OEuzhg==
Date: Mon, 6 Oct 2025 13:38:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Oct 6
Message-ID: <aOO4RxMffA40SRcG@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Iu2oxZxJM5r20IFw"
Content-Disposition: inline


--Iu2oxZxJM5r20IFw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20251003:

The mailbox tree gained a build failure, I used the version from
20251003 instead.

Non-merge commits (relative to Linus' tree): 1581
 1684 files changed, 70107 insertions(+), 31638 deletions(-)

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

--Iu2oxZxJM5r20IFw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjjuEYACgkQJNaLcl1U
h9CWFAf+M/wXRSFtBtk2qUOWCGL3Cyj1hnZ2mbqmv6E4Mz7DwmUTB5h5qFdAJSKH
8R5U3I9h3wfRZkzLEX7vzqYQBte4YEdrCs9ezv5prOgyjVPsZFk/sN5+5yi/wWBI
VUoRywzecKwljpvzzu5zgH8ERHxKc9UU78X7tURoEKj9UEheOEwrQU1xTytEfXgI
GWlEByeIidyC9lEPWzeURoAdU0XMCK+nxhdC81c5CxrAbHcJ95zM9JUIUsTNJVDM
iJ4oH+qcDsRZAiecHNGeIbpvGao+r+WmcnzR65B5IaNy/t12VAnKCI8EgMjcI/60
WY8Cjb2r3DbyiwBj4t5DnlbVwpHCOA==
=Va9P
-----END PGP SIGNATURE-----

--Iu2oxZxJM5r20IFw--

