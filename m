Return-Path: <linux-next+bounces-8679-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 795EBBFA0CE
	for <lists+linux-next@lfdr.de>; Wed, 22 Oct 2025 07:26:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 211B718C1A48
	for <lists+linux-next@lfdr.de>; Wed, 22 Oct 2025 05:26:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10A402E973F;
	Wed, 22 Oct 2025 05:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Hn48pNTX"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206782E8B7C;
	Wed, 22 Oct 2025 05:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761110762; cv=none; b=G7dQxVfRJ1Ns5Nzq11YS4ubwnDoZKC0ep1WtOL1MmAOFQzk7aOnZtUDba1vB7PjADVmFS3cyAIr+vcVIburaWHBDews2mfYt9o+VjFyVL/1ttupJxyWrgmg+S49f/wdpsdv/q7Z8A0hMC8Aqc2RZgGkvx9Z5KomeGrPEq/7nEb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761110762; c=relaxed/simple;
	bh=mXpas3Q7II2E3RIoc0YNALZ0k7lZjrC4FDNfZkG9wws=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=JFxuqj9HF8rKnGeJioWLNZ5q8GpNe4i7sfFwuKfQo2YlImuyTUqTZtTbg7elSRZBj15jlS2JV6qN2cdu8fAtkdSIBYzr+zkVsGMNw5Wypnfms5kbsWnsTrnMHSlHWJst1JOTxaBWyFxYFMpxBG+WzCTp4a8jmgUhWXsbviue7So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Hn48pNTX; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1761110755;
	bh=Czzn4YjA0DxoPNd1smsST42zqWunupnU/PC+dbX27q0=;
	h=Date:From:To:Cc:Subject:From;
	b=Hn48pNTXmbmy0HLGHugXg6Mara41fmRu4FlwF1r5eBInq3XSbdg9W4Ug6CpEerpTc
	 zMDglorDskudJJoadv4JKEzi9fGA+aNSE7ax65IJV+zrwkrVUjiYU+KK82IChi9xj3
	 NlYHOsAwE25JMDLi6ijibjHgHQm6PkLe5pwyo9S8J1iaTyrbTTjWfHLhX/rLvN7eDR
	 4O2h6ielaXzohBVKnuU7MU7kVywl2mVisMjo6uPkHZ5OYtaIXfx9POsudCp5Ozmubd
	 mvAJMV8lo3uhXxPgP5Vrh/gekeg2Yd0aUsKvKtMsB3ISvFwPx0i80Thrb3nArlDRBX
	 2N25eV2OMMlRQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cryLV6bXTz4w9Q;
	Wed, 22 Oct 2025 16:25:54 +1100 (AEDT)
Date: Wed, 22 Oct 2025 16:25:53 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jens Axboe <axboe@kernel.dk>
Cc: Keith Busch <kbusch@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, "kernelci.org bot" <bot@kernelci.org>
Subject: linux-next: build failure after merge of the block tree
Message-ID: <20251022162553.5dfb4df9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4Cy70XElTL/JV3ERhJ7mIjd";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/4Cy70XElTL/JV3ERhJ7mIjd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the block tree, today's linux-next build (x86_64 defconfig
clang-17) failed like this:

io_uring/fdinfo.c:103:22: error: variable 'sqe' is uninitialized when used =
here [-Werror,-Wuninitialized]
  103 |                 opcode =3D READ_ONCE(sqe->opcode);
      |                                    ^~~
./include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
   50 |         __READ_ONCE(x);                                            =
     \
        AR      drivers/irqchip/built-in.a
|                     ^
./include/asm-generic/rwonce.h:44:72: note: expanded from macro '__READ_ONC=
E'
   44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x)=
 *)&(x))
      |                                                                    =
     ^
io_uring/fdinfo.c:92:27: note: initialize the variable 'sqe' to silence thi=
s warning
   92 |                 struct io_uring_sqe *sqe;
      |                                         ^
      |                                          =3D NULL
1 error generated.

Introduced by commit

  31dc41afdef2 ("io_uring: add support for IORING_SETUP_SQE_MIXED")

See the KerneCI report here:
https://d.kernelci.org/i/maestro:764471d48b9e1faab06d96f79a325cdcf2a995b7

--=20
Cheers,
Stephen Rothwell

--Sig_/4Cy70XElTL/JV3ERhJ7mIjd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmj4auEACgkQAVBC80lX
0GzLvQf/XqMj9cyI3VRKC3CHrDrAvKoc++cyQw284WK6XLPsZjJ0DxBQWyt5xe/F
0yodv5ebJzP/KaF+HBHVaVCihu2sFX6GXHdO9kNnnQFaWVqLA3hAevfyTyv+kV7m
4e8lv3x8HIIYsKwJLttnWgkUAqm9F5wOD6C3eYBGQIIevkUNQs+9M7x2WRYpLnQs
cVzj2ZINDhbSYv7UQCmgd/hwp0VCbM6fpwIjmKRv0Fu6cCKk4xg4uY5zDMJ7dvbu
xlthtgjEZ+JrPkapChii41+gx5l5IudVA4iFXNaw57vRtND6cw8cus/H1PoT7K0f
fC5KBSiMsN83SYDqiFZWK4cANlI5KA==
=tgp6
-----END PGP SIGNATURE-----

--Sig_/4Cy70XElTL/JV3ERhJ7mIjd--

