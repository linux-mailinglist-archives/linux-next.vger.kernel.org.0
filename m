Return-Path: <linux-next+bounces-3374-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 340B995915F
	for <lists+linux-next@lfdr.de>; Wed, 21 Aug 2024 01:52:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BFF5BB21DCF
	for <lists+linux-next@lfdr.de>; Tue, 20 Aug 2024 23:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5BFB1C8FC9;
	Tue, 20 Aug 2024 23:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Q/GeiajJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D1F45BEC;
	Tue, 20 Aug 2024 23:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724197952; cv=none; b=T/Q98jApTRlHH1aRWD/aX1/Yy/vjwnJrsqJ+T0pO4swBU/W01T19YZ8v3Liphs28B/B3Pl0/p2iGi98Qd284giHpxJkalQRS6B9ZRGTkSSCXYtdwcW+4e4m0jRvRTXwGhAIFTG3MJxa/CgU1QLF+QvKyhm2K48oKJYxOUoiOUWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724197952; c=relaxed/simple;
	bh=se/CxBhzAtlkt0am7Aa8bhvMPRZiFutxoFYVpvZbnc8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=bAFHOs3+V+U3KYjTBL3KhMz5+WBtuaMReHj7wDbyGlb/W+0cuRLRwBG1b5ZKPee3eQ5K0OYMJT9sXTVs0OmpY62Z+dBDnbgjiAwjprHHgE+qliwYwidj09p4lWwKk6BVLtkwOT1E0sr2gZg04serBOJzKBKvrTeyKUbei3QoKUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Q/GeiajJ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724197947;
	bh=hK3Aybljx4dNoePZvDxrENeUvBYo+DwjnQfPx9iMvVo=;
	h=Date:From:To:Cc:Subject:From;
	b=Q/GeiajJC1+Gjexm3NlDTvA5vKyojk9agkizkRtUPgExIa2j6eMH76s9Yq01dnqxn
	 9NNF5LOwZwvlN2Q/ngQ1wOby5YT784CCJkhKu3sATse7uhHlRrb4ZULpgiA9cQ11xt
	 a7v/N/C4vhfoEOPVNyQpXrJzKvKj8xeNgnX0e2xI5o89h+Jx6XjQ9LaZNkYtPcE6c3
	 VMK7OMn4MoodbBS1JIWIq+XFtuG1oiL80urn41eoRF7dC7NaxIhQ6uqDPxPiSCZaOz
	 7dFU2ckE2gduKCP/zAEejDXR+tEAfsZJkp+NF26hYnbcDHXvIhHW0vVPKMzEoUtEZH
	 3pVkZWKmLQUag==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WpR8p5sQXz4x6l;
	Wed, 21 Aug 2024 09:52:26 +1000 (AEST)
Date: Wed, 21 Aug 2024 09:52:26 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the bcachefs tree
Message-ID: <20240821095226.0e7ad7f6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XKBu8HUwkmh_3i=29wwbMcb";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/XKBu8HUwkmh_3i=29wwbMcb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the mm tree as a different commit (but
the same patch):

  f01d25bb77d1 ("scripts/decode_stacktrace.sh: nix-ify")

This is commit

  2c4f6a68c6dd ("scripts/decode_stacktrace.sh: nix-ify")

in the mm-nonmm-unstable branch of the mm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/XKBu8HUwkmh_3i=29wwbMcb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbFLDoACgkQAVBC80lX
0Gz3nwf+NVEyhpoWI0ZbqqBlrQQVrG23JjZZofu4buQlLmne3Q3L30Gyh01x5JbC
jMGYZCYRlyO2rq/4zOHVgwlH9ThDhf4dPSR1OFV6+W+r9GUuZy2Ui5XcPzir4nE4
GEP4PzM3vaRSIspSsQ6ykpPm/k+5bPrStn1uLTBoxnZMNQMKKDfRQz5sSVQWJON5
nITwKs64Q5G6UuFmrO2Dnzokb1MDcyerZ6zCVe/xQdsHSgHSU3z104J7HPKdpfld
FJOCrs/MHOcUhOl2KJ9Mrl71bc/cNjyS5/LVN2tBQqFA71cbcHGpI39WlDy99OEl
Lezm2MJ+ZB9JPAcq9QCZDT0wqP6G+w==
=vMip
-----END PGP SIGNATURE-----

--Sig_/XKBu8HUwkmh_3i=29wwbMcb--

