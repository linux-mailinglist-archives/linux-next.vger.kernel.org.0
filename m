Return-Path: <linux-next+bounces-7678-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F84B0CF3A
	for <lists+linux-next@lfdr.de>; Tue, 22 Jul 2025 03:43:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FC89546678
	for <lists+linux-next@lfdr.de>; Tue, 22 Jul 2025 01:43:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E436B1A5BA9;
	Tue, 22 Jul 2025 01:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="PJNjYPJe"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C16C2E370E;
	Tue, 22 Jul 2025 01:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753148575; cv=none; b=sK9syT07LXBamzyb5dZYzpUx1zDQE2ewG6wrsJ6xSqQ/kvOHMKqXZlCObaweSk22ii8uSH1Rcg+nJjMTEpuPv6e+cTGq+RQBQA68R1M1ksXOBJa6NuGpBaP9giivv9DVRpdRttYVG7qNF6h7ei5X31MMEL6BRzx5qkIkYVCnMx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753148575; c=relaxed/simple;
	bh=CqABq7oz4nWeQWt3WHhA/Ulft6QcCV+wkMFV1Vvum5o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Shk7h3/85HoBLNRCHufNvT2Tymb/wBIdYkE6W7ZDZND3mbDzA/K27Dt/nrE9i9WYsVEp+CzFCuPO1fBwjXVH2/WaIpyUT0zdt8sfuInw5d/IoqgH9mMJ+bA1Oi8BKC7y+eCfvozoDAIrr27xatYN8cg7/SZIKIaIAmAdfLDYmyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=PJNjYPJe; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753148411;
	bh=kW43v2CJU0eh5utNf7+57psv0SEO33wdFHe1bBu69gg=;
	h=Date:From:To:Cc:Subject:From;
	b=PJNjYPJer5bfaEzbs04vSKIix41xKer07eqYyBp2ceqe7/HkTwJ9rwvmGrzrEDHUY
	 tBDbcrwtniCQKLmhnHJFhR2eElV4kOGNqBag1wqocCY9KfCW7dm9HieUQdue68JgZe
	 9/UXG7D+DyGUIBEHby5CTLFCNNyOUmMVwl0ME2hxuaUGG4TusvbM09X6GWklV7Qxpt
	 /MbHJ77caDQU9KMQZLe+tHHsBDFjw/RoKURp9MAVRqeU2nQf9zn+MPRe5n3iaehQ+l
	 DbQBRGljPCzfudFmNnyGaXO6R4tUcZp7XRq50HN1t1jVKBTMMwTCVK8EyTVVqe9o6y
	 rCkYkUYAu8Xig==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bmKhV0TcFz4x3p;
	Tue, 22 Jul 2025 11:40:09 +1000 (AEST)
Date: Tue, 22 Jul 2025 11:42:46 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Networking
 <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Raju Rangoju <Raju.Rangoju@amd.com>
Subject: linux-next: manual merge of the tip tree with the net-next tree
Message-ID: <20250722114246.2c683a44@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XcVR0con5UQbUHdtB0osM.1";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/XcVR0con5UQbUHdtB0osM.1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  drivers/net/ethernet/amd/xgbe/xgbe-ptp.c

between commit:

  fbd47be098b5 ("amd-xgbe: add hardware PTP timestamping support")

from the net-next tree and commit:

  e78f70bad29c ("time/timecounter: Fix the lie that struct cyclecounter is =
const")

from the tip tree.

I fixed it up (the former removed the function updated by the latter) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/XcVR0con5UQbUHdtB0osM.1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh+7JYACgkQAVBC80lX
0GyFuwf/RbZq0l99iLBm8UGqZe8+80z5boGeiO6iJkiV8u7nBTbuQwVrFLV6oXy3
6NWFjq/2cQmCkxblGl4JY0gTsNjBQoSGiLXPB7PAEGswdA9yKdkeHPSpD7c0yCRE
0k0gycTURUS4CH23YuX5Y4sWqI+1C/9UMeBDPhz6RGyi4vsEJj9Bl0D+3P5MNpIS
qJCGAqU5meuUcLnMbIdnPHdupiFZxFO4eHMYs4T5FEe+KMvFjeNtRr/Appa+oMx4
ELfKiCv0P+kmJdTy2o4x4fOPjYcpCN2RjH4EafEroN4JUWlszo6VR43KK9X5mjg0
HB2QZJrVPSQgbP10TEFIPLZLiNkMVA==
=Cv9s
-----END PGP SIGNATURE-----

--Sig_/XcVR0con5UQbUHdtB0osM.1--

