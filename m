Return-Path: <linux-next+bounces-3634-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EE496E78A
	for <lists+linux-next@lfdr.de>; Fri,  6 Sep 2024 04:08:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2338828397B
	for <lists+linux-next@lfdr.de>; Fri,  6 Sep 2024 02:08:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 300271BDCF;
	Fri,  6 Sep 2024 02:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="PN35VIuZ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16EE1B59A;
	Fri,  6 Sep 2024 02:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725588506; cv=none; b=sS8voymsngW1W9BxPHr1Hk+bDRIyLPTImiPVPzttC4+C+OZggpm8KHuYLKcII5hVpL5YuNWAxclESvHDKdAGt3+odEqq2qS1iIWUsfwSOR7IiAkf0oOAZEqHH4TsvI2NVI1fIvMf/rvdoSdjyp+swhP1V6osgbk7ToQ+bpmBYfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725588506; c=relaxed/simple;
	bh=xwu+Ko87uW3Nel/t+x+us/FjNcL68/8AaWlzObr5OOI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=PzfuK22e7Lju3pOFH4qeaOAFwAgU3xEkOmheWD9ON9A7Yaml4rxBiiaXiye5h9XhTdpmIf84RN0QA0htDicOssE1DhIWtMXR9hPmjC1FjNe8A58edKy+F6mMEEkeJ4N1txpwFPsN5gCAchU/VNmnEb9wCrVoEAV2hDG9znbg994=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=PN35VIuZ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725588501;
	bh=S3wtYb7aiLCJt3DDSZ8aFXIgqe481olk0EsLirbwCS0=;
	h=Date:From:To:Cc:Subject:From;
	b=PN35VIuZrTbwSpjc8dJMA0W+5SqJh3BTrtL1B289xY9nag/9cqjhOHihSGMZkgP8W
	 HOVHIfNZCfyncGrAjJ6rm6BWRNN5hU410yRjlv0k3dYDZqOJPqFTJ9FDlLdXPMlaRF
	 ZIM2q0Mz0f9uVdquv0M7gfzmUPB7lRxrD6LWnbQXx3jsxAdI5BTCFSCKY60kb2QQKP
	 cp26C7WvD7MYrXzJTU7sAVYmL7w52R4z7qA3gE8PQgNI7hLLpyDEEPlvlvCQPikKFX
	 gmDja/ExO3TYsUTExxKf90UrWyBmB3TWHJDYzjj1M+p4I9hBilW1D15BvgwQyVblNt
	 hxovGG2leOfUg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X0KQF60wTz4x21;
	Fri,  6 Sep 2024 12:08:21 +1000 (AEST)
Date: Fri, 6 Sep 2024 12:08:21 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alexandre Torgue <alexandre.torgue@st.com>, Olof Johansson
 <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the stm32 tree
Message-ID: <20240906120821.6ca2ac3d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/A=h3yswC_qvU9ssT+JHkCg0";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/A=h3yswC_qvU9ssT+JHkCg0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the arm-soc tree as different commits
(but the same patches):

  078dc4752822 ("ARM: dts: stm32: stm32mp151a-prtt1l: Fix QSPI configuratio=
n")
  76e16f3549e8 ("ARM: dts: stm32: Keep MDIO bus in AF across suspend DH STM=
32MP13xx DHCOR DHSBC board")
  835dfbca3781 ("ARM: dts: stm32: Add ethernet MAC nvmem cells to DH STM32M=
P13xx DHCOR DHSBC board")
  8388a6e67f22 ("dt-bindings: arm: stm32: Add compatible strings for Proton=
ic boards")
  a15ad86d4b65 ("ARM: dts: stm32: Add MECIO1 and MECT1S board variants")
  b14c9f6bd0ba ("ARM: dts: stm32: Use SAI to generate bit and frame clock o=
n STM32MP15xx DHCOM PDK2")
  b512ce39b570 ("ARM: dts: stm32: Sort properties in audio endpoints on STM=
32MP15xx DHCOM PDK2")
  c00176c49e94 ("ARM: dts: stm32: Describe PHY LEDs in DH STM32MP13xx DHCOR=
 DHSBC board DT")
  ce923f5d2804 ("ARM: dts: stm32: Switch bitclock/frame-master to flag on S=
TM32MP15xx DHCOM PDK2")
  d3557e468f68 ("ARM: dts: stm32: Disable PHY clock output on DH STM32MP13x=
x DHCOR DHSBC board")
  efab072ce426 ("ARM: dts: stm32: Add missing gpio options for sdmmc2_d47_p=
ins_d")

--=20
Cheers,
Stephen Rothwell

--Sig_/A=h3yswC_qvU9ssT+JHkCg0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbaZBUACgkQAVBC80lX
0GyHNQf8DyQE32G6zUCFnmV9Hebi4PE8TMbAPd3FeZ5+jp+l/jeUl9CREsq9klPX
RgtxWh/s+DoqOT1y2kRIR6vFk7PyPn3HY7bsYcXFhKJAIxA4YNhamV/bb0x8I0KB
/UMDrOE0w+LlXVnBu4t3Mw15uh6PJe8URcoSdDrdqALqgE2ahxVVDI+yiXIE8Am+
47VMNHi4bWDPIfDpYFB/8N7I6ofksMINAi7m+PFxjNu/eFf48wN1U2ZgCL8gmAWC
bONww70Dc/9/nVLveyJ43LU2Zj+pUzzmh7HmxQEld/xmSNnxwuyDG1DoZSuLmwOn
xiFLACFTAWtNIbDUeXO65BbvszmjCw==
=lwLp
-----END PGP SIGNATURE-----

--Sig_/A=h3yswC_qvU9ssT+JHkCg0--

