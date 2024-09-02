Return-Path: <linux-next+bounces-3526-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41248967DB3
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2024 04:12:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F205C28198F
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2024 02:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B4D0125DB;
	Mon,  2 Sep 2024 02:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="aYI8qhf2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5BC8F6C;
	Mon,  2 Sep 2024 02:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725243109; cv=none; b=T6IzmSyeGyOE3PTdYfHkgfeFFxU5yA9XLd1AMQGYZK7Onx2va9qhXbpHtDUqYySb9nynpjj5TXM5OIJbevRCHeSa6D1pLgqEmoD+yKc5ywhXVctcww7RbHff1i7q8umFCI5C9+fnOwWKuVt4DqQlPHAH4s/v2dignAqOR8wd+lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725243109; c=relaxed/simple;
	bh=CYuFYJUNAPQZE/t9XwqerHX+6ScGFfgnN55lm/Pa4Bk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=N6wPm6sAfZ/rKF6ZGjY+vVGcnkRsnVCnJlEz1M2WJV0R1Z35JmATKJp+RJUMdZ2DIicuXNq3SasBlkaSvprXTCdgP9/k88plZtPl9uljkuQxL2CVhY/lS31t8mxPNdkszxpWGRLZiMsJLOqsAcQQgxcpyGrr1sOTDFllOLqDnBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=aYI8qhf2; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725243102;
	bh=9VVl1NddvHtnzZAKEpaYIgAMWRRqbcJqWNNCCf+BMTo=;
	h=Date:From:To:Cc:Subject:From;
	b=aYI8qhf2BPz3pTv6vLSh1i8DBN6e66bVTMqizCfB0Xq/zosmcnNwGE1MDElNM1kyt
	 EQottIom56zS9/3Sryv26XpRborrewg0RQerDpgn6d0kU9RTd3KGbYT8pktGMWf/Lo
	 LXdPaOEzdeiCkxBepNhCiDUGIHUqsKqNw8EcyIQfN14XqenKXRgE41gavra1D0efTQ
	 rs5OW0aveGVrIlBcaYUxQOdBYdETNfAbPoMCRfrqSp5wZBJ52k6vdGg7aO58sLBATa
	 iGhvt0tDi9/WfNX9J9IpBrGkt55/0CACUM/Pfu+zd99cenOzK+1NbK3h6PcsQ+lZ5W
	 7X3FOsSwkvAog==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wxsgx0Z06z4x9G;
	Mon,  2 Sep 2024 12:11:40 +1000 (AEST)
Date: Mon, 2 Sep 2024 12:11:40 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Palmer Dabbelt
 <palmer@rivosinc.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Ryo Takakura <takakura@valinux.co.jp>, Sunil V L <sunilvl@ventanamicro.com>
Subject: linux-next: manual merge of the pm tree with the risc-v tree
Message-ID: <20240902121140.51cc49c9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/U4+eS=4WkyHYdJpRfvBEEE5";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/U4+eS=4WkyHYdJpRfvBEEE5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pm tree got a conflict in:

  arch/riscv/include/asm/irq.h

between commit:

  f15c21a3de1b ("RISC-V: Enable IPI CPU Backtrace")

from the risc-v tree and commit:

  f8619b66bdb1 ("irqchip/riscv-intc: Add ACPI support for AIA")

from the pm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/riscv/include/asm/irq.h
index 8330d16b05b5,7e9a84a005ed..000000000000
--- a/arch/riscv/include/asm/irq.h
+++ b/arch/riscv/include/asm/irq.h
@@@ -12,11 -12,8 +12,13 @@@
 =20
  #include <asm-generic/irq.h>
 =20
+ #define INVALID_CONTEXT UINT_MAX
+=20
 +#ifdef CONFIG_SMP
 +void arch_trigger_cpumask_backtrace(const cpumask_t *mask, int exclude_cp=
u);
 +#define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
 +#endif
 +
  void riscv_set_intc_hwnode_fn(struct fwnode_handle *(*fn)(void));
 =20
  struct fwnode_handle *riscv_get_intc_hwnode(void);

--Sig_/U4+eS=4WkyHYdJpRfvBEEE5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbVHtwACgkQAVBC80lX
0Gx/BAf/S0laIaLxR9VuPFZy3CdHnRi8yK84gfMIchYM9VV4qlH9cTtSOdjKPnZ1
IzjxKpl9mkmiIr8Z9tqRpKTvqBj2gU6SCVghKsPtWWhNIeCS2+votY5CM0drQW4A
xHpiYYk5l95BLTnOfAAf57Hcd4Y5ExCd23MJxeH2DFiD7IK9briwje2ew0mmjaes
51RYOasm9FcWP9Y5UetunsViHRoWhTEzHKEGGCTCDmGGeUqjvGawjUG+Uqsspm1G
miBUgnJF74azQxWKme5Lt9vhvYyf3p+S1ZjRILJnoEJlFuge07Y5cj/zTMV2PgVb
t0Ehqjz56hrtCj/GC/BxSwKyF5+dgA==
=xapy
-----END PGP SIGNATURE-----

--Sig_/U4+eS=4WkyHYdJpRfvBEEE5--

