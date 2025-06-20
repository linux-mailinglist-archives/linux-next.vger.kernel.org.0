Return-Path: <linux-next+bounces-7186-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B85DAAE10F1
	for <lists+linux-next@lfdr.de>; Fri, 20 Jun 2025 04:11:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4986619E1FFC
	for <lists+linux-next@lfdr.de>; Fri, 20 Jun 2025 02:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6C388635E;
	Fri, 20 Jun 2025 02:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="IF9APY0x"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737D454640;
	Fri, 20 Jun 2025 02:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750385494; cv=none; b=LvCeIX6N5fFELMZEQVORxPjQTkr5oZlxBRFGwrCmkpYzWPzNWqg+xy/h+6F+sjNTCzgf5UxLSIHRPte2L67PvvhfSakqewWLUsWR1Z9Olroe6TkZgoAUPbxluIBdqQyh3JtkzwGG51lRvuVZY1SL3JEkjaZxxnU4GdknwufBcpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750385494; c=relaxed/simple;
	bh=+fL+7lATRHrgFf9ezte8Bme9gjvIBxptmslEwxQX6sM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=V1zyZGBfyu01L3qatOJyq8wWZ1Rj72RzWmnE6L886MhHhOPKP13pZrCdz+absxsPxNEPiMzFydO9GeCHQ9WNlTjv3UbaO6Z+b/JWwEXL/ZCRWO1OhxPNaW9r84CdGDLAZjkm/OZjizHJ2k1NFjCjD++8szHyyKNXVzqiR0O0X7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=IF9APY0x; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1750385483;
	bh=6HDe+9Ljqo+nDEd8bs6ab9WT5YyIev4S5ZAFB9tvjBo=;
	h=Date:From:To:Cc:Subject:From;
	b=IF9APY0xmStNXrOksWJNFwhuznP2uKSrIQTdWQnBIBBNbukJu4XZH2sS4eg9QuDbX
	 BDN2CCf1PIzpaiUkyQcn/5oblwxkEbpNpR4Cko22vl36e6UXADEeVj/WNbbnvua3wL
	 uI78cZeCB2WZKD0MuVp85p5XhltcwKWp3afTDwuTtvzGEuTWLTPatH9J29TEl6R+GW
	 r+qdIathvBDb7L3uRSsai7G2q26q7qsH4oUxD86F1M39Bri8iZ46oTgq+j/XYpnvXu
	 nuUgTR9ffgns/s3w7/x+iTiCq9jbBLa8XmFLkrOMeVsiH9KH5ugX0JPWt9YY8PNAKP
	 +phfAsTqHZJUA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bNgvH4Hc3z4xM2;
	Fri, 20 Jun 2025 12:11:23 +1000 (AEST)
Date: Fri, 20 Jun 2025 12:11:22 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Christian Brauner <brauner@kernel.org>
Cc: Jeff Layton <jlayton@kernel.org>, Networking <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the net-next tree with the vfs-brauner
 tree
Message-ID: <20250620121122.344c1d0d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GoVKaWfXr/MwIgi9T5i7uLR";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/GoVKaWfXr/MwIgi9T5i7uLR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  net/core/net_namespace.c

between commit:

  9b0240b3ccc3 ("netns: use stable inode number for initial mount ns")

from the vfs-brauner tree and commit:

  8f2079f8da5b ("net: add symlinks to ref_tracker_dir for netns")

from the net-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc net/core/net_namespace.c
index 03cf87d3b380,d0f607507ee8..000000000000
--- a/net/core/net_namespace.c
+++ b/net/core/net_namespace.c
@@@ -796,11 -821,10 +821,15 @@@ static __net_init int net_ns_net_init(s
  #ifdef CONFIG_NET_NS
  	net->ns.ops =3D &netns_operations;
  #endif
 -	ret =3D ns_alloc_inum(&net->ns);
 +	if (net =3D=3D &init_net) {
 +		net->ns.inum =3D PROC_NET_INIT_INO;
- 		return 0;
++		ret =3D 0;
++	} else {
++		ret =3D ns_alloc_inum(&net->ns);
 +	}
- 	return ns_alloc_inum(&net->ns);
+ 	if (!ret)
+ 		net_ns_net_debugfs(net);
+ 	return ret;
  }
 =20
  static __net_exit void net_ns_net_exit(struct net *net)

--Sig_/GoVKaWfXr/MwIgi9T5i7uLR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhUw0oACgkQAVBC80lX
0GyXQgf6AoiOljcx1KzsIjArxkW71/NjyFf/axCnp5/x8esey8QPXYn1PwOQR19M
blLUaBSPbHc+SEksKvNmwC8SHwUmoLozs0pKxilH0+kGEvK2/Lq96iD0S8C2yihS
0+NvIxeSxxiEINX6nn+9mn4awz7oGdB1zEfEfSD5EdW1xdlAv++lW5dngGoE/Hp/
q/gO6e7g5Jd+H6kVERbtrmNfDOkmRvDDKjqrlJ4CCxOjflrFGEhCPacYRi7aPQAu
lulv8nhB6fJ5HSGEyxsXD8bkhEjmVqZAeKCL6Yiuayi7Yf9Z+KjBtGw1yrEQG3A2
9bQVzmSsz8WvtZaRS/dWb+QRK85hpQ==
=Nc8N
-----END PGP SIGNATURE-----

--Sig_/GoVKaWfXr/MwIgi9T5i7uLR--

