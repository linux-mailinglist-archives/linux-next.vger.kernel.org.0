Return-Path: <linux-next+bounces-5514-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67498A3D0A6
	for <lists+linux-next@lfdr.de>; Thu, 20 Feb 2025 06:10:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D051189C6BA
	for <lists+linux-next@lfdr.de>; Thu, 20 Feb 2025 05:10:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0787C1D9A70;
	Thu, 20 Feb 2025 05:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="nDQbe6D6"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0615E19007D;
	Thu, 20 Feb 2025 05:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740028198; cv=none; b=nq4ASb8qyoofRx75m4DBYnMaE29dRhDvkWVd6q5CGQO00zR2TtFeQAZRdmxfJeLFjhZG9JGBXTSyrKP+iOyVdaF/JEv8uwYLVhbN6cxn1HrOQgdk2P7bdz5kOdYzCmbiI0/fnixO7SCB5nhIsTBTDLF+q8WSdUL3t4n/rf6rE1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740028198; c=relaxed/simple;
	bh=o1ia1AMgZAkT5aA0aSTgQPJ3uWVThEoB1DxFoDu4/LI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gLfHhxPjtXbbDJ4sZwsFc1JYLloZHU4cf1HO5BZ1pLon+sercq6u7KiU7q3iCnZfBZTAhRpfN7nfg5I3hUM2ekPNl2La/DX7FPwfK4sZHNtqP1nN/mfTumLZwD5zQVtr7YkmhSRkiFRqm3Wd5Z5nj8xQeIRBqttp3cuor8H0TWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=nDQbe6D6; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740028191;
	bh=zplQo8Bu1/MzwqrFEQH4kfY6n0Y9AVnpHoLKEImbB8Q=;
	h=Date:From:To:Cc:Subject:From;
	b=nDQbe6D6cw8206nUmE/M1gs6iGRRXpaoTms8rJbccbqjKI3/C+KGbdBxBbMrVlyXc
	 s4SU+WEBmkQK42BUgR9XX3Towtq+9TLJbcp2hNnAfibsn1R6Tcl7Mn5+PIZeKYMO00
	 /+HOYRDvghJL52tSfkgnnwrRr1kQBG1gVpsQTRThlB4eUxgk5xgWf0atFgNjnyjtEu
	 vnwGh/6dpol5r977zsb/t0Vu7rzthzyzGCLm90lUApL5LunWhs4bpyl7AzaonO1uLB
	 xsCBHiUpC+Hf3pQ3FuMSpTJ8f/Owd0sTp87tLrNJn50ioG92vLLsDzGVVuh2H/2UU7
	 0knFd52D/+RSA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Yz1Xb2XwMz4wy6;
	Thu, 20 Feb 2025 16:09:51 +1100 (AEDT)
Date: Thu, 20 Feb 2025 16:09:50 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the sound-asoc tree
Message-ID: <20250220160950.2cd64bdb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mv8Yk4mt5njhTJ=wO.OyNeF";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/mv8Yk4mt5njhTJ=wO.OyNeF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc tree, today's linux-next build (powerpc
allyesconfig) produced this warning:

WARNING: unmet direct dependencies detected for SND_SOC_SOF_AMD_COMMON
  Depends on [n]: SOUND [=3Dy] && SND [=3Dy] && SND_SOC [=3Dy] && SND_SOC_S=
OF_TOPLEVEL [=3Dy] && SND_SOC_SOF_AMD_TOPLEVEL [=3Dy] && AMD_NODE
  Selected by [y]:
  - SND_SOC_SOF_AMD_RENOIR [=3Dy] && SOUND [=3Dy] && SND [=3Dy] && SND_SOC =
[=3Dy] && SND_SOC_SOF_TOPLEVEL [=3Dy] && SND_SOC_SOF_AMD_TOPLEVEL [=3Dy] &&=
 SND_SOC_SOF_PCI [=3Dy]
  - SND_SOC_SOF_AMD_VANGOGH [=3Dy] && SOUND [=3Dy] && SND [=3Dy] && SND_SOC=
 [=3Dy] && SND_SOC_SOF_TOPLEVEL [=3Dy] && SND_SOC_SOF_AMD_TOPLEVEL [=3Dy] &=
& SND_SOC_SOF_PCI [=3Dy]
  - SND_SOC_SOF_AMD_REMBRANDT [=3Dy] && SOUND [=3Dy] && SND [=3Dy] && SND_S=
OC [=3Dy] && SND_SOC_SOF_TOPLEVEL [=3Dy] && SND_SOC_SOF_AMD_TOPLEVEL [=3Dy]=
 && SND_SOC_SOF_PCI [=3Dy]
  - SND_SOC_SOF_AMD_ACP63 [=3Dy] && SOUND [=3Dy] && SND [=3Dy] && SND_SOC [=
=3Dy] && SND_SOC_SOF_TOPLEVEL [=3Dy] && SND_SOC_SOF_AMD_TOPLEVEL [=3Dy] && =
SND_SOC_SOF_PCI [=3Dy]
  - SND_SOC_SOF_AMD_ACP70 [=3Dy] && SOUND [=3Dy] && SND [=3Dy] && SND_SOC [=
=3Dy] && SND_SOC_SOF_TOPLEVEL [=3Dy] && SND_SOC_SOF_AMD_TOPLEVEL [=3Dy] && =
SND_SOC_SOF_PCI [=3Dy]

Probably introduced by commit

  f120cf33d232 ("ASoC: SOF: amd: Use AMD_NODE")

--=20
Cheers,
Stephen Rothwell

--Sig_/mv8Yk4mt5njhTJ=wO.OyNeF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAme2uR4ACgkQAVBC80lX
0GzBZQf+IQMaXhNJKbI5B7SqdmKIhJ90vPw4ltVWoXbTL+SiouCmiR+9SG2i5GJV
RuooC4Ofs1LaSvPnA8E4Eq3oRB8El7FRC11pOn3tAsPIfxeDmyLY2lYKY1MaHL5E
am2ZiyasxOPGgZQc20Joei4dfsDXn2Q+8z7CDjBAZXDE5W+goJ21aUPlLwXWuIw7
L5K9CA8GBYZZGEpywLvv6UrK2TcCNSgtP50XO69t/caqIAp6OqWAEMg847K9pBB9
8RmjHvUushY4mBDk971/pN79iOvD2aF5t3WimIBxcua5Sp9LBTWTBn62T2/q8vV8
PVKzO1YrFzG35vxmUrv98QzhovYqzA==
=Ey+w
-----END PGP SIGNATURE-----

--Sig_/mv8Yk4mt5njhTJ=wO.OyNeF--

