Return-Path: <linux-next+bounces-7181-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1C6AE03E0
	for <lists+linux-next@lfdr.de>; Thu, 19 Jun 2025 13:36:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3F3257AF765
	for <lists+linux-next@lfdr.de>; Thu, 19 Jun 2025 11:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 125CB23644F;
	Thu, 19 Jun 2025 11:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WRFVo6do"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6145E236A73;
	Thu, 19 Jun 2025 11:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750332842; cv=none; b=RtCqEiz/6nidUQ1MuIVTDBunadRWqPPv3zwCs1BYEgJihr5Hus6TWJvv2C6T6RediXZbi4R4zQTVWI0peyFGciqMVbYYrIbGKGLFyzMPFfjdMctuB7x7AJu0yIgvTfs2yvG1YW0ZZfL8uShgZAGkqj2sJncEpzj5Gg/mqQPPuVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750332842; c=relaxed/simple;
	bh=VwmQnh86mmecCweO+pnsgNN2cDKLYEmmigNkJsNCxCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DlmZGgRmrJUEsHlaCyz6xvU+x2V5AZkHsEeLK0YU/iWDFV3vVaHY0b3+4ZjgAIb+3feS/nqVdsJCiqMHUYRx7yL0aA/+ImpywZ+UmH6d7nUvsJ6RYgkHgBLjkuwSaucyusZYe7ljb7D2x5EjCGeq/SqCV5FLYDfxU08k6KS+nns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=WRFVo6do; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1750332836;
	bh=H2AI9AZoWa/hRzsDWpMBrbrQp8NJUXeICYcsf6MSaNo=;
	h=Date:From:To:Cc:Subject:From;
	b=WRFVo6doziuAy1TPdxDLZhcGVibQB6WUh4ahoYFErCT8PvP4gB3Wy5s/5LDz91MLf
	 0AZ078R23p+8Ek9tfbjrbQtmn/yJQSyJ7/3JGSUHb+yp2d/HYQ09xiPGUTvR1aSdny
	 koskeSLzfCsX8+dWp9N7/Scj+elnvFDD4lYYpmHu1sV3lr5ucgYgfnbVHYb6F8Br7h
	 6aOaM5a51nNXKkpEFx6mnuQ4zlDH10XEtfqXq/1Kn7WjRyXvj2AG3LEu5LuTXgXjls
	 GjqrmanwVJH1CTJyVprYNee7ft0HRs53Vxt+Xc/8JXy7/bgTOG1eRBwKPJeAexUurJ
	 PLgrNkRM0yeLw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bNJQr1pp2z4x7s;
	Thu, 19 Jun 2025 21:33:56 +1000 (AEST)
Date: Thu, 19 Jun 2025 21:33:55 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the imx-mxs tree
Message-ID: <20250619213355.70bc0dd0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vsJMqrd7+7F5/r3kHT5j9Au";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/vsJMqrd7+7F5/r3kHT5j9Au
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  bfb861766f3f ("arm64: dts: freescale: Add the BOE av123z7m-n17 variant of=
 the Moduline Display")
  8c6d53ee0a19 ("arm64: dts: freescale: Add the BOE av101hdt-a10 variant of=
 the Moduline Display")
  844cddc2ded0 ("arm64: dts: freescale: Add the GOcontroll Moduline Display=
 baseboard")
  67fbe9fc5d5b ("arm64: dts: freescale: add Ka-Ro Electronics tx8p-ml81 COM=
")
  5f465a764523 ("arm64: dts: imx8mp: Add pinctrl config definitions")

are missing a Signed-off-by from their committers.

--=20
Cheers,
Stephen Rothwell

--Sig_/vsJMqrd7+7F5/r3kHT5j9Au
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhT9aMACgkQAVBC80lX
0Gxd9Qf9H65vwQPtnFeni37DOeukJURr69uiHcVzGWJXigoJpHTsWf63DUtgw8AB
PHTDejzjOh+jjlS7UaAAUUiBNOQY/dY45WcUP3Gg4qFgxAiejl1/V5v2Xj0p+Mie
w1HA0f7wWthlRxDXhp989rkyH0bnVF8mIXC9WW0+fLsJE/dKQ2DuXmTtVjR51zUM
BTVHCCMEKcVs/0akblvRq7IqNEVhfHa6mMwlEtlWUVY7tLIE3OtGiWS9Db8kEGXQ
97JzTYyIKDeob7bVIYEbGIoz6wTIA7HVBg4FRR1EFvI+VSuSsczcrin6OHNLevB3
j4UnWvDooa3+lBXdI5XVBuJMadJhRA==
=4g2E
-----END PGP SIGNATURE-----

--Sig_/vsJMqrd7+7F5/r3kHT5j9Au--

