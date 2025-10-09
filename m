Return-Path: <linux-next+bounces-8579-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB69BC8E25
	for <lists+linux-next@lfdr.de>; Thu, 09 Oct 2025 13:45:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6FC934E7D1F
	for <lists+linux-next@lfdr.de>; Thu,  9 Oct 2025 11:45:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4E4D2D6400;
	Thu,  9 Oct 2025 11:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XCcuLBMY"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8762C21F3;
	Thu,  9 Oct 2025 11:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760010334; cv=none; b=JlO6C9vvo08xzj37G5tkY7IJFbMbJKAGiEG6CbSU49GaMLjGsoSOS3UlsDhnovtGmynBMzlqphGxkUJ0+JxrSQrXha146JQWOr8wcJlqRwtcb4oiugfKMMlRO1g2r41zUhYQhWEYL77KvVJk5AKo5zw4bhxHiQUSKjjdCXDBhUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760010334; c=relaxed/simple;
	bh=WM0p3hW5vczU2BkfCt3C4+fUb1K74G3WR2X/86J9z3k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AdtTCYk5gLybUUFvhZD0kci0+l794LMHt233RbdRxGS/HDdzFuHrKIb+Y++crYTie9l+BPaa+DKSRkCCh7FWaJer8U8CYBxoQDVmZscgDA8Q4D6mixE6WXf6x2F2+zqxmkL/FTcIRMUKbHd/9tR79AL0JU4Hten9EsShmC7N4DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XCcuLBMY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A25CC4CEE7;
	Thu,  9 Oct 2025 11:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760010334;
	bh=WM0p3hW5vczU2BkfCt3C4+fUb1K74G3WR2X/86J9z3k=;
	h=Date:From:To:Cc:Subject:From;
	b=XCcuLBMYzHeWSicIimJT3Jlv63loUJD/Bls9+TnoGwC6bDl1baH3dBoFGyqDm5WIm
	 n0tJaDOAMQhBLcap2YmHEM9HGncIkyDd+8D4y0IVOhYIdEbpN+OR/EWfxt/hpC3PMT
	 wHNSnSJYMYGBLPyJDeb1eNQitCyW8z0+R9k8lZgYASj7nfcUEQeu7SUlxHWCZO0EOg
	 1fm7gb1piMzHzehucSPrwGEGf90utEfECk93xdRDEkeTd+td1MapTPw+FN2jyWH0+/
	 F0nZ0g5yAROJXOzDDmeYrAsdm6Qn93STn750LsAoByl4MxMgqUqgi7sWruVIfPnlLS
	 0wK3zqgLzgqYw==
Date: Thu, 9 Oct 2025 12:45:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Oct 9
Message-ID: <aOegWp_BsH1FGaeE@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+njiCVdhjGAlKdqk"
Content-Disposition: inline


--+njiCVdhjGAlKdqk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Changes since 20251008:

None!

Non-merge commits (relative to Linus' tree): 732
 820 files changed, 17586 insertions(+), 10965 deletions(-)

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

--+njiCVdhjGAlKdqk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjnoFkACgkQJNaLcl1U
h9CQ0Qf/XHsGcYOIAeaGHWSL2d+UljwECDJ8nh0sjW1KLBTy/Iht3Fq6AserJS+N
wsObCwMx2jsLAaDc2KNpBQU2FNqDDMQvsciYfh+alpXIS+g4dGd+8j1Mcah1b2ZJ
5BOkNX3IPoY0Dxz0fZMydh2djPn3iXXrV385nYKraESrw3GyEtTUf+sSDHLlWiQ/
wwcpDPGopwW8q65Mz8FTSprM5dB9mDXxd1+9L0dcJAQi4ChkdWHnh8B6Nt2FXRRb
TIB1bDbJo/CeRtqDC0Eu4uW04z91EfP8m9Q1f6LzSVZK2MtNu0TkKraoedgTQLo8
wq78nAaor2BDjnf69aDPiNAWAhuPUA==
=3Pts
-----END PGP SIGNATURE-----

--+njiCVdhjGAlKdqk--

