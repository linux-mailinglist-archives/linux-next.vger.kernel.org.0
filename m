Return-Path: <linux-next+bounces-278-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE5E8096EE
	for <lists+linux-next@lfdr.de>; Fri,  8 Dec 2023 01:08:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FD501F211B1
	for <lists+linux-next@lfdr.de>; Fri,  8 Dec 2023 00:08:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5692A7F4;
	Fri,  8 Dec 2023 00:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="KIBaVo4B"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 783881713;
	Thu,  7 Dec 2023 16:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1701994085;
	bh=Y8H1SxXdEsoUXtruYdRocu8FnDiCy0NFG2kz/YYgWKQ=;
	h=Date:From:To:Cc:Subject:From;
	b=KIBaVo4Bsdlxs9FvaPz3pU44nvraVNUjLd+uB6vmxlanFrsRGRmIvSmh79PtqyfiV
	 LJWJkCc0IzcxsFctt3+VGS9etUP/ByiJGHpzHh7sekUEDHEhWbcBqKARAyi7sK4ZQN
	 9wnBli2NhD9+7dG1LEKN88NYwYmgRLTmmo3yVp8EJtG34ki9nxZ1EPZipsl5ntiJdn
	 wl5Bf1HDeUGg73KATVSWRVXOlqdCg2x0GVltqyO9BbkVCfE6UjoXNmaHfV39VOT/9c
	 xUXKR5ea9Lh8rIZjhGALclB52FAqxV2F5+y/lLrqp9vkqT9RDGrrQpOmfZ6+Y/D8w5
	 y6sFKUa0BeYiQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SmWgT3rdsz4wbh;
	Fri,  8 Dec 2023 11:08:05 +1100 (AEDT)
Date: Fri, 8 Dec 2023 11:08:03 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Sterba <dsterba@suse.cz>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the btrfs tree
Message-ID: <20231208110803.59c777b9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0oHs9sGDSSYN0qnY7QHCUCy";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/0oHs9sGDSSYN0qnY7QHCUCy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the btrfs-fixes tree as different
commits (but the same patches):

  34394e93dcb0 ("btrfs: ensure releasing squota rsv on head refs")
  157711241cca ("btrfs: don't clear qgroup reserved bit in release_folio")
  21b2ea73c688 ("btrfs: free qgroup pertrans rsv on trans abort")
  eb56ec091a44 ("btrfs: fix qgroup_free_reserved_data int overflow")
  025d23a138c6 ("btrfs: free qgroup reserve when ORDERED_IOERR is set")

These are commits

  e85a0adacf17 ("btrfs: ensure releasing squota reserve on head refs")
  a86805504b88 ("btrfs: don't clear qgroup reserved bit in release_folio")
  b321a52cce06 ("btrfs: free qgroup pertrans reserve on transaction abort")
  9e65bfca24cf ("btrfs: fix qgroup_free_reserved_data int overflow")
  f63e1164b90b ("btrfs: free qgroup reserve when ORDERED_IOERR is set")

in the btrfs-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/0oHs9sGDSSYN0qnY7QHCUCy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVyXmMACgkQAVBC80lX
0Gw3LAf/dEsUwCcV60LW/BjH1zC0Q7+VaZvDgGpPYUhIMocjwjXt+e+A5b6UKwF1
n18KLATLxxQCLOuT2aJMo7ImbgtYzPStnpmZ2GdrNgYD2G1ZhkWn1otawrnGSKHs
Kgk0KjpgRG4gRZBtJH0s0W6flNUI37tYKwVaPtxsyL8lVNv3jI3BERMfjd7OsQus
M3AD0wHtME8Sm20kBifF4mYKO5+dG4DvKSekePPYDzODF56GPnb2iDnzEtL45ulI
mbolZkIyXTeQToBeQOfpxPcYPU+YOl3qlkubgG9riXNjkgPc8Xk0tVIhohG1Cs8n
kqB3HOzYGFtCloSKPREpbzZUjxbV6g==
=yu3C
-----END PGP SIGNATURE-----

--Sig_/0oHs9sGDSSYN0qnY7QHCUCy--

