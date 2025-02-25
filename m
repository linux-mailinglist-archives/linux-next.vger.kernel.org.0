Return-Path: <linux-next+bounces-5561-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E6FA43424
	for <lists+linux-next@lfdr.de>; Tue, 25 Feb 2025 05:32:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90D71189D8B7
	for <lists+linux-next@lfdr.de>; Tue, 25 Feb 2025 04:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD6C82904;
	Tue, 25 Feb 2025 04:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="IiDKaDWw"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EB81362;
	Tue, 25 Feb 2025 04:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740457934; cv=none; b=QK16JAbavM+n8/4/6CeT3SzOZab55Vxw753Kz31r+BecnYHHfpMj0+YDqIEaUHjjjf25PWE/mCmGoirLn2jcP96swQHBeZF4wBnVB5WpQsweY0E1+Z8I+BCGH7yC64rJ6r8IvBAmfS3caqfkOslJujn/ugnZMJgW6MHup0r2KOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740457934; c=relaxed/simple;
	bh=irayXAisGUoUoGZvRyGhIKIP5KwuaCozyhuWr6IDiZI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Z/pRqNCJgioImvMvfMjAUMx6D2UwrIxPQCjI2isM5JsuT8UqmC5o706lu+Dgulzx/O5n9SRhNi5+KhuXcBnHkf0/GfKmx+A6GDXurrgjfYZDKEJgTYXIy5HKba+Yd2UNodxpzvEy3JXk+UwwlXzcbLPPTwfJzWhfdDkEdrS6g+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=IiDKaDWw; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740457922;
	bh=ZuCR/MCGR9SvJt/L2yF3b+kYGVfqXq9PZC4o2gp9sDI=;
	h=Date:From:To:Cc:Subject:From;
	b=IiDKaDWwxo/KMCjJMm6aQahJnfouin+KXcG7iNA6g4T5aprgQeV2RMLJqxXfVNNxJ
	 W5IW2k1YFwRseOMzcCHjfOgcaocjCh5sW3J79QVvWOdt0lC+QfQGQC4EK9NVcrfnVJ
	 LKRCy7bhu9cs2rQuyT1oe8TYEPJ7tP94az9kWhXHuTPT1X20gXB9H8wKFIhwMfp34T
	 xIJmtd/xdJg+YL72QfNGlt7Y5NurTWxq82IlR0zcGRm2TKq1Zv+dq2QMv5oTQH8NG5
	 LJbqBaT6FxK8v0NfBo5IhJLqu8lF3/jeaeSjSdoKFjSTNflqFRh7jCdB/IUF2h30YS
	 amOkR1jLaE5BQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z24Sd57p0z4wcj;
	Tue, 25 Feb 2025 15:32:01 +1100 (AEDT)
Date: Tue, 25 Feb 2025 15:32:00 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Martin K. Petersen" <martin.petersen@oracle.com>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin"
 <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Bart Van Assche <bvanassche@acm.org>, John Garry
 <john.g.garry@oracle.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Nam Cao <namcao@linutronix.de>
Subject: linux-next: manual merge of the scsi-mkp tree with the tip tree
Message-ID: <20250225153200.00773d86@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/udWpU6YiEcQx+bGVEcRtS3X";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/udWpU6YiEcQx+bGVEcRtS3X
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the scsi-mkp tree got a conflict in:

  drivers/scsi/scsi_debug.c

between commit:

  b7011929380d ("scsi: Switch to use hrtimer_setup()")

from the tip tree and commit:

  b441eafbd1eb ("scsi: scsi_debug: Simplify command handling")

from the scsi-mkp tree.

I fixed it up (I think - see below) and can carry the fix as necessary.
This is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/scsi/scsi_debug.c
index fe5c30bb2639,2208dcba346e..000000000000
--- a/drivers/scsi/scsi_debug.c
+++ b/drivers/scsi/scsi_debug.c
@@@ -8701,8 -9351,12 +9351,13 @@@ err_out
  static int sdebug_init_cmd_priv(struct Scsi_Host *shost, struct scsi_cmnd=
 *cmd)
  {
  	struct sdebug_scsi_cmd *sdsc =3D scsi_cmd_priv(cmd);
+ 	struct sdebug_defer *sd_dp =3D &sdsc->sd_dp;
 =20
  	spin_lock_init(&sdsc->lock);
 -	hrtimer_init(&sd_dp->hrt, CLOCK_MONOTONIC, HRTIMER_MODE_REL_PINNED);
++	hrtimer_setup(&sd_dp->hrt, sdebug_q_cmd_hrt_complete, CLOCK_MONOTONIC,
++		      HRTIMER_MODE_REL_PINNED);
+ 	sd_dp->hrt.function =3D sdebug_q_cmd_hrt_complete;
+ 	INIT_WORK(&sd_dp->ew.work, sdebug_q_cmd_wq_complete);
 =20
  	return 0;
  }

--Sig_/udWpU6YiEcQx+bGVEcRtS3X
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAme9R8AACgkQAVBC80lX
0Gxw6gf8DH+9m+demSWVyzKIyRKQyI7hfULkUiXeCdFIkVwWY0b3EyVCcS4qLnwm
5Tn8dpKLF6fSGNyKD+5o3W7UHVUbiRT4oRqXcaQW9b7nntE2P/dycpA7JNzi5V7E
TwDtssaU5Rv0X2ogeoWby1i8pbgzhmOqG/1O7rAq6TmwS1TaWk6O52PYDI9EMAEL
xjCjnRVY0kgncIECsKqLcnrzK5kU5ym2LxlzslMb+P1W/5TgWmib7d2K0rA7tSlL
f/xtBXaA7ljwzo5J6CN78ILWZ19+Kdf5Tgj4FujnK/wMt/ZUxntem9UBrT8KBNHR
97jyLxocZUudWEeMqBktqs4PTDPcng==
=hGCw
-----END PGP SIGNATURE-----

--Sig_/udWpU6YiEcQx+bGVEcRtS3X--

