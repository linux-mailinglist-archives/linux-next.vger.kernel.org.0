Return-Path: <linux-next+bounces-3417-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DD095EB48
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2024 10:04:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48D4D1C21D82
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2024 08:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C8511494CF;
	Mon, 26 Aug 2024 07:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="LifRwjG1"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA04D149C4D;
	Mon, 26 Aug 2024 07:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724659178; cv=none; b=ZWsX+C9N9zg5EtuIgqlg5XIG+ZaZXlKAWZ5k1Z7GiKZgnKsqr7poHnz7Hs+cd/ljMBMOcSzkNIe6AwJEDI8MAnVW1mfibvLD22quBxkDzQV0tdUCrR2cT+Y/dI+QeRJuGQNIayPNACSWzEnlVfUQKob3N2Ru+XHOoj3h00ERWdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724659178; c=relaxed/simple;
	bh=bKLx07E3At82l8mxbSMBOfdYPZjc3j4ZfRSnnqQX+Wc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=sRE3ecMjdkhcalMa4Z/PMx8MAmHt0o4xSg/0TLKBRU5GZJYGS40EjilRC5RG+cAlbd6g0bUXGCEDzU3IRReDFY7x1HwTgoCwTwTUnFEpuWBhETWog7ZZ2Kuazz7Ea5luX4xW5tg8Iz4eq0+XH7HEdFQQ2ieEbDcmYcqNs13Gv64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=LifRwjG1; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724659172;
	bh=f4Vb3ruv/FflFaQ84MQ50HLvQj/1umtpah/iZx3jxOE=;
	h=Date:From:To:Cc:Subject:From;
	b=LifRwjG1o9JYqN0B/Wo1BRa6j3D8mx2AyBjn0U/As7cKhYKOdGzxqYLHeQZ+xx2ax
	 NeIQYhx6VxLZVwNDfeoXXXfy4x5AZGBCBuNWQNoNCD3rDz4AiMnGV/4Cl/WT+qBYWk
	 r7h///bB+RGm78V2lU+zQHlWHaSSWUCqQ4kdE3lVfvd8BMJWEnA6WJ/t/7XThAJIgN
	 bewJ+NEDctBLhJVaLdInrCAZofhkTeBqGAylqWDov2BRfPhQqn28XzIONoQDEa5A45
	 vHsiV62t/ZR5j9Gyq+WyKcE1f8znhFcu2Iuior5m0bW/rrd0lm6KgvxXS1q6So4h+C
	 aE3TpgDjJOt9A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WsjkW4dM2z4x1V;
	Mon, 26 Aug 2024 17:59:31 +1000 (AEST)
Date: Mon, 26 Aug 2024 17:59:31 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Pankaj Raghav <p.raghav@samsung.com>,
	Dave Chinner <dchinner@redhat.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	"Matthew  Wilcox (Oracle) <willy"@infradead.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: boot warning after merge of the vfs-brauner tree
Message-ID: <20240826175931.1989f99e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/eFOibwsiHTxbRCFF.J1bhf2";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/eFOibwsiHTxbRCFF.J1bhf2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs-brauner tree, today's linux-next boot test (powerpc
pseries_le_defconfig) produced this warning:

------------[ cut here ]------------
WARNING: CPU: 0 PID: 1 at arch/powerpc/mm/pageattr.c:97 change_memory_attr+=
0xbc/0x150
Modules linked in:
CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.11.0-rc5-06731-g66e0882f=
ba22 #1
Hardware name: IBM pSeries (emulated by qemu) POWER8 (architected) 0x4d0200=
 0xf000004 of:SLOF,HEAD pSeries
NIP:  c00000000008a1ac LR: c00000000008a14c CTR: 0000000000000000
REGS: c0000000049b7930 TRAP: 0700   Not tainted  (6.11.0-rc5-06731-g66e0882=
fba22)
MSR:  8000000002029033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 84000482  XER: 00000=
000
CFAR: c00000000008a218 IRQMASK: 0=20
GPR00: c00000000008a14c c0000000049b7bd0 c00000000167b100 0000000000000000=
=20
GPR04: 0000000000000001 0000000000000000 0000000000000200 c000000002b10878=
=20
GPR08: 000000007da60000 c007ffffffffffff ffffffffffffffff 0000000084000482=
=20
GPR12: 0000000000000180 c000000002b90000 c00000000001110c 0000000000000000=
=20
GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000=
=20
GPR20: 0000000000000000 0000000000000000 0000000000000000 c000000001562288=
=20
GPR24: c000000002003e6c c000000001632418 000000000000018c c0000000020c1058=
=20
GPR28: 0000000000000000 0000000000000000 c000000006330000 0000000000000001=
=20
NIP [c00000000008a1ac] change_memory_attr+0xbc/0x150
LR [c00000000008a14c] change_memory_attr+0x5c/0x150
Call Trace:
[c0000000049b7bd0] [000000000000018c] 0x18c (unreliable)
[c0000000049b7c10] [c00000000206bf70] iomap_dio_init+0x64/0x88
[c0000000049b7c30] [c000000000010d98] do_one_initcall+0x80/0x2f8
[c0000000049b7d00] [c000000002005c9c] kernel_init_freeable+0x32c/0x520
[c0000000049b7de0] [c000000000011138] kernel_init+0x34/0x26c
[c0000000049b7e50] [c00000000000debc] ret_from_kernel_user_thread+0x14/0x1c
--- interrupt: 0 at 0x0
Code: 60000000 e8010050 eba10028 7c6307b4 ebc10030 38210040 ebe1fff8 7c0803=
a6 4e800020 7bc92720 2c29000c 41820058 <0fe00000> 4800002c 60000000 6000000=
0=20
---[ end trace 0000000000000000 ]---

Bisected to commit

  d940b3b7b76b ("iomap: fix iomap_dio_zero() for fs bs > system page size")

I have reverted commit

  9b0ebbc72358 ("Merge patch series "enable bs > ps in XFS"")

for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/eFOibwsiHTxbRCFF.J1bhf2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbMNeMACgkQAVBC80lX
0GxEdQf/R1yIPtc12LuyoonK0zKvGPJRxslB88jntuhop9Pk891xvOU8nOi0+9Th
YkMkE9lOYuIlx9O31t6kFtd92YgCGmaRwsQ9CSnETYulJx1m2e5OcBo2h8BEuvvD
V9etU0RGGkuJlamTpDiKYKuDpe3QiwBH7M5PgcpSuiXfTGnVChO4Y6hixE5+u8bU
J8D/mm5HmtZ5bk5uMwv+WL5pw55P+IDtBCrLveShdOGAKr+OcqxSOUo3hJKNnS02
tiwWebuO/MHL7cUui9C8KL9Tc360Ee4JKPLny072KyUDHsX1N5SeMYjtEkAyTUdR
ib4aoP4D43BDmXTXRoArm/Xf7GL8mw==
=B4mt
-----END PGP SIGNATURE-----

--Sig_/eFOibwsiHTxbRCFF.J1bhf2--

