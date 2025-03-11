Return-Path: <linux-next+bounces-5720-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D11CA5B83C
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 06:08:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7CDF188FA7B
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 05:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 387FC1EB1B9;
	Tue, 11 Mar 2025 05:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="b4RSTFMD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9FB1CA9C;
	Tue, 11 Mar 2025 05:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741669728; cv=none; b=paaJXx+WWZDMZQTyvnircKeQPPA/wuppiJ4tEtvBSOcK1gzuG/sdDMrkNX3Pqx3znO/EP9MreOs9vOsE3FWeIKkYWXgfATBmZYnwgPROLztA60owmHGqPbgWqIYyMri3aS22fTOnwPE2/BgnoTI86Wi3uZpZ3RICpD0mcbc9QCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741669728; c=relaxed/simple;
	bh=otZ3TQRBrKXoY/r6j9Eg5rw4zZXMFMzqxwqcSrMLmsc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=uimQShjq+cNNPATrTbAcvtiLmkznPqnJpDYZA9LqFAocHooP/gXANa4B3cz0St25dfoTohpBr8b57gUFiSjrbLQsneuD7GHg5ZQSfpzbl9+4SAHdfQpM5V1dLPvmvgSeUYUBhzaBriRQegAQ5Gla9b5qBb+K/iL2zxNfuAQ5EBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=b4RSTFMD; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741669717;
	bh=NnfwfeOIQyHPFQlIIwggaOgZOoeuywrf9oWDddPwvBM=;
	h=Date:From:To:Cc:Subject:From;
	b=b4RSTFMDajAI42IeglauZnmepdOxuSdKlksOGrtw6iZ9LN/Db9edmtad3mmUosG07
	 vISj1ROczggwi+SmRwzp1Z0Lq3C7xuHdXdJcwVbC6oJsXOfs1L9tyFPOgf2wcaqDhC
	 liFxy7x9IDnFNoNw5blFYgp5OdhVznM1BSuw8watEZD9alPQHqwHGPcqxUepAcsXu2
	 na9gd1M8hMpNpjl/e5y1dUY4Gg4SGT2P0fe04GmOJ8b2m0Q4RQvxrlPnqby+lUottX
	 CZdDIiYS6A61X4uUvD5F1nOX8eniZ/JTkGz+iYFm2/yK9Z47jM4KgRtTNdxNs9N6qb
	 X8g6AwHSDQbzQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZBhcP0HwYz4x89;
	Tue, 11 Mar 2025 16:08:36 +1100 (AEDT)
Date: Tue, 11 Mar 2025 16:08:34 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar
 <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra
 <peterz@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, "Mike Rapoport (Microsoft)"
 <rppt@kernel.org>
Subject: linux-next: manual merge of the ftrace tree with the tip tree
Message-ID: <20250311160834.5ae8c9b9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3+m5UqZaYguCLgFxVmK3rBC";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/3+m5UqZaYguCLgFxVmK3rBC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ftrace tree got a conflict in:

  include/linux/module.h

between commits:

  c287c0723329 ("module: switch to execmem API for remapping as RW and rest=
oring ROX")
  602df3712979 ("module: drop unused module_writable_address()")

from the tip tree and commit:

  186a3d01d596 ("module: Add module_for_each_mod() function")

from the ftrace tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/module.h
index d9a5183a9fe7,9a71dd2cb11f..000000000000
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@@ -771,6 -772,18 +771,8 @@@ static inline bool is_livepatch_module(
 =20
  void set_module_sig_enforced(void);
 =20
 -void *__module_writable_address(struct module *mod, void *loc);
 -
 -static inline void *module_writable_address(struct module *mod, void *loc)
 -{
 -	if (!IS_ENABLED(CONFIG_ARCH_HAS_EXECMEM_ROX) || !mod ||
 -	    mod->state !=3D MODULE_STATE_UNFORMED)
 -		return loc;
 -	return __module_writable_address(mod, loc);
 -}
 -
+ void module_for_each_mod(int(*func)(struct module *mod, void *data), void=
 *data);
+=20
  #else /* !CONFIG_MODULES... */
 =20
  static inline struct module *__module_address(unsigned long addr)
@@@ -878,6 -891,15 +880,10 @@@ static inline bool module_is_coming(str
  {
  	return false;
  }
+=20
 -static inline void *module_writable_address(struct module *mod, void *loc)
 -{
 -	return loc;
 -}
 -
+ static inline void module_for_each_mod(int(*func)(struct module *mod, voi=
d *data), void *data)
+ {
+ }
  #endif /* CONFIG_MODULES */
 =20
  #ifdef CONFIG_SYSFS

--Sig_/3+m5UqZaYguCLgFxVmK3rBC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfPxVIACgkQAVBC80lX
0GyvQQf+L499S9KM35C1ug3/QlbIoPeQbkewFJ4c2aeXXeoWhPPaEsGko+aSCWJ9
xBaACAixAZLGPJxVRVsfxVfkUXbBjxLjV/KmrARGJiWOpBDYIL+ZkY/z/2vC1ykc
BQwS+eLFx40ruD0ZW8UJaWH5IXR5pNEbOiEf1L2F80nRVK4A2tRVx7q/lwS5oE2I
ugk0jSAR0ZLCTu0vPnwCfKQIuTI8Xyv0tSubaLkjiCFMEGUYOwxyprhD8vs7pYDI
hoW6D5ef+MZwZ+r7pCG5MgfBWKXI/1LqOzISrhAXCnA3GFyJiLnZTxejFh+o/CGV
+e290LNZJgf5xDMYMTSfVBNRyJxNyw==
=l0RN
-----END PGP SIGNATURE-----

--Sig_/3+m5UqZaYguCLgFxVmK3rBC--

