Return-Path: <linux-next+bounces-7197-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E6CAE32F8
	for <lists+linux-next@lfdr.de>; Mon, 23 Jun 2025 01:13:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3DD5A188DA0F
	for <lists+linux-next@lfdr.de>; Sun, 22 Jun 2025 23:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1C6121B9C9;
	Sun, 22 Jun 2025 23:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Vnj+rdcR"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3492A33E1;
	Sun, 22 Jun 2025 23:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750633982; cv=none; b=NEZxmPRp5JV/X+Vnyah0z7bYMOM5LgZAglio+8eAIE19OoPzqIrCRxacwtLxW6sHon26g+CNN+DnU+uaXZCy+6KvEl33KDQXXkG+652jYXC5Ma6W0/brw8PjSADO2R2srXO4ikp4jrNSZ7/jesQG/gV4y+42DJNYAGUaRqorI3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750633982; c=relaxed/simple;
	bh=GhOPkCem6q1ZnegDfQgpQBsKwmd/t7yaOcJz3uKoqGA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=T3KbudKv4EWvW6Mf7rfxcXTWOS/gHcJ0qYAig073SsKH0qluB7RRNA/Gsghs8UieeL9IkjRXKUQB3/cdNd+rG5TcmVifYmc3t46ViuN31tGIPENuolVAhVVTIav3dnTqFvUpcofCgarDV6/EiMlZ5jmVgZeUS6N6CiuSoL20FbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Vnj+rdcR; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1750633972;
	bh=ZZlcUupFv8lbRmaho4dfXx3P45VrTD9lGZNwNyQtL4M=;
	h=Date:From:To:Cc:Subject:From;
	b=Vnj+rdcR3ez2f7wznYh15Uzk+zcdmC1pZTFFk3bsQV224ZNk8c7uHO0wZmijV4x6P
	 5SqPom6eFBL4sYEKs16oAARJ1FkYdhto+FnLCRv0/ByVOqYCmB3+DXL8dClxZNPdlQ
	 HMp/BByH4ylLNAfW7iMhIrK23le23Hpurh6Cec76/ojT86RhzW00pD7runrl2ysdtb
	 aGTDiuwxypVmgWDMyW+fg1Faamt7xq2SzhgRkRXjJw7b7q9XWPwh37sFYZQTaRhfYJ
	 8uvEgLwqRluTdsiiz6C0aLy4NYVHFYZ05XeDcrI6GXGijpqACJkKBXztKvpk00WLgM
	 N76keGuYWPvjQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bQRnw5cxTz4wd0;
	Mon, 23 Jun 2025 09:12:52 +1000 (AEST)
Date: Mon, 23 Jun 2025 09:12:50 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the vfs tree with the vfs-fixes tree
Message-ID: <20250623091250.2a3a399b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/p=KpbD2Ey1Kil/F508vJwrd";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/p=KpbD2Ey1Kil/F508vJwrd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs tree got a conflict in:

  Documentation/filesystems/porting.rst

between commit:

  2e7072350656 ("replace collect_mounts()/drop_collected_mounts() with safe=
r variant")

from the vfs-fixes tree and commits:

  05fb0e666495 ("new helper: set_default_d_op()")
  691fb82ca6cc ("make d_set_d_op() static")

from the vfs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/filesystems/porting.rst
index 200226bfd6cf,579f17df46cf..000000000000
--- a/Documentation/filesystems/porting.rst
+++ b/Documentation/filesystems/porting.rst
@@@ -1249,9 -1252,18 +1249,27 @@@ an extra reference to new mount - it sh
 =20
  ---
 =20
 +collect_mounts()/drop_collected_mounts()/iterate_mounts() are gone now.
 +Replacement is collect_paths()/drop_collected_path(), with no special
 +iterator needed.  Instead of a cloned mount tree, the new interface retur=
ns
 +an array of struct path, one for each mount collect_mounts() would've
 +created.  These struct path point to locations in the caller's namespace
 +that would be roots of the cloned mounts.
++
++---
++
+ **mandatory**
+=20
+ If your filesystem sets the default dentry_operations, use set_default_d_=
op()
+ rather than manually setting sb->s_d_op.
+=20
+ ---
+=20
+ **mandatory**
+=20
+ d_set_d_op() is no longer exported (or public, for that matter); _if_
+ your filesystem really needed that, make use of d_splice_alias_ops()
+ to have them set.  Better yet, think hard whether you need different
+ ->d_op for different dentries - if not, just use set_default_d_op()
+ at mount time and be done with that.  Currently procfs is the only
+ thing that really needs ->d_op varying between dentries.

--Sig_/p=KpbD2Ey1Kil/F508vJwrd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhYjfIACgkQAVBC80lX
0Gy9jQf+ME37wKvD+euYFfAaEvIZAEtbe6kuyzBLo8k1aamFllvyScaEoEg9uPKY
V0A1NeKcYKfZNaOx1payQ22cKEnOGeHZzgspAJOk7+b7VdB2AuGckoWQw7FTucHU
tsJpLxF0hG5+AJi5Vu+2fkhEs4ujsgH9fgII64OoIT1w7s+l8e9FtyveDHc+jDGp
tp5D0jOlncBRvcD8LA8Q9UzgtxGnH6KB4KhXgM53/2/JR8/B3YY6TlBJ0kxOojxj
5xqqW3O4fr9EiM8h1pnpezUyyOhYfORYg5srVnuoMeMvGQ3J1AeMOL04U2uVlJCM
yp3JiFeShwJMOccLcnZDKSFLKckPig==
=hCP0
-----END PGP SIGNATURE-----

--Sig_/p=KpbD2Ey1Kil/F508vJwrd--

