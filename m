Return-Path: <linux-next+bounces-2503-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3995C902AD9
	for <lists+linux-next@lfdr.de>; Mon, 10 Jun 2024 23:49:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E29A81F22BAD
	for <lists+linux-next@lfdr.de>; Mon, 10 Jun 2024 21:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C72574410;
	Mon, 10 Jun 2024 21:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="m4q9ABAV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5C24D8C4;
	Mon, 10 Jun 2024 21:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718056147; cv=none; b=ieSrnBAMczqP/4O9rzZlHce0Hs6hhx1MzZkvI+GiNrZ6sA/V7q/+VZjc7r/VQzlWbfHco+b/v8Wa6X2hyCa608GHQM4VZwuD4Nv/lbGIRBTOTu+ysvJ49e23Z+JZb6d20R0HDmu3ngpNkY9n3JcfAJHWYhvrg9JSsQTsVrf5+rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718056147; c=relaxed/simple;
	bh=ykFBQCi1dh1P+VqakbdOODcKqkyWfqJasyFdBjTnQi8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=W3xIdQ0ciczBiT7QKVfcEIHgUH0Enr3FAFPwcvP8bVfvG5haaZCHEedtilfA+y9mem/wudOAO6KJ08AVv3lmyTdhnRPacQ2bQeBLpNPAi3PXK2J8o8iNmD7BtpztFwWfMYFuX+fg9zFXDTJfJbXE3jtVAJpSZ00YA8T33PU501o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=m4q9ABAV; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1718056133;
	bh=kohiDelzqZSp+L1kHkWNDcmHcrarcNb/zE18QNFtoE4=;
	h=Date:From:To:Cc:Subject:From;
	b=m4q9ABAVhN1IGrXjZ1uTLpGGHrh2yotagV1pkt1Ssjx6EputCWZmBdFJJnBXdmWeE
	 ZuZsh9ATnCGLCiofT81EnGowdfCql5tTHS7OMXqEDM9xbSX5KrQqTrtZKn1SshpVSg
	 Tt3LZ8KUejDH6xIwCVaqlh6q/5wSx7c9JcJLNFzkFOUpFzIPrq0FnVdRKEEInpwpGN
	 4vkD4qjz1l+4pdRuup/MkD0WLKw3EBj5dw7OAGSwjoXt4AFYEEC2GX+x6gBoZnD5Uy
	 S05gxTSbr+08rd+fYJmdtb71D0uzkKiaCuAGkp1C0mAVxxs0hB8y1S2VSMMSJUToH5
	 7jGWfxISj36ng==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Vyln10wMhz4wc3;
	Tue, 11 Jun 2024 07:48:52 +1000 (AEST)
Date: Tue, 11 Jun 2024 07:48:50 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the mm-hotfixes tree
Message-ID: <20240611074850.48ab8cab@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/U3=e9Y7jEVx/Q0w0vobTQQB";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/U3=e9Y7jEVx/Q0w0vobTQQB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  1a2ffe941767 ("mm/hugetlb: do not call vma_add_reservation upon ENOMEM")
  39778a292a45 ("memcg: remove the lockdep assert from __mod_objcg_mlstate(=
)")
  40bdd66a7b77 ("kmsan: do not wipe out origin when doing partial unpoisoni=
ng")
  412b78b1f29c ("codetag: avoid race at alloc_slab_obj_exts")
  7284034f1a52 ("mm: arm64: Fix the out-of-bounds issue in contpte_clear_yo=
ung_dirty_ptes")
  7e6f87243a04 ("mm/ksm: fix ksm_pages_scanned accounting")
  882bdc954a25 ("mm/ksm: fix ksm_zero_pages accounting")
  930167c7f314 ("nilfs2: fix potential kernel bug due to lack of writeback =
flag waiting")
  9d72b28b9211 ("nilfs2: fix nilfs_empty_dir() misjudgment and long loop on=
 I/O errors")
  ac8e505e6693 ("mm: huge_mm: fix undefined reference to `mthp_stats' for C=
ONFIG_SYSFS=3Dn")
  bab08beb5b33 ("mm: fix xyz_noprof functions calling profiled functions")
  ce974305742a ("vmalloc: check CONFIG_EXECMEM in is_vmalloc_or_module_addr=
()")
  ebdb8f407552 ("mm: page_alloc: fix highatomic typing in multi-block buddi=
es")
  ec0649d7d6ce ("mm: drop the 'anon_' prefix for swap-out mTHP counters")

--=20
Cheers,
Stephen Rothwell

--Sig_/U3=e9Y7jEVx/Q0w0vobTQQB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZndMIACgkQAVBC80lX
0GzKhgf+Nvgg5sirgHfZ+i3gU2GJKkRmKDng3FJbiDItRB9xTTdSxYe+zHh+QXsT
NmHG/HXQoiX23IKbJfnVWUGV/IQQimtB6YsSe9a3LkMUC5Y3qZldT14yvIWuQIrw
BPRGAn9mgTiDthCRLS7/JpERishCblgj6VerZvpEYkE4TEN0r5LHTMt5PgBlTMpM
9yKidTtWTu03+3234+3iWlQbg+JbdHpVCQu8O6+Z0UkyHinyLFBLQAZdNG7b6cyS
Y7SPQJtr9/j4E3uR4HLW61hKSTu3WNI7VxpxQmdykT6pYHr6QYlJ3+AaBUzeSKZw
ketwUiKj5nZzse2vCe+VU5T2soZpgQ==
=V7AJ
-----END PGP SIGNATURE-----

--Sig_/U3=e9Y7jEVx/Q0w0vobTQQB--

