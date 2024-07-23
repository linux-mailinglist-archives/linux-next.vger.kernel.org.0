Return-Path: <linux-next+bounces-3103-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE05293A975
	for <lists+linux-next@lfdr.de>; Wed, 24 Jul 2024 00:49:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59FDD1F228AC
	for <lists+linux-next@lfdr.de>; Tue, 23 Jul 2024 22:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6B88146A6E;
	Tue, 23 Jul 2024 22:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="dRGlt/ui"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B857628E8;
	Tue, 23 Jul 2024 22:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721774954; cv=none; b=Mb0DYM3zx9lmeO/gdpDehHWWNMd1vGZ6ph1Xe/E5lYY/9Tcxb5UEA0lTllSNUw5JbFbE2j3eqwQq+dVG30NnE7gkNkuoYfovEL4Sk6nrCkV6du7HcpNwV4xULQb7spQFqKhj2NMHkfyDjptRXqBNAdK5+8ojJ6aVSEDeDdy5L3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721774954; c=relaxed/simple;
	bh=kfUDyN4oBaPcr5gpAgQf9lf05rKE46HWWZZzb9qPNuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GIy+GPfOOuTF9bzLKs4lcxiKReP4bJSUUyALpzJQqV5K0YS3bMrwyat4pAgPpt7qNecmjHjy72+euhj3+PYAchvrGOKXSfuiiSlTlxjqVINxsDBbEalej6lKE6D6iJjytVZe9LdSwWUOE8XDkKK3tWSn0dtvPdbcXcRDQu5QEv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=dRGlt/ui; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1721774944;
	bh=VlUu3IpODUV/ZAtKdUMXAzyXBBgLWgqfNodC3YJ+3iU=;
	h=Date:From:To:Cc:Subject:From;
	b=dRGlt/ui2tmTYzDMpBaUs3OaMJXPkiUsDYQ9wXD4YQZApxbAImiHMU7cLgw3bz136
	 fYUgFYSCprB3k2DOFQmwKkBAJ8G4x+s9i68fyVtWo7KLOte0ekBx0E3nblh+zDZBlA
	 J6DracxH9Bl0bA88qcYEHUXuXQVB/Xmc6uFurrVpxzp7jnlIjOhGDMFg1RUXSCOQLE
	 4Cw/ZfcgI+ObknMkbxmHdLqGpmueOkeC2V8JbteUDh4I8bDBAEvBvpRqmUF+5/UQZf
	 cLsgM9FpBRKtGeLhTecAxu6LRqCXuxzlQ3Rye9ktFmRLWTKK5ef/MgNSEB6KtoeWq0
	 wBJgr5z7qXNbg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WTC4c3JBrz4wZx;
	Wed, 24 Jul 2024 08:49:04 +1000 (AEST)
Date: Wed, 24 Jul 2024 08:49:02 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mm tree
Message-ID: <20240724084902.0843304d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.Ko6Qqmn._gBbh.nf_NcZaV";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/.Ko6Qqmn._gBbh.nf_NcZaV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

In file included from mm/vma.c:7:
mm/vma_internal.h:46:10: fatal error: asm/page_types.h: No such file or dir=
ectory
   46 | #include <asm/page_types.h>
      |          ^~~~~~~~~~~~~~~~~~

Caused by commit

  b102945dd5b2 ("mm: move internal core VMA manipulation functions to own f=
ile")

from the mm-unstable branch of the mm tree.

asm/page_types.h only exists for x86 ...

I have dropped the mm tree until the end of the merge window.

--=20
Cheers,
Stephen Rothwell

--Sig_/.Ko6Qqmn._gBbh.nf_NcZaV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmagM14ACgkQAVBC80lX
0GydPwf+PcC0WiazNrGsMm6tTg7HcaeDrAyrGjpy6B3TxVx4VpsPRre+higOGFsj
wSR7x7wVWPdMr9NVWFa5BLF3O6h1nWLY7Guq3aFMOB8c2moFufwYyoaSjYdXTagV
3ocecDGYAsohDWpeTBflGlMBt6Fw/4AdemPXd6kCDl4RpvxKLRKGjI9PH4aewVDh
kOnMAZzoqT0PJZFnUSWj5ENjvvP9+1dlTRJvBTHRQUkOk+U88BoqPDWAp96AloP5
yAzRArRfA6/+l5GBDKIpz5vP9XOi88D2P5dkS5RoLjCW6heF98vq64aINMUng8Zb
aO7c2SGPCQLisHVfmaSP5YjCfVb6BQ==
=z2Dn
-----END PGP SIGNATURE-----

--Sig_/.Ko6Qqmn._gBbh.nf_NcZaV--

