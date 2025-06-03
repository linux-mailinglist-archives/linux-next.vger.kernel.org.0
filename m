Return-Path: <linux-next+bounces-7020-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 50803ACC055
	for <lists+linux-next@lfdr.de>; Tue,  3 Jun 2025 08:39:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FAA0172DB2
	for <lists+linux-next@lfdr.de>; Tue,  3 Jun 2025 06:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8BB81F4607;
	Tue,  3 Jun 2025 06:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="SR61zG5P"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1030A4A1E;
	Tue,  3 Jun 2025 06:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748932779; cv=none; b=VdQcKVCRyDRRBsvHyDHITewqc1OVTTC3SYOIsHL8xKjKL2c+0StHNLn0rZ2pHvWxRgNsSwYSsoEuvfECLefz5jAHJc8h9brgxYKbTFyQFx9hmxYnmQhX7KsOEUr5SlgLkq4JWZ6QUhIUpZ6F7yX6tyeYj6TvfCSUd22Z9hZSU7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748932779; c=relaxed/simple;
	bh=D1/a+GvMV8YPHhVUub5/CYKXmriD9L5qW0wpunttUl0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dTws8/9QyJ//L63dMsy+bTmoL7dWJVMwdrTkVTShotf1hF+5zJ8P9SZQIlAplcAyAtpeynObO3pPut+QMTc0CPEhl+d/UMtUwSbVi53LBfj+Z02GCzO7Y7T54GKbV31PThylf5rGWILmaBpubXphYbqyOCMSnJbxaTujf/9RrfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=SR61zG5P; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1748932774;
	bh=+tt/mIECRhIxSHIdLvnzsuR78acib5ceTa4QHVOV7BY=;
	h=Date:From:To:Cc:Subject:From;
	b=SR61zG5Ph3fnQAw90G3gKTHAflJegDGaofLmLuUNcGOuxUBwCq0WtZkLbc56LVp2q
	 pLgVMK/yQqfJhSVI4sqsJ+uQoA5R0DGhoH4gKL0GIx/ex1EseBvX3ns4y1ZJbrdZaa
	 UodzxVXlGunQrIgWWCXg8nhngzVRUhxaeRvnLbEpM9CUmTJ0KrpBwWSKX1RoHiYhqB
	 v5bjgppohis9XTCFi3Vbvp2FxRCeZXiFOwIGY24Q5plRsth2FJ6nNUKHdULU17YAqg
	 tqL/Gny1avY2togO/kxiqF3aCAfQrn6YRr10jxLXRirSMCVaavEZ+TZwPq5SOO3CLF
	 y9g8dB2wA1FzA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bBLfZ1KVWz4xqK;
	Tue,  3 Jun 2025 16:39:34 +1000 (AEST)
Date: Tue, 3 Jun 2025 16:39:33 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the kbuild tree
Message-ID: <20250603163933.4df366ff@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/l8WN/j59CGbN_5k6_f6kMbW";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/l8WN/j59CGbN_5k6_f6kMbW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kbuild tree, today's linux-next build (sparc64
defconfig) failed like this:

sparc64-linux-ar: unrecognized option '--thin'
Usage: sparc64-linux-ar [emulation options] [-]{dmpqrstx}[abcDfilMNoOPsSTuv=
V] [--plugin <name>] [member-name] [count] archive-file file...
       sparc64-linux-ar -M [<mri-script]
 commands:
  d            - delete file(s) from the archive
  m[ab]        - move file(s) in the archive
  p            - print file(s) found in the archive
  q[f]         - quick append file(s) to the archive
  r[ab][f][u]  - replace existing or insert new file(s) into the archive
  s            - act as ranlib
  t[O][v]      - display contents of the archive
  x[o]         - extract file(s) from the archive
 command specific modifiers:
  [a]          - put file(s) after [member-name]
  [b]          - put file(s) before [member-name] (same as [i])
  [D]          - use zero for timestamps and uids/gids
  [U]          - use actual timestamps and uids/gids (default)
  [N]          - use instance [count] of name
  [f]          - truncate inserted file names
  [P]          - use full path names when matching
  [o]          - preserve original dates
  [O]          - display offsets of files in the archive
  [u]          - only replace files that are newer than current archive con=
tents
 generic modifiers:
  [c]          - do not warn if the library had to be created
  [s]          - create an archive index (cf. ranlib)
  [l <text> ]  - specify the dependencies of this library
  [S]          - do not build a symbol table
  [T]          - make a thin archive
  [v]          - be verbose
  [V]          - display the version number
  @<file>      - read options from <file>
  --target=3DBFDNAME - specify the target object format as BFDNAME
  --output=3DDIRNAME - specify the output directory for extraction operatio=
ns
  --record-libdeps=3D<text> - specify the dependencies of this library
 optional:
  --plugin <p> - load the specified plugin
 emulation options:=20
  No emulation specific options
sparc64-linux-ar: supported targets: elf64-sparc elf32-sparc elf64-little e=
lf64-big elf32-little elf32-big srec symbolsrec verilog tekhex binary ihex =
plugin

Caused by commit

  833726f654c7 ("kbuild: replace deprecated T option with --thin for $(AR)")

sparc64-linux-gcc (GCC) 11.1.0
GNU ld (GNU Binutils) 2.36.1

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/l8WN/j59CGbN_5k6_f6kMbW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmg+mKUACgkQAVBC80lX
0GzQngf+PbFleuwCySPFei1dTwLmlNuETzgxeO41DflwY8btIQnfXidlu3PnW9UW
KdbZxDxVjVlH2VMiG4GQTeeNYrWKPVBqd6hAZSskeeGGK+T+VoC+/ZOQms6qAKLk
yn5Rw7EUOM5Pmk5qqgiUMnJXBziKudL9bCGTxSOKz9X2pyxFRFz+W9uLb+1jEA6y
h8LBm1+Lx6HoeVOEJJDZpWEWc7Gz0rep8q8vga9HAfKm/NrEUTOnxE50GZAsW5ru
PRHElOaeYTIqsfEa1wtWlK+OE42Vx7X/Zhp4CC8GotChcKgqCGMvCkijskhW7scl
cLD7PPUKzD8VpGuPQc+tTXLxGiIUnA==
=71/3
-----END PGP SIGNATURE-----

--Sig_/l8WN/j59CGbN_5k6_f6kMbW--

