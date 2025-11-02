Return-Path: <linux-next+bounces-8790-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CA6C29802
	for <lists+linux-next@lfdr.de>; Sun, 02 Nov 2025 22:58:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 566B33AE02D
	for <lists+linux-next@lfdr.de>; Sun,  2 Nov 2025 21:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26D751DDC2C;
	Sun,  2 Nov 2025 21:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="i8O9rcP/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606F427707;
	Sun,  2 Nov 2025 21:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762120723; cv=none; b=WDSeAZFSk5hCmHDUpdDGFLWssWsbeciqWUutGO67HVbZ7VU6t7g0rOO/n9LPeIPkLzc4j+0UlRbQvACs/WSBKdCmCKNoegGQRG2Hs0DaV12IA3iXc43nkLw4Y1w4Bz0EU21FoSRveQfs5/Gnr58/e4+aytdkQ9QC3tH2D/Vkq/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762120723; c=relaxed/simple;
	bh=4xFkkpMsJuv4J/A8JRh8mwKrWHVz6GYK4dIzxYgvIgw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=HXKJ0jhy5sEapDXnGegrcHBLfDEMsHDpvnXBDcFgPPBzOvTAYF8VmR3JxVBNoYBfnFSANaVzS6EIzHdhL3rpUHGTWsgl5t/LwC0E+l8SpTQ5mZ1Q1BNlnaBYeyeyOuyfi3KmJ+ioPXwZD9dJkiMqvV7IcibSIYUe7eaLFCJtc+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=i8O9rcP/; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762120715;
	bh=6esJARisw9KjItiloDvLOD1Qe8QrmyYkFEYnGMpyU3A=;
	h=Date:From:To:Cc:Subject:From;
	b=i8O9rcP/8MQjYsrvr0ZNtYg/dit5ehwV1WHLEciexjkcdT1SuSA/jnpJuE3CzrpOC
	 wGb+JevxwmhEEDb1rFqWxMWXTDEWaWltc46+WuiqDpzdP2qsCEE8z2ME2vN9ZlwkLS
	 sPuZh1ALe30sb6GgmOEJcT+kEApkC0qBH6GSf5KHZJjhGStM6NNItzTMIHL9go86Oh
	 CYWmL0kazlCy4yL/0tRy07KpEuXqDeKQp8B4+GWcGTOTb+z04bK90RNNn5lF2Zudxo
	 dWmLI+zItWHyQG1Xz+NXy/ZzUoxvXyWQgNgmGxsqnDIBBKk+VFA6zmfOaKagvH+s3n
	 UcxbDkALae5Bw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d07rp0Qnkz4wCZ;
	Mon, 03 Nov 2025 08:58:34 +1100 (AEDT)
Date: Mon, 3 Nov 2025 08:58:32 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>, David Sterba <dsterba@suse.cz>
Cc: David Sterba <dsterba@suse.com>, Filipe Manana <fdmanana@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, "Matthew Wilcox (Oracle)"
 <willy@infradead.org>
Subject: linux-next: manual merge of the vfs-brauner tree with the btrfs
 tree
Message-ID: <20251103085832.5d7ff280@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Uql9BNrLjzAc07LbdbkVAAX";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Uql9BNrLjzAc07LbdbkVAAX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got a conflict in:

  fs/btrfs/file.c

between commit:

  ede21a086a16 ("btrfs: use end_pos variable where needed in btrfs_dirty_fo=
lio()")

from the btrfs tree and commit:

  48f3784b17d9 ("btrfs: Use folio_next_pos()")

from the vfs-brauner tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/btrfs/file.c
index 1e0ff3d7210d,977931cfa71e..000000000000
--- a/fs/btrfs/file.c
+++ b/fs/btrfs/file.c
@@@ -86,9 -86,11 +86,9 @@@ int btrfs_dirty_folio(struct btrfs_inod
  		extra_bits |=3D EXTENT_NORESERVE;
 =20
  	start_pos =3D round_down(pos, fs_info->sectorsize);
 -	num_bytes =3D round_up(write_bytes + pos - start_pos,
 -			     fs_info->sectorsize);
 +	num_bytes =3D round_up(end_pos - start_pos, fs_info->sectorsize);
  	ASSERT(num_bytes <=3D U32_MAX);
- 	ASSERT(folio_pos(folio) <=3D pos && folio_end(folio) >=3D end_pos);
 -	ASSERT(folio_pos(folio) <=3D pos &&
 -	       folio_next_pos(folio) >=3D pos + write_bytes);
++	ASSERT(folio_pos(folio) <=3D pos && folio_next_pos(folio) >=3D end_pos);
 =20
  	end_of_last_block =3D start_pos + num_bytes - 1;
 =20

--Sig_/Uql9BNrLjzAc07LbdbkVAAX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkH1AgACgkQAVBC80lX
0GyKzAf/dY+3EJklnKxfYhBWpYFSvY0iIQQHv5dzpeJpqz3a5wObN/xJfAphpyNe
d4Rsz1IFHqafw1O4MjkUKNp02fh014r6RYMaDlha6Zx1DF2/gWYHXXcqufyvI8IK
aM6ZGSlFABssnhDe5jpaEIRDIFltVdrfV1WeBo2pQkw0ZbqpP//dmivPaF2PK8R5
IZLREadQYa0JFcF+7kw1wvH/zmavaJ9xpnH7kh7o4z2n4Ih/4n3GISS1rCPIJ/ry
kErtpdjeLJ8SqAcmutegQk+cmGf6YJ88pRa6k9E042wYGki9JSSTb3WXvFIf8Xyg
LTJUJc9VFug8SSVmPrDDxvb6WufyZQ==
=EdDt
-----END PGP SIGNATURE-----

--Sig_/Uql9BNrLjzAc07LbdbkVAAX--

