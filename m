Return-Path: <linux-next+bounces-6895-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 48317AC01C9
	for <lists+linux-next@lfdr.de>; Thu, 22 May 2025 03:38:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E96A1BA01A5
	for <lists+linux-next@lfdr.de>; Thu, 22 May 2025 01:38:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF7912CCA5;
	Thu, 22 May 2025 01:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="hlspnOyC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C0A64D;
	Thu, 22 May 2025 01:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747877902; cv=none; b=ou33T/IFRGDpNTXW7OYBJh23eksdUjBlOPt5L0kPT6vALmGkpccNn7hyBmqGuiV83dtjlP1FCsBbUxq75n139cyFMoSxvBhzf52RudKHX1vh5AdJkWzyZPbtsPI3AlMBb22KY+c6t4DTtEe+WoJYIR67Pbnx67T5CUvYpvWq5IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747877902; c=relaxed/simple;
	bh=BEcRxXbLnAwl3PtiI4DCx5Iy2cLgenzbEJb8ZfQPbBk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MuEcMuMMTMaSy0evVAssfSbrFPjLtB5AYN8gcJk+80rcuShSCbd9Fn8h3iReDvaKW/O6ldOnHpdef4JJ0MPnzuYLGweFKXTTYk0Pbb6ekqGV1w7MTPC0Tuv/BycEyPYtP80YSMYIcPOE1bqlTICsZl/ZLDLbn6ZLkpidwLgbNOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=hlspnOyC; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747877898;
	bh=wCwvSW5OEksD89Qr7XzRychnTaoVvwYQQkOOKkNRy6w=;
	h=Date:From:To:Cc:Subject:From;
	b=hlspnOyCwtVTDzyR7g0vVyjNHjgjARrP5flzvR2AmsENWTeqNsUhWxQsQwA6ySdLM
	 de1GFQqHSHEBswai454lFDGD7HSNPpT2YbA1ks9m3j37VehQ/HSeZviBB1XXVnn/F3
	 9gvKt2Bfzb5YyQ2EOfEiS88kZ96NezX7ahLEHaKC+463Euu1qaAEq1eqbTBBZBbXKP
	 /CrqikIvZrMzWKorkMiYL3TmlMUlaAL6kds52tE1T+gvMc0cPe6m7v+xzPJ8C7GVoa
	 txyLPOeh1dHoN3gMgoYd8ojqh87b8KaoOE4CWxxfygJFKBciX8CVRQjD/DCQJuul10
	 /mH57Xd2LWWZQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b2rXT2s94z4x8X;
	Thu, 22 May 2025 11:38:17 +1000 (AEST)
Date: Thu, 22 May 2025 11:38:16 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alexandre Torgue <alexandre.torgue@st.com>, Arnd Bergmann
 <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the stm32 tree
Message-ID: <20250522113816.16953357@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qoujmc87Y0T_mUnsyo03b0r";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/qoujmc87Y0T_mUnsyo03b0r
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the arm-soc tree as different commits
(but the same patches):

  0a0e8571837d ("ARM: dts: stm32: add vrefint calibration on stm32mp13")
  2a47c4033e09 ("ARM: dts: stm32: add an extra pin map for USART1 on stm32h=
743"
  3acfa4becfda ("arm64: dts: st: Add SPI NOR flash support on stm32mp257f-e=
v1 board")
  3bd31eb4f6ee ("ARM: dts: stm32: add vrefint support to adc on stm32mp13")
  3f70ddb86143 ("ARM: dts: stm32: add initial support for stm32mp157-ultra-=
fly-sbc board")
  46e2ad9fd187 ("ARM: dts: stm32: add low power timer on STM32F746")
  532c5a818d2e ("arm64: defconfig: enable STM32 LP timer clockevent driver")
  7b6bbef62485 ("ARM: dts: stm32: support STM32h747i-disco board")
  7b7b6bb0f98d ("dt-bindings: clock: stm32h7: rename USART{7,8}_CK to UART{=
7,8}_CK")
  826e6fb26193 ("dt-bindings: vendor-prefixes: Add Ultratronik")
  878dec8597d4 ("arm64: dts: st: Add OMM node on stm32mp251")
  8b773be67b10 ("MAINTAINERS: Add entry for ULTRATRONIK BOARD SUPPORT")
  8c18889c702d ("arm64: dts: st: use lptimer3 as tick broadcast source on s=
tm32mp257f-ev1")
  a4d2108a4b3f ("ARM: stm32: add a new SoC - STM32H747")
  a09cdc01ad4a ("ARM: dts: stm32: add pin map for UART8 controller on stm32=
h743")
  bf98eb91ac66 ("ARM: dts: stm32h7-pinctrl: add _a suffix to u[s]art_pins p=
handles")
  caeec8e2b846 ("dt-bindings: arm: stm32: add compatible for stm32h747i-dis=
co board")
  dd9bfe13b47e ("ARM: dts: st: stm32: Align wifi node name with bindings")
  df863325b92c ("arm64: dts: st: add low-power timer nodes on stm32mp251")
  f069852c9b33 ("dt-bindings: arm: stm32: Document Ultratronik's Fly board =
DT binding")
  f80958d949c3 ("arm64: dts: st: Add ospi port1 pinctrl entries in stm32mp2=
5-pinctrl.dtsi")
  fe8690b58efb ("ARM: dts: stm32: add uart8 node for stm32h743 MCU")

--=20
Cheers,
Stephen Rothwell

--Sig_/qoujmc87Y0T_mUnsyo03b0r
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgugAgACgkQAVBC80lX
0GyUqQf/W5uVleIo3eT3hTnHyNVzKnk2fEGgFQbvlV6gDcKb5hzhSh8ikWLX9lvK
QHAYzer2OtndCp4WAWQ8SJ/PcRNwmK5x8xwhloO7erf/o+EWpav5VfRkKFb3fJ5t
08Iux3FTmIb+mz07M4gAHH33pR/ogLJNV4zEoIn28FbKkGXngGF1Q+PZWXIQ1eNU
cBIGtttSRXD4AiUJmtPPHt9DYZBnYyLXj1uTUAOeyrrFJsAQDd4CL6FT0tKdyIAF
qp2DQKHnGjkF7TiJf06TAaGhBxvkbXsSycV6pyp1wTvoJZch9ijOimrSj8Mzt2tp
3q2qsWrIHz1Nn/gss7PF6xAqcsd2rw==
=trE7
-----END PGP SIGNATURE-----

--Sig_/qoujmc87Y0T_mUnsyo03b0r--

