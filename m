Return-Path: <linux-next+bounces-4881-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEEF9E3D3A
	for <lists+linux-next@lfdr.de>; Wed,  4 Dec 2024 15:50:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1BD9B16225C
	for <lists+linux-next@lfdr.de>; Wed,  4 Dec 2024 14:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C03020C00D;
	Wed,  4 Dec 2024 14:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LyTz6L2A"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D197D20C00A;
	Wed,  4 Dec 2024 14:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733323800; cv=none; b=qygUi0EPN6EcV7vHpg4EOd3GHuYL2lDonM/RztGNjcgBFDaXFRJWrstYSzCqb/mdn0f0vmMVm/7BpD+ufzFe9Oda8HtfALmLIjLWYwnBcJBo+J53C2nnhy573a4g9tsGLh54fZGK77d+TRgL5FrO/5kpUbXUhESX86N99RHcalI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733323800; c=relaxed/simple;
	bh=SXYiOg7sCEsshSv5in7bYG/cn1JLWYDjWECIwnuFPHM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S57GQYDU4GPRAaLnAsyYHQwdO5wovNDZhgcAYkIDYlVD6MJN8oUavjRq6ukGCB9FnGmUYoLg7j7CKwbrRmUk8o/mpkx+nBRG5koo9cpdBVjM2XVXyyGNrUEB+N2PzhvJawIQhkEC6uGqvfasLBtKKdEVE3QiPGoQUr33q702mgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LyTz6L2A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1798C4CECD;
	Wed,  4 Dec 2024 14:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733323800;
	bh=SXYiOg7sCEsshSv5in7bYG/cn1JLWYDjWECIwnuFPHM=;
	h=Date:From:To:Cc:Subject:From;
	b=LyTz6L2AMXhvY1hX/r7eHjonMwh3v51vB1ujVf83gjfFLXtMho5I69rVOyBFl0xdT
	 OnpRYWn9QeDQe4Sx9ea9mv0h1bjcMJJlOLZO6bla/nLbvlnKQVqEpZLghb9ZpRPTAf
	 SipXe8S/mfbl+Echmagz9BKsNiMFFACOnEm7stxROo9G1kQN8nH3P0NSTeIKKqCUde
	 Ss6AD7fkGThBhbzD0pDLQ3r9hfmi1VMq3cB8vDs/Qm4kTt6m/ZIwtTQBfNYAJglwA8
	 GHRGr17bWRK22Sm1hSg+bLpBgELbpvXygrivCfGwtTQir3sis3wNyQsCdn6AIJ14pn
	 1Id+0erL3aA7Q==
Date: Wed, 4 Dec 2024 14:49:56 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Dec 4
Message-ID: <Z1BsFNdGqJQNe17G@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Z4Jo/EfryksjxvzX"
Content-Disposition: inline


--Z4Jo/EfryksjxvzX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20241203:

The drm-xe tree gained a bad interaction with the module changes.

Non-merge commits (relative to Linus' tree): 1477
 1480 files changed, 62765 insertions(+), 30120 deletions(-)

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

I am currently merging 387 trees (counting Linus' and 148 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
Gortmaker for triage and bug fixes.

--Z4Jo/EfryksjxvzX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdQbBQACgkQJNaLcl1U
h9CMgwf9Gejik72iK01DCXuqEfa7hYrhB+T2j10Eyis5/ZP8dRTIpnlVq1+l2yR8
A6oZTuLlNOUpz77dmfsC6V0vrIUG/4vDMmkONrafPCUOmuoqaK45WUduNf5sPW0Z
zQSnYyBRTHGXfafqPZHFzkRpD1AJM+Qm0foRAbnPi3vpkOTclwEeAhuFVdIxKTLf
oNjcjgXJw3F63byGMLSbvk9/6EUAR7U10zY32j873VNHLHtv8q2J8rTAKLSUAEoG
W4oKk0uQX0XEZhKi8C9uJmxtcWo6q2+P8jCiwn1EuX1V0Oes3rqXA03dWVVe7b+5
FVdDFg0ULQDE/EBxL+TiDiEig1dPbA==
=TATX
-----END PGP SIGNATURE-----

--Z4Jo/EfryksjxvzX--

