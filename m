Return-Path: <linux-next+bounces-2684-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E1391973F
	for <lists+linux-next@lfdr.de>; Wed, 26 Jun 2024 21:12:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 820EC1F225E1
	for <lists+linux-next@lfdr.de>; Wed, 26 Jun 2024 19:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14BAE19149B;
	Wed, 26 Jun 2024 19:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tqoxRZOi"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDABA191495;
	Wed, 26 Jun 2024 19:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719429143; cv=none; b=CZAyeB2Yxz+JlNsXEDSyhKey3Hu6oF+H1jOK46fhmOUrYGSggJYaGeFb5/XdULJH4C1vFzJgukTnwyVqaI99p7ci49Cbg+kRVZ7yYcwherHbpCQSGh79Sv8mMK2xqBgApZMe+TZBzwnU+O1D4dEKNLsE/iJnSGrwEV8QsXc6kVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719429143; c=relaxed/simple;
	bh=Gv/B8Zf6gnCvJrNa3a8Gz1A6sTWNe8x8l4s9b5SCHu0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qOR40DjWAstjt0O6q7MHxTLDTpobuvnOJNGRcsUS9l/ktUw83D0/onh1qM8vks/O3378FScn/Ir9pyVOkGeCHZrcNLpwslzSyZMgJTYLkFzE6uLCdXMmpmfpmrkI3Pu+o4gfxGhieNWr+ux3ysdotINrgV2hhMRprRvuhQBbIIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tqoxRZOi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F55BC32782;
	Wed, 26 Jun 2024 19:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719429142;
	bh=Gv/B8Zf6gnCvJrNa3a8Gz1A6sTWNe8x8l4s9b5SCHu0=;
	h=Date:From:To:Cc:Subject:From;
	b=tqoxRZOiIf5p6sopRCgB8vRVq3ofp0JvDSDaQrITrHy/DyU3tX+2R/DcOxWh4vLdz
	 qMVg+ktK0cVDHDR82i/xK/XRImSrGkgeTGY298Ok/5rX/cptKJ/BoqItpbUcXoJELU
	 +3OumdWT7EM9bThu0DCSntqaXK/Zif+CDCvL2mgkjN8GHaI7h7MLJQtmgekRWYATq6
	 TEG1y2lD4cfQcDlzz6BIMrNGKb0ZSw5ZygdvTAz1XRF1JlK0UE2//0OWPj23CVJv8J
	 nKTmJ5dJ3JEfx2SZpR/cxHJ06Bk0NAkrBsLhqJffS+KUVMxaySSq+9U/tKcA+3dJud
	 KISHhRVHDrVxw==
Date: Wed, 26 Jun 2024 20:12:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jun 26
Message-ID: <ZnxoEsUjw3N98vaj@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Cniid+g8e7TXYD4Y"
Content-Disposition: inline


--Cniid+g8e7TXYD4Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20240625:

The sound tree gained a conflict with the sound-asoc-fixes tree.

The rpmsg tree gained a build failure, I used the version from 20240625
instead.

Non-merge commits (relative to Linus' tree): 7866
 8606 files changed, 753216 insertions(+), 149731 deletions(-)

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

--Cniid+g8e7TXYD4Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ8aBIACgkQJNaLcl1U
h9BbPgf/eNzHGeVqqfh5FGnMYn1CeVXTGYk9aShS0q5HHKOhwRqRkrT9nMbStqIH
Znle4iYUYNmIwudX9N9McQDcyWGDY1p2OJQJU6NoTSHmVlAtZGSVVxSlGyX6Y5Mb
6lrOKXsdI2vxvvvwMkvOjHANwcFoerw7Km0YVaJJo5zV7Oqj1E+v2au6WMTORuhh
/wqLjYp2qX1Y1Se5UWv9JAJxniCWM4IhgrPPGjxk3RsjKeGFxZ0WXZRnLpaS0aH7
IQLX9Dj5kB/+v4Vq1cv7umv8K1gsQiF5ZJ0Id64hF1rpanhuK6hfCQo5Igdspbgh
HJ3k7iLAETB8uGbftD9sLwz+Z2MyDw==
=USx5
-----END PGP SIGNATURE-----

--Cniid+g8e7TXYD4Y--

