Return-Path: <linux-next+bounces-8573-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F287BC15F9
	for <lists+linux-next@lfdr.de>; Tue, 07 Oct 2025 14:34:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5D0BC4EBB43
	for <lists+linux-next@lfdr.de>; Tue,  7 Oct 2025 12:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C170B2DE6F3;
	Tue,  7 Oct 2025 12:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="smD3zNuQ"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996762DD5E2;
	Tue,  7 Oct 2025 12:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759840493; cv=none; b=ohghZ2a0AS05wem8HzVqZKDfWqg8n10h927FtwtVXV7X80rcGaXwvNbuHtMcE3Z0fpdljlH3hLmyvDCGiA1xn1ml+Gxov67bHok6ZKow25qS/EZQjpTPqI8aeNUVEGgT8mhfstiZp7FEj82yHOUcEfpeRVCcNqYoHNeFLUPsLEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759840493; c=relaxed/simple;
	bh=/gA2vXXADC0P2DO9PBeH/QWjg5FYuxfk1woaBqc5pHM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z5ZOP+xxXB/4Lb7YfLHF4ekk7omuLaRJ5xunD3mwL8nhz7t6b87iKJf0w9EM83TrR8Ni2RskxdCOCwKCh1Gi9+IueEMUXrtgU5VsFSXF8zWKHYxxCZOIe7lQyxYMQux+BfqwnvwS4c/8e/pKIBOjLnnJcidKFUmbY75kJ1I0mZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=smD3zNuQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF235C4CEF1;
	Tue,  7 Oct 2025 12:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759840493;
	bh=/gA2vXXADC0P2DO9PBeH/QWjg5FYuxfk1woaBqc5pHM=;
	h=Date:From:To:Cc:Subject:From;
	b=smD3zNuQsvbnvKUBlqEraNMCOmlHf5ZqFh3D8I+is2XJSEVmtVUmBd3U/x4u/wg8w
	 tKjmOiTTHzsDJHxh7tDkCvTFCZ8p2UMXtApFoE9n2UUGL5/1v+zgDlg99IKclCZvjF
	 MpLB+inmE4asNzxoj/DxExIsl2N8eNyZ9aq9NEaerLss2KG/Qq5UKeWs/cCCxUuSj+
	 mfnH3xt0zvvB06dAqhXq4FbWclNtfrCkDf2CEQg5yULP6BdFmqfZDNIOSOA6Ew0S25
	 gjnF2kcFJKmmDa+rVD/QKIHjC/Gntmts7UUH/XDS+aj2nuTONSDemVf/blJQYHOUmm
	 VHx6PU1UZaWIA==
Date: Tue, 7 Oct 2025 13:34:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Oct 7
Message-ID: <aOUI6esdF-mwJib6@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bjLYY9IEYe109sMt"
Content-Disposition: inline


--bjLYY9IEYe109sMt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20251006:

The mailbox tree gained a build failure, I used the version from
20251006 instead.

Non-merge commits (relative to Linus' tree): 1189
 1444 files changed, 61523 insertions(+), 29086 deletions(-)

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
a native build of tools/perf.=20

Below is a summary of the state of the merge.

I am currently merging 407 trees (counting Linus' and 406 trees of bug
fix patches pending for the current release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
Gortmaker for triage and bug fixes.

--bjLYY9IEYe109sMt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjlCOkACgkQJNaLcl1U
h9BxXwf+IEH5TVkJsZTKvQ2v2Ab8fPfHLoMs1noXC4EVD4q50hUK0kKkwbB+MdLH
CXFl2hFQ6WlpF9WUWtH5Fui08EEvRo894qKrzqvmYmVivo3ZzwgYA7GFQBlUL93d
kXL2MfkwerhM8QpyKCC0pu6uW38uJpe/2lquNAajgdrGqnBAv5rc9mOgII/6JkcZ
974bjDJTaf/aHrXtHulEk7kAL3+auybwqQI/g6KLeXMVPJi3h5vfagjNe/Kw8NDs
dFI4M+h0ZhyLoZfl7F4CaChFnmvImilB82NCwfeH0+lvub3e00U/W5Tc5QxH1Pj1
dKkWc16Vn9yG7wI25p3swSXNwwhT2Q==
=vEQR
-----END PGP SIGNATURE-----

--bjLYY9IEYe109sMt--

