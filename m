Return-Path: <linux-next+bounces-6339-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C76A97A7D
	for <lists+linux-next@lfdr.de>; Wed, 23 Apr 2025 00:29:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA67B189C66E
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 22:29:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8737825C81D;
	Tue, 22 Apr 2025 22:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="hmXPbR2O"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9532701AE;
	Tue, 22 Apr 2025 22:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745360976; cv=none; b=ra+fAOFBIBX8UCebE5tMe0DI7onLnqGYhJunhL4WcSyenrwV+UZbrIhPdSELy6acSLmlvlxLxfV9KEjhdXgVNtMbKYgk6aymgCOSmPFYOVvA+7UqD8x6mTBSVcZMXQKP27uZiUOiMgnu7Xx5U4qNjwFtW3SlcwqVeH9ylQXI/7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745360976; c=relaxed/simple;
	bh=pm7cUXM8y3awphCsbCHGxlGDv2cLWuP5LQ5ih7JfLmw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=sUQek7zRzdgub6TCBDy2VGlvOu46ns04EuD9GN6yUbtZ6v+Uk48UNOCw1Lvt0DHN9uB5yDjUSUWcOr3O3atl6SCn4ktW+EKkyWF68CAncbXKcXqx16LumawvOCDgD8eGGcO6yPRUifvzt3tu0mDn+b+M8oKWT49EVpFU/YvrtmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=hmXPbR2O; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745360966;
	bh=5G7v2xzO674mCNoDJCXPmF2yZDjwwg8vGbTAmGr9Nww=;
	h=Date:From:To:Cc:Subject:From;
	b=hmXPbR2OhpcFUOZe0Atd7bKeQW0/xN04O3GykCypRDxVLlxOHy4UgcW39MAgST6kS
	 fYI2vg7O1hnexQcUm2DMDvtbrtSDTbSLzx1rncySZe3LWeCPcmFhmPEB7pTztPCGsS
	 eCu7qzygcceqfX1paDH/icj+uLv/19Z9Q1TKI0WV39JHWX56lCi4ZgMRCkcSdMkUEt
	 n+Q4TA9J3N51ljRhwvlPAZsZOWwGJMKUBhbjBdFUSPDJ/ddidTmKfWAoMvVIv9DBFS
	 AXa0gHHteoU1z7LHlkAg8cyA+WJAP+CGiTZEHwzumN2XdBvC33w1dTyZp09fjH9yv1
	 7TbQL9EMV/pPQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zhxjy0Y9Lz4wnp;
	Wed, 23 Apr 2025 08:29:25 +1000 (AEST)
Date: Wed, 23 Apr 2025 08:29:24 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Sterba <dsterba@suse.cz>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the btrfs tree
Message-ID: <20250423082924.0304a186@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/y5aFDOoYDbkyCfrjJr5pH7+";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/y5aFDOoYDbkyCfrjJr5pH7+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  0343f88be454 ("btrfs: subpage: access correct object when reading bitmap =
start in subpage_calc_start_bit()")
  308a921d5c45 ("btrfs: zoned: return EIO on RAID1 block group write pointe=
r mismatch")
  39b4c6395e2a ("btrfs: fix invalid inode pointer after failure to create r=
eloc inode")
  4853650cc31d ("btrfs: fix the ASSERT() inside GET_SUBPAGE_BITMAP()")
  4a50116e0850 ("btrfs: tree-checker: adjust error code for header level ch=
eck")
  53dda1b821c4 ("btrfs: avoid page_lockend underflow in btrfs_punch_hole_lo=
ck_range()")
  5605a0903ce1 ("btrfs: zoned: skip reporting zone for new block group")
  982446a056f3 ("block: introduce zone capacity helper")

--=20
Cheers,
Stephen Rothwell

--Sig_/y5aFDOoYDbkyCfrjJr5pH7+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgIGEQACgkQAVBC80lX
0GxKVQf/Q1l5Xe754s5EDPOmfWowoPVgYFiG2gm2Y8e+V/GRVwVfpSUWX7HyXvz4
p92uFVKfUQvLwpFf2U2V10EvAYAbQbNKVXyvxTj/W0Az+pjZEyNUMiNHP+66yu+v
+XNOqq/iWhZ35qEl8ERgyGisI/QwZBlJipJjeKYT3gEXfWzL7Kh4/wD2Pcf88T1Z
cEPEHD/sgXEIQWQPwhevcYZmlnZzcTlw4qpjE+Rs6p8AULKaFoASPUlc35RWN53T
El4gpNRj9oqJEthWEX6Se+xbNbx4O1Z/W+NT5Xcm4L30znm0dAdBHR4QOcI4KIFu
eBYO4F3A8im2ZitOmGpherJKszGpXA==
=eUZq
-----END PGP SIGNATURE-----

--Sig_/y5aFDOoYDbkyCfrjJr5pH7+--

