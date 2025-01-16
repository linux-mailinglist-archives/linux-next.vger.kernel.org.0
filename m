Return-Path: <linux-next+bounces-5222-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C46ADA13148
	for <lists+linux-next@lfdr.de>; Thu, 16 Jan 2025 03:20:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 766577A21DC
	for <lists+linux-next@lfdr.de>; Thu, 16 Jan 2025 02:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6097935967;
	Thu, 16 Jan 2025 02:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="dd8M0iFB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475BA86358;
	Thu, 16 Jan 2025 02:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736994018; cv=none; b=nmIwpU9HFATODkOajj5PRQCyWbYROlFIIizOFO8b8il6l6pi6zu/cp0XI5wlB3RxFPoCVf7dbfEXAJKXfanMqjF83VjGCdGez2u03rp0Hg+N5CtmUgjeQvkp69fMc/2J0kiKjX6kPgLVfLAKpyUu/ECHvdiB0c70wtNY/Ym/4H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736994018; c=relaxed/simple;
	bh=hBgXWpAkifD03J704+eyd3kE+vReY7uTuiusvgP4T80=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=aZr6pAx5Lh2okydV3Arfpa+AWOrSaQukWk4jdW7jXha6YDbIRlpTQCj+ZgrH6dpylGp+pDL/G42cVJaxHp+RuRmthX8xemtseoKCs+JiQd1AEBXd+v2j03pez0MNZgpNlGKvl+sM4Xzpm4SsLuDRiFa9h+4vzGkYdw3frsdAasE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=dd8M0iFB; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736994003;
	bh=SjMeqMZ3zyKF8V6USNUqUyleZnlXtbpQEDTO2uPMJxA=;
	h=Date:From:To:Cc:Subject:From;
	b=dd8M0iFBAFoIWvvfVPzACYhsT3fq2yUH0ydWGbKK7ss5/y0/z3olcxof3W79owvc/
	 adWEqfvj7vfUDI0N8FP78dAchJNDaLfkEeOuJadTJ6lPXWg6FhnUHNmBb9Hl8Tqxr8
	 JNlPeZGC3WxKjceaw6FqS9myyb31A0H/SUHm4kvvBsO9xYz+A9+m4OT5DDB/msDOxq
	 cl+AfZ2Fh3ki8qWlIp4OJmHL3qCyNxrNo6Sw8WSCnuWYbxeCCPOWWO5heZhjUEz+L6
	 lHx9v/F6ZqRXoabMtNKBPymGWwcNxwqto9jz7FMOJo7HZXQnqMpCA3491YTHSNa8qV
	 B3NpN74AFm6Yw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YYRQq4yNjz4xS5;
	Thu, 16 Jan 2025 13:20:03 +1100 (AEDT)
Date: Thu, 16 Jan 2025 13:20:10 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Boris Brezillon
 <boris.brezillon@collabora.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the nand tree
Message-ID: <20250116132010.4948547d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vaxmCeuK8_RTaaHsr8SKJUQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/vaxmCeuK8_RTaaHsr8SKJUQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the nand tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from drivers/mtd/nand/spi/skyhigh.c:11:
include/linux/stddef.h:8:14: error: initialization of 'unsigned int' from '=
void *' makes integer from pointer without a cast [-Wint-conversion]
    8 | #define NULL ((void *)0)
      |              ^
include/linux/mtd/spinand.h:342:48: note: in definition of macro 'SPINAND_O=
P_VARIANTS'
  342 |                 .ops =3D (struct spi_mem_op[]) { __VA_ARGS__ },    =
       \
      |                                                ^~~~~~~~~~~
include/linux/mtd/spinand.h:66:9: note: in expansion of macro 'SPI_MEM_OP'
   66 |         SPI_MEM_OP(SPI_MEM_OP_CMD(0x03, 1),                        =
     \
      |         ^~~~~~~~~~
include/linux/mtd/spinand.h:69:20: note: in expansion of macro 'SPI_MEM_OP_=
DATA_IN'
   69 |                    SPI_MEM_OP_DATA_IN(len, buf, 1),                =
     \
      |                    ^~~~~~~~~~~~~~~~~~
drivers/mtd/nand/spi/skyhigh.c:24:17: note: in expansion of macro 'SPINAND_=
PAGE_READ_FROM_CACHE_OP'
   24 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0=
),
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/mtd/nand/spi/skyhigh.c:24:61: note: in expansion of macro 'NULL'
   24 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0=
),
      |                                                             ^~~~
include/linux/stddef.h:8:14: note: (near initialization for '(anonymous)[4]=
.data.nbytes')
    8 | #define NULL ((void *)0)
      |              ^
include/linux/mtd/spinand.h:342:48: note: in definition of macro 'SPINAND_O=
P_VARIANTS'
  342 |                 .ops =3D (struct spi_mem_op[]) { __VA_ARGS__ },    =
       \
      |                                                ^~~~~~~~~~~
include/linux/mtd/spinand.h:66:9: note: in expansion of macro 'SPI_MEM_OP'
   66 |         SPI_MEM_OP(SPI_MEM_OP_CMD(0x03, 1),                        =
     \
      |         ^~~~~~~~~~
include/linux/mtd/spinand.h:69:20: note: in expansion of macro 'SPI_MEM_OP_=
DATA_IN'
   69 |                    SPI_MEM_OP_DATA_IN(len, buf, 1),                =
     \
      |                    ^~~~~~~~~~~~~~~~~~
drivers/mtd/nand/spi/skyhigh.c:24:17: note: in expansion of macro 'SPINAND_=
PAGE_READ_FROM_CACHE_OP'
   24 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0=
),
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/mtd/nand/spi/skyhigh.c:24:61: note: in expansion of macro 'NULL'
   24 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0=
),
      |                                                             ^~~~
drivers/mtd/nand/spi/skyhigh.c:24:58: error: initialization of 'void *' fro=
m 'int' makes pointer from integer without a cast [-Wint-conversion]
   24 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0=
),
      |                                                          ^
include/linux/mtd/spinand.h:342:48: note: in definition of macro 'SPINAND_O=
P_VARIANTS'
  342 |                 .ops =3D (struct spi_mem_op[]) { __VA_ARGS__ },    =
       \
      |                                                ^~~~~~~~~~~
include/linux/mtd/spinand.h:66:9: note: in expansion of macro 'SPI_MEM_OP'
   66 |         SPI_MEM_OP(SPI_MEM_OP_CMD(0x03, 1),                        =
     \
      |         ^~~~~~~~~~
include/linux/mtd/spinand.h:69:20: note: in expansion of macro 'SPI_MEM_OP_=
DATA_IN'
   69 |                    SPI_MEM_OP_DATA_IN(len, buf, 1),                =
     \
      |                    ^~~~~~~~~~~~~~~~~~
drivers/mtd/nand/spi/skyhigh.c:24:17: note: in expansion of macro 'SPINAND_=
PAGE_READ_FROM_CACHE_OP'
   24 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0=
),
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/mtd/nand/spi/skyhigh.c:24:58: note: (near initialization for '(anon=
ymous)[4].data.buf.in')
   24 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0=
),
      |                                                          ^
include/linux/mtd/spinand.h:342:48: note: in definition of macro 'SPINAND_O=
P_VARIANTS'
  342 |                 .ops =3D (struct spi_mem_op[]) { __VA_ARGS__ },    =
       \
      |                                                ^~~~~~~~~~~
include/linux/mtd/spinand.h:66:9: note: in expansion of macro 'SPI_MEM_OP'
   66 |         SPI_MEM_OP(SPI_MEM_OP_CMD(0x03, 1),                        =
     \
      |         ^~~~~~~~~~
include/linux/mtd/spinand.h:69:20: note: in expansion of macro 'SPI_MEM_OP_=
DATA_IN'
   69 |                    SPI_MEM_OP_DATA_IN(len, buf, 1),                =
     \
      |                    ^~~~~~~~~~~~~~~~~~
drivers/mtd/nand/spi/skyhigh.c:24:17: note: in expansion of macro 'SPINAND_=
PAGE_READ_FROM_CACHE_OP'
   24 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0=
),
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/stddef.h:8:14: error: initialization of 'unsigned int' from '=
void *' makes integer from pointer without a cast [-Wint-conversion]
    8 | #define NULL ((void *)0)
      |              ^
include/linux/mtd/spinand.h:342:48: note: in definition of macro 'SPINAND_O=
P_VARIANTS'
  342 |                 .ops =3D (struct spi_mem_op[]) { __VA_ARGS__ },    =
       \
      |                                                ^~~~~~~~~~~
include/linux/mtd/spinand.h:66:9: note: in expansion of macro 'SPI_MEM_OP'
   66 |         SPI_MEM_OP(SPI_MEM_OP_CMD(0x03, 1),                        =
     \
      |         ^~~~~~~~~~
include/linux/mtd/spinand.h:69:20: note: in expansion of macro 'SPI_MEM_OP_=
DATA_IN'
   69 |                    SPI_MEM_OP_DATA_IN(len, buf, 1),                =
     \
      |                    ^~~~~~~~~~~~~~~~~~
drivers/mtd/nand/spi/skyhigh.c:25:17: note: in expansion of macro 'SPINAND_=
PAGE_READ_FROM_CACHE_OP'
   25 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, =
0));
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/mtd/nand/spi/skyhigh.c:25:62: note: in expansion of macro 'NULL'
   25 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, =
0));
      |                                                              ^~~~
include/linux/stddef.h:8:14: note: (near initialization for '(anonymous)[5]=
.data.nbytes')
    8 | #define NULL ((void *)0)
      |              ^
include/linux/mtd/spinand.h:342:48: note: in definition of macro 'SPINAND_O=
P_VARIANTS'
  342 |                 .ops =3D (struct spi_mem_op[]) { __VA_ARGS__ },    =
       \
      |                                                ^~~~~~~~~~~
include/linux/mtd/spinand.h:66:9: note: in expansion of macro 'SPI_MEM_OP'
   66 |         SPI_MEM_OP(SPI_MEM_OP_CMD(0x03, 1),                        =
     \
      |         ^~~~~~~~~~
include/linux/mtd/spinand.h:69:20: note: in expansion of macro 'SPI_MEM_OP_=
DATA_IN'
   69 |                    SPI_MEM_OP_DATA_IN(len, buf, 1),                =
     \
      |                    ^~~~~~~~~~~~~~~~~~
drivers/mtd/nand/spi/skyhigh.c:25:17: note: in expansion of macro 'SPINAND_=
PAGE_READ_FROM_CACHE_OP'
   25 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, =
0));
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/mtd/nand/spi/skyhigh.c:25:62: note: in expansion of macro 'NULL'
   25 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, =
0));
      |                                                              ^~~~
drivers/mtd/nand/spi/skyhigh.c:25:59: error: initialization of 'void *' fro=
m 'int' makes pointer from integer without a cast [-Wint-conversion]
   25 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, =
0));
      |                                                           ^
include/linux/mtd/spinand.h:342:48: note: in definition of macro 'SPINAND_O=
P_VARIANTS'
  342 |                 .ops =3D (struct spi_mem_op[]) { __VA_ARGS__ },    =
       \
      |                                                ^~~~~~~~~~~
include/linux/mtd/spinand.h:66:9: note: in expansion of macro 'SPI_MEM_OP'
   66 |         SPI_MEM_OP(SPI_MEM_OP_CMD(0x03, 1),                        =
     \
      |         ^~~~~~~~~~
include/linux/mtd/spinand.h:69:20: note: in expansion of macro 'SPI_MEM_OP_=
DATA_IN'
   69 |                    SPI_MEM_OP_DATA_IN(len, buf, 1),                =
     \
      |                    ^~~~~~~~~~~~~~~~~~
drivers/mtd/nand/spi/skyhigh.c:25:17: note: in expansion of macro 'SPINAND_=
PAGE_READ_FROM_CACHE_OP'
   25 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, =
0));
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/mtd/nand/spi/skyhigh.c:25:59: note: (near initialization for '(anon=
ymous)[5].data.buf.in')
   25 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, =
0));
      |                                                           ^
include/linux/mtd/spinand.h:342:48: note: in definition of macro 'SPINAND_O=
P_VARIANTS'
  342 |                 .ops =3D (struct spi_mem_op[]) { __VA_ARGS__ },    =
       \
      |                                                ^~~~~~~~~~~
include/linux/mtd/spinand.h:66:9: note: in expansion of macro 'SPI_MEM_OP'
   66 |         SPI_MEM_OP(SPI_MEM_OP_CMD(0x03, 1),                        =
     \
      |         ^~~~~~~~~~
include/linux/mtd/spinand.h:69:20: note: in expansion of macro 'SPI_MEM_OP_=
DATA_IN'
   69 |                    SPI_MEM_OP_DATA_IN(len, buf, 1),                =
     \
      |                    ^~~~~~~~~~~~~~~~~~
drivers/mtd/nand/spi/skyhigh.c:25:17: note: in expansion of macro 'SPINAND_=
PAGE_READ_FROM_CACHE_OP'
   25 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, =
0));
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/stddef.h:8:14: error: initialization of 'unsigned int' from '=
void *' makes integer from pointer without a cast [-Wint-conversion]
    8 | #define NULL ((void *)0)
      |              ^
include/linux/mtd/spinand.h:343:55: note: in definition of macro 'SPINAND_O=
P_VARIANTS'
  343 |                 .nops =3D sizeof((struct spi_mem_op[]){ __VA_ARGS__=
 }) /  \
      |                                                       ^~~~~~~~~~~
include/linux/mtd/spinand.h:66:9: note: in expansion of macro 'SPI_MEM_OP'
   66 |         SPI_MEM_OP(SPI_MEM_OP_CMD(0x03, 1),                        =
     \
      |         ^~~~~~~~~~
include/linux/mtd/spinand.h:69:20: note: in expansion of macro 'SPI_MEM_OP_=
DATA_IN'
   69 |                    SPI_MEM_OP_DATA_IN(len, buf, 1),                =
     \
      |                    ^~~~~~~~~~~~~~~~~~
drivers/mtd/nand/spi/skyhigh.c:24:17: note: in expansion of macro 'SPINAND_=
PAGE_READ_FROM_CACHE_OP'
   24 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0=
),
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/mtd/nand/spi/skyhigh.c:24:61: note: in expansion of macro 'NULL'
   24 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0=
),
      |                                                             ^~~~
include/linux/stddef.h:8:14: note: (near initialization for '(anonymous)[4]=
.data.nbytes')
    8 | #define NULL ((void *)0)
      |              ^
include/linux/mtd/spinand.h:343:55: note: in definition of macro 'SPINAND_O=
P_VARIANTS'
  343 |                 .nops =3D sizeof((struct spi_mem_op[]){ __VA_ARGS__=
 }) /  \
      |                                                       ^~~~~~~~~~~
include/linux/mtd/spinand.h:66:9: note: in expansion of macro 'SPI_MEM_OP'
   66 |         SPI_MEM_OP(SPI_MEM_OP_CMD(0x03, 1),                        =
     \
      |         ^~~~~~~~~~
include/linux/mtd/spinand.h:69:20: note: in expansion of macro 'SPI_MEM_OP_=
DATA_IN'
   69 |                    SPI_MEM_OP_DATA_IN(len, buf, 1),                =
     \
      |                    ^~~~~~~~~~~~~~~~~~
drivers/mtd/nand/spi/skyhigh.c:24:17: note: in expansion of macro 'SPINAND_=
PAGE_READ_FROM_CACHE_OP'
   24 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0=
),
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/mtd/nand/spi/skyhigh.c:24:61: note: in expansion of macro 'NULL'
   24 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0=
),
      |                                                             ^~~~
drivers/mtd/nand/spi/skyhigh.c:24:58: error: initialization of 'void *' fro=
m 'int' makes pointer from integer without a cast [-Wint-conversion]
   24 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0=
),
      |                                                          ^
include/linux/mtd/spinand.h:343:55: note: in definition of macro 'SPINAND_O=
P_VARIANTS'
  343 |                 .nops =3D sizeof((struct spi_mem_op[]){ __VA_ARGS__=
 }) /  \
      |                                                       ^~~~~~~~~~~
include/linux/mtd/spinand.h:66:9: note: in expansion of macro 'SPI_MEM_OP'
   66 |         SPI_MEM_OP(SPI_MEM_OP_CMD(0x03, 1),                        =
     \
      |         ^~~~~~~~~~
include/linux/mtd/spinand.h:69:20: note: in expansion of macro 'SPI_MEM_OP_=
DATA_IN'
   69 |                    SPI_MEM_OP_DATA_IN(len, buf, 1),                =
     \
      |                    ^~~~~~~~~~~~~~~~~~
drivers/mtd/nand/spi/skyhigh.c:24:17: note: in expansion of macro 'SPINAND_=
PAGE_READ_FROM_CACHE_OP'
   24 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0=
),
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/mtd/nand/spi/skyhigh.c:24:58: note: (near initialization for '(anon=
ymous)[4].data.buf.in')
   24 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0=
),
      |                                                          ^
include/linux/mtd/spinand.h:343:55: note: in definition of macro 'SPINAND_O=
P_VARIANTS'
  343 |                 .nops =3D sizeof((struct spi_mem_op[]){ __VA_ARGS__=
 }) /  \
      |                                                       ^~~~~~~~~~~
include/linux/mtd/spinand.h:66:9: note: in expansion of macro 'SPI_MEM_OP'
   66 |         SPI_MEM_OP(SPI_MEM_OP_CMD(0x03, 1),                        =
     \
      |         ^~~~~~~~~~
include/linux/mtd/spinand.h:69:20: note: in expansion of macro 'SPI_MEM_OP_=
DATA_IN'
   69 |                    SPI_MEM_OP_DATA_IN(len, buf, 1),                =
     \
      |                    ^~~~~~~~~~~~~~~~~~
drivers/mtd/nand/spi/skyhigh.c:24:17: note: in expansion of macro 'SPINAND_=
PAGE_READ_FROM_CACHE_OP'
   24 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1, NULL, 0=
),
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/stddef.h:8:14: error: initialization of 'unsigned int' from '=
void *' makes integer from pointer without a cast [-Wint-conversion]
    8 | #define NULL ((void *)0)
      |              ^
include/linux/mtd/spinand.h:343:55: note: in definition of macro 'SPINAND_O=
P_VARIANTS'
  343 |                 .nops =3D sizeof((struct spi_mem_op[]){ __VA_ARGS__=
 }) /  \
      |                                                       ^~~~~~~~~~~
include/linux/mtd/spinand.h:66:9: note: in expansion of macro 'SPI_MEM_OP'
   66 |         SPI_MEM_OP(SPI_MEM_OP_CMD(0x03, 1),                        =
     \
      |         ^~~~~~~~~~
include/linux/mtd/spinand.h:69:20: note: in expansion of macro 'SPI_MEM_OP_=
DATA_IN'
   69 |                    SPI_MEM_OP_DATA_IN(len, buf, 1),                =
     \
      |                    ^~~~~~~~~~~~~~~~~~
drivers/mtd/nand/spi/skyhigh.c:25:17: note: in expansion of macro 'SPINAND_=
PAGE_READ_FROM_CACHE_OP'
   25 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, =
0));
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/mtd/nand/spi/skyhigh.c:25:62: note: in expansion of macro 'NULL'
   25 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, =
0));
      |                                                              ^~~~
include/linux/stddef.h:8:14: note: (near initialization for '(anonymous)[5]=
.data.nbytes')
    8 | #define NULL ((void *)0)
      |              ^
include/linux/mtd/spinand.h:343:55: note: in definition of macro 'SPINAND_O=
P_VARIANTS'
  343 |                 .nops =3D sizeof((struct spi_mem_op[]){ __VA_ARGS__=
 }) /  \
      |                                                       ^~~~~~~~~~~
include/linux/mtd/spinand.h:66:9: note: in expansion of macro 'SPI_MEM_OP'
   66 |         SPI_MEM_OP(SPI_MEM_OP_CMD(0x03, 1),                        =
     \
      |         ^~~~~~~~~~
include/linux/mtd/spinand.h:69:20: note: in expansion of macro 'SPI_MEM_OP_=
DATA_IN'
   69 |                    SPI_MEM_OP_DATA_IN(len, buf, 1),                =
     \
      |                    ^~~~~~~~~~~~~~~~~~
drivers/mtd/nand/spi/skyhigh.c:25:17: note: in expansion of macro 'SPINAND_=
PAGE_READ_FROM_CACHE_OP'
   25 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, =
0));
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/mtd/nand/spi/skyhigh.c:25:62: note: in expansion of macro 'NULL'
   25 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, =
0));
      |                                                              ^~~~
drivers/mtd/nand/spi/skyhigh.c:25:59: error: initialization of 'void *' fro=
m 'int' makes pointer from integer without a cast [-Wint-conversion]
   25 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, =
0));
      |                                                           ^
include/linux/mtd/spinand.h:343:55: note: in definition of macro 'SPINAND_O=
P_VARIANTS'
  343 |                 .nops =3D sizeof((struct spi_mem_op[]){ __VA_ARGS__=
 }) /  \
      |                                                       ^~~~~~~~~~~
include/linux/mtd/spinand.h:66:9: note: in expansion of macro 'SPI_MEM_OP'
   66 |         SPI_MEM_OP(SPI_MEM_OP_CMD(0x03, 1),                        =
     \
      |         ^~~~~~~~~~
include/linux/mtd/spinand.h:69:20: note: in expansion of macro 'SPI_MEM_OP_=
DATA_IN'
   69 |                    SPI_MEM_OP_DATA_IN(len, buf, 1),                =
     \
      |                    ^~~~~~~~~~~~~~~~~~
drivers/mtd/nand/spi/skyhigh.c:25:17: note: in expansion of macro 'SPINAND_=
PAGE_READ_FROM_CACHE_OP'
   25 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, =
0));
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/mtd/nand/spi/skyhigh.c:25:59: note: (near initialization for '(anon=
ymous)[5].data.buf.in')
   25 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, =
0));
      |                                                           ^
include/linux/mtd/spinand.h:343:55: note: in definition of macro 'SPINAND_O=
P_VARIANTS'
  343 |                 .nops =3D sizeof((struct spi_mem_op[]){ __VA_ARGS__=
 }) /  \
      |                                                       ^~~~~~~~~~~
include/linux/mtd/spinand.h:66:9: note: in expansion of macro 'SPI_MEM_OP'
   66 |         SPI_MEM_OP(SPI_MEM_OP_CMD(0x03, 1),                        =
     \
      |         ^~~~~~~~~~
include/linux/mtd/spinand.h:69:20: note: in expansion of macro 'SPI_MEM_OP_=
DATA_IN'
   69 |                    SPI_MEM_OP_DATA_IN(len, buf, 1),                =
     \
      |                    ^~~~~~~~~~~~~~~~~~
drivers/mtd/nand/spi/skyhigh.c:25:17: note: in expansion of macro 'SPINAND_=
PAGE_READ_FROM_CACHE_OP'
   25 |                 SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0, 1, NULL, =
0));
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  042087247835 ("mtd: spinand: Create distinct fast and slow read from cach=
e variants")

I have used the nand tree from next-20250115 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/vaxmCeuK8_RTaaHsr8SKJUQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeIbNoACgkQAVBC80lX
0GwVzAf9GonXFsp127jA65iX95gUbj2gq3Omuh7lTqx4nahrknC/wHyonpl5D0xY
QlkSRJ4NGADExdo10qC6X56N8MCSDBW2XCog4RLcdU9tRCYsQJRHZbwqjKmNsl3T
sn+YHj1cMTeAMxPhL9mXK5mSUnJLrb2vkqNk8G32LU7mOzeTMpaIY/8167Zj7rpH
Om+nO02KkaN5HKPDuYxFcqpc1iWxbWtuf1YYz1LCiRZa1YFwU921LM6BDyiYghWB
h8pu6ogNg1tqgDnuJ7DhHGAKcXd2kd4MnkF4/G/B55smuN9jh3kDXe/y/T8Wyfz3
xBKqzTgux67TXOUJa6LYVrYp1CHV3Q==
=dpWb
-----END PGP SIGNATURE-----

--Sig_/vaxmCeuK8_RTaaHsr8SKJUQ--

