Return-Path: <linux-next+bounces-8170-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2204EB410AB
	for <lists+linux-next@lfdr.de>; Wed,  3 Sep 2025 01:20:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F4061561E3F
	for <lists+linux-next@lfdr.de>; Tue,  2 Sep 2025 23:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D940826056D;
	Tue,  2 Sep 2025 23:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="KBRans+g"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4A63D987;
	Tue,  2 Sep 2025 23:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756855230; cv=none; b=Nb55SCLQBWYaXohm97HIjH/wNJbh25VM5fymeG5xiJX9JoNHnONRB77eY/yay5z1j+uT/kpow33G93Vk/7iymZOzjxjLvsHvUXGRAfjDThQncJzkY/AywsZXEmQJx9IQ/Mz65TmV/zasPFmOJX2abQShHrkFlLWI2DnUXEp3RQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756855230; c=relaxed/simple;
	bh=vNMP2Sja+AJKeasoUfgLholUJb8+S9KYwUQYYInYVXU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tBv33NgtZFxyb/GMEt3hhqBzYYhSSMYhxgRZyTAubEDEUVweuNiFL7P8djkckcFLaN3bWBSwC4d+cMlqhJcwPPHqdPapifqNKOTNFeZdbQQNylt6hQIEpKxNHUTGMyS/W6LzV3q/6sqPoGEWPUVl9HrGdAtMsRP1YeVy8y98HE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=KBRans+g; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1756855226;
	bh=FIINZRYw4m19okYLUwqRRxgt4KYQdy/PsbrF7L2mYeM=;
	h=Date:From:To:Cc:Subject:From;
	b=KBRans+g3bLmI97A6BAR0NM8SIk42EAHO0NSx2T4P5jdmKFO+kH/62SFM9txP0/Sy
	 TrDbmKw+r8Op5K4u46XQWn4x/BL//m9jiSis+TDtaJmzmHeqqudBqoCMnjavBUFw4Z
	 iaplsTGoP1h2OhFw/epncxOlzKaaekGb0uJ1OLjIdRt701U9l2OXtPvQmTkjQovFAS
	 OlxWMrEHqzzbZ1Bb1Xz+lhe93avgpwieMIrJQJT9D572DJrqfa6TzV0MCXuqrCrUxb
	 LEHdMd9UKyFP+WNHARRs2WK8hDcruityh/uQFA2a5+9j+4wLQCbYSWeM+8OSY1N0QX
	 8PXnSV5kqPcNA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cGhYQ07wLz4w1j;
	Wed,  3 Sep 2025 09:20:25 +1000 (AEST)
Date: Wed, 3 Sep 2025 09:20:25 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the imx-mxs tree
Message-ID: <20250903092025.6381f637@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.PlNp0f1XEw80Y3eesJXZO8";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/.PlNp0f1XEw80Y3eesJXZO8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  a58244ad7c9a ("arm64: dts: imx8mp: Add pclk clock and second power domain=
 for the ISP")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/.PlNp0f1XEw80Y3eesJXZO8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmi3e7kACgkQAVBC80lX
0Gx5WwgAlDWqz8ka0X7ZGDksTZDdrlQLtXpuT6MnLiRHTYawVrJ0q5DrnohSgwJS
PsTyOWUK7L21qRPIKg/mMkr1S78s10ZBqJmF6fYvats/5dJdeMBZNYCj8EFrH2PR
Aw/nEIaHd+I01xA3oCL9bzKEV7dI0TvzyMy4VwDXDRNkMNPv8PA5halE+D+3SmWD
vmIVupCNiBe6y/XAgl6SDtwIsPWfeQTxvXrAzrzILM32TQzLOOTddDwbeY9sdHG6
hM50IsTHNyzwAXkgmkUdMWbgNsYxwLJmDo2U1twPwskUxwvL5oCyPVLQeOi+ph/1
8M6qzZ9SA9t+NMZ2rNV0YktKCOdQ8A==
=mWm7
-----END PGP SIGNATURE-----

--Sig_/.PlNp0f1XEw80Y3eesJXZO8--

