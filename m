Return-Path: <linux-next+bounces-2669-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AE8916E05
	for <lists+linux-next@lfdr.de>; Tue, 25 Jun 2024 18:25:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D45B283DD9
	for <lists+linux-next@lfdr.de>; Tue, 25 Jun 2024 16:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24EDE16F913;
	Tue, 25 Jun 2024 16:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IC1X8RD0"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE92349629;
	Tue, 25 Jun 2024 16:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719332728; cv=none; b=Q/WAPtC4yAA5uWbbtEYtzouPjLOYHsJkuvODa3hfpicGbLzww0L7vlwO9Wdze3Hr8FomFqdPE+DpmQn/OwU2qVF7CMEK1sxHwLNWkHZCJtJ77GHBTxAprvkWPt5Uxo4Bo2PzXStbqRinWNPPb7LInkEC+vrplLXxVa0c59RQcD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719332728; c=relaxed/simple;
	bh=xcrOeQ1G//WvEFWLimshcglz+DJFDvXXCnBCYg5wlas=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E84iEZu2DJpiXY/ar+czGEBjS8FiV5VwG13qhRz/YZzt4y0ynr1f+LSuFcNli6sNaYEHPNIghhpF3W4pGgBoVqZ9FDzf8s9wE8+Li8utqPUWtqJ3GGA++rf2ndj0PpCmyv9wsJ4fGDHsBxOAOWGDKSYCMqZlS5UpaYDlGdEAfjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IC1X8RD0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29658C32782;
	Tue, 25 Jun 2024 16:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719332727;
	bh=xcrOeQ1G//WvEFWLimshcglz+DJFDvXXCnBCYg5wlas=;
	h=Date:From:To:Cc:Subject:From;
	b=IC1X8RD0Z2UTX5MOvq8UE8+MG/FUj1rpIgAyPVl6Rv5E0J+Mm6otr6EfNeg7M0r9s
	 06YhyP2DDdrWfuJdTdDv6mLRd65+eh9fIqzuqf1kjkbFXrpe7y6Xc4FiED1a1sjGvx
	 jNQ2F7sUOuCOaPr1gjxvsaCL2IolYkB19o/2k2EHpgldHIPhPn9omeqOL9NiU+Vaxh
	 tzI8MYl3FRDJPs64fgJMMEzRY06Wn+zKFzb7cp936Uuxpapy3rrgAMNteOQr7mkG5k
	 4gupa1euPhe3iZBF3uPLzTL8XnbQib9lQajvuEWggxwuoEbKESGk5vHzRCI2fDxL8G
	 ZscymZqwXWEzg==
Date: Tue, 25 Jun 2024 17:25:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Jun 25
Message-ID: <ZnrvdJzGbayRgjpn@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Gl2hLb5HDDNJNRJ1"
Content-Disposition: inline


--Gl2hLb5HDDNJNRJ1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20240624:

The qcom tree gained a build failure, I used the version from 20240624
instead.

The tip tree gained a build failure, I used the version from 20240624
instead.

Non-merge commits (relative to Linus' tree): 7415
 8225 files changed, 734187 insertions(+), 141975 deletions(-)

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

--Gl2hLb5HDDNJNRJ1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ673MACgkQJNaLcl1U
h9DNOwf/a/FH7CPSFX+0/LDT1bRVQcIQa7VSqhcQ6zkdkZdAFCJeBSYd5nHJ6DzD
491OGldLYnds7xypFV8OvWBd+jhQlP2eX4lYOsuPOGFLiqXxzEpJuhhzfiWEJ59g
e4OKfjcqLhcayMx6qbtw6hpLvS7NB31a86RWGJFJNRGGe+7KYdJUuBaGnKqRQarF
F5XPSwRMHANij8+qcDVEAqoV9BIobT0pUrqIy0t2pWdKM9jm1ktqnSB+Jlw5T3S0
VhwgkRgJRio3cAUdDeCape3gkLe143KpSB0fWezyimYP8RY7VN+SSnUsIUrOL0bU
geAC2gch43JHr8hIJOFvJi/ytnXF2Q==
=cfiR
-----END PGP SIGNATURE-----

--Gl2hLb5HDDNJNRJ1--

