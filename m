Return-Path: <linux-next+bounces-5410-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E89A3176A
	for <lists+linux-next@lfdr.de>; Tue, 11 Feb 2025 22:13:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 256037A3292
	for <lists+linux-next@lfdr.de>; Tue, 11 Feb 2025 21:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C2FC263C9B;
	Tue, 11 Feb 2025 21:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kJO3aFYo"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FAD263C93;
	Tue, 11 Feb 2025 21:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739308386; cv=none; b=d7nCy2zdKB1TbY+5Weo/6ALT6H+ig+wqrr513ww+lLd1HXndPoOSvhuLdAD3DBHVBaIW08LpC2qZyHwfz0zByVOiLuGXqAljkMxTStimPQ8reS8VXopzMVAz7LOgBR37bRlxTvOB179YZgIJr6K620O4oA1Sm7s1+myoVTt6if0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739308386; c=relaxed/simple;
	bh=05dWBEfatjWpN/nlzrGlbV6Jm169azjmMCyoBk/9gfg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=SGzY04M0715QOnZ45DPk2+KcRz+ZLBwbJcnc0VrhUdF4VrJXUPKZHT7QbHkeAWBGfQSIlE1J1yo43OF6I9aqV3hT7HZ8RBKg+AD9Lc4Fh2LCXHcPx4kTe1BKYtm98vNQpfdIK3beglUqQuGmEsjEc+qwMXJqYCVraGYNJc37C1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=kJO3aFYo; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1739308372;
	bh=DJL3HXkb78PwAHPR0Z936cWN6+d4B6muLa3zAHx5RP0=;
	h=Date:From:To:Cc:Subject:From;
	b=kJO3aFYoaLIypqraNapP8sk68X9hJLhmh0tD7wlictntFHSbinqV2grH1diXJsXVV
	 XSMB0yl3d/jt/OfeeQYiP88wgywC81YI4kHCA7IiyiYUFKLxQUFDazcerd9mw3mXCc
	 VtGaYdQ8g1EzPaGREs53SzEM1tiwhxuXH43YKJantq3gzIxvT8keCtoG2eYFgvfL97
	 h4EpQyNEuCBiR316hgNeWcWyUXicY6gvYTyXB+G47JkYbSh+W7Fyihb3BLXe/FWGdr
	 2vDs15IufU9U1uThXWe5PKxtKn3BXOGlz9063Zo5ZQ/QhtSu4KNvUgdwwclZW6RJo6
	 +hAOswBcTOM+w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YsvKw5V1Jz4wcb;
	Wed, 12 Feb 2025 08:12:52 +1100 (AEDT)
Date: Wed, 12 Feb 2025 08:12:51 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Joerg Roedel <joro@8bytes.org>
Cc: Vasant Hegde <vasant.hegde@amd.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the iommu tree
Message-ID: <20250212081251.0a1eda6d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/I+HV3X+03lMNeJcUiGSgR8/";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/I+HV3X+03lMNeJcUiGSgR8/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  a1bb25cad5ab ("iommu/amd: Expicitly enable CNTRL.EPHEn bit in resume path=
")

Fixes tag

  Fixes: c4cb2311110 ("iommu/amd: Add support for enable/disable IOPF")

has these problem(s):

  - SHA1 should be at least 12 digits long
    This can be fixed for the future by setting core.abbrev to 12 (or
    more) or (for git v2.11 or later) just making sure it is not set
    (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/I+HV3X+03lMNeJcUiGSgR8/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmervVMACgkQAVBC80lX
0GxQSwf8DSu5hVzwr54vCS5D0JKlb8JX5A7qZt3aCkAZn2ygJA3WtYEyGsxd03Bl
E8AGtTnrrkjF2QlU7IzhmULcB9kbeEosWU6r8FeyL9teD7ToPZChRvrqKMkD0ydS
RZPcN446Ow3eyqcVdfpPbCr0yrS5MOXF0h9mhb7kkSC6FW60OXD3Sgrc19ltm7kF
i4NZBShW7/LYxbFdsiM3aaF9EVx8sDCuV5uEEkJHIklMTOCeELZcG2V1edopQoJw
I14WOgNqh1rraLJlYHO0OokNhvlIy4QW9cIw+4QWTAGHKWhh/G+D7hrLySo2egFo
uA6Hit4B2CQTCPcY8ehLtNmskgY4ZA==
=VfQ5
-----END PGP SIGNATURE-----

--Sig_/I+HV3X+03lMNeJcUiGSgR8/--

