Return-Path: <linux-next+bounces-4150-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D39199581B
	for <lists+linux-next@lfdr.de>; Tue,  8 Oct 2024 22:07:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0FB01F22BB1
	for <lists+linux-next@lfdr.de>; Tue,  8 Oct 2024 20:07:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3472F213EDF;
	Tue,  8 Oct 2024 20:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="OFdiw5MB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB87220CCF7;
	Tue,  8 Oct 2024 20:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728418034; cv=none; b=Cp0Vropr4evP3lRZQE7PFDozCbMpNmsWWB+INWQ+ckFuxvGepHUrBEMPsHhWX8lmUqFJ0QoXzNuWJPUgsa8rFw+YWhMZjmuwWzdLogbKJMNfXp5agQ8sNd+ghSQzavn1FGEgtjFFnIZimBN3Xc70c/TUeQIREkV/OBBgkKgGsWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728418034; c=relaxed/simple;
	bh=PSOCBptvao1E6G24bn9V7/lbs3VO/yJJZdg09u33xWE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ASJ5F1uw2t9Yv231RDpl8tiowZKd5Ytg6DkeWXCUvhNE1atREkO0iZBDqjL4E3wTMq1s4a36j8CAs2lGAnelOpdsBmXQGhySmjbb30xMjQjagGUmWwuRCHGTWCFcLX8ijL7wczvd1g5P1oAk3EwkyAtaIb0f4C2dRhcKgTvybVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=OFdiw5MB; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728418026;
	bh=I9jQltw3oSXkVD17+yHKWWfta346uYA8W7D/krWmeM0=;
	h=Date:From:To:Cc:Subject:From;
	b=OFdiw5MBNVlAStM9baz4FLFVihwbl7r+qEy7Xs0c+2AJ+rVVJVU+d5w+ZT5mElnlE
	 49O1hPGo0OsnH4/ll21/h3jxbim6pcZvnYWDl2p3RsBh69lDlxcMF1Dut7Xe0gMqnn
	 k3yNCwCLhUPD2lpKK2OlXL1XAIpWXhUZ6noYCzps0+FlH7ZpMEKx6G6H8KtpziKbY4
	 Z0tpRPIubzEWQXvB25irWS43fDI9M07QZl07uABgIpe+DyqJeMlElBj6IoFv/XOMo5
	 Evy5NxfNA1/cSVeXwr7aS4NDfGbbGqk89QkD0zuVdm1BSHTdGdwK12kZ9HrryrzqXm
	 mzqskYODfdfKQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XNRr973hQz4wnr;
	Wed,  9 Oct 2024 07:07:05 +1100 (AEDT)
Date: Wed, 9 Oct 2024 07:06:48 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Chinner <david@fromorbit.com>
Cc: Brian Foster <bfoster@redhat.com>, Carlos Maiolino <cem@kernel.org>,
 <linux-xfs@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the xfs tree
Message-ID: <20241009070648.60c048a5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/C/bee6xoe1i=sigHjM8xpBj";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/C/bee6xoe1i=sigHjM8xpBj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  df81db024ef7 ("xfs: don't free cowblocks from under dirty pagecache on un=
share")

Fixes tag

  Fixes: 46afb0628b ("xfs: only flush the unshared range in xfs_reflink_uns=
hare")

has these problem(s):

  - SHA1 should be at least 12 digits long
    This can be fixed for the future by setting core.abbrev to 12 (or
    more) or (for git v2.11 or later) just making sure it is not set
    (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/C/bee6xoe1i=sigHjM8xpBj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcFkNkACgkQAVBC80lX
0GykjAf8CXXAIlPWSviKTB2WGD4F7qJ+a8WumIkaLFNsDcfShJSOO9C/zH9mmX/Z
LLnSanQq1yAl2ThR+ApZNVqCwX3TU0ybgtfFn5GsJLaeFa45GKeWJ8qreNVlihp5
3aSoFAiyqleIfvEqf+fw+7M2z8K5bJVdx1A2u9TfZAehKmh/MPNyzNi+FF5o+EVC
347PaHIBRjwE6cFH8POHc8ojZUJ/8s3mHk6CneP6l29BYahsUvRSYkmWzc8tUcPO
Xwrx1ELpL56AWOGP1lfqUYHIfzR32wow2SRHQMQ/6lvSGjKUFWQLKOGoxiIh7Lxl
ZIK6VLNXzT9R0skoF/wxMv67WoDLPA==
=H+/B
-----END PGP SIGNATURE-----

--Sig_/C/bee6xoe1i=sigHjM8xpBj--

