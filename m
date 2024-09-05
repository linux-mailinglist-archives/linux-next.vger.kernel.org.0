Return-Path: <linux-next+bounces-3625-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4354596E5C4
	for <lists+linux-next@lfdr.de>; Fri,  6 Sep 2024 00:32:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B331282839
	for <lists+linux-next@lfdr.de>; Thu,  5 Sep 2024 22:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFF0C189523;
	Thu,  5 Sep 2024 22:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="MkIhYe0Q"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B58B15687C;
	Thu,  5 Sep 2024 22:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725575571; cv=none; b=JA5zi/nnWfn3SpOsEg/GNbw8FPOhMjKdOFpI1ekkesXa0FeildMvwTksdjGv2drVZxMyLe0mtUdzplwNyQV2rTZjtD4U6UDYp6iQ36B/9KDfAtG2m4xrOn0p1kEuXSVcRGa25ynGKXOp4IAa4iav+eJrjw1+b9YfDKuFnx1+d7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725575571; c=relaxed/simple;
	bh=+NVDix8T2xQyedNPt3M1bRr8eVJnqQyakfFC98R23UA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=s3WSywQ35qo9RZH3rQIlz5qf4Pk9fEtwvnNvRyNYQJS1XUNsyXPq6yPunKKlxbTfo7zcHCdgRRzgbrxPGcbVR17tPDJr5eaoutm9M3V0ziVK1GhkHtvebWqXw+IWIGPN9Ry0e+n0MrcU99JtaAPXjt7iaJ2yLBhJX0uRFhKFfAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=MkIhYe0Q; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725575567;
	bh=QNSjDmvq9WCZzo/kTctKtEaVFzD9p319royOrt/C1uA=;
	h=Date:From:To:Cc:Subject:From;
	b=MkIhYe0QLy38PIUAkCMhi1Zc3G76udEBKtQDR4FsCt2G4sKZ4J2Nk97EAzBzqdMt6
	 p5YhojYZ9OYUy2UOlyyo55vdrfJ/hyqhfCfvNAQ74l/z5hlRUJojRPr2TmoQQRI4lE
	 8nisMUQev/ranvLARmBfJMva37XLzzFm30jpQvonrBrBp3+gfEYSQXPvy7gtfs4JnU
	 S+dopIqKa9/zCJE5WYn1GPjqfmZ5anKzZr7PyUz0KqJwY0+TFu0WESUdVXFXvHzQde
	 jz9MWvjjB0X8N4HLUdk6F01DMTUvEjH/T/JbXgeuY6o7SQfSXZD5pl4LGUq4leFRQZ
	 gomXM1ioY0ecg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X0DdW0hjlz4wd0;
	Fri,  6 Sep 2024 08:32:47 +1000 (AEST)
Date: Fri, 6 Sep 2024 08:32:46 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Cc: Jeff Layton <jlayton@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the vfs-brauner tree with the ext3 tree
Message-ID: <20240906083246.599063b0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LwIk8x16cFnZjJMqNA2NE=4";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/LwIk8x16cFnZjJMqNA2NE=4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got a conflict in:

  fs/btrfs/super.c

between commit:

  ec24789ec8d6 ("btrfs: disable defrag on pre-content watched files")

from the ext3 tree and commit:

  c7e408a168b5 ("btrfs: convert to multigrain timestamps")

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

diff --cc fs/btrfs/super.c
index c9aef6708779,d423acfe11d0..000000000000
--- a/fs/btrfs/super.c
+++ b/fs/btrfs/super.c
@@@ -2199,7 -2199,7 +2199,7 @@@ static struct file_system_type btrfs_fs
  	.parameters		=3D btrfs_fs_parameters,
  	.kill_sb		=3D btrfs_kill_super,
  	.fs_flags		=3D FS_REQUIRES_DEV | FS_BINARY_MOUNTDATA |
- 				  FS_ALLOW_IDMAP | FS_ALLOW_HSM,
 -				  FS_ALLOW_IDMAP | FS_MGTIME,
++				  FS_ALLOW_IDMAP | FS_ALLOW_HSM | FS_MGTIME,
   };
 =20
  MODULE_ALIAS_FS("btrfs");

--Sig_/LwIk8x16cFnZjJMqNA2NE=4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbaMY4ACgkQAVBC80lX
0GwAzwf+KZ6FbeLNPJt+2qvVKPeSSkjqCpAjGHnblDBN1Qowgk+/52vDnFqtMlZP
089Zc7kHR8YbLeiU13JjbZavsGQG/ujFIwzyWVlv0CNIrPVu8H+joPIdfcY+5UvI
pl/gNB8OvZgSW47OeTHDU5hLsVrpTyHZ06YQr7ieJsyPh5USwsjTUPOt5mbtwp1F
D7xLcYjduVTc0HW1wFe2137BfWr/IMYjbkSxKccMgSAyjcaNC9HaSO25rsoveZSR
PNJIGUgLoDUmCEUt9g/nKaLAZCVK+8QmNzEbHhVw4OGQ7AfXgQYJsMoi8+wHAyvS
Fi/qXSfK1P++FhL9ULgQ7uuiRhZ8LQ==
=It/+
-----END PGP SIGNATURE-----

--Sig_/LwIk8x16cFnZjJMqNA2NE=4--

