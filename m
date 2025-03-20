Return-Path: <linux-next+bounces-5908-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD94A6A359
	for <lists+linux-next@lfdr.de>; Thu, 20 Mar 2025 11:12:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7FE5719C0D08
	for <lists+linux-next@lfdr.de>; Thu, 20 Mar 2025 10:12:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D24D0209695;
	Thu, 20 Mar 2025 10:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="BcftOn3a"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615431A238C;
	Thu, 20 Mar 2025 10:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742465516; cv=none; b=ql3ca/FBzNswTBZ8VspFXo9A1PMLlzb6nnWWEB4pgwNu7uxAkWNfoFJAijhaD+5SoI4flicMm1uugCU9csehSWgamyaZBC/1FawvTgcCXcgc3aWcxbYcWO4bQLZUBbLtSD3hDt92vHHDfJbMBvFiypYtlNrp0HangIfviAWYpAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742465516; c=relaxed/simple;
	bh=TRB5BlQU4Cp6zal6foWk6PzkRwn6zrit+sIUxqzqbsw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=LFO1StfpkrnWhBWLbdPFwLb9fEz1I3exFyJDaDofUf1Bb9eNNhEY7GWkf2AK0yGCLXHIRE0YAWal2nPkMr5U3uLcpe15cMmAuhoV0vZKF2IG3MTuZNoe8qjya+IfXiIw9viYrOL+Jmx/0xaP61X9gxxskrYRZjU1BFR4cqjBeB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=BcftOn3a; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742465511;
	bh=rlyafHr7D94ajSyM6b5t9bMDuqDoPoOjsklUoBRviXo=;
	h=Date:From:To:Cc:Subject:From;
	b=BcftOn3aCYpMCCo1TeAZtiCvB2x7YtS0MvHB0K8T+g5vQmt1ZoG6wRaHyYPBBXdJv
	 GkLl2n/X/B8afTwPbKVf5tmNGjLkQQowZGneg0RivVrIV5DQyr0uBMJ4GbmFs1hHKu
	 BsPgkZHcSg4TPHK91fuHB2cESZ5LHFGQ/XZ2j/EqpSlkzeS5W1gV4Ix6y5rq6UcYGf
	 YRcavZuRNdE+RYUjfJo4wDjXHTJ+2ruZOzsr8l8EbLhgfglC9btbQAi/39XARHGQ5L
	 lHbeK39mo3DwZINzfaA4KIwYulOqBRwwKgFISfU5xZMuGKJycwrLHsqQCXe1Cn3Cyq
	 0FxGUxaQZE0yA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZJLw744tjz4wcd;
	Thu, 20 Mar 2025 21:11:51 +1100 (AEDT)
Date: Thu, 20 Mar 2025 21:11:50 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <neil.armstrong@linaro.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the amlogic tree
Message-ID: <20250320211150.3d09eb46@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/heoi6zxF/ZHbBm0dPgthFTT";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/heoi6zxF/ZHbBm0dPgthFTT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  5ed591a0d5dd ("MAINTAINERS: Add an entry for Amlogic pinctrl driver")
  7c17ddbb050e ("pinctrl: Add driver support for Amlogic SoCs")
  793d454f91e7 ("pinctrl: pinconf-generic: Add API for pinmux propertity in=
 DTS file")
  f2ecac49778e ("dt-bindings: pinctrl: Add support for Amlogic A4 SoC")

are missing a Signed-off-by from their committers.

--=20
Cheers,
Stephen Rothwell

--Sig_/heoi6zxF/ZHbBm0dPgthFTT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfb6ecACgkQAVBC80lX
0GzhXAf/cVSd+tK7wq1IOwrWv4w3GD3LUHTpUVqtBerk03XsdvZxwmn+10s2Cpgl
xfSsxTXocWPpbGSvfWsbxYrkLy8OMKtuFFLBry36ZE94KW4wXo4l0GoIQUIl4vbA
PF3epuhPOKrfXc3stGx6OjAoW6vV5BTw5j+q/lyzQzKkvbNnmqU7TF7PZynPHSbc
AM0EbFyCFe72L6y4ATgAP5p1ccagH77E1+eD9SlnzKnLWGnb2VMBA28kM+SdeFHr
6r6YFaFb/+OUx3KdU2q4RRe5EGlQrH4EU1r6fI255IyH6nIh48b8trpPPZoYHHkN
/nRNtxrQFJl9sbvO+uOmoTG0a7Fo9A==
=6Ha4
-----END PGP SIGNATURE-----

--Sig_/heoi6zxF/ZHbBm0dPgthFTT--

