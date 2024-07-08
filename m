Return-Path: <linux-next+bounces-2836-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A404929E42
	for <lists+linux-next@lfdr.de>; Mon,  8 Jul 2024 10:25:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F6A61F2110D
	for <lists+linux-next@lfdr.de>; Mon,  8 Jul 2024 08:25:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ED1638FB0;
	Mon,  8 Jul 2024 08:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="rmrGx48z"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3C7374C2;
	Mon,  8 Jul 2024 08:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720427102; cv=none; b=a8OTlJxihSqcI48oMkZZQ8Bz5etITTUmw9A8nMeekdxVwIWZKJy6TyXF1Ot4c/kFkttORELMxpsa2bjM6WHmVit7Tg+cEf/PjrGqm+pwrPFRTgHQ4zFfeYPQk4SkMSiVG1D6lAO2MISQUlGGJuFMqOIWBc+y9bapoL7J28E+KiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720427102; c=relaxed/simple;
	bh=FEgR09j0aFL5VGsYoTIUpv4XdRZpH9PT1SeJwp95Pyw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=EcoKsASVHUB8OcEx7cqSl0vyi2FhmGaWutkD/M1Kp16lNEoR/bTPNcf1zT5qUOGoxve1j5IfDwMZ07cXf2srJL5/1tX8Ft5ppLrO4KY1ELUhDDaxUtIPcpENrhXf1HbgAIxifI+CRcowfwGjLJd1rsS+vANfKKFl5OQmIcNfEJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=rmrGx48z; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720427099;
	bh=6KT6OXx3homlAAV1uGEN9UcRPk8s7cb/dAD7b4chiGY=;
	h=Date:From:To:Cc:Subject:From;
	b=rmrGx48zEc9KU24XZ04V5DszJiydmQzAyy4jvwNzwiobnEeB7EUjCEZ+ePJuqz3nm
	 4ECEz6w97YYsnnoVrVDKiRvFUxu3MfZXNf9Q7y4uIdK1D5hEs64Yc3FXyByOSqWy+d
	 qyJ15wV49RzB/JTu0bSBmAlso0Ur1XdmSaFG8hMN2FxdLUVrBvJMEVEzrlZLLmLXam
	 oaqzCfBTUCIKxLxNCpFVGiVLmPwNnQvuntgzKotdhAbrNJ0KgTIESfzZJA0AkIhw3+
	 E/OyQhQ6kvK5Aj1zmdS3wIROG4TV7lLMMrLYo2Ggn8FRxvYIUOq4YVrhKwA7IOoTrt
	 vfGFLEdLz4nwQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WHccW0KJYz4xQM;
	Mon,  8 Jul 2024 18:24:59 +1000 (AEST)
Date: Mon, 8 Jul 2024 18:24:58 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kees Cook <kees@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the kspp tree
Message-ID: <20240708182458.06d4eefa@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XogTwZD7q+Y22o3WaA4dbAH";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/XogTwZD7q+Y22o3WaA4dbAH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  e3890eadadad ("string: kunit: add missing MODULE_DESCRIPTION() macros")

--=20
Cheers,
Stephen Rothwell

--Sig_/XogTwZD7q+Y22o3WaA4dbAH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaLoloACgkQAVBC80lX
0GyktQgAi9sjgm2x7Csdg+B+iDzrnWxVwPPHNHvgz8Yo6Zg+LDwoE2u6mvSr0jt4
rMvXPHPw65CxJK20KOUdTxBBCrHDzhB/z+q7+xAEHMSWdVdU/Aw67giokeVxTQjR
Y5dR2CnWXDTyzhlFCgP7cXm4OdWmD2yD8bVBRGpniBKCb4IdYxmUDm1C8QY16iVo
DyNqFGih8ogJijMm8CiDZfJ3idSunrv1sUNQI9BdcUubZTg49pRwEbdyxiUYZQwL
MFatxnHlTB3NepIKfIp0BQMvRm0JkWXJFOw7u/j74QOZr8BeC5D0pKRbhEhFg010
WVBtIM6kRxQ+RRLyatOKgAxxq/mpwA==
=C/gS
-----END PGP SIGNATURE-----

--Sig_/XogTwZD7q+Y22o3WaA4dbAH--

