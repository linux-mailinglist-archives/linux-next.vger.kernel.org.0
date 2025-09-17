Return-Path: <linux-next+bounces-8360-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A22CAB7FFC9
	for <lists+linux-next@lfdr.de>; Wed, 17 Sep 2025 16:30:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B21A3A64B5
	for <lists+linux-next@lfdr.de>; Wed, 17 Sep 2025 14:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE5D1295511;
	Wed, 17 Sep 2025 14:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tWBTLwqU"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FC51CDFD5;
	Wed, 17 Sep 2025 14:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758119130; cv=none; b=tUbJWxiRWCvYLY/ArGjmUUbvrnfGIcWGLVkRCzg+G65smt+KMn+MW9ACuroxzyEzaV1D8u9WaKPxFiFapLjAQToodAB6qgXrIQa6S/o1bnUyIlkC6VbGbkeZIwHNoeWAXpN5Hn+aa2fpJYKOLyW9kuxZeh5IeCpnoTxvaVULUSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758119130; c=relaxed/simple;
	bh=W9nBXmUKgBj4vweSXOrnERYMlXoyDhX5fT03iB5YMxU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MW9l0t1q3+iZWf4WqpNr9VQqdBry3jdC+7YAxVkeFRV0p6QIie6O0XGdEVTEUTQby1ANUaGytugHjXgbpmnEJnGMEe1Tx7SgQcXor3RxzGo3uLYTkQfR1gSq2WlhFPfbJdWJABBD9pZKsEbDIVLE6xuf3zZXYr/F9m/PH+xf95Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tWBTLwqU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 973B4C4CEE7;
	Wed, 17 Sep 2025 14:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758119130;
	bh=W9nBXmUKgBj4vweSXOrnERYMlXoyDhX5fT03iB5YMxU=;
	h=Date:From:To:Cc:Subject:From;
	b=tWBTLwqU6ehWsvBBfUcwnm5NxviPu1/shxsSDOmjUGVujOe6KW6O9WunFiO56Pzig
	 RVuOwXdBIA7rlmIWzJGOjHGnkSLZO4SknuuFpufE3kQQv5b6UsEL2RdXPznC2cez+q
	 EWI3nFy9GXSdnxQafPVj8Q8oK08CC0czWUiyP+yNhO9YjRKGHciQoGMI45Jg+5pnWU
	 1QAi4QrOEOIspTGfgM72qGZF9xuBquC5T90XIt2qi/5+gxmrIhZls/4UVQXIvPKZWI
	 30SBLnawVqINNyQ0YGucgEWzhovFAlUsy7jVIKMDV6KUQGEyDf0JHhIjGJeebMkqZk
	 ov8ObRR5ubgaQ==
Date: Wed, 17 Sep 2025 15:25:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Sep 17
Message-ID: <aMrE1pfeUlBoxc0m@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WfqvoLWe/kOnMyjk"
Content-Disposition: inline


--WfqvoLWe/kOnMyjk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20250916:

The slab tree has some missing signoffs.

The net-next tree gained a conflict with the spacemit tree.

The bluteooth tree gained a conflict wth Linus' tree.

The mfd tree gained a build failure, I used the version from 20250916.

Non-merge commits (relative to Linus' tree): 9156
 9639 files changed, 423397 insertions(+), 180594 deletions(-)

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

--WfqvoLWe/kOnMyjk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjKxNYACgkQJNaLcl1U
h9AwmQf+MbK8sRDJln7r1mC6BSTqdzD/dBbjAWzrCSnkaSO4PfJjxGoAVCKg/fkK
XuEFOgOtCZgl54a1CUfwKwhjSorhsfDQ1135c6hy3xAl/MiwdPDPtfPRnP9oO0OV
XKvU+Nm9aBqw3mXX3SwETiC/T7WwI3JXtBHoaRKoiXjRrXNawz0z/oB1/Idvrxl/
QtOr4J6cUyNyOobrXeFUR96rc4nL5hL1ss1oagUXQraNdROE0I+nWQElE7mUpvMS
vG4atfbTZbkGsAKBtGGsoUsDmWlRLkVEd7B+vt7DYs9jnpAu7yxoD9E+M6u5ob2v
NDFi6SzaKmDKZWg9UscAOqsgu0Ig+g==
=3aTP
-----END PGP SIGNATURE-----

--WfqvoLWe/kOnMyjk--

