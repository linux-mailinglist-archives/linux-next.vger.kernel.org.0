Return-Path: <linux-next+bounces-5046-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7FEA01EFF
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 06:46:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58A7D1625E6
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 05:46:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC34A19924F;
	Mon,  6 Jan 2025 05:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="lyal909r"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED5A1D0F62;
	Mon,  6 Jan 2025 05:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736142396; cv=none; b=Y25p18AgX6jLMooIfbubX0cAm4wIN0zCQdvsT7hFM5sX2XNbuoGV7FbVJ6iCj0g+Lngdysa6/hCaabaA+lstDk4yporodvJUbvsMSvRvySyGOzOA/Eud755QMJzzhbBf/3o7GgJSG7vbsvRdiBZtSvWnzNbia0bHdbyQKCjot5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736142396; c=relaxed/simple;
	bh=leD9MENYNTMk76rajE2E8MulQP3FwIHytDMURir9RPs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=NkejVmJAWeUwjdndxREckO7npPGGcyI20hO2DfCFmlHVLcmS9drv9eFLgL+Bc/qxY03wtTiJ6z2buxzZNI4SfO9ajUIo05AmTiixKHucaCIq5KFuf+qAthMMZlY4DZZaEqLR8b/UgN+CeBD17r1D50EJUIprGRnun/5r0YvAnjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=lyal909r; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736142384;
	bh=3xgQZPj+VEizHtdG+0oJG5lBO99j9G6sgT3pL1Ou0fU=;
	h=Date:From:To:Cc:Subject:From;
	b=lyal909rlXXSzRtWq8q1iz00m268fbFlxO8lyL4VNfaSex3NmSMORLcJYgK7Ste68
	 QBRe2+GZoXUejstg+6O53anGLF0VezZIZFJBV9pJmZIlzJdaTk10b9/M2P+0+n+o3N
	 p7U0z0UkZoAI3ZHsbGZ/tyDkqIS8Obn9lGX0zCzI5SeEcGy7RrTWcVf9OSydZzc7gJ
	 7vADj62l+oCr95I5tE6Iknpb4cQv6EACUcOS3/wYdHl5tY16BDa6yKh842OL50jTbJ
	 Qk9nVmhJd06wPAjwvv1M4ULx11LIBIbjmWhXd2Z+pWPM7pmYhjsZE+O88hm3FGhQdT
	 hipHuZ74cnA4g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YRNTX1bWRz4wyV;
	Mon,  6 Jan 2025 16:46:24 +1100 (AEDT)
Date: Mon, 6 Jan 2025 16:46:30 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Daniel Golle <daniel@makrotopia.org>, Frank Wunderlich
 <frank-w@public-files.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the pinctrl tree
Message-ID: <20250106164630.4447cd0d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/b8ypKZdt6Ohp4ya=tg4e=NG";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/b8ypKZdt6Ohp4ya=tg4e=NG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pinctrl tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c: In function 'mtk_pinconf_=
bias_set_pd':
drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c:606:13: error: unused vari=
able 'err' [-Werror=3Dunused-variable]
  606 |         int err, pd;
      |             ^~~
drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c: At top level:
drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c:602:12: error: 'mtk_pincon=
f_bias_set_pd' defined but not used [-Werror=3Dunused-function]
  602 | static int mtk_pinconf_bias_set_pd(struct mtk_pinctrl *hw,
      |            ^~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

Caused by commit

  1673d720b7e2 ("pinctrl: mediatek: add support for MTK_PULL_PD_TYPE")

I have used the pinctrl tree from next-20241220 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/b8ypKZdt6Ohp4ya=tg4e=NG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd7bjYACgkQAVBC80lX
0Gx7Qgf+KV0woTIURPXqafOT9GOblHtNa+Lm2x/+zZoSTdHWswe7WhPqWe2R5W1z
BPsRL6SqpM/z/e4ZumC6PIU/PD1+O6PMyiBD1pFzU4K3r07gIsdxQiHnAaJ5J5Si
PUu3f6Z6YdeEflfebUWs6mCe0zuijzERcR4CGikSLSjyn8MqGEvuWfgtLwV+yV09
17SM63vSVIUzUCEX0ConEOs0FMIaZiVYN14LuZCJ3p1sfqzO7+VW/5iO+ufcZeVE
JCqtKNqFNnyN2GJWM+ZIkSajfbDE2cG8T6tA2+aGDxQ2Zh88giqn5Pxg3xo+gjv0
1sgXDD8yukPyWXa3r+6Iaek36sDCwQ==
=M/ot
-----END PGP SIGNATURE-----

--Sig_/b8ypKZdt6Ohp4ya=tg4e=NG--

