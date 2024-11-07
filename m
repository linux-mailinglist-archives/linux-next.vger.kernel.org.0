Return-Path: <linux-next+bounces-4692-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CF49C10BA
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 22:12:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D129428442C
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 21:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B941219CB7;
	Thu,  7 Nov 2024 21:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="pVPY4NnH"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6615A219C98;
	Thu,  7 Nov 2024 21:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731013762; cv=none; b=osDPYEbHJwzFkKc8CLg95OSt7LPqLwiO6KQzQHms5ZAW98AyEi2L2hcaRlDHLDZV+fQFTwAkn3yk3dawGheO8PajiQP1ztqZAsOqlwj8VyLYUYTCcVGOOBlSZ7kJzMzz9LvSSZxKEVOQvfGAqXFkpTXeTkUa7Obj0uNF3+kf5Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731013762; c=relaxed/simple;
	bh=vwrdjS8ml8vC4eWdNUR9mftmWuSayLSPCOlzu1j5Orc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=odt94Pr500eTpTxCC/z108Xt2AkIhRkVSuMWIjacka2n8GXKLqTnk5pPG9W4X3tMBhu7dcD1CUHq6AkRnG+LwmzrtLMVXDQ//wW8qSHtkWXzcY0fPPrqzvhwpBLlAN7KutAr0J1dfNmroIND31g0mXFQm7SClXIlKSMa9J3/V5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=pVPY4NnH; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1731013754;
	bh=9AOTeKEW0Thc0jC//Nk3O/QqSgPIdB9RMMlryH/gYi8=;
	h=Date:From:To:Cc:Subject:From;
	b=pVPY4NnHa1cXkpIcFCYEzng5EDyd9RC/3yPMTAYgPBTTnVrBr7HyCti4VichC2sEY
	 0IxVp0YngGMPUzGEYigsAjKQMPADtascSAQBQhqX/paaHDkVbTVRZ/l/NZaMd4crcB
	 3bVJmVhXiPqRm22jD7bHs7FBJ3L8cmB3gZUakDwrvpiMus+wiU1qMAYRKsNi9L5xxp
	 Fi2B53RJlsixz4JESGuAjsvl8vIuMllbRKdLZupbdnZCbL3zMoj1N/wOt6mtd4E7Be
	 T08KistAWIFbiVPUpp2XcHucSXUaF0H1pHK6iTVvnF3wbhuRM0BD0cRj1xjr37LSSy
	 10vxegTnRQI7w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xkvp11D3Xz4wj2;
	Fri,  8 Nov 2024 08:09:12 +1100 (AEDT)
Date: Fri, 8 Nov 2024 08:09:14 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>
Cc: Chuan Liu <chuan.liu@amlogic.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the clk tree
Message-ID: <20241108080914.65a7a03a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Yko2e9AoqhcAUASoQxA3V5E";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Yko2e9AoqhcAUASoQxA3V5E
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  5e052ef3c400 ("clk: meson: s4: pll: fix frac maximum value for hifi_pll")

Fixes tag

  Fixes: 80344f4c1a1e ("clk: meson: s4: pll: hifi_pll support fractional mu=
ltiplier")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: eb61a1264990 ("clk: meson: s4: pll: hifi_pll support fractional mult=
iplier")

--=20
Cheers,
Stephen Rothwell

--Sig_/Yko2e9AoqhcAUASoQxA3V5E
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmctLHoACgkQAVBC80lX
0GxWtAgAoOQGLNq3tgOqPiUWc26o9jmEhUYbd5izTnkubqqO56SZNIbdVouprFwM
r3/XllS2CWXWJhFqGZ4mFhaHZWpBufpgUYLtScSkSYj9wDhvyaCd8xdDPPr9EIUk
DG0ORZ5/dX5hW0ttXuq5PETU1yYgh0PAzzpLsdR5gtRnUZ5FY8IC5Wiwsv6HlATz
m0eRJwBBJSXsv+Rg6r01lOmQPtMjYBwsixZIEDT3C9iPdzWkUROs4C9TZ+s5Lnqt
u0x6w9eaY0KJ7NeAs5W+qTzxQkXVJCFtLdSqh0mgAMrNtWdTbLveTk+XCkjvGu2v
3Tc2S44KunxnHTAdYmwsIf7RdWIaFg==
=jeyW
-----END PGP SIGNATURE-----

--Sig_/Yko2e9AoqhcAUASoQxA3V5E--

