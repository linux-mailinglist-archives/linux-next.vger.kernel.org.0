Return-Path: <linux-next+bounces-5773-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 61863A5DD36
	for <lists+linux-next@lfdr.de>; Wed, 12 Mar 2025 13:58:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1DCA57A4DBD
	for <lists+linux-next@lfdr.de>; Wed, 12 Mar 2025 12:57:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0B92245021;
	Wed, 12 Mar 2025 12:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="nKzqfaiX"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC42923CEE7;
	Wed, 12 Mar 2025 12:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741784317; cv=none; b=qoFsubnRidMPJQs1oCjHK8CW0nA77ywiM4sWOIAAu89L7BcEzVdeoiTdoewvDxikw9/T9SWaQHWn5Ezh7SVmHCZKAKTcf1EWpPvDae4LzmtHaKVRNCft4cPqRve14jSymf1famz2Rt78yXYZJf4Jg4poIeicEXLEoCcT7PjszNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741784317; c=relaxed/simple;
	bh=V9lRTTnpFa20bmVZdb8qrVEw3EzhsekbTCLI6o694a4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tv8AV/AuLv8jAIE/mreznoNjAkpB+MTIhwYFphpuZx0fg2hGOQzQgvWiQ8ATOvLLnBh9TctA8JbtZMarZf7zLxX0AY14W2TSMP87GWHDR/BULiQy2zb+eTHV3zx3llP/MsqLYKeRlfqgZhmkpepuFYYLCjPLMAFees63vZ3N5LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=nKzqfaiX; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741784310;
	bh=pXSKGvbw/l6merKyY31ekiwlrdxexscEy/P41aikEaU=;
	h=Date:From:To:Cc:Subject:From;
	b=nKzqfaiXWuXvQ2cGsmTvUcv4CloXIfxthvfLu5mtnsUmg7jzXXHuYeeQZ9G1t1IME
	 U/VlCjm73MuX+TPO225Zv0Wp6ON4QnVaHfiw7AiVEQw3BCeFE7UTaEcqZSPL/8NQGV
	 2qBLnSDoH91WbV/AcUu2Go3gXdaYoS4AH/SOWlxuumSQKHWnP29R3ikZU/NSFAsOT+
	 vjkIt8bmY3Jv4Q2u2zjrPdCctRlLtzEZUQOcfrV9WTzUcGkphCtCdLZ60Ti2FCQpLh
	 Uqs0mKHiPFmxwc6KWWlfzdS4hO2a5NiqIAIGZ+VpAGdZqTRyNyD8WsxLOnXdxioLp9
	 wmuxMr7va+cgg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZCW060SGXz4x5k;
	Wed, 12 Mar 2025 23:58:29 +1100 (AEDT)
Date: Wed, 12 Mar 2025 23:58:29 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Mario Limonciello <mario.limonciello@amd.com>, "Rafael J. Wysocki"
 <rafael.j.wysocki@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the pm tree
Message-ID: <20250312235829.2ac0c991@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IW=GnFSo86CuPV8H07BM9zB";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/IW=GnFSo86CuPV8H07BM9zB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pm tree, today's linux-next build (powerpc allyesconfig)
failed like this:

drivers/pinctrl/pinctrl-amd.c:933:15: error: variable 'pinctrl_amd_s2idle_d=
ev_ops' has initializer but incomplete type
  933 | static struct acpi_s2idle_dev_ops pinctrl_amd_s2idle_dev_ops =3D {
      |               ^~~~~~~~~~~~~~~~~~~
drivers/pinctrl/pinctrl-amd.c:934:10: error: 'struct acpi_s2idle_dev_ops' h=
as no member named 'check'
  934 |         .check =3D amd_gpio_check_pending,
      |          ^~~~~
drivers/pinctrl/pinctrl-amd.c:934:18: error: excess elements in struct init=
ializer [-Werror]
  934 |         .check =3D amd_gpio_check_pending,
      |                  ^~~~~~~~~~~~~~~~~~~~~~
drivers/pinctrl/pinctrl-amd.c:934:18: note: (near initialization for 'pinct=
rl_amd_s2idle_dev_ops')
drivers/pinctrl/pinctrl-amd.c: In function 'amd_gpio_probe':
drivers/pinctrl/pinctrl-amd.c:1210:9: error: implicit declaration of functi=
on 'acpi_register_lps0_dev' [-Wimplicit-function-declaration]
 1210 |         acpi_register_lps0_dev(&pinctrl_amd_s2idle_dev_ops);
      |         ^~~~~~~~~~~~~~~~~~~~~~
drivers/pinctrl/pinctrl-amd.c: In function 'amd_gpio_remove':
drivers/pinctrl/pinctrl-amd.c:1229:9: error: implicit declaration of functi=
on 'acpi_unregister_lps0_dev' [-Wimplicit-function-declaration]
 1229 |         acpi_unregister_lps0_dev(&pinctrl_amd_s2idle_dev_ops);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~
drivers/pinctrl/pinctrl-amd.c: At top level:
drivers/pinctrl/pinctrl-amd.c:933:35: error: storage size of 'pinctrl_amd_s=
2idle_dev_ops' isn't known
  933 | static struct acpi_s2idle_dev_ops pinctrl_amd_s2idle_dev_ops =3D {
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

Caused by commit

  a62f03d037cc ("pinctrl: amd: Add an LPS0 check() callback")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/IW=GnFSo86CuPV8H07BM9zB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfRhPUACgkQAVBC80lX
0GwEgwf/bImDIOzd9Hr2HLK26fmouY5FFEpCtxj8QigCU7sm9idiqxxd/9sBua2P
UvIoI3l5U0bknc3pVjqK8JDQBJI3/+UQk2UcSf62FqR5E1B6J73eXnPw+cZufAZ/
M9tAqpIl83D7/ecfNOzKzXUrjlACpdEGBzUTdLtyBdq4m+3fW1CxWZGbidEx4le9
j8bpvxDPLwE6zMNMEzlCq10QiUi8Mppn25zzsAA59nK/H7WsD29KOHgAj649kxkP
mltnedRnFL0OrirhDsPAYRGQHP5+BLlz+1cbeO+csBCfS2Aj/a9x2+nptCF3Km52
179cjD/mGYEILoKdvQCQd97yJEphyA==
=NuRL
-----END PGP SIGNATURE-----

--Sig_/IW=GnFSo86CuPV8H07BM9zB--

