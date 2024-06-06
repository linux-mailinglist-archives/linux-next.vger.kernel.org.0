Return-Path: <linux-next+bounces-2479-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D08F8FDD69
	for <lists+linux-next@lfdr.de>; Thu,  6 Jun 2024 05:24:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3A2EFB22E14
	for <lists+linux-next@lfdr.de>; Thu,  6 Jun 2024 03:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AFB51DA32;
	Thu,  6 Jun 2024 03:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="gesX6l2p"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD029D502;
	Thu,  6 Jun 2024 03:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717644238; cv=none; b=f/N01bvcMKKPMvbMGJ+IozLmKGDVtSFbGm1JlOuvavg/2qVHIYq/GrKj/vVatyK1rNdJ5k1nIjeRLE4c5pGBKrAGQdlqCwPdw9lGgVnGJNi1inN660gZ/CUTNGV1jLKdOBn6WHuwh/Iz25FetoET6X5DrcHQr3YpUKB82rXtQs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717644238; c=relaxed/simple;
	bh=ZgmxUUkZDpNMQ5ixeBv7rSrczU1eYTFGRLNIh0XhcnU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=AEa06HRR2DLM8H13tp7XcQ7C6TUxlnwcn8jOEQdWjy0oCRVcuDJXA35jWc8a7K7cYmSY0pfhfzVfuUgi/IaJHLR3L7cb04r5sG2K7zNsYhH8CJhdb5B2WU9mlaXC8bO3nkYcTloY6EBUO0ZBTuUvMZCILbwWqP2VX2N5mYM06vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=gesX6l2p; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1717644234;
	bh=lMy+0/atMC48fOKFAywkdgbZ96HlOLLijTmghtRCqrM=;
	h=Date:From:To:Cc:Subject:From;
	b=gesX6l2pthjuCAdxhEGOX+jMWY/cfPVhYkgWuIiMgQpP+hQi3iwKqTj4C9xGNIJYV
	 TYobQufYQ4P3Ohl5fZpmiCxFZMHVrMdbFHA6ejR7RgMAAIe8oplpyeNKqVGF2oQDOV
	 sLSI+FNOdgQuL681ktxpeXgbOVRT0mTmYJfmhWy7z0p/ain4O1+XOcsWwQtdwwRnAp
	 upp6HZ1vhRDN+DsKHuARwwD96YoE1ryh1JNzES7FiksSLDVlRQQTGbBm7ohltOC2gB
	 kxBIE/rN3nx7ct61V1Islenmr9RvvGKHoWtB0r7neE5NFBkpcuv5a+SwKDuCsVTwVR
	 yuVjsDHZv5g2w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VvqRt0mk4z4wc4;
	Thu,  6 Jun 2024 13:23:54 +1000 (AEST)
Date: Thu, 6 Jun 2024 13:23:53 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the mm tree
Message-ID: <20240606132353.0db5479d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/P2FWn0QyvTKehDY1DgWLLeZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/P2FWn0QyvTKehDY1DgWLLeZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm tree, today's linux-next build (htmldocs) produced
this warning:

Documentation/admin-guide/mm/transhuge.rst:342: ERROR: Unexpected indentati=
on.

Introduced by commit

  716119bee914 ("mm: shmem: add multi-size THP sysfs interface for anonymou=
s shmem")

from the mm-unstable branch of the mm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/P2FWn0QyvTKehDY1DgWLLeZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZhK8kACgkQAVBC80lX
0GzzfAgAnmwoz+cQyZ5BL9oAMe/1uuWRoo873kAQ+sUzdEmOT9a//uEDhFqgpvxG
hvcUP3hL2SNl+63nb94Qpzd7d3db0EHBXxxYsySf800RWuXaR/mmhMvAxBi2hR+u
ZeSJD13YTZVvPAWPaTwzBKQSgk21wZUItg5gFcTCd7/9rxNRSHWEVkYeDcvmmKbi
Uug5l2dnxaLXUARCOIlfVA3mgBvi5DQnQ9ZZ/kvHTGB6PRCuFZUK6tMHgJorRY+v
Lgmg81ev2kKyhaXYSl9tZa05JiKLYs/9S+HtAXcI2z4PnXXgDbRa0Y8+rcI9gP5E
lfXO7B0CENE4zouLHeqIejSml0oxVg==
=LZTz
-----END PGP SIGNATURE-----

--Sig_/P2FWn0QyvTKehDY1DgWLLeZ--

