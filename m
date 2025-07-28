Return-Path: <linux-next+bounces-7730-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9E8B14500
	for <lists+linux-next@lfdr.de>; Tue, 29 Jul 2025 01:48:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B37C1714F1
	for <lists+linux-next@lfdr.de>; Mon, 28 Jul 2025 23:48:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB02C237708;
	Mon, 28 Jul 2025 23:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WhArENUV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0842E2367D2;
	Mon, 28 Jul 2025 23:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753746486; cv=none; b=X/tmILQO2nw2GFyp9ie6hEXE564mkBTEkRSoSfAZS59cFmSu7GpYCZ2AJTao6k9p8gtAxMIBbT3PI6qVTTZMq/CjNIYU8meh6THKI7RfPF27kMuTCaxLvwr0LAoXrtV8+SiEWE/93i+HmleNmz9XakxHOxUmUdtxZ52Bf3eYR7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753746486; c=relaxed/simple;
	bh=HAssU1iuyVPQX5H3SJXQdA05rhGCePIiE5k+AQjMF5E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=kRCXQLa7K35Bd5IB6S7X0fP2MfbVVDu0OldtvG6uY7GrTDKPNNvmkeveMfrsx8aG0H0CbluzFbIpV0/JyKI9KJTbRSDhA6PPj1VvrXgJRWCKNacFAv9d0LVALw+mgkRxIm3cIWj8LPB5G3MYg6UrJEvN4VzH9Oy6I7npG2ZarjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=WhArENUV; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753746274;
	bh=9Mnc9dF1jENvmUCinLDRP3FBhqsKZtMHqsuLsWUY8Fw=;
	h=Date:From:To:Cc:Subject:From;
	b=WhArENUVtotLUSV16E6ptzPInJDgles3rTK/d52mob7ebP2VRvglEO6EExcbNh1XJ
	 p62Yy84+URcc3t/pnDhbgK6uBha/GfFy1fbPP+s2jXk0UiI0yZQuucHucUbrA3D8lG
	 G4OUxPo3jnBWTW8gMeV7Bhpfi+OHU6ZYO+X6XCXzVea5xtL3d/tEZsvQhgM6eAKGGc
	 oT4Ph1hipl8h1n7FYR+tLq0GbhvIguVDaMO08ukC1fx25Y4BIy35JrYnkR0vCEXeI6
	 l3Vqn5eo6BvPWwGcUCbp4YKXC4cqL2l06MR/urFceV3kxvUpu0KWcF10OhWi+V+T9Z
	 y2WSzweCEE5SA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4brZnt1FKjz4wbd;
	Tue, 29 Jul 2025 09:44:33 +1000 (AEST)
Date: Tue, 29 Jul 2025 09:48:00 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Sterba <dsterba@suse.cz>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the btrfs-fixes tree
Message-ID: <20250729094800.4a67451a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3+65nJlCODvVjzn7s_0EJCF";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/3+65nJlCODvVjzn7s_0EJCF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  92e6fa77b2e0 ("btrfs: qgroup: fix qgroup create ioctl returning success a=
fter quotas disabled")
  9eb1cf99dc45 ("btrfs: qgroup: fix race between quota disable and quota re=
scan ioctl")
  da08927994d8 ("btrfs: qgroup: set quota enabled bit if quota disable fail=
s flushing reservations")

--=20
Cheers,
Stephen Rothwell

--Sig_/3+65nJlCODvVjzn7s_0EJCF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiIDDAACgkQAVBC80lX
0Gwy4wf+L171UF1UqHs7B6djcgELP5TsjkZd1e1uiBnf57UCcAtlSQ6oCiM0dfhM
lfuJSGicHGgblkCcj4AmHoZfxnxY5bahYylLx/8xBKAtV9wyquzK/WdTZphJqZXh
E/cWbK8v77jQFWVKIMScsyLkJxSeHWkoE530skW965glAdgN2e7ZtQ1jgdz0LZXW
UQ8aTOyCKN4s1y79rmKYnc97iZnphR8rGgyrQRy9f5adVgbIIKVBvAZQwHvkrIjW
ilT+tKczOXjqpkfWod9aBP60dgLW9bwJGqBHOJHed+2DoRSte6sJxhIPjzGkp+vc
1Ay5ZW3EMlkChV1pOTx3B5oRhDpY0A==
=X6M+
-----END PGP SIGNATURE-----

--Sig_/3+65nJlCODvVjzn7s_0EJCF--

