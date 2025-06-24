Return-Path: <linux-next+bounces-7215-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 088E0AE5B8F
	for <lists+linux-next@lfdr.de>; Tue, 24 Jun 2025 06:42:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91D0217E600
	for <lists+linux-next@lfdr.de>; Tue, 24 Jun 2025 04:42:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F7EB226888;
	Tue, 24 Jun 2025 04:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="cw+v0ikP"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFFF21B9F6;
	Tue, 24 Jun 2025 04:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750740162; cv=none; b=Vi57oLnFtkr5v7YdShe8A5EysyAMIjR806S+xoqsIF4FfXyJb2KcV/9zrCmty96avDgxRD2qAhLNV/+hgsnzHOvEAPy+v/Rv9X+PRtkP5aqme6IaaOKWg70mlX9LiyNd4PtMEpo5/LS/V6dcU3iJAllgCwIpDx1eyYNAvaUx6vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750740162; c=relaxed/simple;
	bh=4oCgMDFg06/ZJ+fJ36lp5jhor6NtQ1mEl3NvdGraXWE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VpUWKjxcDSRqpYoFGoiGMDKwg3JKrbzsbf36ii7E8ax3qzjijkxpO03DJR9SjENsr5fFJ7RqEzh9hqZ88+m34Ls/CLFxfUDyJ6AJsJ56Hg5i5xO3eyK5nUOGWABcmg79V0If7HXRILVcKHXcvBTMHkRT8mcYFEepC7x3EUn/+Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=cw+v0ikP; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1750740153;
	bh=3862urRcsU1qhVaMyUmElt22m52yJ8kkk/5cd28KV+c=;
	h=Date:From:To:Cc:Subject:From;
	b=cw+v0ikPI+QXYaLbwSkyjaCy+E7ZyaFRx8Qde639DY4iy5j1ndCT74Z272UPAqeTz
	 McWl66WedJCvDkX4UyQA0162E/PfNeK2xD7FYhgEAZ+q2pKxDfirvujRxqimv5JARI
	 /dxBROhtFixtx8zciuULMP7j55JdoNNV6pnJxpdwTZ4G5uETeYFcQz47s1aI++XTOO
	 vA2LYgwuptlNAoJCqqwqKgSJXBckUF65IfRf9/WTFOj8TMmO4JRKQEndN058LcAi1o
	 7/wOnUgDv9LpvU57tUDxKIF7W0Mi0XiQ2x7+rmWB16ZDT+KzgtKarzOG6lUm35JWu+
	 mC4pK4m6s1WxQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bRC3s08vQz4wbb;
	Tue, 24 Jun 2025 14:42:32 +1000 (AEST)
Date: Tue, 24 Jun 2025 14:42:31 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Christian Brauner <brauner@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Remo Senekowitsch
 <remo@buenzli.dev>
Subject: linux-next: manual merge of the driver-core tree with the
 vfs-brauner tree
Message-ID: <20250624144231.3598eb5e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/g5DpCZ1jN5L0MCP+wZACWEo";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/g5DpCZ1jN5L0MCP+wZACWEo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the driver-core tree got a conflict in:

  rust/helpers/helpers.c

between commit:

  6efbf978891b ("poll: rust: allow poll_table ptrs to be null")

from the vfs-brauner tree and commit:

  a2801affa710 ("rust: device: Create FwNode abstraction for accessing devi=
ce properties")

from the driver-core tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc rust/helpers/helpers.c
index d2887e3b2826,393ad201befb..000000000000
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@@ -32,7 -32,7 +32,8 @@@
  #include "platform.c"
  #include "pci.c"
  #include "pid_namespace.c"
 +#include "poll.c"
+ #include "property.c"
  #include "rbtree.c"
  #include "rcu.c"
  #include "refcount.c"

--Sig_/g5DpCZ1jN5L0MCP+wZACWEo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhaLLcACgkQAVBC80lX
0GwMiQf+NjX8yQQ4+zH18KjEzMCn74HOS3EbVuOYo2xkmBMJR5ttiRj1Ry44zuy0
aLQ+6P4+4B9WxUCaL/8c4q3jITb/Q0vy62xTAaPLM/GPyt1T3qzKLWGMMYocJ7Kn
jDy6KvIrGBMl26aKIk8tpea9uyVF1OJBGa/q8oDHlyjSA+1LApTyqxJcwU10gCvm
VVZeHMdrD455Y0xm8BWDkezQ08XG2fywFzQm6GsYm+cSx7cNCoUBfy/PpAyUQ4gL
8b6MW6MnqHwD6jR2GyVFGhXC1fOBUor0pZOa9N66++s+yr/i7o7bV6vvoqtKIEsC
xR8xQ3gyaL+kvKCs4tfi7zzIFdypmw==
=MrpV
-----END PGP SIGNATURE-----

--Sig_/g5DpCZ1jN5L0MCP+wZACWEo--

