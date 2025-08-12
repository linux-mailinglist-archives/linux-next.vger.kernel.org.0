Return-Path: <linux-next+bounces-7912-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 233DAB21C31
	for <lists+linux-next@lfdr.de>; Tue, 12 Aug 2025 06:45:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD71062603B
	for <lists+linux-next@lfdr.de>; Tue, 12 Aug 2025 04:45:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C82DD29BDA4;
	Tue, 12 Aug 2025 04:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Zk8+3Ot6"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BA720B801;
	Tue, 12 Aug 2025 04:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754973905; cv=none; b=o89SSXCGF9ZcCTO7EQAb6MZWGYA08EwW8U16TUlWfs4qQt0CTL0WlJl36O5dsn7QidlCAvUjw6ipT1M2uBgjzdko7lWeYGyaaIE3koY3UaPeYUYuV3pvpO0HN7eoWxGdLUx5HmXmEqyHq0pXcmuE/jg+uZ/gaPPnDJPpA6V4u3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754973905; c=relaxed/simple;
	bh=eYHOdBhtodxhQQ088uejT1bJaFtUrE+RGqk7011JKoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=p/+xwIoFa0jxRHAJqO1qTPojGeqY3SHk76+0eV6hMJNh3NrHEeSGuThXFV7mNFtAK4VNtPuGFTsUqnVFHPWNfvbDDLVgrrkLEyMdG9dBddK+8PUqc0kjVwMgdEUZ24oA1r4pXOumVJeayZetXjvXq7/3f6aTOYkxN3ODX5nKnl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Zk8+3Ot6; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1754973900;
	bh=XjKGrHuPCIapkpy8Kft8ckIc0FTCu7Y+dTCgZMi5Kdc=;
	h=Date:From:To:Cc:Subject:From;
	b=Zk8+3Ot6Xd3tbVEcSfcpzEPLg6iP3L1OS92sFnAUFiPg8r0cYDfZNXGWZ6wAlYKmC
	 m9+dzw2fg6dVj9Y1wmdmUKLMZY0bOmLoDaeQyhtCo5P5rbWBAJufGj1dmOSxT6Xmbs
	 oSGrDPxVteWajbDCbbaa1L9gTNOLjuKA5EZwWNIa7v1jMuMpI5pm+GyBWdU7pgU2NK
	 DlmcAsq36ygovfirF6kzLq2wwprMNwherxx5/4U4lwfDzwdqIcSdVNPh0rVmH4Vww7
	 amTjmLfPNHb5BDfyd8rpopyYexrnbmHJOEz8+8rLy4/YqunCLH7Q3++tCjkrKbKetF
	 zPf8GVPtds3lA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c1Jp42vZXz4wbc;
	Tue, 12 Aug 2025 14:45:00 +1000 (AEST)
Date: Tue, 12 Aug 2025 14:44:59 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andreas Gruenbacher <agruenba@redhat.com>, Steven Whitehouse
 <swhiteho@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the gfs2 tree
Message-ID: <20250812144459.52ec42cc@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Pt16ZCpP6TQw0B0EntemW1N";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Pt16ZCpP6TQw0B0EntemW1N
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  eba348e9a420 ("gfs2: Remove space before newline")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/Pt16ZCpP6TQw0B0EntemW1N
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiaxssACgkQAVBC80lX
0GxOVwf9Gd73B1fKOLICVGdJCNCQ/VaajGM8Z/IeHi7qK0Vkqs2YExQf0rRfHOgZ
LHqUAOxNFNj9fDDum8e7FVjibLmbVH6BA3Ppajd4kMEluBbhHAJyOF3HTrO+UHB3
vpkTeOxwsZb6W5pz01bZjWJ5etN+VL5uy1Hcvim1z19j87KYW5E6ATH2mgS80/V2
h7WfB9NmhnvmhBBmuRdvpIHU9gziWo/Ag72AYcAy7KzQ8nHedKbK1ExR8aaGyj8I
InCQYQ4BGjvGfe05aIu0YaMdpOf3tRrt9bPPduaMzerfzTXtPhV584plX6+M6iFN
mFnijqhcKMpP2vlHFJ7x/fA+yOjrrQ==
=wZLr
-----END PGP SIGNATURE-----

--Sig_/Pt16ZCpP6TQw0B0EntemW1N--

