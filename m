Return-Path: <linux-next+bounces-2748-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5044B91D96A
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 09:51:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 036151F226C1
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 07:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD2D17174F;
	Mon,  1 Jul 2024 07:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="V9k8xZ8s"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA0E768FD;
	Mon,  1 Jul 2024 07:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719820265; cv=none; b=o07O3GVA6VqwmSI1VyCJOV1A5XfrIk+UcIytZPGzT1RwW84bxoMi7oSw7RaWwa7L+6uCk/smAKbycWXpHYpPBkr+YO2wuAW5rllz3bZHWdZVA6sj9OPDiIW0J0ZMkfkyuk67jECZ5ZA1uDaZBr0k+Ahrs1e7psCdBfr5ShLjWkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719820265; c=relaxed/simple;
	bh=HUw0dPLAvYnDn+WzDu0RqPeQgti5gDyr0ckV9+fNBWA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GPol7L8Wyu3Y49xdgsZzajA8xMZN+lrHvSGQj378s9IyUODf6muNG8aS7EWVa5CO5qSyoX2zXYOuU2dbMfm08PovmpAtiS4Yu7AkYVXuD/FcDpecTT552BSie/xZ0VpGgNS6UG1R/LLrg+/9cMQKu4l+XjZ3TLFOCI8zvjCtE70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=V9k8xZ8s; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1719820257;
	bh=zDSczmlXNDdoowUo0H5CxVHbhIIvRovifmMnsGQqVAA=;
	h=Date:From:To:Cc:Subject:From;
	b=V9k8xZ8sYdjJ+EJ+WW5QANHz7je5bjWJzD/GeNlqKOpRHRG2W39r+eZbOvBgBv3CM
	 N6SDMyZvbkdkv8TqwgEW33Stcwvp4BZJpB+VWKnLPkP/nD5DwHmS434UAc1xrXFUDO
	 iwo4N5cqxp+sgV1sbuz9a+RFkplwD2nM2n1VcXLheuxXyv8FidR8sN6Lqvy5LgRbhs
	 ZFXb0tyRQhC6UU0xnokXFduyVo/4njtkLssiAa78fG19+wM0rEkHtL5sHT0iqlXo0H
	 Gi5b1cBWqyhtLKEl1V2vGHVF6uTReFo+KTFUGbERdAd2vJBrkbTKDfjjM9THkOEbbn
	 7G0ap9Yr3E1sg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WCJBM4N3Mz4wxs;
	Mon,  1 Jul 2024 17:50:51 +1000 (AEST)
Date: Mon, 1 Jul 2024 17:50:51 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Yury Norov <yury.norov@gmail.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: James Morse <james.morse@arm.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, "Russell King (Oracle)"
 <rmk+kernel@armlinux.org.uk>
Subject: linux-next: manual merge of the bitmap tree with the arm64 tree
Message-ID: <20240701175051.0ef5d901@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MCah/CXsJny/S=kto/Rkg3G";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/MCah/CXsJny/S=kto/Rkg3G
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the bitmap tree got a conflict in:

  include/linux/cpumask.h

between commit:

  4e1a7df45480 ("cpumask: Add enabled cpumask for present CPUs that can be =
brought online")

from the arm64 tree and commit:

  5c563ee90a22 ("cpumask: introduce assign_cpu() macro")

from the bitmap tree.

I fixed it up (I just did the obvious - see below) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/cpumask.h
index 099e8b32dd68,18410acdbc9e..000000000000
--- a/include/linux/cpumask.h
+++ b/include/linux/cpumask.h
@@@ -1033,32 -1083,13 +1033,22 @@@ void init_cpu_present(const struct cpum
  void init_cpu_possible(const struct cpumask *src);
  void init_cpu_online(const struct cpumask *src);
 =20
- static inline void
- set_cpu_possible(unsigned int cpu, bool possible)
- {
- 	if (possible)
- 		cpumask_set_cpu(cpu, &__cpu_possible_mask);
- 	else
- 		cpumask_clear_cpu(cpu, &__cpu_possible_mask);
- }
-=20
 +static inline void
 +set_cpu_enabled(unsigned int cpu, bool can_be_onlined)
 +{
 +	if (can_be_onlined)
 +		cpumask_set_cpu(cpu, &__cpu_enabled_mask);
 +	else
 +		cpumask_clear_cpu(cpu, &__cpu_enabled_mask);
 +}
 +
- static inline void
- set_cpu_present(unsigned int cpu, bool present)
- {
- 	if (present)
- 		cpumask_set_cpu(cpu, &__cpu_present_mask);
- 	else
- 		cpumask_clear_cpu(cpu, &__cpu_present_mask);
- }
+ #define assign_cpu(cpu, mask, val)	\
+ 	assign_bit(cpumask_check(cpu), cpumask_bits(mask), (val))
+=20
+ #define set_cpu_possible(cpu, possible)	assign_cpu((cpu), &__cpu_possible=
_mask, (possible))
+ #define set_cpu_present(cpu, present)	assign_cpu((cpu), &__cpu_present_ma=
sk, (present))
+ #define set_cpu_active(cpu, active)	assign_cpu((cpu), &__cpu_active_mask,=
 (active))
+ #define set_cpu_dying(cpu, dying)	assign_cpu((cpu), &__cpu_dying_mask, (d=
ying))
 =20
  void set_cpu_online(unsigned int cpu, bool online);
 =20

--Sig_/MCah/CXsJny/S=kto/Rkg3G
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaCX9sACgkQAVBC80lX
0GxYzgf/VQZx3/bBkPa+hfID7SxV3b43Jy8AFvBxuFQK+7tz4OjZ5byPvVbTE9CL
b/vtbAANz9Sds9qKx8CudrMGfen7ILIB+yhdpT2eXp/yVgMK3sKWR91hL1WcqORs
VWGQu9T7WKn8WvP/yDhaFdBLwXllbxJcKzdYnqfopwXg3Vo+luwP+8ISiMd7f9zq
5yY2ZuFrEQ10HqkpB5GQbfmsl3uqcPO2amPJ2CqLE38MF7wbYDIAd6YubNFvlvCz
t9eIeF1F+vybgT9gcUuwpiNMaZobOaKDyAb68LIAmmQWwdmyK458tRGE+Ycw1KYr
H+1mnF37aIW859MMfRG3EfpLzGEsyg==
=EW/X
-----END PGP SIGNATURE-----

--Sig_/MCah/CXsJny/S=kto/Rkg3G--

