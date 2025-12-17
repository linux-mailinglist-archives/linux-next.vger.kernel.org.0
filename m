Return-Path: <linux-next+bounces-9452-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 080FECC9B3A
	for <lists+linux-next@lfdr.de>; Wed, 17 Dec 2025 23:27:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 085CE3012CDB
	for <lists+linux-next@lfdr.de>; Wed, 17 Dec 2025 22:26:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E052C30FC2C;
	Wed, 17 Dec 2025 22:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WatxMECP"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2405930B53F;
	Wed, 17 Dec 2025 22:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766010417; cv=none; b=aIeYhdW7GY9YxSEYsevk5m1ewskiTlymtlqDEqY5/esmaNe7BnE4yUI497nUcjozhMMYyDT/V1BDwxaJFTlqfhGtf9T5WXKLQWm5t5QPTqaWdf6c9PBK5upV9annaqU+H08OqWMF5pjdPr08MR5gzyRJNH6XYsPFCHQjx0N+ksQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766010417; c=relaxed/simple;
	bh=191idoaD1Dqob+/Ar77kcKkGGJJQSEQAok+g75M7Tjg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dl9b2KEx/8K1qDyEoXZbjAio+7bTjKgkWN39LbAy6Edb5SupNeZXsxHal+dOE09L7NbDIrEm1L8s5wD7TCvkIxQ6+JJ20baKim4LAhqcqtGQXNuatPRCjaamyi7C+iaeKtXSaUDeLqM8Oo5q8/oMFJ6DJSWOF4zdlSO+RbV7V5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=WatxMECP; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1766010408;
	bh=oSGDYy9Y4Iw2ZffFH+PEYI6ePGtVm3o850rxOBP7awQ=;
	h=Date:From:To:Cc:Subject:From;
	b=WatxMECP2J7KJ+4D9xlOFujKQuK8A3xWmrnh1Ii2Q6wie+ASMMaG/+u1ZKFIOJjEM
	 cfYTXmv4h/+ewCiw3qbX6fzjL6SEnfZZJ3cFec/mm2rNaUQtvf2+43tv9m9US68vat
	 vMbHj4YPyGRfbUswAWAFxSAmgVdLCG2hPPxe/kMJR3ubBHHvx6h9/8dvRg+bM//EkG
	 +VJ/djkIAc2R9cUNOVWqgiLq5//mRq2fzf+3WM0DoKoYSI9j9MD0AIPUMlrZ1Pt4fK
	 p62Wa/u2jMU93YNd8XSsWytbzxkD+4lH2ThAkP/9BiesBFeEj+87IxN6Vc8Hg2QU80
	 kZJ3+m077B2nA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dWpLc2gPTz4w11;
	Thu, 18 Dec 2025 09:26:47 +1100 (AEDT)
Date: Thu, 18 Dec 2025 09:26:46 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Sterba <dsterba@suse.cz>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the btrfs tree
Message-ID: <20251218092646.5f3f6f03@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vYvCgp2ZLHLl7NrhDIk7Rde";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/vYvCgp2ZLHLl7NrhDIk7Rde
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the btrfs-fixes tree as different
commits (but the same patches):

  009334649b08 ("btrfs: zoned: don't zone append to conventional zone")
  10578231b307 ("btrfs: do not free data reservation in fallback from inlin=
e due to -ENOSPC")
  2d73d5982844 ("btrfs: fix reservation leak in some error paths when inser=
ting inline extent")
  2fb07657b162 ("btrfs: fix NULL dereference on root when tracing inode evi=
ction")
  94dceafe967c ("btrfs: fix use-after-free warning in btrfs_get_or_create_d=
elayed_node()")
  9c34d6a9d32f ("btrfs: fix qgroup_snapshot_quick_inherit() squota bug")
  9eac9794d967 ("btrfs: qgroup: update all parent qgroups when doing quick =
inherit")
  b1a0caf9df29 ("btrfs: always detect conflicting inodes when logging inode=
 refs")
  f8e13d0c4f83 ("btrfs: fix deadlock in wait_current_trans() due to ignored=
 transaction type")
  fd8c2ad9634f ("btrfs: fix beyond-EOF write handling")

Some of these are causing unnecessary conflicts and merge problems.
--=20
Cheers,
Stephen Rothwell

--Sig_/vYvCgp2ZLHLl7NrhDIk7Rde
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlDLiYACgkQAVBC80lX
0GylZQgAg+p60U7KQTMjUnvsIyIFuXyfLlXa4MZ7b3bA/J/cXhK3Ni80aZ9qKKP5
S1ycEddBKuPhZ07ZF4FvK7PAkvJlwUFnyzVQIhXjbb5zydIKhgzex7QmjuL3xocH
coLOn10pZoxIZzQmCNGqVYiZCDnzGVProDUJjQfSvj7kjeR1ca09Wxz2zfTgytm9
H10bohByRlEqXuNcHNPI24O/NWh9GoVu81BHGjRWd6Ah0ZmpQYbAyI0OlxfGOnEq
6XzGGPv6erFS4g9q7I6bBKb37twEhLO/Rl+VtQXpowxoZwjFnLlnBuqDwY7TibtX
OPLGHiK9MpVaO8vofgLTLjgU4Eei+A==
=ydV3
-----END PGP SIGNATURE-----

--Sig_/vYvCgp2ZLHLl7NrhDIk7Rde--

