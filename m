Return-Path: <linux-next+bounces-7646-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5BBB0BB3E
	for <lists+linux-next@lfdr.de>; Mon, 21 Jul 2025 05:13:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1250E18970DD
	for <lists+linux-next@lfdr.de>; Mon, 21 Jul 2025 03:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ACFF1DF98F;
	Mon, 21 Jul 2025 03:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="OvINISGf"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD7A1A3160;
	Mon, 21 Jul 2025 03:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753067635; cv=none; b=s8FFRPqixjsgIo+iV2SUc8NqrZj+OAsBD46fQp3gjzYXbS7Ru9+rHPSa6/1TW+u35gLugqySWx9O9ZAb3zmvyng7NoA5JwLCU8qxMv5NXbvcnoY2xKacWQvOCA04bbjzM7hMUbsiO9Yg9oAy7X9GSlFpHw/lIKMEbout6qNKxBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753067635; c=relaxed/simple;
	bh=7PPVeVv3ncSmgWy5kT7Os6h3MKo+Zf//pmTUrjsEg/M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=a0c8iUndnvfCSpXsQkzvW56WggU/QUTep5lMommixfqv1MiR/2CHLBi07hAoiiOTfZ09FbwOMblnL9ho3q3dfEBt+jY3uqODzvVZIrI9cA2bsUBG3OY5ruBAw3b0WP6+sLEKc8EhSchtx7A/92DAQDVBUXTcfFgIzoKeYH2XaCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=OvINISGf; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753067479;
	bh=eIUAoe9cs1XgnuZmFk+NEW+rcfnvTGVPXZ99OmoldTU=;
	h=Date:From:To:Cc:Subject:From;
	b=OvINISGflgC3V/8b4x/SgffHfS7kpxrEjT81wsIOH078Fgqi4SgplKfMmR1BkOJvE
	 ZLSmnPrOoPO7+/7rXwhDSSzvqGMEMqyizIQ9T37DkIiZNtiQ297asa92jd+u6Cr6hZ
	 dNbLrt35HmYdw2NPyzF2m6Q4FILFyWeFfiyZbHqlZXRE/eOiP/uWA2k4Xdc6ejigxL
	 iGvxZNQ7xbd0ffhqUllMRu+NA7VSOfBZmKmhrUn5ps+b+uii7bl+qp2Kx4RuAtvlGy
	 CC00+1EGkLMySaVL/67CIXqlNBHNDsdCWmxsA3/VQFq8s6Mz3Jp6okJu4LG9yaFtBy
	 wR5fe52LSlicw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bllm714Phz4wcd;
	Mon, 21 Jul 2025 13:11:19 +1000 (AEST)
Date: Mon, 21 Jul 2025 13:13:48 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mailbox tree
Message-ID: <20250721131348.38ba6ec8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0.hjtAA3+MuH1qKXXC=WgQy";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/0.hjtAA3+MuH1qKXXC=WgQy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mailbox tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/mailbox/mtk-tinysys-mailbox.c: In function 'mtk_tinysys_mhu_mbox_st=
artup':
drivers/mailbox/mtk-tinysys-mailbox.c:95:9: error: implicit declaration of =
function 'irq_clear_status_flags' [-Wimplicit-function-declaration]
   95 |         irq_clear_status_flags(priv->irq, IRQ_NOAUTOEN);
      |         ^~~~~~~~~~~~~~~~~~~~~~
drivers/mailbox/mtk-tinysys-mailbox.c:95:43: error: 'IRQ_NOAUTOEN' undeclar=
ed (first use in this function); did you mean 'IRQF_NO_AUTOEN'?
   95 |         irq_clear_status_flags(priv->irq, IRQ_NOAUTOEN);
      |                                           ^~~~~~~~~~~~
      |                                           IRQF_NO_AUTOEN
drivers/mailbox/mtk-tinysys-mailbox.c:95:43: note: each undeclared identifi=
er is reported only once for each function it appears in

Caused by commit

  43a9f5ab3d17 ("mailbox: Add MediaTek TinySYS MHU-like Mailbox")

Forgot to include linux/irq.h ...

I have used the mailbox tree from next-20250718 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/0.hjtAA3+MuH1qKXXC=WgQy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh9sGwACgkQAVBC80lX
0GwGWQf+P96K6Mg/kT5h7HAOJzsacxyiCdudtzwCnREUL+U/B3+X6xTpa4R9r/S5
uBErNKdWsABBtgjX2DcnBoY+CMfJ7TUwHkMfXmbwFU2MrjC55Wu4qnlmeaneTBtO
1kWTmL1TJtk15I7Yt+wSUpZpR+Ga9DGRzmnkeh7yn4hwNNQqQISknF/3NveAeGbn
zYkspyeZloMQv3KUp8zXYjFuzqC+s+o3kaeQJAwduLNwcCEpkEDWTEidMi7kSa8I
P4JNC/mt9SwNymLztLj6/RS9X16OuTP87wpB4d3WV6EhkzGOB+WXeX2usCZAx4xy
eOVhQEdXN/OXWr5/rtbde1ehRSeFpw==
=MmUu
-----END PGP SIGNATURE-----

--Sig_/0.hjtAA3+MuH1qKXXC=WgQy--

