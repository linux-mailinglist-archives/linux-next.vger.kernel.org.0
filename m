Return-Path: <linux-next+bounces-2703-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEB291C051
	for <lists+linux-next@lfdr.de>; Fri, 28 Jun 2024 16:05:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ABEAE1F21F16
	for <lists+linux-next@lfdr.de>; Fri, 28 Jun 2024 14:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 039741C0058;
	Fri, 28 Jun 2024 14:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bLZCBQdZ"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6121BE876;
	Fri, 28 Jun 2024 14:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719583515; cv=none; b=jvS5lx7qyzOdcuss+b++pBcSxsbsD13xJyxqvstGeq1kMKyj4ixb3DC9nZ+yNI9L5IvHUgV5H/9X/LpWrMpxk+rhC+RxJw9JAVZwMgZXEGgLQkmvtduNUXSKj7e2LSVhMsCXk62WghxIjqhYmr7zZ62A1POShS6Gj/F64sPh/Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719583515; c=relaxed/simple;
	bh=qsG4g2u/tcqSHwDpr0g25PxXA3X2U8qlDlufvdqSJbM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AQgEYjbZAF3mNbRPMnN003TnKXKbf8o2YCMQHF/GEsvQHHAI7QrZ62q8Cqd8fJLFeIOR9dMZhKEnen1hiB6p+Oti3MOTtZOg8If5GHdFWHlT1NzVAVcZ0h5Tbm+i/kYeQYcIF9Iz1Dl0HEWlKudGLxAT33mrqaKwkmwBVUUeu24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bLZCBQdZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DF01C116B1;
	Fri, 28 Jun 2024 14:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719583515;
	bh=qsG4g2u/tcqSHwDpr0g25PxXA3X2U8qlDlufvdqSJbM=;
	h=Date:From:To:Cc:Subject:From;
	b=bLZCBQdZhxCkNQynmO9jTRH9N3D2lXJAMBfjTTZc4K1Uu8nmov33qydP9bnGobiAh
	 W9Q9/9KOdNekdZ8D6h+awHxq0x+ROBZgXd7eAn9WIrLF/JxT7OVO1ZwRqy7uyn/WDS
	 Hvdg6JW42KJ+/K7PWtvSJAsZugn2mrgCGD/mYQ4sYjBRMx85AVKNe4ZD6NnVs3hlio
	 XnxwFD/tIAKv7YKS7BrprjuSSWOsMB232caIpwhl6ZfuwuOzFhF/kpTh9CL4Xi7dpI
	 hX4+dLgEN+jVQSu52IZzamJcUMsGxM+agrprfe7YuT6vKIEVEWxY2T6/I2c2NRZae9
	 q4TRD3ROGBfBA==
Date: Fri, 28 Jun 2024 15:05:11 +0100
From: Mark Brown <broonie@kernel.org>
To: David Sterba <dsterba@suse.cz>
Cc: David Sterba <dsterba@suse.com>, Filipe Manana <fdmanana@suse.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the btrfs tree with the fs-current tree
Message-ID: <Zn7DFyeBCg4LPZTT@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TB9WiHqMLIN2G4z6"
Content-Disposition: inline


--TB9WiHqMLIN2G4z6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the btrfs tree got a conflict in:

  fs/btrfs/tree-log.c

between commit:

  d1825752e3074 ("btrfs: use NOFS context when getting inodes during loggin=
g and log replay")

=66rom the fs-current tree and commits:

  2eb717ce25c03 ("btrfs: use NOFS context when getting inodes during loggin=
g and log replay")
  8cfe0e0697c2d ("btrfs: remove super block argument from btrfs_iget()")

=66rom the btrfs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc fs/btrfs/tree-log.c
index 0bce1d45e2526,f0cf8ce26f010..0000000000000
--- a/fs/btrfs/tree-log.c
+++ b/fs/btrfs/tree-log.c

--TB9WiHqMLIN2G4z6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ+wxYACgkQJNaLcl1U
h9D16Qf9FuIKLsg74QQcp8FdQCIJigZZnUL83BebRgWChemqh6fuEmt6lF4Vo3Wi
mmtfYbV4KQ4/ds2fR8XIRkX5ObJp0idcRSPFAq9NknT/mjgdnBbMy4QL/HsZNuBG
37WAd71ffxudYsOmM0xUvXrK1854hWUxwX/wMe82O2i+CwSfYtZzVTgA1Ht8ibCK
CTBCFXz6bLu7+MoAbmUYmSPA0qZPjw1PZMqw3GrzjkLIofv3zTxU1Pj27stldyYN
P/AzOvk57flyZwbH7avfyCyFOIN7JsIo8EEOajwLMX1qW45fDMf6nwjED3IZlzUt
z+FoQ9o9qUv6Ztp+9ZArjFHwRTaUAg==
=FsKZ
-----END PGP SIGNATURE-----

--TB9WiHqMLIN2G4z6--

