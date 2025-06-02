Return-Path: <linux-next+bounces-7007-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 808EEACBDC3
	for <lists+linux-next@lfdr.de>; Tue,  3 Jun 2025 01:47:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 462BE3A30E5
	for <lists+linux-next@lfdr.de>; Mon,  2 Jun 2025 23:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 651DF39FF3;
	Mon,  2 Jun 2025 23:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="FqO5og18"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1FBEEA8;
	Mon,  2 Jun 2025 23:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748908041; cv=none; b=ZAiFQwnbYySLZ6coQeBEJQeG7cXPoT8m3IlaDFtK1tOlYrjE/BErX3vqD5tyippphOGm0PXKwZQU4hHxRpUmEhDObGw1vkleH8PX2T/DbJCu1PkaUp32aIlgv0LP0b/NlS0Oy2juCURhzG3d7Hm6Mma8+AN5chOnMfq+qhP/K48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748908041; c=relaxed/simple;
	bh=/DWl3nGaHU3bnKeyHf6CfgJYPu1TCJQhs/DUH2CxHkM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=I68PbU6/B9YisyJDGkv1F8u0kMHfjQocENrdWYGk79a3hcZPf1Jr0tWt6/OGJnSkBANzcaK84r3K861KwazcQel3z7fMY06aiCtVisMHU3CfNBdW4OpbR/yLZbAk5B0rCE++EuWJwkS959jrsrjTdFd+wWSouEDmdD3Yvip9j8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=FqO5og18; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1748908032;
	bh=oKxChYEyAukC5bCyf1KJjkwMW4JiICur4azOA4BAwYg=;
	h=Date:From:To:Cc:Subject:From;
	b=FqO5og18BNW1rlf751FF5MsDHz11a16lAkzIlj/xfpdH7b+KjSbckW45XX0mwElwh
	 7aD7Oj3WY3Y8MLZRV8D34EfNLiFcbnQMQ15Sz3zQgcjlhvVW5+MNTENl0lWGPHIMQT
	 TVX/tHuafXJt1kYcEkl2kIXvc2f+c5UCRg7weeVLrHHRxpr6oSRkeZGFLZY++NFaDZ
	 g+czWNR9UZdM45v+VD8O66KmQDBSIBmyNxJ13IzxCgnHnD/tdEoahc8osWRixS/4MN
	 NMukCzlXsBL/xEnAgu4H7szW3gLEW/xSE/6F6beoftF+azVndKV7p6MuMdTgfF+XdC
	 I9dD6kOllT22w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bB9Vm3bhDz4xMG;
	Tue,  3 Jun 2025 09:47:12 +1000 (AEST)
Date: Tue, 3 Jun 2025 09:47:11 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the bcachefs tree
Message-ID: <20250603094711.15762f7c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7pdD6Wh.X7hZuRDwM09Zd/0";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/7pdD6Wh.X7hZuRDwM09Zd/0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the bcachefs tree, today's linux-next build (x86_64
allmodconfig) failed like this:

fs/bcachefs/fsck.c: In function 'check_dirent':
fs/bcachefs/fsck.c:2187:71: error: 'struct bch_fs' has no member named 'cf_=
encoding'
 2187 |         hash_info->cf_encoding =3D bch2_inode_casefold(c, &i->inode=
) ? c->cf_encoding : NULL;
      |                                                                    =
   ^~

Caused by commit

  b4ff0eaf0aaa ("bcachefs: fix bch2_fsck_rename_dirent() for casefold")

for this build:

CONFIG_UNICODE=3Dm

I have used the bcachefs tree from next-20250530 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/7pdD6Wh.X7hZuRDwM09Zd/0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEyBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmg+N/8ACgkQAVBC80lX
0GztMAfxATWP48oHyLh1US2qreOu/D0bZHxa1Ev8vlcL9X1YT0dlm3wyW67OsHPh
4QJ4FbH0SRcalk/CGjixp+1RhyvsTeEGk4a+dvpvF9rJoFK7EL6g4iYZxbzDv4LY
k09WDxgANLtOe+48lDwbunXIspLB3BAAxfgxv1IeYPlMi2dws6FP1+zvTh+jHVw5
tzrEJLf1ufcC5SFET3HQcbd7Ge09BR+tW3BN7YDiwe/PlQM3bX13oD5wEusdDCMz
lHA/8bzy2GB1mf/eIUJEGVP8Zam0dGL576f+aN5VRBDCO/QRMNwLGommnqqNfC71
UA+zQqw5ZE9j7WUDND38Nr3r1hev
=BHnj
-----END PGP SIGNATURE-----

--Sig_/7pdD6Wh.X7hZuRDwM09Zd/0--

