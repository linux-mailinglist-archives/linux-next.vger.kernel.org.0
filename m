Return-Path: <linux-next+bounces-7997-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E00B9B2B7DD
	for <lists+linux-next@lfdr.de>; Tue, 19 Aug 2025 05:43:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6416A5E448F
	for <lists+linux-next@lfdr.de>; Tue, 19 Aug 2025 03:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5067824A043;
	Tue, 19 Aug 2025 03:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="l3FpGNxK"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423DF2D2494;
	Tue, 19 Aug 2025 03:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755574846; cv=none; b=CP6PhgQPUoIxJQTK1AdHV4/4Cl/H2q75uON7zVzKduw2mXV/n8NybQNWWAWryM4yzfaDiFBU3umb/XMUjxmJNQyKoMxFfHncutsUZFiDlyKKrzS0fJxuzQ8yaea+gGJGU68NhcMSK6TOU7fTsBMDOdo86DdgR/nPVmv32ZlQZ8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755574846; c=relaxed/simple;
	bh=/gLIqa7RvVav7E4orltw/g/YK3cyltUguq+gCaCY7og=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IkSlJ/wIO5G/TRiH6e8+iaij/7J4/x5V8IG/TQgIP0zKCbZZeXrYJMsu4+BG/lcIZ87xgICE8HnH2LLHq2p2vAIWctb/T8SSAUzKLCQul/EanPwvOlpSuwlwJtqlJaiRmbOR/mZnzcOLDx7CwjXhimhHR1W07Q3wKHFTWH4VJ8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=l3FpGNxK; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1755574841;
	bh=gBKBEI4890AQyW0w74VFtbTv31tLSEPsLn2ZHiznlZo=;
	h=Date:From:To:Cc:Subject:From;
	b=l3FpGNxKS25oVqUk1Bpe+Ue2bVVn+DJgDqlwKpdD2ceMyDAU/nZY8dDoIFsJrnueV
	 XnTkqOSfLfBvpv5r38FV8DtUHL5MuKHiWZM+LXM58irjRAHXcAZhELL9Ar/pCEz5Ks
	 hvu15nplr0bvG6mL5iUy9yWmP3zY456G1J7QsNjEuMJ6bYYdkoR4yztljxaVYvhiU5
	 x55kXAVfZLbJ6jBvHlKiv/Bo38tFS5r+LL4Y5ZMIB+uJsEHqSXH1KKap6JCJztc6Gy
	 TECFd9XyOqwyJCS8tfBNsnlpHB7Q7A6pLrqU9XZRLQQdtyX2UiHCcfqFpGle3VsttR
	 c+5PZLeiK957A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c5b2c1pSRz4w2R;
	Tue, 19 Aug 2025 13:40:40 +1000 (AEST)
Date: Tue, 19 Aug 2025 13:40:39 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the nvmem tree
Message-ID: <20250819134039.5742c60e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/U7QQ5GIVTgyqJvP0yKHF9EI";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/U7QQ5GIVTgyqJvP0yKHF9EI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the nvmem tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from drivers/nvmem/qnap-mcu-eeprom.c:12:
include/linux/mfd/qnap-mcu.h:13:9: error: unknown type name 'u32'
   13 |         u32 baud_rate;
      |         ^~~
include/linux/mfd/qnap-mcu.h:17:9: error: unknown type name 'bool'
   17 |         bool usb_led;
      |         ^~~~
include/linux/mfd/qnap-mcu.h:1:1: note: 'bool' is defined in header '<stdbo=
ol.h>'; this is probably fixable by adding '#include <stdbool.h>'
  +++ |+#include <stdbool.h>
    1 | /* SPDX-License-Identifier: GPL-2.0+ */
include/linux/mfd/qnap-mcu.h:21:25: error: unknown type name 'u8'
   21 |                   const u8 *cmd_data, size_t cmd_data_size,
      |                         ^~
include/linux/mfd/qnap-mcu.h:21:39: error: unknown type name 'size_t'
   21 |                   const u8 *cmd_data, size_t cmd_data_size,
      |                                       ^~~~~~
include/linux/mfd/qnap-mcu.h:1:1: note: 'size_t' is defined in header '<std=
def.h>'; this is probably fixable by adding '#include <stddef.h>'
  +++ |+#include <stddef.h>
    1 | /* SPDX-License-Identifier: GPL-2.0+ */
include/linux/mfd/qnap-mcu.h:22:19: error: unknown type name 'u8'
   22 |                   u8 *reply_data, size_t reply_data_size);
      |                   ^~
include/linux/mfd/qnap-mcu.h:22:35: error: unknown type name 'size_t'
   22 |                   u8 *reply_data, size_t reply_data_size);
      |                                   ^~~~~~
include/linux/mfd/qnap-mcu.h:22:35: note: 'size_t' is defined in header '<s=
tddef.h>'; this is probably fixable by adding '#include <stddef.h>'
include/linux/mfd/qnap-mcu.h:24:34: error: unknown type name 'u8'
   24 |                            const u8 *cmd_data, size_t cmd_data_size=
);
      |                                  ^~
include/linux/mfd/qnap-mcu.h:24:48: error: unknown type name 'size_t'
   24 |                            const u8 *cmd_data, size_t cmd_data_size=
);
      |                                                ^~~~~~
include/linux/mfd/qnap-mcu.h:24:48: note: 'size_t' is defined in header '<s=
tddef.h>'; this is probably fixable by adding '#include <stddef.h>'
drivers/nvmem/qnap-mcu-eeprom.c: In function 'qnap_mcu_eeprom_read_block':
drivers/nvmem/qnap-mcu-eeprom.c:32:15: error: implicit declaration of funct=
ion 'qnap_mcu_exec' [-Wimplicit-function-declaration]
   32 |         ret =3D qnap_mcu_exec(mcu, cmd, sizeof(cmd), reply, bytes +=
 sizeof(cmd));
      |               ^~~~~~~~~~~~~

Caused by commit

  117c3f3014a9 ("nvmem: add driver for the eeprom in qnap-mcu controllers")

I have used the nvmem tree from next-20250818 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/U7QQ5GIVTgyqJvP0yKHF9EI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmij8jcACgkQAVBC80lX
0Gwnkgf9E4u6lMD7ZTa7eLJ9UbnZcigFFD9XHwCT9yCi9V0J170/p4kLPhjGNdf2
p+qnyyrqVaDEeyTuYqe0k8cJPrR63iQD8FY7H6D4Bw5TSajV0v+g4jFtgbwqORul
3beI++/KfO0xi1LUKddqjZF/+MXps6XX/KIdVY/mpgIMTUmlNuwoKZELhQP9ySRv
iwZuRXn0xLpxkehmEIZrweT7H4oBCtWwLpQzo9wC/Q/a+H691Sa0FqShjS4S/jsK
Gu0bg5uz4cvZTH6JaFlAB5oHsROTLQnDE44nLIIWME6EdMXI9yh7G5ZMtZ+kzhtX
ztXRrrO1GXWOM2QrE9Bh+PGDD+x/3g==
=c8zr
-----END PGP SIGNATURE-----

--Sig_/U7QQ5GIVTgyqJvP0yKHF9EI--

