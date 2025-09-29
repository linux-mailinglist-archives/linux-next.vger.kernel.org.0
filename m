Return-Path: <linux-next+bounces-8521-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0A9BA9C76
	for <lists+linux-next@lfdr.de>; Mon, 29 Sep 2025 17:20:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43E213BA9F5
	for <lists+linux-next@lfdr.de>; Mon, 29 Sep 2025 15:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B45B30ACE0;
	Mon, 29 Sep 2025 15:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BpGF/ol4"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E891DE89A;
	Mon, 29 Sep 2025 15:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759159231; cv=none; b=qHnu+cJOKVR11LAoFHzu1X2fcH3qk9L9jpYuXnZot4awr2gPh7ejTpJpTXRzFr6Gc0MaODxP9x216aaWjm+ey/Or6YrDv17z6UI8BcxB5jLvBaf8lcystMRTgn0VjtVjRtqR6Xok4La/OHtQJYk4HR+1FRDTQrmSoprFkhV0duE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759159231; c=relaxed/simple;
	bh=mRzPyyaEQdoIZjSLGjadJXvQ6OgpCyUXb24eAv8Yt9w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X8PrGNUSKgE9dypDwSBQgjHcA7HpOOw9jna6dws204zML2vF815iv+YLl5urK0lRub/HE0yR6yepMc0wZctNHacgeTaDGX6Xx0dvbb8q6qMvHspb/8L/F+1n3RI2sM/KgNPR7p/U444XxUV6XUQbR3Bzk+337qH4XVqkoWclZuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BpGF/ol4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15F5BC4CEF4;
	Mon, 29 Sep 2025 15:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759159229;
	bh=mRzPyyaEQdoIZjSLGjadJXvQ6OgpCyUXb24eAv8Yt9w=;
	h=Date:From:To:Cc:Subject:From;
	b=BpGF/ol4Q3HUnroR8ZxKYNYmTDLUHXJsFdZnL5BG6bJBG9LUuWUJlRO6/YnKKv7Ry
	 JkF7hp71QSF4YJdQ4PuxqPxVOgW5PQwqoguLa4VJmkskwwBZIOHyVV47ic3WExqPFH
	 6r/4LLYSZtbHcD/RINjMVGa0TN9kmxTed3SjksPXUNT2QuxhEdE2shPDwBCH6lxtIu
	 3OAFahwJklq5pMdrrLcdTfnDJB0iMEAg8g/rr2uBxCIsjFyAhXS8hBN29iZAaiSWdF
	 ++dJWN3GMNhIsiU6+Ek5krx4Gx8KJ361LNoz+8Bx08L9sojIpMnI2pVzFkyHW0Qokm
	 HSZD5fMAWG3Ug==
Date: Mon, 29 Sep 2025 16:20:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 29
Message-ID: <aNqjuhJUX8ZuzMIj@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OjMzcx4UcwNFiIR3"
Content-Disposition: inline


--OjMzcx4UcwNFiIR3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

There will be no releases on Tueday or Wednesday, they will resume on
Thursday.

As a reminder we are in the merge window, please do not add new
non-bugfix commits.

Changes since 20250926:

The vfs-brauner tree gained a build failure for which I applied a fixup.

The net-next tree gained a conflict with the v4l-dvb tree.

The vhost tree gained a conflict with the net-next tree.

Non-merge commits (relative to Linus' tree): 11590
 11571 files changed, 552562 insertions(+), 212078 deletions(-)

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

--OjMzcx4UcwNFiIR3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjao7kACgkQJNaLcl1U
h9AlaAf/TXtDOUC5ssi3rDatHmkf3DAxzOz9GM8ANCU6cGWGltqbVEnMSfK24G9t
3HdPQmlvK00OJw21h3MFu19x69DDcQfrc0PocQFDoHrPlY6epYsJrfjyERu+xz8N
88LOqiEvDU7Cqc8jgrzoMyHQQh1sKbAE7/0fZgOAvxCduvSNNaChd68Hc3QkyH93
JWr3AAFFcnfYOO0bYYEZyEeO323G03cIuBaWiiSPFy3wB0+knzTm/3XZBZX0Wnb8
f2CPgv0e8u2r36TThUKh7jY6hvI8sc8fuBkpxEU9cIifU0KwPS+Q5ACWlWxdwoNI
u3E0k9zvN289+ixdYpuwn1VZM6zWbQ==
=DRcR
-----END PGP SIGNATURE-----

--OjMzcx4UcwNFiIR3--

