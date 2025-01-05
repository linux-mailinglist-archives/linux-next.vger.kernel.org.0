Return-Path: <linux-next+bounces-5024-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D698FA01BDC
	for <lists+linux-next@lfdr.de>; Sun,  5 Jan 2025 21:52:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77E663A3843
	for <lists+linux-next@lfdr.de>; Sun,  5 Jan 2025 20:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B6381B5ECB;
	Sun,  5 Jan 2025 20:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="lQpYN0vm"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733C0A29;
	Sun,  5 Jan 2025 20:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736110340; cv=none; b=fCf4lOsP2pnt2y2oTpWZsV4fggK7c1PfF7//aD21xi8PYUY5DsjTJXd4LWOi/6Sg2LkZys+uLmyemFqKN+ZN1f53Yk/1KhpvUZQi1tnYSvSu4dGAYExrmLXr1ik0vk+aRefGZ3Le9WbLzCQGlwQ3bXRM5CtuZwEzYIEjjdimTao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736110340; c=relaxed/simple;
	bh=qCVOqmpladThk+RCBJ/0aHMwPKPtKLG1rFh9XP9JeL0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nRBcicFtehdpTliAtT6wUYFdsjy6pi6GDa/f75kS1rYVchBNsgwmubFROgxPWrkIbVr0tWsvhQBtU+AvLfda31VU31DrvzvjBEsZyBHIDxb/80kBcnEvQRTQwez2zeWZnnxVxihozsW86h/FnoAa4juz+zaMZoclVxpYHuywYGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=lQpYN0vm; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736110327;
	bh=HU9GZB3YpqxLCvhtS+s//kEyPvkROuqCyxv2AJYoTkQ=;
	h=Date:From:To:Cc:Subject:From;
	b=lQpYN0vmI6v+lOOM1X5zxGB0eTUhqcdg5S6W+P9p/4kUKqSVKv1RCG1us9uNGQcBL
	 FFSWC/GKjdtwFRF1WmQOB2K974TbRx56YpJIGt/dX/cInwQZYDuT9qIdPRPJGGYv+r
	 LnpBBy2UWYTdQ4w26Xxggcy2wxB571k9aJH3zesL7RDPMl1B0w3tMGhXxk8oWsmCAz
	 hmDRWI+jDtUcqWi4n07qpCA8VBdLv9BH3SFO3kOJl7vLUoXp6WRkKWyE0r3YxHzVfL
	 8IYy82mYXodUbuRG9zl42Bh1P1LU7A9SsYQ5Oh6sVExT9lCgRs1Znkcn6sk4+PUeOg
	 PmNO/wRhGmGlg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YR8d339zfz4wyV;
	Mon,  6 Jan 2025 07:52:07 +1100 (AEDT)
Date: Mon, 6 Jan 2025 07:52:13 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Bharath SM <bharathsm.hsk@gmail.com>, Bharath SM
 <bharathsm@microsoft.com>, David Howells <dhowells@redhat.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Steve French <stfrench@microsoft.com>
Subject: linux-next: manual merge of the vfs-brauner-fixes tree with Linus'
 tree
Message-ID: <20250106075213.6046a9ef@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/d6QKGiC3B7wi1F1tlNB=23u";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/d6QKGiC3B7wi1F1tlNB=23u
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner-fixes tree got a conflict in:

  fs/smb/client/smb2pdu.c

between commit:

  92941c7f2c95 ("smb: fix bytes written value in /proc/fs/cifs/Stats")

from Linus' tree and commit:

  4acb665cf4f3 ("netfs: Work around recursion by abandoning retry if nothin=
g read")

from the vfs-brauner-fixes tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/smb/client/smb2pdu.c
index 959359301250,458b53d1f9cb..000000000000
--- a/fs/smb/client/smb2pdu.c
+++ b/fs/smb/client/smb2pdu.c
@@@ -4840,12 -4841,12 +4841,14 @@@ smb2_writev_callback(struct mid_q_entr
  		if (written > wdata->subreq.len)
  			written &=3D 0xFFFF;
 =20
 +		cifs_stats_bytes_written(tcon, written);
 +
- 		if (written < wdata->subreq.len)
+ 		if (written < wdata->subreq.len) {
  			wdata->result =3D -ENOSPC;
- 		else
+ 		} else if (written > 0) {
  			wdata->subreq.len =3D written;
+ 			__set_bit(NETFS_SREQ_MADE_PROGRESS, &wdata->subreq.flags);
+ 		}
  		break;
  	case MID_REQUEST_SUBMITTED:
  	case MID_RETRY_NEEDED:

--Sig_/d6QKGiC3B7wi1F1tlNB=23u
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd68P0ACgkQAVBC80lX
0GzbvQgAg0fuU6YWkQb3q97as57SZ+9vYX+n7C5HCPYJ73qyiG+jgHpk0L/BXhAT
Dm8qG86Mv1x9HpEIzSqFINsXhwx+qn+exAZoynbcIXEtlPvIcEO9i5nCFL4B+6NV
tLev7L5/BcNazEyYeu+EHahtNiFpETRfU/eiBfsSEmBEiDHPkPm+N8x1TY3Av5Me
hEcKZc/jybbqqUDTAygPCsbwIaCwJccLwyJ5hNqQPHxI8RfN0G4GZ56RZu8F58MN
yeRJRMQrkkEoNdgzXW94EYULLOdUND3Sk3B8L8zDceSbqTiWzDVRkIoDHdnxtBet
cPvjufPC8dHRSyWcy2/DaN5lpKxdKg==
=2+kJ
-----END PGP SIGNATURE-----

--Sig_/d6QKGiC3B7wi1F1tlNB=23u--

