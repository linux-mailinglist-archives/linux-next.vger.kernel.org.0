Return-Path: <linux-next+bounces-2877-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A0ABE92B338
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 11:07:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1B761C225B6
	for <lists+linux-next@lfdr.de>; Tue,  9 Jul 2024 09:07:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21DDF155747;
	Tue,  9 Jul 2024 09:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="vDcbPhCj"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A871B155322;
	Tue,  9 Jul 2024 09:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720515979; cv=none; b=BrSqniIjsZFktnxuiAqAJIY+Y7E9wKnLp6u9HtGdd+15nSVKtYTvHS/k1/0NynlwJHmKqnKdHlNKkjZ1xsvrMvnxula0CdUcR6istB6ahBiNDZyY2HgUcwCWhcrWdI/Iju/4vOJPuOW+kNMHrELeByXnU9TsreoLgVQgM0XtBBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720515979; c=relaxed/simple;
	bh=YDl6ObPY2mVhBupeJ73q3DsqusyglDxKTqqEPwtehGw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tJZADkn1fejUjFA5nkbiJWQSFRDf4Mw01CRadx1ZwDG4L2foyrF4r3S9BpoOpHZya237dPOWd78948vOccKDQLQEFxPu5XsV6kJjt5ChZ4bOk8Yh1bA2RbL4avIcpBOaTN6vVv65EQI7B1y66r/6xBFabGP3JtN+qMy5+lixO7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=vDcbPhCj; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720515975;
	bh=XlEDxTC8D8hZTxluPVB2GztGvpDaonKJ0QYS3rkyBn8=;
	h=Date:From:To:Cc:Subject:From;
	b=vDcbPhCji3b28uM/0v/aGzAb7UlPgKGAHanMCBMeFktHaKjn2PjKKuwolTyHWqATi
	 gkghCO5GJDt1nXy/UjxfB3AWZ85iWUtm3OOxg2brNV+oJVd7sWPQDZKQqrWI674TwT
	 WaDSchqzAPg5XN8I/Ba/zqI3z1z3Ok6T0Q2/Yb7tF1Z2w/ikGDdJAkziAMp5IUpp0z
	 zxvPxhlitDseA3Gad7DQxoI54Po8CF6RDgYpz1cxlgTxI+CfBOrBKIoDyBMDsUUr8S
	 ngEMO00rbgpdq6vRn2EK42gb5FRgmOX8mORPnzUyT3uLd5SuCJCltbx/0gbGPqKFE+
	 9MiGdZ8i9LvlQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WJFTf38Zjz4xPc;
	Tue,  9 Jul 2024 19:06:13 +1000 (AEST)
Date: Tue, 9 Jul 2024 19:06:13 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Joerg Roedel <joro@8bytes.org>
Cc: Mark-PK Tsai <mark-pk.tsai@mediatek.com>, Will Deacon <will@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the iommu tree
Message-ID: <20240709190613.3fd8b7ea@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5auU+RIQ0GygD0jvw/HXm9p";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/5auU+RIQ0GygD0jvw/HXm9p
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the iommu tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/userspace-api/index.rst:42: WARNING: toctree contains referen=
ce to nonexisting document 'userspace-api/iommu'

Introduced by commit

  d926e7c04843 ("docs: iommu: Remove outdated Documentation/userspace-api/i=
ommu.rst")

--=20
Cheers,
Stephen Rothwell

--Sig_/5auU+RIQ0GygD0jvw/HXm9p
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaM/YUACgkQAVBC80lX
0GwiOwf/ayee33mJAEPEAI7xIDR9vX/J4cteqJFZWm4XgSFfYuZFc+g04Tf3eHbT
QgvV5FLr1CsRNhUapgaPKOgH8gwmvvM33YXWWvXQA4lwqjdD6iM+Wbv0QUUdcoWt
X6IhO6GNQZEX5nNcwr0ip8S4JJs7qxstv/a4IPNS4BpwzQk5SeldlocPZiMdou0g
+TFLCDMC3g0bBFSHuwuP3wjiagMyNijIbaeQCXJPScMb4CNWxjpRj/Z3hshf9cUa
wm4OM9AK7CQoYVrnWxTVjiHEvoYBT7uffpExWHYBvBlDKMtSs6hOwMKo2UzFAOCb
WO0VtoM5gDveI0GPSZVsFwIyy3Hj0w==
=ZQTn
-----END PGP SIGNATURE-----

--Sig_/5auU+RIQ0GygD0jvw/HXm9p--

