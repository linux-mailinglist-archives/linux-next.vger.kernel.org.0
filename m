Return-Path: <linux-next+bounces-4468-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DC09B23C9
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 05:10:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3BF51C20A02
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 04:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ACCA16A395;
	Mon, 28 Oct 2024 04:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="BgmDaTW8"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B220080B;
	Mon, 28 Oct 2024 04:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730088629; cv=none; b=Q9bZFlsIl8hFdVIwwRizFK67uO7PTmU1AHoUzYTTPmpyMvykZH+HNS/fkC4QT48WkylIhvKlMGvyu2euCS0Pyeswa/iR6uXuGnad9oTxvDlNK7oaGOilgzsy/t020Kp6pBsYJtvR+VVCB9szU2Z8j2kV+sJPARGg6JyScE4A5NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730088629; c=relaxed/simple;
	bh=Vv9SVYY9mDZHTGgs1YYHJzdiRQVFPpvCPq70k4UE18A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rxIiEQHV3vkkCys2nP19ho80Wznc1ddnqW62wmfPGxjVyOepgFh3clNoIz0pMA5mXI4uZmh9YKuflLYg7jSIIupDA2DrA12FnLF5dBzpeOWNQhY8yXKqd78U5vGOW7LXPYzL+BtEb2Q3VVWhe92yQl7P493G+beH4krtrIiFye4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=BgmDaTW8; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730088619;
	bh=LOGUl5/xUjF9ph4ttkwMOUs/A5aXfjmHZl57mx+KDxU=;
	h=Date:From:To:Cc:Subject:From;
	b=BgmDaTW8glYu211mgXIIx8lmiAlkNJhNGYg2JQ5vGm11RAp71+W2LO58bLb9xmZbh
	 dtG2dfmjFzXzEI4CWw8nFrEHJjSFiRSet7Jzy/dsCRUjcTfR06T0jrKgQHRdRGVDaw
	 CaWhzvtQ+c8FsLtay+M/XD42eG/WNuqTtB7ybV32oSDqMNhWKBiAVwjwZwjf8nYPM5
	 p1JCSmQxgI9mYV9IMPbU9LQKlh7/k5CEkULYmAMmGO6nvDKstOnfOxamG5ikZ8zdUw
	 XCJEXulFKg7JtJWrrc8dOWb6XEMd51IgoYcCXG235QhW5HGwz3qtKVXoBRymqB50nf
	 gr9COEHxBAhog==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XcKfz2rsRz4x5J;
	Mon, 28 Oct 2024 15:10:19 +1100 (AEDT)
Date: Mon, 28 Oct 2024 15:10:20 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Marek Maslanka
 <mmaslanka@google.com>
Subject: linux-next: manual merge of the clockevents tree with Linus' tree
Message-ID: <20241028151020.32157f3f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/je_eMV=QGjRQOOyYiijf0n1";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/je_eMV=QGjRQOOyYiijf0n1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the clockevents tree got a conflict in:

  drivers/platform/x86/intel/pmc/core.c

between commit:

  5fa607880168 ("platform/x86:intel/pmc: Revert "Enable the ACPI PM Timer t=
o be turned off when suspended"")

from Linus' tree and commit:

  d7a87891e2f5 ("platform/x86:intel/pmc: fix build regression with pmtimer =
turned off")

from the clockevents tree.

I fixed it up (the former removes the code updated by the latter, so I
just used the former) and can carry the fix as necessary. This is now
fixed as far as linux-next is concerned, but any non trivial conflicts
should be mentioned to your upstream maintainer when your tree is
submitted for merging.  You may also want to consider cooperating with
the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/je_eMV=QGjRQOOyYiijf0n1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcfDqwACgkQAVBC80lX
0GwBngf+JrnHKbyyMp92zk1vBvEVGN4ogLOpErDaebhhCwPJeGzTlBkWiIG4JdtU
q9NA4MpzwjAUruCJpAYx4qABol+dGzB6hEdSyjI8kgRDCSSZLmrlzaedjqmLa6zW
iGT/ZI61Zo214u8137AftIypbu1Q0P5ugB/VcAUUyH8WoYoZ2YGGYgBESmcwKwQZ
3grNxAwmr15l9mODfDtrMco+FrO1lqz3QpZVzjoMI7Dxiz+/jJ/2JmFnkyS+PKQn
LQVVVuRy65092gWln2Ehyx5gbp4vE04qqRp+N1WMkjblbt3GgGrKIV6LM/5FuCh3
v5JPKneJHejgqxxNY9rV7R9eFlQxJw==
=RfAC
-----END PGP SIGNATURE-----

--Sig_/je_eMV=QGjRQOOyYiijf0n1--

