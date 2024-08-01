Return-Path: <linux-next+bounces-3183-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 985E594410C
	for <lists+linux-next@lfdr.de>; Thu,  1 Aug 2024 04:25:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54C8B286C6B
	for <lists+linux-next@lfdr.de>; Thu,  1 Aug 2024 02:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBA73DDD9;
	Thu,  1 Aug 2024 02:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="JtiCJtXA"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A301370;
	Thu,  1 Aug 2024 02:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722478670; cv=none; b=Eqcg3WuBPtzJs/BAU4K1lHylNyXwfVPbHQyCBq6lX/UPrrUI/UqLZ7LNqWkVJrK30SetSscICl1s3L0xHzQjFiQ9JuXiKeDZbz1nVCJdYxQyZA0u8V57fghdn4FBICDMmB/D7p1nH56TIkJnvMhzLsBxH47bVU2m4jF+/wgTnpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722478670; c=relaxed/simple;
	bh=oS1RMgLwMHL2Dhqmo7GBAdxNlz2oCF2eZsjIxTf9OW0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=goVjILhRua7bf0gMksIcDj5J0ldpkaRp5qiC/wJ1sZN1fUQ4SZOpl/y3sX/ZFhfYYqSLrsBY6clgGH30Iuf2SJgf9UKBjf5kUwtG354IiOKFidSpMkNTFU8r5Z8xzdZzqS0eXrjFwl4AUr5olyZLPofNg2c+lY/6ildwbm0+sB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=JtiCJtXA; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1722478665;
	bh=fVyxYzqCMvMG8pzOm61KDyWcw8LoxCEnu+X5OHBVRFs=;
	h=Date:From:To:Cc:Subject:From;
	b=JtiCJtXAWEttwW280hQZ9s1N24Vr4Xt4fiw/7jNFRGMPihztKS9ehiWEOqKc+9A1Q
	 rtbMrP8g8gX6U4cI6QCEaMkzvPcYoHdjKw12hKyLlI6Bjb3mNPBqqzK6GdRj4Dj1Yc
	 iKofo3fKNvv4VmibXC9Oou6DYebZkfWJzgwci+v3nJoVO80jtM5nuoRU6Jae1DJcbW
	 ZLJeauwQRhsfyMw2cChjTncmu6DDgsE6tpTax7MqqxLHQnYW8Fi0EU3jDOkFbhTkkp
	 GNk4qk1yaCfxv2o+pnMDXO0kblegMDOewgq6AW4BdFpc3Tl1Do5+vUnqe52w9P5hdn
	 Uzsm8RCOUoATg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WZCKj0c9Jz4wb0;
	Thu,  1 Aug 2024 12:17:45 +1000 (AEST)
Date: Thu, 1 Aug 2024 12:17:44 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Daniel Bristot de Oliveira <bristot@kernel.org>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the tip tree
Message-ID: <20240801121744.2756e2d5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/13r4xTmIENYAR4Qx6jPyBQ0";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/13r4xTmIENYAR4Qx6jPyBQ0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

In file included from kernel/sched/build_utility.c:72:
kernel/sched/debug.c:341:57: warning: integer overflow in expression of typ=
e 'long int' results in '-100663296' [-Woverflow]
  341 | static unsigned long fair_server_period_max =3D (1 << 22) * NSEC_PE=
R_USEC; /* ~4 seconds */
      |                                                         ^

Introduced by commit

  d741f297bcea ("sched/fair: Fair server interface")

This is a 32 bit build.

--=20
Cheers,
Stephen Rothwell

--Sig_/13r4xTmIENYAR4Qx6jPyBQ0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaq8EgACgkQAVBC80lX
0Gy7Cwf+Iuc1/AGMxS/3HRYxyZI5hPUP/gMmsUpwzafP2JSr+meeIcbS2OGTlDVu
pYg5SYxeeZA0HiTxRTYZ663d0rS3uPZbyzdcl05PcrjrTRtxYenhgwR2UhZEa6E6
XRoP7C+oFlLrfhL/RoEDeR+/INo2YYwWJJq31M5KiONJeFGZnZAtxurkmA69Cr3k
tLoxl3G9GV6ElUHejqQXg18fTtc8Dtv0ueNqpS4t2VW0zYBIRiQ0eA26mbQBo05v
ZJytADq4rbZ/k13b9iQT5BsAuGvSFQf5LkC6H3k1ZqG7VfQS6gOW0M2xvfnINRsN
XrPZZFaNjJu77jzWdNfsne1ODwoxew==
=BtfK
-----END PGP SIGNATURE-----

--Sig_/13r4xTmIENYAR4Qx6jPyBQ0--

