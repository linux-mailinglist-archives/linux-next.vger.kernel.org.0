Return-Path: <linux-next+bounces-5703-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 84954A5A5B9
	for <lists+linux-next@lfdr.de>; Mon, 10 Mar 2025 22:10:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32B17189322B
	for <lists+linux-next@lfdr.de>; Mon, 10 Mar 2025 21:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 312871D6DBF;
	Mon, 10 Mar 2025 21:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="a/oT5h8G"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5C4BA3D;
	Mon, 10 Mar 2025 21:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741641001; cv=none; b=ICf3wHZ1EhWFlkElHp0xzh+dRp869HmA3aHYDL9+LVXerMLU52DbcFBeOv6T2oXzRqN7Rh5Z3CYbNqmDMIb3RTvmUY+j8He91xSUqUaZmwaeiJOJUMMV4otFVxBIVGt8+BvU+CVaPuywedfYbuFB5LCJZdBNGjd3SrniurUHbi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741641001; c=relaxed/simple;
	bh=hnoXiGNp/PvOnwjAQ4Ytu76PlRn/83SZ8YwArqcMUXM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Oop610ebKLl0r3tMHEFtGDHUbOf065rhB0v4r6LqmiLqqycZM1hAZv7k4vw+pYCFl9IK21mUBZ6ExbSX33rfxSoHMgVq+kK25qeUBt4BQm/2ogrLQbs8UDhUIBIpWJlLy6st8Qhi6GiVPg5XzxqqnDG4KCK4Haj0UtEMpo4OJi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=a/oT5h8G; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741640987;
	bh=qwuVxop55oAN9OnWyq/O7mn70JNt9kf0Qtnwu7sCngQ=;
	h=Date:From:To:Cc:Subject:From;
	b=a/oT5h8GnZ4JAJ+7We6cq8j3KZasIrOIfhrRCOTNKd/fn9vHBHKQRd82k72ZzfbBp
	 9UYs249bPnjctJs4i1x9C/YGb0oH9IPUoF1/qrZb57IbXdrPFz1MkN3j3hCJ4CzIgr
	 +RSK/nFYHYyk11BgwcCI/iey83FuCfm6oXcJxb7XALfvg6yQM+VEh/NAqkYsaUaQ4N
	 i9RowOSVDwbfsNWUSWV2lOR4ybrc8u0qFh7W357zF93VwoSKruRUNkTNFyT3zvGNxU
	 B8vuK741AHpVzKoRvetNhy6TisICM48uRPIdXZHX6W4r/hHAdHHlP9kNxHjFDBfLm3
	 Fkx/oypmtrDRw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZBTzv5sdZz4wcj;
	Tue, 11 Mar 2025 08:09:47 +1100 (AEDT)
Date: Tue, 11 Mar 2025 08:09:46 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jens Axboe <axboe@kernel.dk>
Cc: Ming Lei <ming.lei@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the block tree
Message-ID: <20250311080946.64b06fcc@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QYhGvB+ugkYZZpenyX8+NMU";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/QYhGvB+ugkYZZpenyX8+NMU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  cf2132935639 ("selftests: ublk: fix parsing '-a' argument")

Fixes tag

  Fixes: ed5820a7e918 ("selftests: ublk: add ublk zero copy test")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: bedc9cbc5f97 ("selftests: ublk: add ublk zero copy test")

--=20
Cheers,
Stephen Rothwell

--Sig_/QYhGvB+ugkYZZpenyX8+NMU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfPVRoACgkQAVBC80lX
0GzVGwf8CElRZp+ZcG5iLe6hoQtqSIUkfT6oGjwrty7Hov1QEZLv+2YZ6PcNoAzN
kbbu06ZqvwxDQdU3EwMtJAB+jiXXWUCF++w/NLgdl9v6SgO0g1PLlxhI/mGmJrBL
CT5EvCqK7a+8hFrP4a+q2/n9KIzhJioXrhpWrwNrzYmQaTGQLqTybomaCx1n3D6l
1W1t2MmLjfmzDYnV12hXaa8SixxdI2BkYrX1gUMmxpX/CZQz39gEqmM2U8k9PMtp
F/RPcSh+7//CU8zAFS0GS5jqZsiUeVOZRffrM6cDvA1PVVWIKNaronPmqCZr+oV3
/eWW1qF8aAq3+Or853UfQZje5MlJ8w==
=8gAF
-----END PGP SIGNATURE-----

--Sig_/QYhGvB+ugkYZZpenyX8+NMU--

