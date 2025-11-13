Return-Path: <linux-next+bounces-8963-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAD2C5A446
	for <lists+linux-next@lfdr.de>; Thu, 13 Nov 2025 23:04:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5E0B34E13FA
	for <lists+linux-next@lfdr.de>; Thu, 13 Nov 2025 22:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50A41244679;
	Thu, 13 Nov 2025 22:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="YMQ7ztQ0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F032E3164C2;
	Thu, 13 Nov 2025 22:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763071481; cv=none; b=B9nLdY8E2fzvgOa+0nDJYV56v38onC8EJTUQ3DqFB3ovOtHfwOUbbOViZsbewmr0OuzWEYxuzOCwRK+eCjsNIhJ5AwDy5lFp327VWsDrv6M7VLulcNAvqo+yxmt2KDZ4Z+Nrq3c+02a75ptW7MvDjI1DW2L1R8pFmRF6ocLqgPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763071481; c=relaxed/simple;
	bh=UKQF2aEkrw/resAn5znoexxzOPPZa598VJhhbySwUR4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lPx5lvMNhN37u/3CSu1B5flbmX11YRxzKD5HOj3Cz7a/0L0FkCBsVkrJu6yvwrob6FVLcQp57YTcd/CGCcdZlXCPVTa89VVrD+aICatycqv2q3R1WcIoOrh9LPnigxkc4nXYoAKnyORbQ6MJDdkAlMmo/k7GT000cWSBX63rOFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=YMQ7ztQ0; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763071477;
	bh=4EpdDQWeZikfYl9IJplxKzO4YPIf5Px5HZA/JZ/t6Ps=;
	h=Date:From:To:Cc:Subject:From;
	b=YMQ7ztQ0GXJsSCuPbPsdpIQzrghe8f1Q7jcjeWc8AdfGuVx3vSXetJL+5Ae2vMIXo
	 JwW7qu7pvcusjmu/2DFBm3LZHCNnkaQEYzFG0yYAwYQewsTrsuu9hjgYz7eghY834L
	 E7ZAtnvgb9o+PniadoD7myfJnN7iRXXS1RauOD/1ndmhBxm5jLUHT6hyympKjaNqtm
	 uM5jOTEiOb22Yz2kHdi3iytyb5yJ9nTQgedBm2uoUy1JhyZz5X7OvPWr7/ywTH5LaV
	 cqkEnDukYUCl5YF2IrifczYOpWHavLKXxlArfXxM9CPE9vhCiSAhD/dE2bocOr/4gl
	 vLOpLzlTk6JSQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d6vSh6tGSz4w1j;
	Fri, 14 Nov 2025 09:04:36 +1100 (AEDT)
Date: Fri, 14 Nov 2025 09:04:36 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jens Axboe <axboe@kernel.dk>
Cc: Damien Le Moal <dlemoal@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the block tree
Message-ID: <20251114090436.2811f38e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/u5CTDF89DNUrDme6b_8K_bE";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/u5CTDF89DNUrDme6b_8K_bE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  7b2038b1b1d4 ("dm: fix zone reset all operation processing")

Fixes tag

  Fixes: db9aed869f34 ("block: introduce disk_report_zone()").

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: fdb9aed869f3 ("block: introduce disk_report_zone()")

--=20
Cheers,
Stephen Rothwell

--Sig_/u5CTDF89DNUrDme6b_8K_bE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkWVfQACgkQAVBC80lX
0GwDpggAgwEJCuOh34nKE2dluGwp90fVyaLnE+C6KgOl+NVwdoUE+/PMaxJMHogz
Mf6YJ/e2zUrqtuJ4kprvaQbxWwZScjBakN9qPNXLENCc2vmO+i0brkP4eCRqEEkZ
dUcDnQsA3Im9Y93kwP7MeH3twe4xzFVyEj+2vh/7k8AmluEx9F+SAlEOdNEqv9yK
uWCaF0rmo2FNtbpd71axkUSczhnac+Xp16UKzZxNYvOKHBdxfntElC+iv6Sf59+D
B29jVIdTqu4dRwVVjNDQRCevYKEZpzYE0yZfbLW+v1gblUOmf90gP7fDey8WOFjW
od1rh4QxNzAwvWtLQAZLVO3eDHMiOg==
=HSPY
-----END PGP SIGNATURE-----

--Sig_/u5CTDF89DNUrDme6b_8K_bE--

