Return-Path: <linux-next+bounces-7271-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E22ECAECA98
	for <lists+linux-next@lfdr.de>; Sun, 29 Jun 2025 00:10:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA854189BA7A
	for <lists+linux-next@lfdr.de>; Sat, 28 Jun 2025 22:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4CEE23D29D;
	Sat, 28 Jun 2025 22:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="MrSx8MGk"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4354943AA1;
	Sat, 28 Jun 2025 22:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751148628; cv=none; b=VOzwbY++h+8M35T2x9ZgfeQcDXcFtlyXfD4nSBYSa2zPNY3dycFUZgLctPP80X/ZtDNpCCJgC6pN3Qg/chd90D58M8Lm6le6FS+sEdGOIVbhFtpOOYHvtJuh1VYOjHf2sxGnMjtDAWX+S5e3m3Cc8L07k+mvEBPNC2X3aXAWec0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751148628; c=relaxed/simple;
	bh=7CWQ4hkaoBog1HgMHx6+xqgzrHRz5+hBkn7Mm9goa3k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IpNMTiV39qFOr/F74K8bM1yWten1tCyrqzyy1rrDmLy1fYnvzi+PSf0eu1hyOIX4gD2F5JqiwzS5TGSxMtdUoRJE0YN8N3KZ1GgdATP3ke4361qybGavMIFZzubyoK32H/eMGelejli1UE1wcSGlAL4mKXDGCXjOITfhTusSiIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=MrSx8MGk; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751148615;
	bh=5mw9JnC+kRPNRmMSuXtByqvTNgQUPImozED06B1Nbrs=;
	h=Date:From:To:Cc:Subject:From;
	b=MrSx8MGkb0BTwSgcUc41+jlZgXMEwfgZ0HgUJjmaISMMSz1zyciTyvniNuTf92yH4
	 hFmWtxMNR2XvX7/vzjH8Y0VNPWu9Bex2QsAHDl70qrbVZOsFg7uT08EPrrQ9mReH4F
	 dbvUeOGQsRxymz749hb809IvWXF8YDFV7NW3kyid8tUgnCpYb2/r9EXfJ75w5CzOEE
	 mADg5VXmNAPFPXt45cJLYTXzSqvxR5QqSsilgf4kNIG5wdwiOmsTzNPi2gA9wj/fv1
	 EWXOjEv+y9zkxbTToJMVAvvu5A7EIXbp7/13+6yUcxjdALjVMkgK8qbDtT+aQ8KxUj
	 RMmh9H2PAi3ag==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bV66t5KJsz4wcm;
	Sun, 29 Jun 2025 08:10:14 +1000 (AEST)
Date: Sun, 29 Jun 2025 08:09:50 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the tip tree
Message-ID: <20250629080950.29338ef2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EMeKWmSeRmJJLyOmIB=Ut6.";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/EMeKWmSeRmJJLyOmIB=Ut6.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  4584f5907e79 ("bugs/core: Reorganize fields in the first line of WARNING =
output, add ->comm[] output")
  62aa47bc0273 ("bugs/sh: Concatenate 'cond_str' with '__FILE__' in __WARN_=
FLAGS(), to extend WARN_ON/BUG_ON output")
  58e421837e2f ("bugs/parisc: Concatenate 'cond_str' with '__FILE__' in __W=
ARN_FLAGS(), to extend WARN_ON/BUG_ON output")
  776914942311 ("bugs/riscv: Concatenate 'cond_str' with '__FILE__' in __BU=
G_FLAGS(), to extend WARN_ON/BUG_ON output")
  4218dedd47c7 ("bugs/riscv: Pass in 'cond_str' to __BUG_FLAGS()")

are missing a Signed-off-by from their committers.

--=20
Cheers,
Stephen Rothwell

--Sig_/EMeKWmSeRmJJLyOmIB=Ut6.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhgaC8ACgkQAVBC80lX
0GzHlQf/S+38aQFkoUB7DBIF+lOwKw0jN0eiQ8N+PeY/WJ/EXaCjrTxaQD8AVvD5
biDu/5zyXembZfOr15ye/PDBexSyUfUcae71qSDLzeimYlKF9fWNe0Y53Zuyf+a6
99v1Yed2yyDNrRRFE50v7kbe4G0PxgwEqMJAUbNIZ//v2u3iZsMgKcdi7KF/RNWF
UzzhVzpPowca3GVD97NK4FrljIt0Rxq4YgT7QWA+RmONILMIMzECGUCFKCWWpdMK
Fdc5BT8x3nwf6nnMXSAj4F/jERUL6by6Z6WW1L7MUe47lTH8c4k6rdqPrVZcxFex
nj6cJ35MWPDFi6yMjj+PggRzuPCgQw==
=XwNx
-----END PGP SIGNATURE-----

--Sig_/EMeKWmSeRmJJLyOmIB=Ut6.--

