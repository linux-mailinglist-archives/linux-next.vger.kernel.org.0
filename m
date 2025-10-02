Return-Path: <linux-next+bounces-8543-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1AFBB4919
	for <lists+linux-next@lfdr.de>; Thu, 02 Oct 2025 18:37:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 648872A7BF7
	for <lists+linux-next@lfdr.de>; Thu,  2 Oct 2025 16:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DEB3265CB2;
	Thu,  2 Oct 2025 16:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hUfPY/Yk"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DF52580DE;
	Thu,  2 Oct 2025 16:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759423069; cv=none; b=jADKW1Qv/utjmJdSgqGdh3DFmnvnJ1jEKDYQ2l5l39eENztzgCdIvOzZasVN65a9QpVqUrS1Wgg9GVzIDG9lTUm3ejN2Lk53YfOPDLV6HfszpOB6Cxw2mIem9HLxw2M5nwwo8k1VfYSNUJNDd0Kzq+6x4nRIFX/f/7J3w2o4TLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759423069; c=relaxed/simple;
	bh=41//7SsDUarncGgnx9j5IJd5RHLsWKaSigrTJFxqRdw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kjym2lfTx/FkwR/eAb2Yye6MVh+nGpVE1KkHPLSwUg9RS7s5JDP53+GNugXGe6ue1EbReXa43z5qT4SqnqlRgVCQOL5cLRlGlQIgfK65twMnLlGtk/4WciOM3tz9c7epY4qlWPsGTyKvrNwcY03KzDMBM9FhExx0UbVmrDtTtp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hUfPY/Yk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 258D1C4CEF4;
	Thu,  2 Oct 2025 16:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759423067;
	bh=41//7SsDUarncGgnx9j5IJd5RHLsWKaSigrTJFxqRdw=;
	h=Date:From:To:Cc:Subject:From;
	b=hUfPY/YkBFI/e/O1h0QCVxhBszTxhbdFP+LcZruW3fMUkSHy3M5ziYLT8rfdf1Irt
	 edj/8TPNytLmBLT0R/wTphhJ65ZsSfE/OabI29bVsMrr5bHIAjfMmwm6kiFX1VmG6t
	 GKGNXBmWetQ5GIYBrOxgTZfYAaN3j6LcXQjoPnhaVANXFVCiCaZveZob4hYnKrC8xv
	 +E2fc94o19TMtUl3CrhfIvW1lTaqgX2dvc1ZLEDRgaT4IlE2BLi3r6g4J+fW5NDHHm
	 RXkzb0WVOcKOsMDC8qppwgjoRKlRliuhMNVqTwZBNR47hNlroX1ofV4K1N9t7xk7TD
	 oj7eBzbIXxFzA==
Date: Thu, 2 Oct 2025 17:37:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Oct 2
Message-ID: <aN6qWFc6hIcbRU1o@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2aQh4/qmluK+geZx"
Content-Disposition: inline


--2aQh4/qmluK+geZx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20250929:

Linus' tree gained a build failure.

The nfsd tree gained a conflict with the nfs-anna tree.

The vfs-brauner tree gained a conflict with Linus' tree.

The drm tree gained multiple conflicts with Linus' tree.

The ftrace tree gained a conflict with Linus' tree, and also a build
failure so I used the version from 20250929 instead.

The kvm tree gained a conflict with Linus' tree.

The hyperv tree gained a conflict with the fbdev tree.

Non-merge commits (relative to Linus' tree): 8092
 8162 files changed, 387039 insertions(+), 145286 deletions(-)

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
a native build of tools/perf.

Below is a summary of the state of the merge.

I am currently merging 407 trees (counting Linus' and 406 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
Gortmaker for triage and bug fixes.

--2aQh4/qmluK+geZx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjeqlcACgkQJNaLcl1U
h9BNugf8DLNneLsiHw+Hu3f4MJ6d2e6FfYMnncwC6AndlZYWAXihk2SdovqNYgLi
xiyFCS9JJUrmGjMxcr9GZpPCkV9+HHZrhGSjC8VeLySIMTAJPoQiMv7tGJLLh2hJ
ssETROifqEEdZNgFnj3473SsxvQnIJlZK3DRj+J2/WCObQrq/k/Dvc78Gugmhxuz
f+9hBlywcdZ2FnKUpa7HlUWkq61iFg0TEH/pElaol4Flz6Z5KWpWOf8V+Rn7NgXI
yo8KaRVOMgIgeCcSH2v0f0ZesqGno1op/s+yOkzAkAAl3EoXtzjU6xjN9LoOw+RV
BEwiYj+VNYdpt3yXkHW5MmgY69DObg==
=vKeK
-----END PGP SIGNATURE-----

--2aQh4/qmluK+geZx--

