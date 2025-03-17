Return-Path: <linux-next+bounces-5823-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 76326A64FEA
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 13:56:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB2DC16EF06
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 12:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51459238145;
	Mon, 17 Mar 2025 12:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="RoLviM1C"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6720E224241;
	Mon, 17 Mar 2025 12:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742216178; cv=none; b=PMoRfUzT7L4uZ4i4e2nP/qZzBlvYVEeyweZsppAFLPtxuBM0XHSTL7neLcLEWf/xV7ftdAtrYer/miaBl/hbNeIN5q4AyDz9hXgiOf3IDVZC2jbAQBSlqsLp3jER18AepGcTfZMJWVaPxSZ8IoOEMWqz/VUaE2373+epRBLQk58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742216178; c=relaxed/simple;
	bh=NycearbzJs6CcRBZISbzFoT5YCwv6PG5mSfRyTWWoDs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=HSwrhdMihhTXi7hY1YHs+VaIU6z3rEM7zak4QEFSafBRX0Fn7sdqBMWJ/KZRaPSsX7Z2XkxAygnSBh34ygND4bgbIo9u6UjbP91HmP18a/TKgknMbr9kDINZk2+9jR9O2pysLZPGjXRLk0w5KHF3/4QxBDijN0WKqKVUkWY8brk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=RoLviM1C; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742216172;
	bh=Yqew+5d9VUxcHIE0Y2xG/uxOZ95oUAdna9dVeiJ9WMU=;
	h=Date:From:To:Cc:Subject:From;
	b=RoLviM1CnBl+5GbGizGTKyUlmvn4aNHSSkQhmQ8K076CR+nR650C5uPMnQJxADwJN
	 Pkuh8K5Leef4bE8HRNjmh9rGLIk/F2SpKNxKhnaOWCO3ll7wD2EfcdmBkonOXho8ks
	 f0NhVUPhjYKN6Gr33ATBol/4KUI88le2CIJmEaqxphcUy0YXmQlTeLJ1BWGDdx63Np
	 OvD81yJo2uMLHCpHru8IrmIR3TOGIG0anqEPpcq8FiNkmwlBuLIXpw4kDvuHi5hJU6
	 56bPhAJbB+7/BeVP088UBQ8nbhXD/gPNgA0HecXqrXWOZwX+wI6R/P2akBTY5tBtr6
	 n/Ip/0wojsD2Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZGZj80Z35z4x1t;
	Mon, 17 Mar 2025 23:56:12 +1100 (AEDT)
Date: Mon, 17 Mar 2025 23:56:11 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <20250317235611.28546a4e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BeicDFRAiMqm.SX4SNeEbLi";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/BeicDFRAiMqm.SX4SNeEbLi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs-brauner tree, today's linux-next build (sparc64
defconfig) failed like this:

In file included from <command-line>:
fs/pidfs.c: In function 'pidfs_alloc_file':
include/linux/compiler_types.h:557:45: error: call to '__compiletime_assert=
_399' declared with attribute error: BUILD_BUG_ON failed: O_DSYNC !=3D CLON=
E_PIDFD
  557 |         _compiletime_assert(condition, msg, __compiletime_assert_, =
__COUNTER__)
      |                                             ^
include/linux/compiler_types.h:538:25: note: in definition of macro '__comp=
iletime_assert'
  538 |                         prefix ## suffix();                        =
     \
      |                         ^~~~~~
include/linux/compiler_types.h:557:9: note: in expansion of macro '_compile=
time_assert'
  557 |         _compiletime_assert(condition, msg, __compiletime_assert_, =
__COUNTER__)
      |         ^~~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_a=
ssert'
   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
      |                                     ^~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_M=
SG'
   50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condit=
ion)
      |         ^~~~~~~~~~~~~~~~
fs/pidfs.c:877:9: note: in expansion of macro 'BUILD_BUG_ON'
  877 |         BUILD_BUG_ON(O_DSYNC !=3D CLONE_PIDFD);
      |         ^~~~~~~~~~~~

Caused by commit

  b0f4119d8b2a ("pidfs: ensure that PIDFS_INFO_EXIT is available")

Why would you expect O_DSYNC =3D=3D CLONE_PIDFD everywhere?

$ git grep 'define\s*O_DSYNC'
arch/alpha/include/uapi/asm/fcntl.h:#define O_DSYNC             040000  /* =
used to be O_SYNC, see below */
arch/mips/include/uapi/asm/fcntl.h:#define O_DSYNC              0x0010  /* =
used to be O_SYNC, see below */
arch/parisc/include/uapi/asm/fcntl.h:#define O_DSYNC            001000000
arch/sparc/include/uapi/asm/fcntl.h:#define O_DSYNC             0x2000  /* =
used to be O_SYNC, see below */
include/uapi/asm-generic/fcntl.h:#define O_DSYNC                00010000   =
     /* used to be O_SYNC, see below */

$ git grep -w 'define\s*CLONE_PIDFD'
include/uapi/linux/sched.h:#define CLONE_PIDFD  0x00001000      /* set if a=
 pidfd should be placed in parent */
samples/pidfd/pidfd-metadata.c:#define CLONE_PIDFD 0x00001000
tools/perf/trace/beauty/include/uapi/linux/sched.h:#define CLONE_PIDFD  0x0=
0001000      /* set if a pidfd should be placed in parent */
tools/testing/selftests/pidfd/pidfd.h:#define CLONE_PIDFD 0x00001000

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/BeicDFRAiMqm.SX4SNeEbLi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfYG+sACgkQAVBC80lX
0GyY0gf+Om71ATwURA0ZNDTEiFL0ADzKQ/H+Do/1GLgU1ie40KE4sxHJAHSgSGj5
5b5hB9OL3WB5l8FR9QM7hibqtWCRdYJEyWGgvemVBIAjyfC2sU5ug/tAriCz3aYA
V67Xm2sJPEpyLrg50HwwsNCVgA71YpMcpwKdH2MqcJ6aMRHRI22W/gXuldV5TgRF
yNNdf+GiCCsOvAv/eOkX8BbX/+y0rMJy9GfH6Okyx4OiL81Ns2CHXkwBF3amLkrI
4ASMGERoh/5Ex2FMqgrQzBvp2YrZ7HULPVzHEw7BGnmsN2ZQgrLk0jrWx68d1csI
TxUTyE57p5Ig9EnPC4+n625VP1gqaw==
=L8Km
-----END PGP SIGNATURE-----

--Sig_/BeicDFRAiMqm.SX4SNeEbLi--

