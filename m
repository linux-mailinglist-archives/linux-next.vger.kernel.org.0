Return-Path: <linux-next+bounces-8903-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B81C447CF
	for <lists+linux-next@lfdr.de>; Sun, 09 Nov 2025 22:36:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFCCE3A4213
	for <lists+linux-next@lfdr.de>; Sun,  9 Nov 2025 21:36:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCD812264C0;
	Sun,  9 Nov 2025 21:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="KCgcg67d"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B09273F9;
	Sun,  9 Nov 2025 21:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762724176; cv=none; b=KbBItK9M1/nniXePUtlDpgQqR20HR+w5V2vOnPe5I80zWovzzLxrnFw9fJnX7aG70VYQWAMNTPxWAwG3iZC6Kv5+uhp8MjaTtSCIw8ag1irTcq9z0naYusSd/BGduLcYub9c5x4QL6PDfdvHlDWh3nBeRBEbNizKFw7rIgj9jP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762724176; c=relaxed/simple;
	bh=IM1h4TCvgh/0YMDDHu/bUjgSNMyL9VyWeDEoxGTOHd4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VVCbHK1opvmoQ0qr/nE+ce89degL+nTcCHo1w6GIJ533XiFJuFBQLveAvlX/VfaQBCBZVFTkSzQafbXCcJos+A+SDxo+WSmRkh7oMJus4PuxFnuCkTHetldkBQJczWV7PvsXfxjJmPNjcNHFa0DgbB4ar+ETcG6N+62iPJoyZIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=KCgcg67d; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762723690;
	bh=mXzp6lpb+x4n1gItKa0zPYy6KYvThjTTAQOOroyRjvA=;
	h=Date:From:To:Cc:Subject:From;
	b=KCgcg67dq0OwLih8dJ0r4lqbrtiESXp4ZxeqRUZLanJ1CjVAx/VCvQXRAWOfmIndQ
	 IcwtK5AEtd5LJCEe+KoF8lgiLb4dwBghcxJurmD1UAsfjBXlQUK1uiQe4Hxt10MQKN
	 Sivta43CSvRZCRGfxkgIX8z6tf/XXHZEFYgoqnJW/bHGhxPimdxpqUn1/VMFWTUOiX
	 88ThpC1V7svCZtxffli5vy5GdeZTpmh3PqTdJZu/c++h2gO82dOv8yFcdysc2TCSNT
	 Kxhsucyn48Qt7OIggAUl+sJP8X0NYrunlDAArCc/n2luA3uvNV5fvePHCyGvbgkjX0
	 FTO/dE+UW5Stw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d4QrT6yZfz4wCp;
	Mon, 10 Nov 2025 08:28:09 +1100 (AEDT)
Date: Mon, 10 Nov 2025 08:28:08 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jens Axboe <axboe@kernel.dk>
Cc: Christoph Hellwig <hch@lst.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the block tree
Message-ID: <20251110082808.7df5b060@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZAYD6LYPW=zxqqrRQg8BE3y";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ZAYD6LYPW=zxqqrRQg8BE3y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  86a9ce21f5b7 ("block: don't return 1 for the fallback case in blkdev_get_=
zone_info")

Fixes tag

  Fixes: b037d41762fd ("block: introduce blkdev_get_zone_info()")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: f2284eec5053 ("block: introduce blkdev_get_zone_info()")

--=20
Cheers,
Stephen Rothwell

--Sig_/ZAYD6LYPW=zxqqrRQg8BE3y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkRB2gACgkQAVBC80lX
0Gw5BQf+MAumSlm3DRflq5wuqMvvPaeJKpnWGlcgYkfxfCsJRKt37n+dkDQvk7Pd
EP6TW9v0v7Om/9frAAJB+IU7TGD9ydeojz/Y84sYRGrWy2BJXngtL9ksB7emEZjL
0yvdgl4JiNi4Pt8rLhZ1TUpH2UPXmPzCj1uU2PYCDvvXjxkEnHwj/hPNXJ5jJ9f+
8y3FxSGWUcIX8vpWetpEctEbH9HdnwUHvNefcKn2mSycst6QgEnOc6Xfc82zfpbH
161MfSk0Rw4iW2ZC7sLpP6i5IGNX5D6EE3Id5zLkyyYLmJ7GGKHUvy3kIOOrnBE/
gixXd/FRC4ezzZ6MuHPTj+TkyanF1Q==
=bLSZ
-----END PGP SIGNATURE-----

--Sig_/ZAYD6LYPW=zxqqrRQg8BE3y--

