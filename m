Return-Path: <linux-next+bounces-6795-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4999EAB85FF
	for <lists+linux-next@lfdr.de>; Thu, 15 May 2025 14:15:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57F083AE184
	for <lists+linux-next@lfdr.de>; Thu, 15 May 2025 12:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 977FF298CA6;
	Thu, 15 May 2025 12:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="cNxfbw7T"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3228298C36;
	Thu, 15 May 2025 12:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747311051; cv=none; b=hHhPDTHz2CtfWzOwqzHSYRMxVFqlAal3L1qg/oc3wTl3KEOFCTSLEFuPuDpwWzXifHl4PdBRJEX/1Dp/LL50DZ/GCI7urODrLYHppIQfQliFn7/5iECOFKpboai23TOT4VHd8vAKVEff2gyWevQs3h1kybZpG1vh8hVyX4kCQgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747311051; c=relaxed/simple;
	bh=N6rMoCx2aOj/7ScMu7wI/CvU9gkdt/FPtQ4XvrgHyNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U0TqPXL3BqJ4gBsdrCqFz93WzszzaqsOb5K+U/qcxSnoyubJYSKlc/paUxeV/Ms7yOHlz732QJTxccm1miNIbArGsW6kvDOYxdPVvcBZ6q3akqc+FiIOX1xadpgljFcaoaB4bTgOcRc1/JVyAcn8Ah288SIfDJBqJqZysr+0d2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=cNxfbw7T; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747311043;
	bh=N6rMoCx2aOj/7ScMu7wI/CvU9gkdt/FPtQ4XvrgHyNQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cNxfbw7TKopOr76pqBt1IlHgj3jY6tDdQWO2HqbGadj/8zLsjU3p1kN0C5XMmqrpQ
	 cBO/TMMAVMLnYHSgW7ZONwrpDg+4B7HkYAT4GLzoTokYBBgYNcS05IPGU00zRmk2uq
	 FHhrGHSOd7iV/mQvPGlPiLEURUBIg/tchLc6edM+xg8/8I7PmeH1os2ltkZCCJc9JE
	 +MrWvd8d3NvmLUxKgD+TIMsqf7dnpInOyNIfx4gblDDEqLcn8kznJ5AkpnmhXJhXjr
	 IZNI0KVj6uM9X+B6MIVlDm/SCKcPYm1aRAvW+R6orUEVvYWmSkN0t9Sq088IEPRPiE
	 U/onZH8FHZeuQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZypvR1dTxz4wvg;
	Thu, 15 May 2025 22:10:43 +1000 (AEST)
Date: Thu, 15 May 2025 22:10:42 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: error trying to fetch the clockevents tree
Message-ID: <20250515221042.7471ffc9@canb.auug.org.au>
In-Reply-To: <ba3ff719-ce60-4c0f-a215-fa332b614b82@linaro.org>
References: <20250429082047.4af75695@canb.auug.org.au>
	<db7fce1c-c051-41d9-9cf1-ef015b0f7fb4@linaro.org>
	<ba3ff719-ce60-4c0f-a215-fa332b614b82@linaro.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ub16.dQMbCW7_llv1o7P1SF";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ub16.dQMbCW7_llv1o7P1SF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Thu, 15 May 2025 11:20:01 +0200 Daniel Lezcano <daniel.lezcano@linaro.or=
g> wrote:
>
> I had no time yet to migrate the git tree to kernel.org but the
> servers seem to work correctly now.
>=20
> Is it possible to enable back the tree so its content gets some round
> in linux-next before the PR ?

Restored from tomorrow.

Just to make sure - this is still

https://git.linaro.org/people/daniel.lezcano/linux.git#timers/drivers/next

--=20
Cheers,
Stephen Rothwell

--Sig_/ub16.dQMbCW7_llv1o7P1SF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgl2cIACgkQAVBC80lX
0Gxscgf/azHtkJZK1c89SBx4lYCiPZV6uj6t5kgzKjXJV5qMg1bpvPbH7o3bfXA2
B2d13bBIyCZ8vyvJdfsfUg22QrAD1c1bUWcvhiHxpNkI2Kle0kyH4rZ9kMIxLxDw
Yu6aAxTzqh7XKjpHXOyopDoDVHlsU0ZzVsPW1Syevr+QZzCgplex/PMs/CIrbtph
4hEWz4JbWuV6tx36zfJTDq+mwLYrr7EpPnGTxvINfP0wB5HoiFvtFA1MlN8KjOwx
5kjEgZpbbTpYNkHGc55Tk4fNb4eMN9VNdo8ojiM38LM9hryPHKdbIQfAnP+fn9+U
cP/A3L7sIj0ekE88PeDAPqHvryVuSQ==
=3CMP
-----END PGP SIGNATURE-----

--Sig_/ub16.dQMbCW7_llv1o7P1SF--

