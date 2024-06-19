Return-Path: <linux-next+bounces-2601-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 973C390F213
	for <lists+linux-next@lfdr.de>; Wed, 19 Jun 2024 17:26:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 526FA1F22ACC
	for <lists+linux-next@lfdr.de>; Wed, 19 Jun 2024 15:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7687C13F426;
	Wed, 19 Jun 2024 15:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IF3cdEsa"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8BB13C676;
	Wed, 19 Jun 2024 15:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718810750; cv=none; b=kIZWjEH4RnRKytex8e8lJeS7UTC5qwdVuSw6p6ccw7zhO5DLbJNe+ivAAMlovyH9px6cgi0+waXDutfAEZkEfyq4bFE6xbQ7WmC3VzZOQLzBem77RTybXHPqB/BQKAqeQxSbveuGiz/AD3xW4v0BiHfniltQQDLav3EaKrFWRiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718810750; c=relaxed/simple;
	bh=KnBRaCMJ7PQVhc64M/Jh+r8IKDFW7kujI10v4h+YJE0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s3KhIttw2ZPqVXGlbq1qhBgXepbGrlL6ByY7hyaIsr9mbDDGrp6ZqXsOGk/+Pn9NBon4JId/deQq3iVSdcFcVJaHBhk8mD8LmQTUjK/XzWsEEmdC08jUA/KLIKa5GCWK2Wu7hNCVze4YprDuCbideNFVfXFLS086F4N/X+Ky0Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IF3cdEsa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12F48C2BBFC;
	Wed, 19 Jun 2024 15:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718810749;
	bh=KnBRaCMJ7PQVhc64M/Jh+r8IKDFW7kujI10v4h+YJE0=;
	h=Date:From:To:Cc:Subject:From;
	b=IF3cdEsaPJyVckqTU7FvwLKUmH9Oy6E+F7u9RoidXU2Fd2ngob66NNj6XvUIWGbtl
	 isqDkGLUliEJyIqWZpXqgJNtKfcqx16zSO+ZWJuHypDxnQvL+acjRrOGrMMBNEgU7R
	 DS4MYTohxoiEG03YOzhRyDDsPphFIsDGbCvEk+HJm1Dd8aOC83jNca9yCv6vfRFxBz
	 RDphvPxp/CsIfT4WXLyLwN11pR7ZxCYBwO/ja9QX08qqncjWjSSnsrA41wFw4U56EA
	 tlzZBoenISb2HGS8Ak6caTcFwBC4PCqsidBdoTe3g6b7rKPtD4UvtZbtYcvNnrtPNb
	 Gpp4Slno3TpSw==
Date: Wed, 19 Jun 2024 16:25:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jun 19
Message-ID: <ZnL4evFtHPLHl4f7@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oG8QnXiMS9PHkCIO"
Content-Disposition: inline


--oG8QnXiMS9PHkCIO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20240618:

The mm-everything tree gained a build failure for which I applied a
workaround.

The paulmck tree gained a build failure, I used the tree from 20240618.

The kvm tree gained a conflict with the tip tree.

Non-merge commits (relative to Linus' tree): 6348
 6756 files changed, 585477 insertions(+), 116016 deletions(-)

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

I am currently merging 377 trees (counting Linus' and 106 trees of bug
fix patches pending for the current merge release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Status of my local build tests will be at
http://kisskb.ellerman.id.au/linux-next .  If maintainers want to give
advice about cross compilers/configs that work, we are always open to add
more builds.

Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
Gortmaker for triage and bug fixes.

--oG8QnXiMS9PHkCIO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZy+HkACgkQJNaLcl1U
h9DesAf/YQHfqjZenYhdyj/TB8tkT0r/iD9gt+CqGtc3N2Wr5FRTMsLxUbTttubX
Tt4hnDxDMpS8neLMO+TuwawLPMOHttJA7BTuu1s1e47h2KxF+lsak2vrm8ZdNvGO
wN/X8WoJZ5gH8g1uXn2m3hQSlk3wLmUdUvPoiz8CU3Ku62WZ9u6V8dHlJTnNk13Q
JwwCGT21iGi2uEU9bQ5xE7WLpwWKAseMx2itBGPRW9/C3nyFMcx2yyHPsZPpoLj2
VFtO8Up7VC4BIdBTKE/n9DRR3yv5/iSuRXUR/1IpQgQQNE6MyPfH+np9YNs1JxvC
qrSGx8xR2l6rC6ox2oVTmMrXi1lSeQ==
=NFiZ
-----END PGP SIGNATURE-----

--oG8QnXiMS9PHkCIO--

