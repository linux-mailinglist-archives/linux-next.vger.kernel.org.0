Return-Path: <linux-next+bounces-8585-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C20F8BD2C16
	for <lists+linux-next@lfdr.de>; Mon, 13 Oct 2025 13:19:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 786294ED54B
	for <lists+linux-next@lfdr.de>; Mon, 13 Oct 2025 11:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E93022248B4;
	Mon, 13 Oct 2025 11:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M4XPpfk5"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19202045B5;
	Mon, 13 Oct 2025 11:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760354357; cv=none; b=LYbRBp3y/rmlVXxXl/PYiVXZ4wDn2tMz8VALP3MuYg93dhZHlFI+Oe4Rra6WTtM7XnVNN9Ey5bDq/9ZiVcivfPOJjADe2gkn4tQWvk/n9uRjhLXC/fyafJdQ5avydSIBq6evNUy1zRWAW2wheVkujtcNX6cEB6ooKGgMIxetm3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760354357; c=relaxed/simple;
	bh=ewqwrAQCMIZ0VP/nXg4M8cv/HRuQ3hmnE4a/FZitw6A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UPKkrLJJSqJicKcgZqS1KW62+T8lNhvUIL2u/ZX5WRAg1ov0NYoSvDosMFHaW6KE9ZKsEdAUynXbix7fTM7D5YLVKu+R7MZ92tkIiLPwiG+5WF3YuaRRh1Ziee8ykC5Bpo0duo9hcFmqXeDrF/0HRumV4s0eN1AUfBMIepVG/OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M4XPpfk5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0894C4CEE7;
	Mon, 13 Oct 2025 11:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760354357;
	bh=ewqwrAQCMIZ0VP/nXg4M8cv/HRuQ3hmnE4a/FZitw6A=;
	h=Date:From:To:Cc:Subject:From;
	b=M4XPpfk54pq6FlHn1/ftqnHRbHRsseqt+idTHrzY7zK7ZKG27qB+tjdgVTbM7ohzA
	 Fjmw8jeyB8dRv8W3kqGHZdJpOwHewBAtt44Il6wGSC7xCfom2L/HQ6BhPK2YzwDYAR
	 1G9DmKTcMUn8ZMHTwX9M1F9oSS0sq9SqChbx2peFGsTfmmZJad1tzEuBdbhzZp6RuW
	 Ch3MhPJaa8O+d+Vat9dDKhjx6PhyXwzqBbPfYUs8wRhmZa23NbzKxLcbmJDaA//w2w
	 F5zrZ0Oot8SN0rcp8G1stqm9ly38Awjw9f4DXGFGlQw++5gZ1MpoFfAVfkp0KBP+lv
	 3OLbP5u6N2+nw==
Date: Mon, 13 Oct 2025 12:19:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Oct 13
Message-ID: <aOzgMbVHy8VqJ7mb@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oSiGYOY4cHKecAKp"
Content-Disposition: inline


--oSiGYOY4cHKecAKp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20251010:

None!

Non-merge commits (relative to Linus' tree): 737
 678 files changed, 17274 insertions(+), 10983 deletions(-)

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

--oSiGYOY4cHKecAKp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjs4DEACgkQJNaLcl1U
h9DZmgf/fpRbVg+FwMGJwmF5lOM7qaUMG7v6aLWiTHdH8891RBvhGywJe9hyVKwb
OFKPiddYLfB7ae1R5RRiC+lb9F9Gx5WAefwQ+666B8h6xgwhvfYmOgkbIYlJoi5K
gv7aPKbImeLMZ4yLoQees6PLHNOlNB8FMa0Pu/IvlEtayumrH93CP5STUfo87Q+U
WRvj76Uslc82Z28YuLwa40rPtanJLbv6qp94jyhJJkeQ9AdKCH2+BAzHqubADq8v
PrM0eu6nkVkAy/cMnIPP/trHDNN0pxN5M7MRzv5lHW/qpU4cxpG6Y/HkNjAXAAdf
ozEtHhG6qu1iV75SFzwXVXzwjjGbeg==
=9mJi
-----END PGP SIGNATURE-----

--oSiGYOY4cHKecAKp--

