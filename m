Return-Path: <linux-next+bounces-7152-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 654A8ADA54B
	for <lists+linux-next@lfdr.de>; Mon, 16 Jun 2025 02:59:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D58A3A860A
	for <lists+linux-next@lfdr.de>; Mon, 16 Jun 2025 00:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2988B12FF6F;
	Mon, 16 Jun 2025 00:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="b9Pm9JWn"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526BC3594C;
	Mon, 16 Jun 2025 00:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750035539; cv=none; b=Sw18fC2pq4ziScT4wvFwN5JfPom8Dfv4IWux2IW35RzxcmyuTEDZL9oQir5a19cH6J5tdlh+3rpYaI9tM+xnp/tL7/mk1aLQ/vq+N9sHGbzZBxL+ww9XIO0nFhFeJQsW1wDMzKvF2QaaSumvkR0+cMBg5Kz9FvYGDtlmmD//2Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750035539; c=relaxed/simple;
	bh=f+5FHwXjcgYzYzIr6jYjN7qg/BvvqdDTBT3QaseGHbo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=PoTCDi3PqEE1lxaMskzxsDqc5/+BVBkE03Zl1ZNp6Jsg+JEfTncl/EXz7xaZniK54pWf0/wsAWI6nNrrhHmvakQqTyQj89Bns0UXTdHBMmRXWBpcJvtBCHk096+bovQxho/NqCphRmzgIuF21vSXV+za1MzlC/R7T4ku1ECOVoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=b9Pm9JWn; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1750035528;
	bh=VhttZDbhEWQy1S6BcWWgxQBLezIKUgoVvz0G55l+Pz0=;
	h=Date:From:To:Cc:Subject:From;
	b=b9Pm9JWnVy9RdfBi9/hDcGi+OJNnIUYUEncTHQtjsyMePPfAvBZxC6FgPJ3z3r3Km
	 0/RNx4MW91fOclEevJJmd93+gz9uzs/nDUjurJaNxmBTKJfEfLIHUn0lXpEp4hBKZq
	 C3pMOebbTGtlqfp5S0Ppo58U2XK9pDfznTt3pDE1/iWuHTqvZF5twOk4C9zERhqOTR
	 vKwUSwZLjmelaFnucW2DGGleTfRS0ssti+JyMg9iqpNvl2MJ3t9YGLhnYDF0iNy02Y
	 /yMKN07MXy8/01OAwaIpPXBgrTE0ZeUUOlHX6YElxzyflEr5MiwQdViw42iq5hDCV/
	 7qyIDcM15LI3w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bLBTM600Cz4wcm;
	Mon, 16 Jun 2025 10:58:47 +1000 (AEST)
Date: Mon, 16 Jun 2025 10:58:46 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Al Viro <viro@zeniv.linux.org.uk>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, wangzijie <wangzijie1@honor.com>
Subject: linux-next: manual merge of the vfs tree with the mm-unstable tree
Message-ID: <20250616105846.45af3a7b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UJ+J2a.W.2EEatjTgEvbccf";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/UJ+J2a.W.2EEatjTgEvbccf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the fs-next tree got a conflict in:

  include/linux/proc_fs.h

between commit:

  e4cbb84d3ce3 ("proc: use the same treatment to check proc_lseek as ones f=
or proc_read_iter et.al")

from the mm-unstable tree and commit:

  5943c611c47c ("procfs: kill ->proc_dops")

from the fs-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/proc_fs.h
index 703d0c76cc9a,de1d24f19f76..000000000000
--- a/include/linux/proc_fs.h
+++ b/include/linux/proc_fs.h
@@@ -27,7 -27,8 +27,9 @@@ enum=20
 =20
  	PROC_ENTRY_proc_read_iter	=3D 1U << 1,
  	PROC_ENTRY_proc_compat_ioctl	=3D 1U << 2,
 +	PROC_ENTRY_proc_lseek		=3D 1U << 3,
+=20
+ 	PROC_ENTRY_FORCE_LOOKUP		=3D 1U << 7,
  };
 =20
  struct proc_ops {

--Sig_/UJ+J2a.W.2EEatjTgEvbccf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhPbEYACgkQAVBC80lX
0Gy99Af/cTh1zGyVmdzMOFw27HBZ2H80TfYt6Uxve7EKZvYWzdftHyktKbblN3wd
bwgpbpMl79C7NLh3EAI5L8e9Z0ALc6AiZfyuO8VSNsQma68g1sojBRZ6u8Y+c3UV
IHeT+wPhdQy6Kf/lXkVffdixm3AZZJBwRFHUrPmzrNQ4KKhBJWg25WcFVXkr1rlp
boIQdN6rU6J6hRSiGr7LSZ+V7BQJ99kyWuMawGhPuxo+FpdNouzyFXm/70+Sae7Z
XaVtkR4BzkD8Sy0ozdCTWhzFjW/pWnwzucUHKgvGp6BiOxPieQu1d6iAiylz2og2
PmoADJndGn9XxBG7WlRbnKkJy5M9pw==
=lY8s
-----END PGP SIGNATURE-----

--Sig_/UJ+J2a.W.2EEatjTgEvbccf--

