Return-Path: <linux-next+bounces-2695-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C00791AE76
	for <lists+linux-next@lfdr.de>; Thu, 27 Jun 2024 19:49:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EE946B231CA
	for <lists+linux-next@lfdr.de>; Thu, 27 Jun 2024 17:49:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5391319DF95;
	Thu, 27 Jun 2024 17:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nYWlA3na"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D8E19DF8B;
	Thu, 27 Jun 2024 17:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719510536; cv=none; b=aYAYyNdclL6QmyjIVS5aKAng17+1VcPJwXhaaSIP07vdf8nXFSfOXJ/LG2iYpZ/vLWp+uwSJm/2U6Hehn8ZPGW4ie/EIX9HExLxFXydsiMEZMpROoHvJ6wlhExKxFe4pIJhi7V/KLFEil6LLD09uRZugylh8YIi0Q7nHjRsAu1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719510536; c=relaxed/simple;
	bh=8gVzBekE2oyh3Wr+wM9bjtLGi+3aTY8+Iej1gUuNYTI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bJihqm8q4y0R+ljUM0W/FvtFAi/SxpIp5Op49/EM4wmBo/a38qA9myDKaj9tKOH6tZz2g+eYAjSFPdDyO3r19TUaSOPADuZft70z/KkVduQYczGwc9P2yXCj8ULLDTGY61FtjNACK57Vl9FuEDA7cVTXCZVSd3TvTFoxWOLIJM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nYWlA3na; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3E5EC2BBFC;
	Thu, 27 Jun 2024 17:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719510535;
	bh=8gVzBekE2oyh3Wr+wM9bjtLGi+3aTY8+Iej1gUuNYTI=;
	h=Date:From:To:Cc:Subject:From;
	b=nYWlA3naWyEy4jbCxEIqtUCy1CZvU1CtcEXb/UwnZq+wykJnE6+uWFy47eTcUj7Qz
	 sEufNB853c6mCPWbF8HengG6rpMwBY7xeloX0G3OUVvF2ITWurEDbm4N1+GFCvJL7c
	 +vK6EcryevJutRoMFQn3PcImhz0ZeniaiKjBdebvJje9kfuYLzpOclpIARkFgVdFwv
	 034IQNEzxx5hGYL0DjXSJWmtqFWelWAUKqegpxiAb60WxPISSYj7Q9ltZcmRMCjXYh
	 bJHd1i4LsVlSP05phimYeZljCMk0Zok9Q6lSEPQRk3gYFByQuLhyhYs4qy7X6wbBBO
	 drbNaviiiTw0g==
Date: Thu, 27 Jun 2024 18:48:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jun 27
Message-ID: <Zn2mBPrQHe4k1TXC@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6R/g9yWYluo+aSeQ"
Content-Disposition: inline


--6R/g9yWYluo+aSeQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20240626:

The rpmsg tree gained a build failure, I used the version from 20240626
instead.

The vfs-brauner tree gained a build failure, I used the version from
20240626 instead.

The drm tree gained multiple conflicts with the drm-fixes tree.

The drm tree gained a conflict with Linus' tree.

The leds-lj tree gained a conflict with the chrome-platform tree.

Non-merge commits (relative to Linus' tree): 8127
 8860 files changed, 765288 insertions(+), 152271 deletions(-)

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

--6R/g9yWYluo+aSeQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ9pgMACgkQJNaLcl1U
h9BnAwf+LfsBtV8Fi/SWpoMLJltuLYyK4Cq5O1h3prZYUvjM1DX4pRDdNLkr57NU
E8A9KIHdf8ptE3Dc1wt7df/uJdmfGtu18t1sQyQqmlpXzpgyKnAUJsBf3l52CI2s
v1kOku3GrxktF1UyoaAm1Vku8nVWNuT4wy/bGWS/s9QBO27ZhB76bKFoRrmUKdqD
g8K3xvksjKYIiQbpBQ4DrQRVCtaSOviaoXY8dyJukGb2PON+ede6QSaLvdqM/q0w
f9OHByQsnFkmQUBNPCkDX9q/M+6IqUoM2jT01Qiuokuv5csU4BFwqYVNKTo1uLh0
a3y8grm9uArLzO13A564zD8y0x9jig==
=m0PV
-----END PGP SIGNATURE-----

--6R/g9yWYluo+aSeQ--

