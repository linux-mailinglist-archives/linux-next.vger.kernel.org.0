Return-Path: <linux-next+bounces-5070-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 25131A03519
	for <lists+linux-next@lfdr.de>; Tue,  7 Jan 2025 03:26:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D5A41645C6
	for <lists+linux-next@lfdr.de>; Tue,  7 Jan 2025 02:26:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCA0918EAB;
	Tue,  7 Jan 2025 02:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="s3Qkr5p4"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076272594A5;
	Tue,  7 Jan 2025 02:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736216781; cv=none; b=VzhirN5YdgMoo8l/ZeKePCqhk4U83HAp2DX+3l1dD3g7mEBzlD5NPnGnToNOYHe/P0xQcaBXaDJXvLOuYzD9n8UQSb+9beuh1hO+68FJFdTLj+xxhLMMDsuLdfyHXCfYtREnBTUP/srOd5Ns547GFemvvYd8pIStxpBasZgKOck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736216781; c=relaxed/simple;
	bh=IjSbyEq6PoTKXf0aFhQsmUlA1b6IgTUIb7d/Xj6R4i8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Eg79U4et3j6WUYod/TnGk7JL2IPhTsJ23P5Dcdabtr8O51Hu6AeRdgjJQXuUp1pYPN0PIn8KrevGq1vK7FNLMEbuPIBk1D6bRjAFUyxEXp3wI+ntFax3rcrr6M47kPW/+ujYnG8Jq0Q5LdwwBF0nFmCydS5YWR9wJEsg8XEoABM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=s3Qkr5p4; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736216768;
	bh=iyJrfvdDKF2VOJrCj2GqZRJKD3mw2aNGzuL6VTWvxoI=;
	h=Date:From:To:Cc:Subject:From;
	b=s3Qkr5p47RtFTdhKsc+C1vY97JyzWupSr9s5R8WZCw//ntiya0r/QtRJpNdCE7bWy
	 Tum8tDA0ijx3sg3T35WZ7nGNQkvzbf1BQxU6qL8+3ipHEp7I687hdRWbBhQxSnpSfK
	 SMO2uf1sKcIsFUs6LkJ9aa3eO29DGfs0VOjBNLZS5FcJrstji3JM+Gg5iCFhvXe01V
	 dcBrg26IcxT0A9GGEo/t9VOUb6DjPCLNzgollyPDIB5CEImYcbSihfeBfuHUdq2N2n
	 AobM497XVKoyc5BsLpSGbg+SqypAPumnjmgL2t4s+pm7FxXh/Hi7EywHGqF+PbzbSB
	 i6b9om4dWPQ4A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YRvzz0dh1z4wp0;
	Tue,  7 Jan 2025 13:26:06 +1100 (AEDT)
Date: Tue, 7 Jan 2025 13:26:12 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jens Axboe <axboe@kernel.dk>, David Sterba <dsterba@suse.cz>
Cc: David Sterba <dsterba@suse.com>, Gabriel Krisman Bertazi
 <krisman@suse.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the block tree with the btrfs-fixes
 tree
Message-ID: <20250107132612.71a1fe49@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/p/3/rC/BMcIha8I5sLiqgWX";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/p/3/rC/BMcIha8I5sLiqgWX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  io_uring/uring_cmd.c

between commits:

  dadf03cfd4ea ("io_uring/cmd: rename struct uring_cache to io_uring_cmd_da=
ta")
  3347fa658a1b ("io_uring/cmd: add per-op data to struct io_uring_cmd_data")

from the btrfs-fixes tree and commit:

  e9447dc0b18d ("io_uring/uring_cmd: Allocate async data through generic he=
lper")

from the block tree.

I fixed it up (I removed io_uring_async_get() from this file) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/p/3/rC/BMcIha8I5sLiqgWX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd8kMQACgkQAVBC80lX
0GwvcAgApXsoSNYbVQ9jJ7rBsQTvw+AYrjJAUUG40DCAt9hSWwK8jvj8S8sk1xbe
HUlRICefymaK3mktI77zsn1Y7uYaRh3ajxVmPLlTb0c/IZK3neHmB0go0FMzaqqj
cwjqoejPIU0HnLlZUiA5ZlCtuYksXop++SMyMTa2aV8xLvzrp2kg0RWCmwA9tJyB
ISHVkNWlcoKl0PLfOswkesV6FkoEQape5ngAxFIH7QckQF3hw58b4/2t5tz4HAfv
AV0+nu7lWgMtpsluXlJerCv06XfzLMihVxLVLE6kOCrm7k8W+9Ch1rGaT1+dZ2xx
jEu1mjOXExvpu6Xiux83bVGZ85R10Q==
=4ywS
-----END PGP SIGNATURE-----

--Sig_/p/3/rC/BMcIha8I5sLiqgWX--

