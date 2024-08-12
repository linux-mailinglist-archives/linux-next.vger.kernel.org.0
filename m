Return-Path: <linux-next+bounces-3293-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BAB94FA0B
	for <lists+linux-next@lfdr.de>; Tue, 13 Aug 2024 00:57:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD5F31F261A6
	for <lists+linux-next@lfdr.de>; Mon, 12 Aug 2024 22:57:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F71319A291;
	Mon, 12 Aug 2024 22:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Un0eJeak"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA26C199380;
	Mon, 12 Aug 2024 22:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723503121; cv=none; b=c9xtZVGIMxntlYdEVR9wgY7GEUUVKapf/ECOiFz6EFsgM8P/2oPS8XMY/sV66FiZl4LD/JEkhxuc6FZ0yKb+CiD2NC06YfCcuNy3HWmEYjWXmqLVn3lT0Cb175zq/mm2sTO1KrcjWXcuH6PLoxMZWlU+v6/gs1Nb2AwDCN4z+UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723503121; c=relaxed/simple;
	bh=2opEo/VgFFeZJKfZngD8yML6SUz7G7eb2MCNBI3OX2c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=f6p0E8T/Q7ynCMst3yyIo5VYs3pX6C0rU9rDl3bgVCETLTjZufXV50dVaUiBHBQSeqQv2Gjp6um0bj21fNnkXZ6DuMpM3gTctJgTxCaeuW2qytKk6bmF4WbizCj6m8ULo0eIwegaRrksQ6fWs47QZ/WzSFw/sMUc5Bk7vWCjtf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Un0eJeak; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1723503110;
	bh=YEqsHGPV72L+M2eQgfwTyMr8vAZrzEur0p+nucQCs0Q=;
	h=Date:From:To:Cc:Subject:From;
	b=Un0eJeak8DLqB/UC2idt/UGl02ERLL/Ssrwg2gFUlD9DwUtlsODAa28dANmnUuuDT
	 dVSoGeLB1nYqBNDTl51cfq/UmWtHpywXRWx1AiCEk8thObfcV0WjVUOj4/blUhV+kp
	 BkUja64nUheLkX41gJOpGtMTlpEcRdxrdEwXwZ6lXVlY6tvcikKlxdKJ0+TdPRLyiZ
	 FYe2v5xaOI5s72n3E6fBdDEW2bjOhRaTKHG8Fr3lZ21BQ+WhnxdnwSEpLabnUcjYoE
	 Mc3oTfJ0zqpmHWb/ZrSr83r5a8kzrZFJlU7x0Rzt4ZHKlUAWqnLBMQJJgASV5Hybew
	 82jbem33jd1kQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WjVBX1xpjz4xCW;
	Tue, 13 Aug 2024 08:51:48 +1000 (AEST)
Date: Tue, 13 Aug 2024 08:51:47 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christian
 Brauner <brauner@kernel.org>, "Darrick J. Wong" <djwong@kernel.org>, Leo Li
 <leoyang.li@nxp.com>, Peter Rosin <peda@axentia.se>, Richard Weinberger
 <richard@nod.at>, Thierry Reding <thierry.reding@gmail.com>, Vignesh
 Raghavendra <vigneshr@ti.com>
Subject: linux-next: trees being removed
Message-ID: <20240813085147.786004fb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/m/RV.EsbhE1zzCHvWicHqfd";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/m/RV.EsbhE1zzCHvWicHqfd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following trees are going to be removed from linux-next because they
have not been updated in more than a year.  If you want a tree kept (or
later restored), just let me know (and update its branch).

Tree			Last commit date
  URL
  comits (if any)
----			----------------
cfi			2023-07-09 13:53:13 -0700
  git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git#cfi/next
djw-vfs			2023-08-04 08:20:57 -0700
  git://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git#vfs-for-next
drm-tegra		2023-04-06 14:02:33 +0200
  https://gitlab.freedesktop.org/drm/tegra.git#for-next
mux			2023-05-21 14:05:48 -0700
  https://gitlab.com/peda-linux/mux.git#for-next
pidfd			2023-07-02 11:14:54 -0700
  git://git.kernel.org/pub/scm/linux/kernel/git/brauner/linux.git#for-next
soc-fsl			2023-06-08 17:56:26 -0500
  git://git.kernel.org/pub/scm/linux/kernel/git/leo/linux.git#next
soc-fsl-fixes		2023-07-09 13:53:13 -0700
  git://git.kernel.org/pub/scm/linux/kernel/git/leo/linux.git#fix
uml-fixes		2023-05-10 00:21:30 +0200
  git://git.kernel.org/pub/scm/linux/kernel/git/uml/linux.git#fixes

--=20
Cheers,
Stephen Rothwell

--Sig_/m/RV.EsbhE1zzCHvWicHqfd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAma6kgMACgkQAVBC80lX
0GwYSAf/awrH6M+i6Jitfx0Abd1OzR4OuzOBCisfaXBv9/tu6zc78Ou2FzmMFcUG
tIfJqsG/IEK1liGBQ3mE17AGBohbNW7hAN6mdv4KoTXOsMmc6kYfD0Cm17+Q7fA5
Rhnx9IMRqim8VERxHlzXUIUArdsrBz9pcDnWbT6Yzh3J/YjcHB9u5NMyRNUzvLel
DopdTZkQMLXf+ASNJjLmmyOBbEqdmlB7hIqpjZA7wvv9d0b+8zYpop9tL9z+Diw8
Hy1kXYnrhNr9UhoyD/EpTeUhCkKEqdJ1TsVrm/U7rhqwh558tpziwxGZqdoGnSGV
0hROvtY56V6PjXUlE/UGkYkX2v2mUQ==
=dsZR
-----END PGP SIGNATURE-----

--Sig_/m/RV.EsbhE1zzCHvWicHqfd--

