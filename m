Return-Path: <linux-next+bounces-4477-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 110AF9B2AC6
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 09:53:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1A241F221F0
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 08:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 106CC1922E9;
	Mon, 28 Oct 2024 08:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="HQHIYhHy"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2426A18C93D;
	Mon, 28 Oct 2024 08:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730105588; cv=none; b=ERP5FL9gMJAIfXWXvydQ4L42qpUTbik63cnpBAaBG6LF6WywI+e870CtUWYzYq8g3RCKEWaEGlEokaeen30htJiOWLqA0T1sztV85j8B+ZVG3V9glYtsYDvzBi2YGGfb8eC1LuRQXJBLWKH4PnlxiMAmgLr+X6CD0vBrTH9MmHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730105588; c=relaxed/simple;
	bh=RtYn8cdiczrDP8ngYI2J92PSLvPSPzcx2pfCGWGtNDo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UyCKWDzA+F+9/3whcxp9IcNe8bXT4texuuRisX3PMFCrWU7lWe3YYMh0W74XGVtDiNyTfXbHURjKcSyKN+mT2M15PU/5VQzD/v3RywTLMoaAVGQb1WgqYUiAd8jGRFCL0QB6EFwSjBlQYV1io1+1YzMmoVEH8a4enfwK58Jdqek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=HQHIYhHy; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730105581;
	bh=lqtSQx2953aHPBP5In47zscgVywYl/Hptd5PYzeE4eo=;
	h=Date:From:To:Cc:Subject:From;
	b=HQHIYhHy5PvjL1lVPuBztrvE2dpeX61rQu4/eVsj3/c9vBTvhctEckG/pgven5y4F
	 0O5IX4djgYY9bMX4QKZEcCjEJBqKU0ySQkGninbVxGafFNn5/j8y+yrEKgkAA3X8wf
	 Kd9QY04gk6+Fu9BSDHGse/2ooIkH6UJIfhOewPYtSt6GDNaq5R5ji4rlYB2P+vzZIs
	 iUNOK7huZPM5CMNv22O/b+gsk2pkcOm5EZl24qihz96Tzf2hut1TnORN5UlJikQGMo
	 PefV/FtI5oE4i6WP4wHEwEmTQdKZpM297h5nMjVW1Who4NIpEhZXL5fa/Cj2n6h8HE
	 IcA1uLw2Ablfw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XcRx93Fs9z4x6k;
	Mon, 28 Oct 2024 19:53:01 +1100 (AEDT)
Date: Mon, 28 Oct 2024 19:53:02 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Maksym Holovach
 <nergzd@nergzd723.xyz>, Markuss Broks <markuss.broks@gmail.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the samsung-krzk tree
Message-ID: <20241028195302.748c7a5a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kA_dbDnLoHkpPT4uXUAEF/w";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/kA_dbDnLoHkpPT4uXUAEF/w
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the samsung-krzk tree, today's linux-next build (arm64
defconfig) failed like this:

Error: arch/arm64/boot/dts/exynos/exynos9810-starlte.dts:72.9-10 syntax err=
or
FATAL ERROR: Unable to parse input tree

Caused by commit

  229cf465b9f6 ("arm64: dts: exynos: Add initial support for Samsung Galaxy=
 S9 (SM-G960F)")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/kA_dbDnLoHkpPT4uXUAEF/w
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcfUO4ACgkQAVBC80lX
0GyPpgf4iNCMu1lxi1tiFDtJmXm1lmm9C74mTfMijhKTodLl4O1GM2/mNoaTxviO
BVTx7gPQI2eIuPMZdiOANEHpizxhNFtn/T/wxQaIRzxUx05BXfin7Zz4jR1ov3CC
BA3vk6f58ViQbN07L/JWfqKA+G+0kgiLD+/JsR/o6LfGe+R3ktcCKUvTmQdZfNPg
VHNuFPAeExiWKB++tys2j4g/e0RpyfYe14kYkVOFo13wRvLi5eDSAdn9nbdXoL4O
VlXYWCa7Bak+fHUcGR25HZhPbW6lq+RPMP2w6mqvBIxLidBSWHeAKPykHBWalNS2
zcCZ+EJsXBbAzwW3BcfTpHSCx56j
=er4p
-----END PGP SIGNATURE-----

--Sig_/kA_dbDnLoHkpPT4uXUAEF/w--

