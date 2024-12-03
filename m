Return-Path: <linux-next+bounces-4874-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB3B9E2F8E
	for <lists+linux-next@lfdr.de>; Wed,  4 Dec 2024 00:11:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0152282F2A
	for <lists+linux-next@lfdr.de>; Tue,  3 Dec 2024 23:11:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDF631FA167;
	Tue,  3 Dec 2024 23:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TAEm4p+8"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D338460;
	Tue,  3 Dec 2024 23:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733267512; cv=none; b=mfcQeyGV2lMoCcW9bRfA/TCSUxjtyiM4OJV7uCpzY7pTa4C0wt+SUQZitieVDw5Xs4AHN16Rol0HY+A4jrM2gsfux6uOBpWeZIwIZ/6F0baVxtoKKesUJEsQfX6sdASr8GYTlu2qt+mz8PjCDtIf8d9bxq+L4hvPO+pjU491ZxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733267512; c=relaxed/simple;
	bh=d20KR80wasI7XHqdiONKe8v4ECQvsTbtaE1E6K21lOE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PIEDE+lbD1T9mZJ89DenZlJLWd1OdI26IyZzc3SLJCjLeijWrN2BpjKCBe27RV0UFZaQs6RJUerb/N1c7BxSd6uTHnRiNhx9/EnFVcB2TxhkNIrXt4PTwPTFg64edtODdq1SVpUBUgmNoBfXWzjJ++oa6CELXzoirW7RBRvLORE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TAEm4p+8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BF39C4CEDC;
	Tue,  3 Dec 2024 23:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733267512;
	bh=d20KR80wasI7XHqdiONKe8v4ECQvsTbtaE1E6K21lOE=;
	h=Date:From:To:Cc:Subject:From;
	b=TAEm4p+8lEWq30wBFYWMWtQOFNiPLtOIzWYiFAUNSoY8VF993rVjGoBO1R0V1GiXG
	 2W3uiQfUUNz9K5tLZptTklNvIBgnL/s355jxFiq3saywQYplismCyUrOMykhtRffcF
	 rScMWMyc6xhViqYSN//fBKzGdq38ikMCExHbv44yZaOHeEInNcKJBCytx9GBLD41MW
	 mhzwuHdGO9s4CvKj3A2WHgQLZomSNLETT1OAqwPn8u7e7U3j9Yyl9nM7nW9+1AoWTY
	 ezQ4ar1wpzyHeP8LFP3bIMIJOQUKEEShH/1YMmZpV3yY9iOiFvRQD5iQ22yRlGPf9O
	 dTlrACIAgfiQA==
Date: Tue, 3 Dec 2024 23:11:46 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Dec 3
Message-ID: <Z0-QMgYYurkzyjV6@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cWo/kyIJZvmOjkfc"
Content-Disposition: inline


--cWo/kyIJZvmOjkfc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20241127:

The crc-next tree was added.

The iio related trees were dropped due to build issues from an
interaction with Linus' tree.

The hwmon-staging tree gained a build failure due to an interaction with
Linus' tree, I used the version from 20241128 instead.

The net-next tree gained a conflict with Linus' tree.

The drm-intel tree gained a conflict with the drm-intel-fixes tree.

The ASoC tree interacted badly with Linus' tree which I fixed up.

The watchdog tree gained a conflict with Linus' tree.

Non-merge commits (relative to Linus' tree): 1345
 1274 files changed, 51599 insertions(+), 24657 deletions(-)

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

--cWo/kyIJZvmOjkfc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdPkDIACgkQJNaLcl1U
h9DAFQf/cfWiGGAQokMSIiEY8d8IahZCi8lvzgaekrLynNJ2LnFoVSQn8gg9yf6c
yVMefzCx3RFO2MIZdGnH9ACodo+hXAa9fSdeQC8tJDNplaJp3fIxVqnD4O6etrz+
MrIqzZTqPaEnXSlPFs9Sxp0Owo3SAIpSsY1fh3bOpUgEZOyASrsXRxWU7kmDpmQZ
TyWsxNeOXhAkDgD7qNatn4yVXxFNAZV/kz/g79fiijDXc6JvDEms55HCt/tHk6TZ
roFIpVAGeC7kvK34zAvYgLJhoHUZwLl9VhV0t37BfitxGmJ9xkmHrzbwIp2XSQke
9XnqZrP5xhcIliOXR90POda+eP9bbw==
=zgqd
-----END PGP SIGNATURE-----

--cWo/kyIJZvmOjkfc--

