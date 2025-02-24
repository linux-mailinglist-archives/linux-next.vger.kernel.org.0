Return-Path: <linux-next+bounces-5549-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6DBA41979
	for <lists+linux-next@lfdr.de>; Mon, 24 Feb 2025 10:49:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B0C3188D09B
	for <lists+linux-next@lfdr.de>; Mon, 24 Feb 2025 09:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D023A1A83E4;
	Mon, 24 Feb 2025 09:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="AtGOWShz"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3551F189912;
	Mon, 24 Feb 2025 09:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740390548; cv=none; b=k+MvQRnIbZL1JNipCHEcwOMB7RWCZKOPNy54Mezd2bY91XezOWELwEClzsgHz18ZWatIcGNYFXJ9tl0ntvOx+n6Jv3U/frIoVRM5AAM5bQ/UyTqK5YXIYN4BWrkZoeInUUv25bJJk7RqZcbzZd70SY/sIPfS2jYVIB5iNqWh5CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740390548; c=relaxed/simple;
	bh=7Pd7khuI2KchDXVwapOXs6RAp/nDAGa5YPGGGTL0Vv4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gJpxE82isvkC/mfFA9nqOMjUOAene+l6mRbDoXnYwbiGjfL0/GDRGWTs1bdLLo6b3iy44/Xjm4O0oT1HBpr4lHxbwus4tLsVXUurdcNYo86UT6kdCZt2XGey2rRHQGGkEhupmUHiz97KB8v1dtlCqpme1YUFFfCuJcuBpMtmSHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=AtGOWShz; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740390544;
	bh=epl3x8xyIYnk5Z5jcoZE73g/RkDrJ2yEW/LPXAjedmo=;
	h=Date:From:To:Cc:Subject:From;
	b=AtGOWShznmM3GB2OKC076+wSzZEY2cmPIyRAE/BTcXUgwPRjWHFYLwsANGhkoWsCR
	 0wVT4nHmqEnoKq3ZrlAzw+eSdu9jE0WTuQ5It7sUJ8pJQ/P5fLEHC3XYbKVZF4kbAE
	 PV/k05a08rHkHhNaEzmgCTICoMz/loG4uT7ehD8/gQ43Lhqg7Ezb3lnzE0Jg/YOaDZ
	 LHoNU0hcnGqfTw2PxV2oP/+EJxP8dnz4Vi0W9VO+5l/ajLcRUo8wXRYmO6nvV1c10G
	 shmItjUnrhihuxF87xT3iR19be2kQHglWYyy9LmutrcRblaYveHOJAVtzvioe1MW4z
	 DpXfP60uiTk9Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z1bXw0DGxz4wcy;
	Mon, 24 Feb 2025 20:49:04 +1100 (AEDT)
Date: Mon, 24 Feb 2025 20:49:03 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the bcachefs tree
Message-ID: <20250224204903.7ab806c7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DC1sc+iJXBg1Rx+NBBfO/kr";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/DC1sc+iJXBg1Rx+NBBfO/kr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  d139df3ad938 ("bcachefs: Use flexible arrays in dirent")

Fixes tag

  Fixes: "bcachefs: bcachefs_metadata_version_casefolding"

has these problem(s):

  - No SHA1 recognised

Maybe

Fixes: fce7ea1266a5 ("bcachefs: bcachefs_metadata_version_casefolding")

--=20
Cheers,
Stephen Rothwell

--Sig_/DC1sc+iJXBg1Rx+NBBfO/kr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAme8QI8ACgkQAVBC80lX
0GzK1Af/SJhPV2DdrsqtYJ7B+hKnEv+ojuFxWyv4oMMwwDueASIXdksRYTfomPl+
lWHvRzp93HStrmCxpdLi7i/ak76aNatU2ZKHfHqSKjawGFwBz5kxB+maaaLHAvWP
2EITdMfus6dWKj6GBa5J04ClnUz5rkL+F6H/+wR4sr7dbQVbUuEvGx/8KDr/owcJ
xH+EOkkkv+pFhkm3lRudryhGpTY8tyZBMf2IdOT3gCd/S4TfdrgCi4NpOhZHYu1K
j8yiyY8qR+VioWGMMg8QHrQDSGXLDEv/zEH5WnsTQKZ3aqwz/YdiA/LzWLQbdQs6
H7KCauCTr5ok7o7BKUobwIhcCbxOXw==
=n9iM
-----END PGP SIGNATURE-----

--Sig_/DC1sc+iJXBg1Rx+NBBfO/kr--

