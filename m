Return-Path: <linux-next+bounces-3631-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A85D96E73C
	for <lists+linux-next@lfdr.de>; Fri,  6 Sep 2024 03:19:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 501261F20F5A
	for <lists+linux-next@lfdr.de>; Fri,  6 Sep 2024 01:19:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C9C2175AD;
	Fri,  6 Sep 2024 01:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="oOgR6G11"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275041B59A;
	Fri,  6 Sep 2024 01:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725585546; cv=none; b=mhWSa02y90jk1zsj1QFuxHT+mtxEWBHIm7xZLN1fV2DbC9w0LB4O8ORUesU7d79NutHj3LRO/v15FufKT45PShs1AVd3IJuLiFs0XDapVqd/6dGux8Cb5XoNSGW1JGFs00Sn9kPUYFZTbUzc4suHYJjIcdSPP0QdvsTfHDYc/bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725585546; c=relaxed/simple;
	bh=DaOS58tkYZ9R0T9x9nOTDI8UAuA1wiCCz6gpazP5FQg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WH6yjTw3v5YLZowOCzyHGAHIPynhohB6VbpW7RMS157L6A2KA3KqN15Hw15AD6DLLK5sWis2y1UJ88Mc25ZMgYDoXjWUBjesgQ8TfbYN1SCGJllOcqHPRDEDZpmFf+7y0cTF/IcUgpiRC1j6K8i/1De9k2egT9Li8ecN1Otmq0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=oOgR6G11; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725585542;
	bh=7qY/Y8tI7PjAMwGMDySdZ2VUsQkVvbqnkJYUP249K2s=;
	h=Date:From:To:Cc:Subject:From;
	b=oOgR6G11C69B7+efy5++Kkx6DbOrmSULoy/5R/TD3BnAbKJQ3LuNqR32umdl0UpbL
	 kOtQSTvFU1yX0Zrl/N+zMy2uzS+dG7C+oOV2bRnOjrX83Cirj6QNmSWiGIrgWuEqPY
	 xPHElMQZYZM7e1Z8XO5NeiTjiglCnC8SwL+DCS1UD8GG+abhO7d+wISoDbrch8jLQi
	 JATqMHFl3UqNhWnB0YZskmN81YHqDiWqX2g07r5rkJsR0lTbuwFukT7QlEK5LbDx+q
	 QtvfpCHpbTD/yEqLz68pEpm4ItpjHBF2K9+d8IT49XjwnDyh/YVgCPhLqs17rfOxq+
	 NcHA2Kde5R21w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X0JKK1flcz4wj1;
	Fri,  6 Sep 2024 11:19:01 +1000 (AEST)
Date: Fri, 6 Sep 2024 11:19:00 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jan Kara <jack@suse.cz>, Andrew Morton <akpm@linux-foundation.org>
Cc: Josef Bacik <josef@toxicpanda.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Yafang Shao <laoar.shao@gmail.com>
Subject: linux-next: manual merge of the ext3 tree with the mm-stable tree
Message-ID: <20240906111900.5fcf345e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nfuKwau09XQQ1Nd+SSMRpjg";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/nfuKwau09XQQ1Nd+SSMRpjg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the fs-next tree got a conflict in:

  mm/filemap.c

between commit:

  0a2d82946be6 ("mm: allow read-ahead with IOCB_NOWAIT set")

from the mm-stable tree and commit:

  d23805138ac0 ("fsnotify: generate pre-content permission event on page fa=
ult")

from the ext3 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc mm/filemap.c
index 4fdd2e49f9dc,b722ce0ca6c5..000000000000
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@@ -46,7 -46,7 +46,8 @@@
  #include <linux/pipe_fs_i.h>
  #include <linux/splice.h>
  #include <linux/rcupdate_wait.h>
 +#include <linux/sched/mm.h>
+ #include <linux/fsnotify.h>
  #include <asm/pgalloc.h>
  #include <asm/tlbflush.h>
  #include "internal.h"
@@@ -3303,8 -3391,17 +3407,19 @@@ vm_fault_t filemap_fault(struct vm_faul
  	if (unlikely(index >=3D max_idx))
  		return VM_FAULT_SIGBUS;
 =20
 +	trace_mm_filemap_fault(mapping, index);
 +
+ 	/*
+ 	 * If we have pre-content watchers then we need to generate events on
+ 	 * page fault so that we can populate any data before the fault.
+ 	 */
+ 	ret =3D __filemap_fsnotify_fault(vmf, &fpin);
+ 	if (unlikely(ret)) {
+ 		if (fpin)
+ 			fput(fpin);
+ 		return ret;
+ 	}
+=20
  	/*
  	 * Do we have something in the page cache already?
  	 */

--Sig_/nfuKwau09XQQ1Nd+SSMRpjg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbaWIQACgkQAVBC80lX
0Gx3awgAlSNbiMvhcjw3x2pY0VcInTIA8QgyNQgjrzcZKfVzVb6D/9pJtqHzZv7J
G1UPDktNT+OUh5snm/s2UBSP1WQBdx3re1YITygv2IBgievbWP/u7FZG/DqrJEfq
QdQQmAwVBh8U/rWs2h0GzTNy2uOIpyFcyqpLBa+dlC/Ne5XFlHlHWLeq+Jijzvcl
bTYEIjYl2/ooJLdOusrwN6S1tukIoL/yvUKMG/frEb7S4n7Uec2o1owLctldq8pR
iO3XM6pR6CwGU2Um6VXRGT9PFR0i21OHHK+Mnzgjjd/cIrO7dCWqHg9Xc9KLkB7m
6aOoaheKDIODhd4N8WohEPHewiLRKA==
=xzAi
-----END PGP SIGNATURE-----

--Sig_/nfuKwau09XQQ1Nd+SSMRpjg--

