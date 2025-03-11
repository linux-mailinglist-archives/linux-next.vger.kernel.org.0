Return-Path: <linux-next+bounces-5728-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C20C9A5BBED
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 10:21:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8596E188BA32
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 09:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F11442236E9;
	Tue, 11 Mar 2025 09:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="mURD1W6a"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A3B1E32D6;
	Tue, 11 Mar 2025 09:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741684891; cv=none; b=sNAEIdeW95OuV2mIkZX4c6Te428CYvlBbcYJYu/KiwRN55yl+4kGVt31NtkrCvhDoNHdLl226NC23WxWseqMLQIM6axJg7GJCCaoaRX57aUchoDQLoN4MfaRf2OE19nIn4kaBtgH6d3UM58a/t2l0iUCvOwZ3tb8YsumatGuevo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741684891; c=relaxed/simple;
	bh=kun+iVus2uE1850ceuCqRajaOjC+jMUf6gQi2jHZRb0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Rc0twu5BFXEO724Y2cFKroGc2oMZ8tHhtSwztF58GCeDFUkeIXM2DqKdkgTkMQvog6KiC6zQDEBc7yCOwyppwDxzBHmaMhD+DNyeKmOY6IWLUsLYw6Fk8OtIj9mKEHFpVZFDSRxGbhQxEIN0hnWKWsYqWGnYfhBpf9miuB51OMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=mURD1W6a; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741684888;
	bh=Cs4ZuYiaSKR6fWBNmzs9JOkQzrlbjJZkceYMjhdvI50=;
	h=Date:From:To:Cc:Subject:From;
	b=mURD1W6aTwmSw9r02Au/rNALS9nH79Y9XFmEYfke5x258oewhrzLevV3u3BQm9Nr3
	 f3Nwv1QH2ly1HbSr47+LR87VdqUuAGLi9ZF5jkCTxw0gYdjrxpdMDjNeaL8UDRvVrU
	 JUj7UJxxhIBJEX3woDJ193ovLK519MWpOfyKxnUihky7nFTaUMdNi4lmeI9NfWP9bp
	 0HrUdrITnAO6RtYH+SwOCP/gre8UzUlJLCAf0s7yFqLyQf5n5eJ0b8oWwBgbhPzf63
	 ySVRhvOUJWwjM/H+2k/JFr/5hDmVUVIT3Ec8r+HFlCkcL1SKp6ebo7IyP2qu+59bWJ
	 Y6d8KuaWEYSgg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZBpD72jClz4xCW;
	Tue, 11 Mar 2025 20:21:27 +1100 (AEDT)
Date: Tue, 11 Mar 2025 20:21:26 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>, Joel
 Granados <joel.granados@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Kaixiong Yu <yukaixiong@huawei.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Subject: linux-next: manual merge of the sysctl tree with the mm tree
Message-ID: <20250311202126.1150e018@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=thni74Oyi_+e0s5DS8LZfQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/=thni74Oyi_+e0s5DS8LZfQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the sysctl tree got a conflict in:

  include/linux/mm.h

between commit:

  61316cdc1915 ("arch, mm: introduce arch_mm_preinit")

from the mm-unstable branch of the mm tree and commit:

  73aa354af21d ("mm: filemap: move sysctl to mm/filemap.c")

from the sysctl tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/mm.h
index 4d32053c3d19,f5ba3ed8b44a..000000000000
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@@ -41,9 -40,6 +41,7 @@@ struct user_struct
  struct pt_regs;
  struct folio_batch;
 =20
- extern int sysctl_page_lock_unfairness;
-=20
 +void arch_mm_preinit(void);
  void mm_core_init(void);
  void init_mm_internals(void);
 =20

--Sig_/=thni74Oyi_+e0s5DS8LZfQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfQAJYACgkQAVBC80lX
0Gy76Qf/a67qa7QonE/yTZ/r0GAc4pyztb9YPRkRkuFDeDFZBr7WGbE+ZDhy1fD3
mvgAhXIfywSXOfkH2qY1v7hrzbbobOtP8QUMBfV6Lwjwk+kSo4zcXlncxIlf/U5S
7r3pnlGWDy7JqXiC4tRszUpsWBR8W+ygDuoAew9AUAzhuPBzgSMm3kN3ZAEjiz+P
QL7pOboMnXeebvc+TcYz27/Jd59gbjpplWMzp1j95cdOUFyP7iX/L6q4GmpKJDQe
By8ilVeO92X2aQJXcfwdCKm+0nqCiMunjeGkm5a5urkEWyUTkCJITH89zM9H40N7
WRY6p5mNx9Ds3FYOj2J2C4pkW/k7+Q==
=PsLl
-----END PGP SIGNATURE-----

--Sig_/=thni74Oyi_+e0s5DS8LZfQ--

