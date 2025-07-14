Return-Path: <linux-next+bounces-7511-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDACB0378D
	for <lists+linux-next@lfdr.de>; Mon, 14 Jul 2025 09:09:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35A813A29CE
	for <lists+linux-next@lfdr.de>; Mon, 14 Jul 2025 07:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB6CE22F755;
	Mon, 14 Jul 2025 07:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="bseCXV9d"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A596922F74B;
	Mon, 14 Jul 2025 07:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752476937; cv=none; b=Qiu3z5QzCC+0jN7BpywGMeNohPMYhjIqCd/YG1AlEwXb0nKcAnBBPxQV8D3iQMwE5zLnXjx5M1YNrnx9VWHLc7SluWwa9L2ZKCXvFBvyxO+vB1CqXn3hA3IuhB89dCE114W7NLGOgMxiH020Es5yPOOPvaV3W7riJ8TDpNT3EMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752476937; c=relaxed/simple;
	bh=Dx+bWg0y/ulJ68RoEXf6wKfPP86WrNECzHUQd/8/HOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rPVuvwI/u4OI2qi0uW0+nOX8kjInc29/s//dgQayMOYRj+3C5t42HOAb9VAocOUqjz8TmMYW66Rb8AiFm9Zro2w7rbwJ0eKelONGsDtXjqWZG40Tym4RBMLyhZ/27ar//QoXCT04O4lV9rgJVcf+L7UC4IQwR6EudfzAY3lEoys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=bseCXV9d; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752476829;
	bh=rOOnT+vCR/jEoBk0F19TrnUSvpTrdf+d7rIbiva2K6c=;
	h=Date:From:To:Cc:Subject:From;
	b=bseCXV9d6TIsy13ZYCzemJO8muowbxYZE4sTppZ+VC7Wuzm2pIkNJx3+9ZcbTdXIy
	 kvrEln2VxGQo3G6uug/y3pscdeM+CIW2BXXprGcFE9Zj6/T+qKEmfskpZx9gKIjazR
	 vucwPHrfFLNGG2XDVpnJpJwyQKcRB5wsaaUB5A3yj8aDYhai3oBiyLdq9PUx+uZxIL
	 h7lfOMPEiBWBdivkC32jUemNqrLK8RHqLl1855HvDFsU5tY0GOmRjcdMjTh9225C78
	 7LNIrVGl/mQJWda+4Oi4vrTXJELj1oRqiahvia4WQsVFEZ6+Y4o4vkemy9pqd/BU3c
	 KodF3NBONt3kg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bgYKT1fn1z4wcd;
	Mon, 14 Jul 2025 17:07:09 +1000 (AEST)
Date: Mon, 14 Jul 2025 17:08:48 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the pinctrl tree
Message-ID: <20250714170848.0fb46353@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4G66NGgpa=WeYsaVpR9UDUq";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/4G66NGgpa=WeYsaVpR9UDUq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pinctrl tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/pinctrl/qcom/pinctrl-milos.c:1323:19: error: 'msm_pinctrl_remove' u=
ndeclared here (not in a function); did you mean 'msm_pinctrl_probe'?
 1323 |         .remove =3D msm_pinctrl_remove,
      |                   ^~~~~~~~~~~~~~~~~~
      |                   msm_pinctrl_probe

Caused by commit

  b614f176b308 ("pinctrl: qcom: Add Milos pinctrl driver")

I have used the pinctrl tree from next-20250711 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/4G66NGgpa=WeYsaVpR9UDUq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh0rQAACgkQAVBC80lX
0GxGowgApS8FuX4sl6BTeKs2NFg2xxZ1SwD3ZsIE5NCP+42/KGMaub50CfusSUJJ
gsJWE6hfPdpTUmjPu7aU+zBH8JuDfS6E4WIrmxNd9NvnwVoB/8C2CdMyZA3DrBtK
jSJcHVX6rQV/zNNAyTEiBl/x/R2w52cjEXyKC8nUamCw2UnFEyc2ibY5tVX+K6op
6Po4vYSpgJLfbW/lTokfsrMqvTz+3q8eEPgy54OKh00eHmPx03gZTh47rQ3N/O0V
9EkoKvOajDdKAyAfrsCLjEVPS4BiGeXixPa7hh3LsiPrN7favwxcbY+3AJgvCJAx
LHjQvV7hqmjs0r6icyXyou07qGnwrA==
=Rie9
-----END PGP SIGNATURE-----

--Sig_/4G66NGgpa=WeYsaVpR9UDUq--

