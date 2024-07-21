Return-Path: <linux-next+bounces-3090-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC033938684
	for <lists+linux-next@lfdr.de>; Mon, 22 Jul 2024 00:24:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 484FF1F21586
	for <lists+linux-next@lfdr.de>; Sun, 21 Jul 2024 22:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FCED140366;
	Sun, 21 Jul 2024 22:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="HYq4SDQ5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF5110A1F;
	Sun, 21 Jul 2024 22:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721600673; cv=none; b=AWUqJtiBg1OzeItGOvVYdpHsox5+480QxJGkQJmK5SLY2poJvfBBChKukgKbS5UrciYw14GoiQ/mjzG2IMwbRQrq9XJSGUYrTiSEiFCkOQ5kfx5541QZYuOYMdUJxu7U5B2m6Mr7qmKDTo+HXqa5CIK8GD9VMklCORycma2hTlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721600673; c=relaxed/simple;
	bh=S/w/XyA31ZDKfYuXS8arlM6esv827d59gpDcvpNW2xY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZZ8Sy5ATBEZNAvHV7SdDtQY4yOJ2BMw1rsn1MH0PZXMZla1rJTF0DXOuK+vmpwGFQEWBurXLFLPq44T2RZHpzGhSjNAYizDyXJegwShiaU5DyTyGgxGorENLtjR5K75RCK8Yy8TDmsyhjZwE3sNkSGvS4hwa6ewd3LWtTTrD1Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=HYq4SDQ5; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1721600658;
	bh=Uk5NLdxVMZbTccu32suEA/DBRvv0J8s0ILTjrgKxjS0=;
	h=Date:From:To:Cc:Subject:From;
	b=HYq4SDQ5nPWkxooKFJ95WRQoJkgUO3eHJ/BuENnEuKBiHfDBHUA6ZOcOp6BH75GcZ
	 q9PChvpEWm5OOdKzAO1IupuAfq1o7IsiYTGEBerEpzXvnREn/sgYgiHFT9gCoK81xZ
	 Ia//bcwKnC8kqr+qo7Z/U/IzzMXJiJ5PWuuSn7FpnHyw8L7DaGYOQDpEO5LsYSwbFu
	 m5GavPR4G/xyTJBhfjyu8UW1HVPw5C5xbONv9iqgbdpFZObmJRpyWrsvJ8+BXsSwhK
	 ELcSZvDsdj8tZwUu7yQHRZJSwCNn7+ppbNZ8ijIdKe2HD7FT8wjyfhnmTVnvrTBpf4
	 OYXj0O70TZRkQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WRycy0l8sz4wc3;
	Mon, 22 Jul 2024 08:24:17 +1000 (AEST)
Date: Mon, 22 Jul 2024 08:24:04 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Sterba <dsterba@suse.cz>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the btrfs tree
Message-ID: <20240722082310.113978b8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xHzYG0pPu14tAsptm2mMm07";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/xHzYG0pPu14tAsptm2mMm07
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  5363738db29d ("btrfs: change BTRFS_MOUNT_* flags to 64bit type")

--=20
Cheers,
Stephen Rothwell

--Sig_/xHzYG0pPu14tAsptm2mMm07
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmadioQACgkQAVBC80lX
0Gz7+Af/Qf0ag6sGkycMDyUHFDLOqXN7usL8RPOnMBLL0uJa6c6bPjrJOXbTB2mP
ZuWJo/NiykNpL688BS61eC6qfwV85wfgVf649mV+PN9Rj+vVTBj9fofWDS8Jbk54
yN7Wp/dLS8W976uKa8b9StDQWfKBf+d7AP/KTj3OtkgFUAyNmY+mPt6cIQH/ipy+
5MWuLFjVPNhD2vZLUuRozwx+/RVJU0hFX0Z9/qFMGtw8orrhqlxhgk7XUq2LYC+7
FADjEpKz82UPmdGDc7KK1xTTWP9xxEPoAJ0e+w5I1ot7mA7SSBDoc81Q1AF+OLVQ
P97ecLw81VAIPCCnBt3wXYnf5qHDQQ==
=L1eZ
-----END PGP SIGNATURE-----

--Sig_/xHzYG0pPu14tAsptm2mMm07--

