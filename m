Return-Path: <linux-next+bounces-8619-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E89BE9B32
	for <lists+linux-next@lfdr.de>; Fri, 17 Oct 2025 17:21:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 348EB586583
	for <lists+linux-next@lfdr.de>; Fri, 17 Oct 2025 15:13:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4707632C93B;
	Fri, 17 Oct 2025 15:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NRDTzZOz"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D44F32C92D;
	Fri, 17 Oct 2025 15:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760713920; cv=none; b=me5AHPpDSNYRSc+B0SObxG6xo0xWI/CcPpUzrHFmOTZaf4D+PgLqqEiiCC8jydn4ZRHPpKcC+QMGJ4JFUikVDRD3jXe5Jwn1wZg0wSDBaIuj4bYvEbOOR0E9ZIdXbgHz+waIw3owe5rLVj2XF62e33/XrkNarudF5w68KdWIYAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760713920; c=relaxed/simple;
	bh=3A2UtV8RSX0mCUrhuUG29mYiPpgPMUzBVAKt7huF7KA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QA+BcA0WyxBJ95mHXBTHrGmD5Qq0nCykhZLBNPCJjp/GtZnI3AROxOZIYL6tXiOs6sSVEocObqleIExTwxwR08KzOMIkptsNjJPrU+LRNLLG1dsiEVNz3cERf/X5e6FXOwlBYDhpFyNRNbp8NdeX1U2a9+rbVkhOSxnsblZByFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NRDTzZOz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37375C4CEF9;
	Fri, 17 Oct 2025 15:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760713919;
	bh=3A2UtV8RSX0mCUrhuUG29mYiPpgPMUzBVAKt7huF7KA=;
	h=Date:From:To:Cc:Subject:From;
	b=NRDTzZOzFYy5ANzeAKeDoR+ro2uvff75Y7+Q7x1MupFoVUeKu/zYODffEnV7EbrFc
	 rka4nz/mpoqXf2fuINnEqluPazRCftMS2MhaHHVpmmL3Zar4sb5hF2kmkW8CAOTGvL
	 TORP1fFuIugZmZk96JP9IcR3qDF0Prvc16O5UEhez14YI5+SejATPFFRF19azIPJC6
	 VnCj5e8xS6KsAvqke4hvaXOKVZ4I1UfMIYNxRgOIwo6Q7sf8FlSFZ1thI31nLU6si2
	 HvfIzVlFp0vyAG1P46h938tt4+Jl8xX/raKpYa9F28m59Un5zSrXHmF8rlsg6aIcBs
	 Id7SecAzyl6nA==
Date: Fri, 17 Oct 2025 16:11:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Oct 17
Message-ID: <aPJcvDHsHD-Wdy30@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DwfsC3uvfopCyYSO"
Content-Disposition: inline


--DwfsC3uvfopCyYSO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Stephen will be back from vaction on Monday so normal service will be
resumed.

Changes since 20251016:

The mm-nomm-unstable tree gained a build failure for which I reverted a
commit.

The libcrypto tree gained a conflict with the crypto tree.

The gpio-brgl tree gained a build failure, I used the version from
20251016 instead.

Non-merge commits (relative to Linus' tree): 2117
 2125 files changed, 70693 insertions(+), 31577 deletions(-)

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

--DwfsC3uvfopCyYSO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjyXLsACgkQJNaLcl1U
h9Chpwf/YKi+HryWPzprRb2DJHw7tnHUAnKsqawK0ol/LkC6KQb0uOg7rJxzHb0V
cOxwUljFeH81oKHgeXI+9yeGFIWEV6PYo2hd1SUiI3YQLLOOi13z3wLHsQK9oo+D
KQ6AwieTpIE6vRPjWgn3FJixLRLyMVJkIi/y0prZsblBPSsXa+k6/VrrhbzgdNky
QV4FO33ZlPWw0B/OTmnbedXn5Rh30oP2C8KCi4579dlnF9AjjtWZQl0dsvO7P9tT
SymleD2FQrdQvffu6FqcfPYwpivOzsxZGWRLchHqRarsRCenhE4MdWR2cn4B+xId
VpT82f/VyMOOUXr53LtDPhcYgNFPcQ==
=OB9V
-----END PGP SIGNATURE-----

--DwfsC3uvfopCyYSO--

