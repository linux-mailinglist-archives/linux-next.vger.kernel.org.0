Return-Path: <linux-next+bounces-7296-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6632FAF071D
	for <lists+linux-next@lfdr.de>; Wed,  2 Jul 2025 02:00:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7DDD54E17C1
	for <lists+linux-next@lfdr.de>; Wed,  2 Jul 2025 00:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B775F28504B;
	Wed,  2 Jul 2025 00:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="OZd9SZLW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75C024E4A1;
	Tue,  1 Jul 2025 23:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751414401; cv=none; b=TmX+3qNyZGfcDoIkM8GKF8cBrQRoKXIuMl/KLyrL7RB6du+H/CnJTZvZyu6YzOcyHOy6ahZpE4AG3GAPGQ3qq+p3AKRT6PPU1Q6Xl1UNklAYwEwrBDfup9kFzbrPQY8/LnNuM0RaQfP0NrdMm+DSvrVOFIFBUFKTFlGYN5+ZiQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751414401; c=relaxed/simple;
	bh=rxbsUTGOVvyPGtgx6cjN99AdYdjauYRSq9Wvrlrmf0M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=uYfcrx2zIFNqhFwHxvtOsi9g8YgPH+MfF7k+MTMZPCSOcy4kSSV4q+amHId14dvsWE/O5LVe/fEXz8nQQXt7MSRmo7u3nCOzoiv1zATYGrSRKwCnxW3o5OimYU0pswzMeae7yGx+seF3eeNhkNz+SIWyVw1L3YsYQ1xDwhF42Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=OZd9SZLW; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751414381;
	bh=Mgd1mI5F34xSkqss+pNP+uZCGp5+tUerRW7Qt3GO3/M=;
	h=Date:From:To:Cc:Subject:From;
	b=OZd9SZLW5pRD/gPx2Y2kh5ofRai+CwftUr5HDa7SCSSQ7j876S3uX6GHehiABIMm5
	 5vZt5CpaP7X82bBNGQztW0ntI/whOCqrbL1SlamYQpFIBumlYLNMKumrbKMRAwooGl
	 uH8ABKsAUtODVbPjIIxywbAO+XRrS7Z3SdX2Lg3ItYZ5ezHsd/4JGCVdfj4mfYCam3
	 g2aUq9cxOGA/ebJXXV2zSMvz9100geOa8D8M6w3tDj9gykuVTzDraYjtY1lQsK43tL
	 0mLrEWOH9t7Ezew5tln/GqYFlmsZ8wqS7QheKi71SjNv9/Tq8vj6CxDGagLVV2wuIC
	 j7d9NXQ9pmwRg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bX0Pn5CR3z4wxJ;
	Wed,  2 Jul 2025 09:59:41 +1000 (AEST)
Date: Wed, 2 Jul 2025 09:59:52 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Sterba <dsterba@suse.cz>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the btrfs tree
Message-ID: <20250702095952.0054d878@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Dn8eVuqGXawNwZHl4Afe+xD";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Dn8eVuqGXawNwZHl4Afe+xD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the btrfs-fixes tree as different
commits (but the same patches):

  2a3c7660adce ("btrfs: use btrfs_record_snapshot_destroy() during rmdir")
  98a0f4b12f16 ("btrfs: propagate last_unlink_trans earlier when doing a rm=
dir")
  47daf995b2af ("btrfs: record new subvolume in parent dir earlier to avoid=
 dir logging races")
  329dcb54d3ef ("btrfs: fix inode lookup error handling during log replay")
  edf7a45c2d40 ("btrfs: fix iteration of extrefs during log replay")
  cd259be49719 ("btrfs: fix missing error handling when searching for inode=
 refs during log replay")
  b3b587df28d2 ("btrfs: fix failure to rebuild free space tree using multip=
le transactions")

These are commits

  157501b04699 ("btrfs: use btrfs_record_snapshot_destroy() during rmdir")
  c466e33e729a ("btrfs: propagate last_unlink_trans earlier when doing a rm=
dir")
  bf5bcf9a6fa0 ("btrfs: record new subvolume in parent dir earlier to avoid=
 dir logging races")
  5f61b961599a ("btrfs: fix inode lookup error handling during log replay")
  54a7081ed168 ("btrfs: fix iteration of extrefs during log replay")
  6561a40ceced ("btrfs: fix missing error handling when searching for inode=
 refs during log replay")
  1e6ed33cabba ("btrfs: fix failure to rebuild free space tree using multip=
le transactions")

in the btrfs-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Dn8eVuqGXawNwZHl4Afe+xD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhkdngACgkQAVBC80lX
0GyhIAgAgHP/Dr+AdQlas/LXmsTUdcpV3NyUeFNYSCmJ5b6a4+7TEvZaZX/V6e29
mu25Jomr3cYH9GgYoa+QJ9RWLwhUnP0Yp/Q7/ZOnh0L+89HpKJ4iIhnNAu4V/QAr
BCImQlP6RHG3wOHw1otx2JJSyg8ZMrsPzwam8vYrtmIzolBKesUa9nqrQNYRvDuO
v69ty48N984RD++2xZ6nqyNl1D68BaZiLs3YA36HgXsTXyp5RuPizcCMNT3z3MqE
LqaIZT2ywYn/x4AZPiYNKIISKQoEohT0XIZBCAYfvlpWjiM7HJANm4F0KqYzb51y
yZHR90jn2iEVsYUhNvZivVh2lDmMdw==
=Hzk5
-----END PGP SIGNATURE-----

--Sig_/Dn8eVuqGXawNwZHl4Afe+xD--

