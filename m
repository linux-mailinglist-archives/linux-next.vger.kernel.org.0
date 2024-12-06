Return-Path: <linux-next+bounces-4885-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E869E6EAF
	for <lists+linux-next@lfdr.de>; Fri,  6 Dec 2024 13:57:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CFCE18834EE
	for <lists+linux-next@lfdr.de>; Fri,  6 Dec 2024 12:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3053D201116;
	Fri,  6 Dec 2024 12:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c9JrqhOB"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B9B201006;
	Fri,  6 Dec 2024 12:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733489738; cv=none; b=W1vZplihWJ8UhkL2PJuO+/M8vDADvci0EDSaru5lv05Hdu7tRNLy/har3XCDsGLg9bKRBOzhkhRCVSF9PAuksvqlrOBtnOTcCRpV+jMCp91/uDdxD64YqkB64luKgEfuMc4hrjq7FDsuV5wr1Hc//yoAgCN6NYpGbvxLix8aCPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733489738; c=relaxed/simple;
	bh=xZjeMwCjMjZYYhQFWvUA2joTRkTaHDdHdVZko+sl5jg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hNlEfYuyp6z3wMIPAUpaocBCmEPiiTph3QbsDOYZCeYowEUxJZM2qjo9Y7EhFH4TAxVOurO9c7HQa3Vo+W/J3GLgIWeWwuazbtiWMUX+g32yHrhJwP2/Q5wrVwijm/g8p/9Hyp2wN+wGd4+57bfRGgEbhJkD4c31IpIhFxFCv0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c9JrqhOB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 620B4C4CED1;
	Fri,  6 Dec 2024 12:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733489737;
	bh=xZjeMwCjMjZYYhQFWvUA2joTRkTaHDdHdVZko+sl5jg=;
	h=Date:From:To:Cc:Subject:From;
	b=c9JrqhOBMKvV1OxcpwXZe4k32YiqNK5HLXqJa8e5iAXyZlNFt+a8GdE4SFByh2qsN
	 XWfPD8VMXExHnEEl7ntX906+pb6OHf1juVZ8J9UZyoAFOtMSmh0CzyIl9o4mlOuW9n
	 sgbyB5B+D5dPpWuXQkI4ATtfnICW0Jhn8ueYPIO06I7uldf4e/kisIaqymo958Sk6b
	 UyVegc9f7rdQgrQ0mBu1J9zUlxJK+XblQ74f2EEbrSOzu/VAnwAHWKvAtghG8Vz1Ad
	 L3bT6E/IWa90doXh0CTWME2QXci0cIwgEdwEv8o50wMU+Zw/601+1+lBkZLqlOEvDv
	 T3W95XHV20EAA==
Date: Fri, 6 Dec 2024 12:55:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	DRM XE List <intel-xe@lists.freedesktop.org>
Cc: John Harrison <John.C.Harrison@intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm-xe tree with the drm-fixes tree
Message-ID: <Z1L0RdL5kQCXzRRV@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yqb3qgop15r2D2T9"
Content-Disposition: inline


--yqb3qgop15r2D2T9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  drivers/gpu/drm/xe/xe_devcoredump.c

between commit:

  5dce85fecb877 ("drm/xe: Move the coredump registration to the worker thre=
ad")

=66rom the drm-fixes tree and commits:

  90f51a7f4ec10 ("drm/xe: Move the coredump registration to the worker thre=
ad")
  906c4b306e934 ("drm/xe: Add mutex locking to devcoredump")

=66rom the drm-xe tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.


diff --cc drivers/gpu/drm/xe/xe_devcoredump.c
index f8947e7e917ec,71636e80b71da..0000000000000
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c

--yqb3qgop15r2D2T9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdS9EQACgkQJNaLcl1U
h9AtxQf+LbiieYUYlYRCYegx4yY3aH7UB8QIZ5m/w5fCA07vo8XGn+161Zl1Wrjl
Eo2UY7RIMSqvqgyY3zxuHQwskfdBDuIMAsz1mcBMigpG1T7bkBuipnY+dkbQRytb
TP98U6MmcE9YTOcC/1LR8OrvkrKcos0V0+IqEyw+06iv9xqQH8uMyThnWEYAyGjO
fQnAu5I9kV4k4ApGc11glOZQMPUZSSQPhwIINMopj1gFMWbpmZLW5UcmXZF4XZdL
J2tsslw7QBeNmzImIUOWZ6u1Pcs81PnYcBncpUzDnPiS84C2NihW8wrkollA7i0U
MOrgTztGJh3CujHocqUszp+PxEriIQ==
=AIIM
-----END PGP SIGNATURE-----

--yqb3qgop15r2D2T9--

