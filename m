Return-Path: <linux-next+bounces-9467-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B159CCB833
	for <lists+linux-next@lfdr.de>; Thu, 18 Dec 2025 11:59:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E90FD304FB94
	for <lists+linux-next@lfdr.de>; Thu, 18 Dec 2025 10:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3163E2FF148;
	Thu, 18 Dec 2025 10:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="j5Q+BBwC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761A61F9F70;
	Thu, 18 Dec 2025 10:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766055560; cv=none; b=FawYDaiFyZrO+YcSJvf0T60niuImdlLyftUzLTDZQjykVXFg354DiE2cNs8HnSnEO6oE+PbFqUx93QqHhN3V3qiT5kCmhCHy2RwMPxFkqPBUYEcY815shkc0BLaKbVb+HFURP486cyjwi9UugR6y0sHNnyM8pFMcucEr7dN5bFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766055560; c=relaxed/simple;
	bh=R56FURjxWPG2CQ4cd2qmfuhDHP+NYe9N/yxYOUKVheM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lm2bNyP35aE079z0GQLdooX7nnaftkyzHYx5OGBs21xRIAkOD8wyBp3zO6PbmsOOY+a/9+A4jw6MNovFGfqHxGToDGgxYypj5Osza0XM2MS3vp8joo8BGW9tNpDXhpSdT/4NkstVMQ5+urzYhxtZQrt8rV5CBx0Ol8siB0sVtT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=j5Q+BBwC; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1766055554;
	bh=gapBsFcFpK1z2g0n8LubszGKmA02aSty5TCmrKgZ05I=;
	h=Date:From:To:Cc:Subject:From;
	b=j5Q+BBwCJaKnBoF1jIBTS5DrOWDAVDmQjtSbJXD0mpMYxFO9fMgBZVm1N7biQdMKc
	 DyeC512y7fXwLEMlOiTzbJ9RoD7P0C1d+Ni+hse1uZCUfhBDj+adI/PZ+Gj93GhHPg
	 tE6AC4lHCFzlnTA7NXfUfe0Vw6fNmwtB8ZaFvJZRszai9RY94Fa1FIF5O75n6MBeq4
	 u/tMdeNDdVAC6kQSQzRbEwC/yAsZy4s/aoGU9F9FkDr+YeKGzj/6K9ec0UOcxm7hRJ
	 mG45CrO8X82cIh4aFw47A5REYoFHnT5PNITvu3GfqT7yG0am1W8PoYN6ZQ6Y+S4A7l
	 wmVVawzsj2vQg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dX72n4WPNz4w1g;
	Thu, 18 Dec 2025 21:59:13 +1100 (AEDT)
Date: Thu, 18 Dec 2025 21:59:12 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
 <johan.hedberg@gmail.com>
Cc: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, Stefan
 =?UTF-8?B?U8O4cmVuc2Vu?= <ssorensen@roku.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the bluetooth tree
Message-ID: <20251218215912.1597e25f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CIec0nTWgL.mCS+P9=z0oDP";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/CIec0nTWgL.mCS+P9=z0oDP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the bluetooth tree, today's linux-next build (powerpc
allyesconfig) failed like this:

In file included from include/linux/byteorder/big_endian.h:5,
                 from arch/powerpc/include/uapi/asm/byteorder.h:14,
                 from arch/powerpc/include/asm/qspinlock_types.h:6,
                 from arch/powerpc/include/asm/spinlock_types.h:10,
                 from include/linux/spinlock_types_raw.h:7,
                 from include/linux/ratelimit_types.h:7,
                 from include/linux/printk.h:9,
                 from include/asm-generic/bug.h:31,
                 from arch/powerpc/include/asm/bug.h:116,
                 from include/linux/ktime.h:24,
                 from include/linux/poll.h:7,
                 from include/net/bluetooth/bluetooth.h:29,
                 from net/bluetooth/mgmt_config.c:7:
net/bluetooth/mgmt_config.c: In function 'read_def_system_config':
include/uapi/linux/byteorder/big_endian.h:34:26: error: conversion from 'un=
signed int' to 'short unsigned int' changes value from '536870912' to '0' [=
-Werror=3Doverflow]
   34 | #define __cpu_to_le32(x) ((__force __le32)__swab32((x)))
      |                          ^
include/linux/byteorder/generic.h:88:21: note: in expansion of macro '__cpu=
_to_le32'
   88 | #define cpu_to_le32 __cpu_to_le32
      |                     ^~~~~~~~~~~~~
net/bluetooth/mgmt_config.c:40:19: note: in expansion of macro 'cpu_to_le32'
   40 |                 { cpu_to_le32(_param_code_), sizeof(__u32) }, \
      |                   ^~~~~~~~~~~
net/bluetooth/mgmt_config.c:127:17: note: in expansion of macro 'TLV_SET_U3=
2'
  127 |                 TLV_SET_U32(0x0020, idle_timeout),
      |                 ^~~~~~~~~~~
cc1: all warnings being treated as errors

Caused by commit

  afa20d8099dd ("Bluetooth: mgmt: Add idle_timeout to configurable system p=
arameters")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/CIec0nTWgL.mCS+P9=z0oDP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlD3oAACgkQAVBC80lX
0Gzq/Qf/f+K3A257ZD+7e0Hav3Y+27FFezq1Vtd9Tp+gECDrAXtTmqZxVBXPX+Xq
bBCLQRdYvXeG+E3EjGzaYVq8feRmBCpIK06TUTzeOo5J/B2zlwZSkPQLjjyOCi8Y
mNHHJtU3jta6AzTThQEvp0nTro8efZEtNU7Z5ZMpUMFeIG3bZNemHlM4HGPaMyNc
9mDqC7OCTglO5aGQZRl5PVwmIhrqcr9QASGd4UAt3QA8x7ZPkQiW6pFEVQ7lL9AF
5j2TH7nYV23vjBgOT0VqScAPUR/DVUz4f+qw2BGizd2jRDNaCPgRMntrqH9qnQtf
4Gjd/MAF9ZFaeKb2ox1jl8sksCG22Q==
=L2pK
-----END PGP SIGNATURE-----

--Sig_/CIec0nTWgL.mCS+P9=z0oDP--

