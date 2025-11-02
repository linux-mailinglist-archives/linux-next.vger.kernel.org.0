Return-Path: <linux-next+bounces-8791-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4D6C29973
	for <lists+linux-next@lfdr.de>; Mon, 03 Nov 2025 00:08:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 252F43ABCBD
	for <lists+linux-next@lfdr.de>; Sun,  2 Nov 2025 23:08:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6622E20F08C;
	Sun,  2 Nov 2025 23:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ni3GNGq8"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169F8846F;
	Sun,  2 Nov 2025 23:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762124883; cv=none; b=pyD0MdZD8l2GOw2fzIEJxbs4fEVjnob0dLNwB2aqr0wOn7YK0M7GIBzk0QUAvf6jvszNyv2nCVXeYskDn0ZTvzfor7AxkONN8JQis3qWfGvpRwqQJV21TyUwFUvdfFDGJuuZlOLMXSxolMjQg5UU9zLvbfhB5DSNjdlqRpF+f54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762124883; c=relaxed/simple;
	bh=Mmsz4AsAPrgzvy+/DPeF0gUarOJZ9zlb61UAEWNeghM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XJOeVLQCuQV3cElsxxbrFCxml5oOY04vHXPTF4OG9uf6GT7679gLbTwqu5JpmOKpyNQGFnzEWVaSmg9dF0RfwmIRWB2JlTnuJrBG4xFDYil1lSuPHdAC5qcwmJJ3zZ7b0kiE+1aoT8RKH2tTm+pYSoOMoRjvD0GlKDfJszZCdLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ni3GNGq8; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762124873;
	bh=fCH5++WfvKpTknvdl0m4vyQqVpmFKtADZZLeJc7HYao=;
	h=Date:From:To:Cc:Subject:From;
	b=ni3GNGq8yTM2J5vHa6ElQMcricCHBD4aHfX+WPxXSplgOo3+5LNmtuEVbAUkEC8v9
	 6HsGPjGhhN4gbHSY4MB2WKcf0e3GaZRHyj2v4Gue6iaCpScx2/Xlo9ctu4KeUdZbV8
	 9z07GkkuCbPcWM5ker+chfgy1z5rX7qYW9LrvJMO8QE8+GQaVjb00IUN1rm3VnWeoX
	 MKHnxyOX9sgt2lCjgP4hr4QWNhHmq6uLLEFjMC9T4axRfxly/nWrKNib9/XRrDw/k/
	 rLL5eLI/f02Dt7od1wJdUFje3MMa/rkWC+mThNo0kk3UbeAkWj1cW1Qj63WFZEkOwb
	 QfIgi2ekKJCUA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d09Nl6dM1z4w93;
	Mon, 03 Nov 2025 10:07:51 +1100 (AEDT)
Date: Mon, 3 Nov 2025 10:07:50 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Israel Batista <linux@israelbatista.dev.br>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Sumanth Korikkar <sumanthk@linux.ibm.com>
Subject: linux-next: manual merge of the s390 tree with the mm-unstable tree
Message-ID: <20251103100750.4522060e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/e429RH3BDT+DdvNkIbp8xSw";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/e429RH3BDT+DdvNkIbp8xSw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the s390 tree got a conflict in:

  include/linux/memory.h

between commit:

  074be77d684a ("mm: convert memory block states (MEM_*) macros to enum")

from the mm-unstable tree and commit:

  300709fbefd1 ("mm/memory_hotplug: Remove MEM_PREPARE_ONLINE/MEM_FINISH_OF=
FLINE notifiers")

from the s390 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/memory.h
index ca3eb1db6cc8,ba1515160894..000000000000
--- a/include/linux/memory.h
+++ b/include/linux/memory.h
@@@ -64,21 -64,9 +64,19 @@@ struct memory_group=20
  	};
  };
 =20
 +enum memory_block_state {
 +	/* These states are exposed to userspace as text strings in sysfs */
 +	MEM_ONLINE,		/* exposed to userspace */
 +	MEM_GOING_OFFLINE,	/* exposed to userspace */
 +	MEM_OFFLINE,		/* exposed to userspace */
 +	MEM_GOING_ONLINE,
 +	MEM_CANCEL_ONLINE,
 +	MEM_CANCEL_OFFLINE,
- 	MEM_PREPARE_ONLINE,
- 	MEM_FINISH_OFFLINE,
 +};
 +
  struct memory_block {
  	unsigned long start_section_nr;
 -	unsigned long state;		/* serialized by the dev->lock */
 +	enum memory_block_state state;	/* serialized by the dev->lock */
  	int online_type;		/* for passing data to online routine */
  	int nid;			/* NID for this memory block */
  	/*
@@@ -101,14 -89,15 +99,7 @@@ int arch_get_memory_phys_device(unsigne
  unsigned long memory_block_size_bytes(void);
  int set_memory_block_size_order(unsigned int order);
 =20
 -/* These states are exposed to userspace as text strings in sysfs */
 -#define	MEM_ONLINE		(1<<0) /* exposed to userspace */
 -#define	MEM_GOING_OFFLINE	(1<<1) /* exposed to userspace */
 -#define	MEM_OFFLINE		(1<<2) /* exposed to userspace */
 -#define	MEM_GOING_ONLINE	(1<<3)
 -#define	MEM_CANCEL_ONLINE	(1<<4)
 -#define	MEM_CANCEL_OFFLINE	(1<<5)
 -
  struct memory_notify {
- 	/*
- 	 * The altmap_start_pfn and altmap_nr_pages fields are designated for
- 	 * specifying the altmap range and are exclusively intended for use in
- 	 * MEM_PREPARE_ONLINE/MEM_FINISH_OFFLINE notifiers.
- 	 */
- 	unsigned long altmap_start_pfn;
- 	unsigned long altmap_nr_pages;
  	unsigned long start_pfn;
  	unsigned long nr_pages;
  };

--Sig_/e429RH3BDT+DdvNkIbp8xSw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkH5EYACgkQAVBC80lX
0GxwXwf9GP9Y8nYvm1QzAV/4Vfn3V/zgZaKDAnm9ZZyhlhEEcor6nLGXIfAhPHV8
HGY3KAhogff6vCGY5YNQxaa8HuVnK+hId8dKzpFcvORe5DgmvzpdFs2+jepKPNBK
GmNuz7bN3AyJOVAVyOV2ceuvUe4nV7AgH220J1r5JggkaUDsPQWfzTYtw+5tjfIK
3gF2pMpQyP02q924YnjBENtZXOKDmuLHYNqkcU9JiH/QAXXJvMh7I/GmykWIkmog
/VaFwmBcx3DDZXxTMDIE2WvUwnThKzjgVb7ly3raGgp6kLDwRTdaFCJ3eHAM7gsO
GQf5wHdVBGv6Cmyzxe6sRBba69sGQA==
=vbzc
-----END PGP SIGNATURE-----

--Sig_/e429RH3BDT+DdvNkIbp8xSw--

