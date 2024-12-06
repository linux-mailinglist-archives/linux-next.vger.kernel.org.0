Return-Path: <linux-next+bounces-4889-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CEA9E714E
	for <lists+linux-next@lfdr.de>; Fri,  6 Dec 2024 15:54:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4468165029
	for <lists+linux-next@lfdr.de>; Fri,  6 Dec 2024 14:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA27315667D;
	Fri,  6 Dec 2024 14:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZoVsIToQ"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2ACF1474AF;
	Fri,  6 Dec 2024 14:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733496840; cv=none; b=SMu6MrykMsdTCoAjJ3gsdtS6FD7HneRfm/8Iv53SJ49yF6+9C9XrysXdFRieR9Q+0QKH+tSnrYnyI98SeD5RiVWtGCVxLc7xdxEK9QuPx0vlWgOb4hJACdbG3zxfaYCs+tgDSMh3kC2NrMwqcU3MY6w/RbheHcqoC3a4ySmQsgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733496840; c=relaxed/simple;
	bh=dY2/tn84e54MEORpav+8Mkaqo/fG4bvIn19B/UcYyYg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dh647kMYpm9crY+U8kegcpuMpAwfakLvD1otN26NzQ8BUyfoqupVx0hOlz0QmLmgDQ1iw31wc27ORsxdDaHnHmVC+rsLxDw90SE5JS45+cEdZ3/JEMWHApsRQ8/3vXNrQARZTkoaIvMKTJeT0oSEbyWusBrEni4NWUFCBTxSXCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZoVsIToQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8DB7C4CEDC;
	Fri,  6 Dec 2024 14:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733496840;
	bh=dY2/tn84e54MEORpav+8Mkaqo/fG4bvIn19B/UcYyYg=;
	h=Date:From:To:Cc:Subject:From;
	b=ZoVsIToQxmT9ZKFjDs3uQ7Zxe9Jz/BShNBWUklAZzpURc6QkVfbmzDSPj8OP3gDTL
	 cgCLNTRVVwnlXnssbnUXH6xVncVjgqZ13GkE9Xml5ZaevIwMQV0xwses6FguIZudg/
	 5IERN6gH1XV5XXS75QTsaG0tgPWdf/LQaB5cVW+Ays4v2vJ8Tzka8SjucO69Kahg14
	 ObDgMX7PrFGi5wDHoCaEMRuIQcnfYD7l8qW/I0vFJoHuP41+bVnFTh3KdkSL6MUhq+
	 +LjzZz2w+InVRW+D7NwVDwonpMKON9IuXfK6txRU9WzEKYL2E61DyPm5W95FcNUXdk
	 JwcQm5zLj6V8g==
Date: Fri, 6 Dec 2024 14:53:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Dec 6
Message-ID: <Z1MQBRWp_6VLGdgv@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="90BH3Xu5ZWmMzFed"
Content-Disposition: inline


--90BH3Xu5ZWmMzFed
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Stephen should be back on Monday and normal serivce restored.

Changes since 20241205:

The drm-xe tree gained a conflict with the drm-fixes tree.

The iio tree gained a conflict with the iio-fixes tree.

The iio tree gained a build failure due to the module changes in Linus'
tree.

Non-merge commits (relative to Linus' tree): 1885
 1971 files changed, 73323 insertions(+), 37908 deletions(-)

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

I am currently merging 389 trees (counting Linus' and 149 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
Gortmaker for triage and bug fixes.

--90BH3Xu5ZWmMzFed
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdTEAQACgkQJNaLcl1U
h9DKdwf+MLuYX6TX0002Hsz2O7VDYYSe1/qaTz2Se+gNZRR0LtOWG1BXMQb3ahar
JNNfOSNEwXt6OFylobMDlHa5NDOn2jCWusUJNIFXArEM5c/9T12+LKuhS5569WHB
5mV4pN0Vc42oeIfLx71rI/f6qwUSKXRuB+lWPBQiD2gCoJ9NoX+72sfndaYZP6rG
Dbm/+x70h7ZMzaimgrrSlp5IgwXAOjc8GZUdPjkEVz9eDuopZyc+1GA3k4/33pkY
FrdaLmwPUwaSOYiZarqy+LvLoA9xB7pwMwAqN97dJf2q6xxRVQVZgnq15wpJ+NUL
IxrczfZY2L0av4xaQJhvO2vjc4lcxA==
=sIec
-----END PGP SIGNATURE-----

--90BH3Xu5ZWmMzFed--

