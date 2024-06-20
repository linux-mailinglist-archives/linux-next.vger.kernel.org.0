Return-Path: <linux-next+bounces-2613-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE2D910B71
	for <lists+linux-next@lfdr.de>; Thu, 20 Jun 2024 18:10:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7AE9A1C24ABD
	for <lists+linux-next@lfdr.de>; Thu, 20 Jun 2024 16:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A677D1B1514;
	Thu, 20 Jun 2024 16:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m1N5ZWMZ"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1611B1509;
	Thu, 20 Jun 2024 16:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718899824; cv=none; b=Lt70kfcaHWI2pGLA4fFto6fVm1ML5Q81cvjVNKzwkA88igv5FcVmXB+ftUUIc3dqzxz8992/ebxoP5+nH43SfvNs4ao1ceg/tl+uuNL1XZhq48ysM6ZH2x1lQ9F8mBjdWUGu8R3BBJ0A20pxMtFEHSeUupXlJWDizVRs2z/VLSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718899824; c=relaxed/simple;
	bh=7GwI5j/yDSrkvc5Pgfk2z6Kha0u3fi52ugjXtVX8NrU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b5fO4ACZSEOeEyhkTc8VqxRTf5j7HmSrEtLTbY+GLOWs8DgZHNJfW1Kg05f7ezoqw51ZybGPavFJvBrAHpnH26nTrAWY7ZK8DvgK1HxdKIKMYaxTmDhXQ7MqB+tuWrUziUqxHvL+eFvwN5dhPIShYOaxwRWFF/Zm79qZUYqQzv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m1N5ZWMZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84187C2BD10;
	Thu, 20 Jun 2024 16:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718899824;
	bh=7GwI5j/yDSrkvc5Pgfk2z6Kha0u3fi52ugjXtVX8NrU=;
	h=Date:From:To:Cc:Subject:From;
	b=m1N5ZWMZ/XSbda0wCNHyvPeIn/7PFSW86lVG8+Ney+4rTlMfydYRxl50BDj9thoQu
	 uVCpXRsp8Cl+1ljvbBo5Io4j7RBJiOW7FgaGgtyrexNf10KwnjTZLUpEVRmMnMXs3A
	 FPpSf6ZIhr4gpG0YeIVTyHRUpjjqrvAMm5uO3iRM98QIn+p26m+tHUSD+nJ1uTMJ2P
	 V7WOXR+GSKD96ZniuFSaul2ZXQgNUkHj9KHi3SszsM2ERL0Vt1wq+LZeSAdA2DzXY6
	 n2ECxUKerntdz+g4td25JkOVh4xPQiFn8f32rCkoem//EL5uwyw2pY3fKKb5vaF0aE
	 4d+Va3ulVK43g==
Date: Thu, 20 Jun 2024 17:10:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jun 20
Message-ID: <ZnRUbK1pvBJqOsoh@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ja5wTWUi8XDrbGi5"
Content-Disposition: inline


--ja5wTWUi8XDrbGi5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20240619:

The v4l-dvb-next tree gained a build failure, I used the version from
20240619 instead.

The memblock tree gained a conflict with Linus' tree.

Non-merge commits (relative to Linus' tree): 6610
 6991 files changed, 595079 insertions(+), 119966 deletions(-)

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

--ja5wTWUi8XDrbGi5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ0VGwACgkQJNaLcl1U
h9CbFgf6AxKaq2WvM99zGqR6xvmWmBT/fJwItZmalzqKC93CNpeuZOwjXEj6KDKw
r+pURQFhRX18+R/VSfkByV4cC8DcHc4wtpg6xEJunlWWXhK55ME6LHOI9mwFQwO5
7f/q4W39ttIlDaafua0moLSLTfuhvIVGm3kYguPoONgAUiMEWWWzJe0RaM1T/icg
TaVWaWf9sHcqxrMSp01JwKQlWGAuuUHWuVfaOInmn3j2bHMvO3KNGACDQtoPcwqn
gFWZyaY8C5/7iwLVjiFsfOCc6zf/kAm5oqtl9PcEUSmAEVemWskS0QCMAOoxHiHq
EqxoAG2MjJmAcNNoDprRGyWwNW0vHA==
=FEGW
-----END PGP SIGNATURE-----

--ja5wTWUi8XDrbGi5--

