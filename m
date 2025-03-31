Return-Path: <linux-next+bounces-6118-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2D0A770F2
	for <lists+linux-next@lfdr.de>; Tue,  1 Apr 2025 00:40:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82F14188CA83
	for <lists+linux-next@lfdr.de>; Mon, 31 Mar 2025 22:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52D6B21B9FC;
	Mon, 31 Mar 2025 22:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="bGpsVmgC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DFB7D07D;
	Mon, 31 Mar 2025 22:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743460829; cv=none; b=h786uBghkHGovSljZuWo1BdqkWOd4S/k5FxfUIB4UQvkPPvVDy9TOErmnJDBS1CHPhoMoDTJXTG0jhBerxlu6qVmeUxKgZNHQQ4FDJj4qAKXEnM+CKQvzNoIgjNTORnIm7TN6HnCkhS8EPPNM4+zxjGHaIiIMxslcIrQiNVaWyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743460829; c=relaxed/simple;
	bh=iQB9yDpIfCwDgZWy6y/Bo80KU//A/LqOw128yZzQ7vM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jDNpzQETyvEPkywn8TlIFfsAo3kifgGEuwYoIXWknvymDM5zARvBqhlQ+kkf/CsqlEYzz/fVnK6bKJWNRUhpKkaqxYAC4nBJbjllc43DxBsNGgVKmyu8QW5I0rwmzTPoo8QiTzEgI/dJLnRAJzDRUTU/6SsBlJ8QiuulddrfZfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=bGpsVmgC; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1743460816;
	bh=6a071vbjMM4yLhuzqtXyUa/MWkBfNRxPkYX3M9A3WD0=;
	h=Date:From:To:Cc:Subject:From;
	b=bGpsVmgCjAmTAi1jpCfuurzQ6FTo96mlf4hPEWwYw7ORTxS3pqU4ODyMulJGge2fq
	 dG7mgyGsfdIY+EArNQzehmOBXjTguaEHMyCN6OVRWkzMZ1r4eod/llGF0mjWRjCBLS
	 2X9j8rKhk0+FT7Yz3V4TlpOs8zOasftZxCdfizvLi/Z4/biiexKWHQwbUKpwhauMEc
	 CY5yKZ+8M3HW+kuJrWuqCObN01qJAKWo3LrzPpTKR9hE85z1ecIoo9Xo7kccZ9tGq5
	 MS81QHSWDgPPn5qFtrzOtvsIoUSVullP+xd278rPwzjHkqp28CO1R25ZSn6p3EPo+J
	 99c1JlqiEuQOg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZRR0c4pngz4xG8;
	Tue,  1 Apr 2025 09:40:16 +1100 (AEDT)
Date: Tue, 1 Apr 2025 09:40:14 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the ftrace tree
Message-ID: <20250401094014.4134abe1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4iCEptGOdms15w_YocE/5aO";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/4iCEptGOdms15w_YocE/5aO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  0e5d1a4b22bc ("ring-buffer: Remove the unused variable bmeta")
  186a3d01d596 ("module: Add module_for_each_mod() function")
  34c9862b1833 ("tracing: Skip update_last_data() if cleared and remove act=
ive check for save_mod()")
  45be9d6a4e4c ("ring-buffer: Use kaslr address instead of text delta")
  47d1b7233ae8 ("ring-buffer: Add ring_buffer_meta_scratch()")
  4cb6fa440707 ("tracing: Show module names and addresses of last boot")
  7f335d104d30 ("ring-buffer: Add buffer meta data for persistent ring buff=
er")
  9042bbf70203 ("tracing: Freeable reserved ring buffer")
  aad5fa4e9de1 ("mm/memblock: Add reserved memory release function")
  bab85a646dd9 ("tracing: Show last module text symbols in the stacktrace")
  c6a1b7c2e58d ("tracing: Update modules to persistent instances when loade=
d")
  dca91c1c5468 ("tracing: Have persistent trace instances save module addre=
sses")
  dfc0b3249550 ("tracing: Initialize scratch_size to zero to prevent UB")
  e39a2f30d23c ("tracing: Fix a compilation error without CONFIG_MODULES")
  f20423262b36 ("tracing: Use _text and the kernel offset in last_boot_info=
")
  f5d0a66ca482 ("tracing: Have persistent trace instances save KASLR offset=
")
  ff700de3978f ("ring-buffer: Fix bytes_dropped calculation issue")

--=20
Cheers,
Stephen Rothwell

--Sig_/4iCEptGOdms15w_YocE/5aO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfrGc4ACgkQAVBC80lX
0Gx9kAgAjxqA/RTOu+vYhk3xcFgb2CkakEjB8V4YWhcoo4ykq9UtOoygIy/KQOtu
MkpPhYY1OHyixacr5MEq0n+71i07bWdQkkswHfwTu/iSQCZnJxiAzJ1Kl7jYp7r9
HqyI7BqmxvuCdwzjTux4f1a8qaj6Xa841unfd6M+Js6tEXFYtqS1Nbqi5pAkcFdK
K1wajK1uhEBw0w+X8bxj1pvlAnoC2I+G6nPiH8dO7sgzQtVRQpFqFkaBPv8maJ/E
/+qIwHD7Nmg1wN5nhuUvgsETZaMJFIkZAdSpMNqm3eBrN5UYqDs6FqqwPmFX0cPr
UKtx4eDPLvlZOQGms3wZAuXIyEfqyQ==
=1X81
-----END PGP SIGNATURE-----

--Sig_/4iCEptGOdms15w_YocE/5aO--

