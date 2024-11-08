Return-Path: <linux-next+bounces-4704-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3801A9C174D
	for <lists+linux-next@lfdr.de>; Fri,  8 Nov 2024 08:51:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3B931F23376
	for <lists+linux-next@lfdr.de>; Fri,  8 Nov 2024 07:51:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 218011D0E20;
	Fri,  8 Nov 2024 07:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Gidv643O"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC0C1D89EF;
	Fri,  8 Nov 2024 07:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731052245; cv=none; b=S0XNAW41BE9gzoz4jPjxn5mNcPGgBkNUiIZQfGrframb/P/ztBPU6buvmLu6CTMxIiG4uREsbmcjlmCK6rchKATYp5w9PbCPXzx/PF0/c50fZxEHJACS35AOqzcBIC1D2lokuqNUbMT7JdXchBHTwstda9cGwBNCfqhqb0cwHqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731052245; c=relaxed/simple;
	bh=n5edx28hASoLed754TtbyekLHxQf7teMnccHrRubeyk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rabIkI94RCSXD4IOM+n5HsONjCW5MQr0hqTAZIDHYpG6avK5KTNXSHKO2bjep20OfOvrQKkAMqZg2WHw0GUEpLJkpX1RbN5ptLSZGIyv/60EIiAp1apDQ9W3s+Cbt98KmaMHgnsWg8lJnwxyxmf5VA153yRhqb6ea8rofcPrNE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Gidv643O; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1731052237;
	bh=0/r25AA/H6+H6jUlgI0pfryas969CBHleQFKUsA0MWM=;
	h=Date:From:To:Cc:Subject:From;
	b=Gidv643OsczyEm7kWahn9RNKXPgYoLyNfDmVQNuaCCZgf45A10qVZmp2pise8gD1p
	 Hqe75anZjpoPGCiZH21llvO4/eGwxy0vWRj68H6RtdbBf40AAwSFQfNSm+3XlB9qLS
	 MU7q7OcrefcU5RQw/OrzYnv+aFh1Jbz8jFwpvitArFKKjeofKqtiqIkG2SnjNizNy7
	 vT0EmzUMZEdO17JwVaIdmpQwGHt1mUc3YvGAqLbDQ+Y7rNRuS0BdDkUovTQZT9t/Up
	 2f6V3xqaX06Dw4Fsgsc6XG1j7kz7jD1ND/9Mwv87WBVZaeuWb3X0SCkZvsknQW7siZ
	 zdlowE+st/8OQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XlB2435vmz4wbr;
	Fri,  8 Nov 2024 18:50:36 +1100 (AEDT)
Date: Fri, 8 Nov 2024 18:50:37 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.dev>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the sound-asoc tree
Message-ID: <20241108185037.59cded26@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1Eyak/NWKPCKj3G=WwmGlPD";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/1Eyak/NWKPCKj3G=WwmGlPD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc tree, today's linux-next build (powerpc
allyesconfig) failed like this:

ld: sound/soc/intel/common/soc-acpi-intel-mtl-match.o:(.data.rel+0x6a0): un=
defined reference to `snd_soc_acpi_intel_sdca_is_device_rt712_vb'

Caused by commit

  5703ab86ff7b ("ASoC: Intel: soc-acpi: add is_device_rt712_vb() helper")

CONFIG_SND_SOC_ACPI_INTEL_MATCH is enabled even though CONFIG_ACPI is not.
Presumably as a result of the previous warning I reported.

I have applied the following patch for today (a revert of the above
commit did not easily work).

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 8 Nov 2024 18:18:39 +1100
Subject: [PATCH] remove COMPILE_TEST from SND_SOC_INTEL_SST_TOPLEVEL for now

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 sound/soc/intel/Kconfig     | 2 +-
 sound/soc/sof/intel/Kconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index 46b45f390ae9..0a368df2874e 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -2,7 +2,7 @@
 config SND_SOC_INTEL_SST_TOPLEVEL
 	bool "Intel ASoC SST drivers"
 	default y
-	depends on X86 || COMPILE_TEST
+	depends on X86
 	select SND_SOC_INTEL_MACH
 	help
 	  Intel ASoC SST Platform Drivers. If you have a Intel machine that
diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index 2c43558d96b9..3ef861187e6c 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config SND_SOC_SOF_INTEL_TOPLEVEL
 	bool "SOF support for Intel audio DSPs"
-	depends on X86 || COMPILE_TEST
+	depends on X86
 	help
 	  This adds support for Sound Open Firmware for Intel(R) platforms.
 	  Say Y if you have such a device.
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/1Eyak/NWKPCKj3G=WwmGlPD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmctws0ACgkQAVBC80lX
0Gx75gf+IjlWSIpkZSPS5s8wh8GCGLf5IJY677At7gKey7b66Ibve8hdM2ENIaal
wDfBFxnW+e6boH3GwRGJCpMRppBkz8O8aHUj0HsKQzXmruR59frSOXmXhJL9feJF
KvY+ObpfHS3huf0f0s1Tz/+PJvcryevYWWsZDueRl+9Dbbu8wG4CrF0/X/uvjH3v
tqOyoifanDxDnok8+wp59XxLWZp8aJe3fA3BmpKpMPrQjsxmJ6DcrBBP8gKgFjEw
UZ0tZdxpV2RYR6Xjh/CHyLv1uwnsqlkusMZy771u2kv77AXgizT4hBhxbm3Kjqps
UjY3rFpKZzVe0TGFMOiGnwJeyJZZPw==
=IC5O
-----END PGP SIGNATURE-----

--Sig_/1Eyak/NWKPCKj3G=WwmGlPD--

