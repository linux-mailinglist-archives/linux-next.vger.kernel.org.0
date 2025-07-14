Return-Path: <linux-next+bounces-7514-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B17CBB03887
	for <lists+linux-next@lfdr.de>; Mon, 14 Jul 2025 09:59:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB3161898CA1
	for <lists+linux-next@lfdr.de>; Mon, 14 Jul 2025 07:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B0EB23817C;
	Mon, 14 Jul 2025 07:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WZAmyDgF"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8995F22FE0F;
	Mon, 14 Jul 2025 07:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752479963; cv=none; b=hFOq8/9MYzcBaMH6ef89hPBF+o//kgP5qC8Ddj0/XjZH/rK+5Ov6KfqBxoJmoGaFQQFSFlWCjWA9iPIB7vatEG9my4fqssO3aMNUwz61hwb+Hj61AqILkGM6j+Ai/cw7TyaVNA61OC3QMlbB2yMx3bod3d2f7XjPLZZs6boIykc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752479963; c=relaxed/simple;
	bh=R5rR/XDUQo37NVX2ZZnE7IMZWUUCI6M2Fq3lUTAd4tU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=u5KQPX9LzpGfh0ZZrny0gdy6BuywmDE0bj//B6KSvuQcAYQp1yjNPdG0RXttzZttpGvVyZpJg/CvrBLFQGxysVG8g9M3FoM4xZjYpJsyFacW8W7HL5QjWMpcModUlQvya1wIsL7AG3ImUtebgigZADfl5kFyf+Bf/GKTXfOHcfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=WZAmyDgF; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752479856;
	bh=xvpupJJZzCN+ptXyBXjLUPMy03e3XLWXPmP44BueyzY=;
	h=Date:From:To:Cc:Subject:From;
	b=WZAmyDgFNAlidEIOv6ZSjuveLP3P6RrM4FxkNqBi16thQqlXHIBqoHjiqtt4OxuXK
	 uMWbUvABnn3pWxOb25+XAWl1pFbsl/FBartp0jga0s+/WSUzzVK2s2M+FgRA4Cz2Mu
	 c+ND2sQC/Xte2oA6oplLgN6I7b1Ep3fWDArBr6cAnm88WzAJ592ChS0YgQkJ+zrRVo
	 VCRG7GVXgbdANWyEx20kIzJABxKWFk1/bgvAg45hSTPj8D7Yf1EgtSDfCWmy0IUgU9
	 80FvEnE1u83y+veUEB3CazISJLWd2d/zS8dgsHyHjBflAlDgORntP9ZIhgWlml63l0
	 z7UZHTRGnGXyA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bgZRg3l19z4wbW;
	Mon, 14 Jul 2025 17:57:35 +1000 (AEST)
Date: Mon, 14 Jul 2025 17:59:16 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>, Joel
 Granados <joel.granados@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, Sami
 Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Thomas =?UTF-8?B?V2Vpw59zY2h1?=
 =?UTF-8?B?aA==?= <thomas.weissschuh@linutronix.de>
Subject: linux-next: manual merge of the sysctl tree with the modules tree
Message-ID: <20250714175916.774e6d79@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/djCT7TUsKaOPOEN2=QpD/Pi";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/djCT7TUsKaOPOEN2=QpD/Pi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the sysctl tree got a conflict in:

  include/linux/module.h

between commits:

  6633d3a45a8c ("module: move 'struct module_use' to internal.h")
  a55842991352 ("module: make structure definitions always visible")

from the modules tree and commit:

  6bb37af62634 ("module: Move modprobe_path and modules_disabled ctl_tables=
 into the module subsys")

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

diff --cc include/linux/module.h
index 3b665cb0cabe,e93cdb92ad92..000000000000
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@@ -584,17 -608,6 +584,16 @@@ struct module=20
  #define MODULE_ARCH_INIT {}
  #endif
 =20
 +#ifdef CONFIG_MODULES
 +
- extern int modules_disabled; /* for sysctl */
 +/* Get/put a kernel symbol (calls must be symmetric) */
 +void *__symbol_get(const char *symbol);
 +void *__symbol_get_gpl(const char *symbol);
 +#define symbol_get(x)	({ \
 +	static const char __notrim[] \
 +		__used __section(".no_trim_symbol") =3D __stringify(x); \
 +	(typeof(&x))(__symbol_get(__stringify(x))); })
 +
  #ifndef HAVE_ARCH_KALLSYMS_SYMBOL_VALUE
  static inline unsigned long kallsyms_symbol_value(const Elf_Sym *sym)
  {

--Sig_/djCT7TUsKaOPOEN2=QpD/Pi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh0uNQACgkQAVBC80lX
0GzLSwf9GDEV4caEzjAMiRjjDPR1+UcFQEqbFYQ1Rx4OyTphZTV+yJLOiRiG2ZK1
121BXMXnjULZk8v70MqVe8WlMnk5mwCRzRoMBO8/Unqu8bKh6HoSF9Egq9SwSekn
ZsF4jPeow4DHvbHrRUk87oxf2+QRVfKXNmLTuU808rPp9ml+4O/mlDRkblJmuVTs
cOdRwCgpp77gnWIUXdcn9bHpsA8V8B/Ru03ejDmk9qW4FxrUjMfb2OmYeICGMMez
c70obI/eY3+b7W+tnUQuOT6krLVHfY/U+wJYLO+ABJDoa34/NovwaUp6QKr+BKKc
fsHGEjseNpVkHkopFO3AHeyxm1VlZA==
=FVaC
-----END PGP SIGNATURE-----

--Sig_/djCT7TUsKaOPOEN2=QpD/Pi--

