Return-Path: <linux-next+bounces-7352-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98733AF8653
	for <lists+linux-next@lfdr.de>; Fri,  4 Jul 2025 06:16:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0D7387AFB34
	for <lists+linux-next@lfdr.de>; Fri,  4 Jul 2025 04:15:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82BA41367;
	Fri,  4 Jul 2025 04:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="KI68NQy0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD412DE6E3;
	Fri,  4 Jul 2025 04:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751602608; cv=none; b=gOHvLP23254TpLTY8r4sauvBiJ1XDOqumGcd5nkbFgY9S2MppakXFtZmCvX3I7W2mqahopW+Jg2m7zYs+KT/qyOZROK7/xPZfAAIfLV0sasc+Z5EerR4alyrs1jfbnuLabCb5G3ShfV3/4+g12AmGdoy5i4sfjUX26L5MYcUaBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751602608; c=relaxed/simple;
	bh=sMdhIRRts9Kmh+aiumvsj8e4PSCqDDgU6wbd7dwpwPE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=E+JzOinOBJ9IB0v9IPJZkHnPT9y4c+HtMEWPsEYEPoku3PUBXXcMoQhQbPVUxmXTNp/FFW9SDqTUOsSeb/ddA1JkJ7OAPLqD/VtUTWPFBdR5/5WE3FtJwJNrCWlVL3GhdB1+a6WNh5/P806f0vcewLrG/EamS9vctNIsAyvflAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=KI68NQy0; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751602568;
	bh=I9bXgNvI7TrFHTydazylNLmlw2hatjhuqfY9fq8n1/w=;
	h=Date:From:To:Cc:Subject:From;
	b=KI68NQy0HdDAkm0Ss9W0zZwDx5JBvPxWJiqDDIWV593eKTFOTDNQMrFgynsE6+rG8
	 rmiRgngCffcrLuT9jzpVpXSRRqsRZOn7tjwpbNt0cJBy9V01A98nvdiuTblIFnsjPR
	 Hc+eVwXWAcapfWEkRouRvR6SbfVxRpzx5X4g1iFh3xK4W1wm7/bOAuN4YDkDjIrUAh
	 X/OWug4RJpOsh1sK5RLp+akpA+5fioH7y0r46nHioc9tkryj0f9F7vRFbF6DmuPnez
	 +D1kF/bZXI6Vu6eQa8mlfETo3FsRLwTZzJFx7Xhn24jYQDMWGPpFsVzeL7ixSp60Wq
	 IpFRnHVFpuahA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bYL0m0bhdz4wvb;
	Fri,  4 Jul 2025 14:16:08 +1000 (AEST)
Date: Fri, 4 Jul 2025 14:16:35 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Eric Biggers <ebiggers@kernel.org>, "Jason A. Donenfeld"
 <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>, Linux Crypto List
 <linux-crypto@vger.kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>, Heiko Carstens
 <hca@linux.ibm.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the libcrypto tree with the s390 tree
Message-ID: <20250704141635.57ff7b16@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fCFUZVIEdgTWEINU4ZEfIpR";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/fCFUZVIEdgTWEINU4ZEfIpR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the libcrypto tree got a conflict in:

  arch/s390/lib/crypto/sha256.c

between commit:

  65c9a9f92502 ("s390: Explicitly include <linux/export.h>")

from the s390 tree and commit:

  1a8f59dfdca0 ("lib/crypto: sha256: Consolidate into single module")
  b8456f7aaf35 ("lib/crypto: s390: Move arch/s390/lib/crypto/ into lib/cryp=
to/")

from the libcrypto tree.

I fixed it up (I removed the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/fCFUZVIEdgTWEINU4ZEfIpR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhnVaMACgkQAVBC80lX
0GzZtAf+NpRAyxFql8FX/wizP5xXftFrsM3RyXyg8ovjfKeGNT/5c4RQS3lr0DGD
E+/6gkZhqdaiYSLt93dmcnG+YtZ0hhvhcC8INx7IgHSOfsWRwGgMKvBL2md1Nb8h
ZCHm/v2yZ7QJMqDf3FwDKbuIwRHsACeyhPewLKHZ0Tc//+zzLYaarzha6TH28M7v
2E6hJJS+C6KX/ig1IWjkJ+9UfD6VVhsoWqRlPIptCe5PLWSGUvjJye+9enx0dqjS
hbPOEm+hLlp3hkpweyefAGmgT/VOIkyW8910kGAvKadfFhpm7rXpkFUSmDJkmHQP
BylBT4yjspQ+wZxvk3bGUlvFWBbb6g==
=vM2U
-----END PGP SIGNATURE-----

--Sig_/fCFUZVIEdgTWEINU4ZEfIpR--

