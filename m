Return-Path: <linux-next+bounces-6498-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC9DAA6A63
	for <lists+linux-next@lfdr.de>; Fri,  2 May 2025 08:06:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C02893B707E
	for <lists+linux-next@lfdr.de>; Fri,  2 May 2025 06:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69C061DE4E6;
	Fri,  2 May 2025 06:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="U4st9TyL"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28D61C6FE1;
	Fri,  2 May 2025 06:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746166004; cv=none; b=HBR4J8QXOv//w39itTzadN48uusrEuAxnTCqsPJOeXXJMyG6aUOV1MoHC3vfwet4QAbCfz3ZSAtb6t0X/+IQ9Xlm9/dFZA4/XjiYGjKvDAJzcFuZpejVTzFvuX/gA4FS4Q7Q8bRkMCBPaoguwG9wGBKuNLpt9JfrRRujVCn0EG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746166004; c=relaxed/simple;
	bh=Ko9F8N+zSPoEZwy8bx/ngZm72qTMS1KTcz8AUXdK5wc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RoEtA75u03Sf0hO2cz+6a/iQ1mMMZ2aWgH2vcflEKMdALeobT/ESeNPfsAYhClUH4tPcDelo3dBvlvgTaf9viyNJV7FUOk1qpIOWchV3fs95yYg3pZXRFt8Ye6Xu7S3FHTM3kyBpSeMlhtQ0LUtTcJsGi3Zzo4U7w1D5zGKP0T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=U4st9TyL; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746165991;
	bh=7KDiv+Y4VlK9mNT9noGQ2GwQatfVZudbbTQhZiRAUUw=;
	h=Date:From:To:Cc:Subject:From;
	b=U4st9TyLXcW/yg/5Y0tQupnYUkvteyGo0AgYVZc7UiORdP2pLwAlX2g3FzZNCcThC
	 Bcj3ZqTQvX1y4sDFaBBQ9j4i9+baYgv68/0GkUbEdSPil9+uBH9nmsIvhhgOzvVXmo
	 JDk117OAFedfHnrSsV41NZ49ffxJ/I/rXVZUBgs7XeLVaVZH7jqYO+F0EB1WxDhh+X
	 cEYXlkER5SsOBBKjo9sjZQSx06xkuVZt+K8ZcZzT4cBP5/UBDuYbfTcvkLxxEZgQb7
	 4upQMIrXanY/uKMtG518cGnnpYXd1+3EkJJFzC5hLNVCkUR0Fwcrq9ZJQIBaSI7aqf
	 J1AHBJAx3dz3Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZpgRB2Ywkz4x21;
	Fri,  2 May 2025 16:06:30 +1000 (AEST)
Date: Fri, 2 May 2025 16:06:12 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Corey Minyard <corey@minyard.net>
Cc: Corey Minyard <cminyard@mvista.com>, Ingo Molnar <mingo@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Thomas Gleixner
 <tglx@linutronix.de>
Subject: linux-next: manual merge of the ipmi tree with Linus' tree
Message-ID: <20250502160521.202cdc0e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WHfAzOgnRTWsbPSKsM0AKP+";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/WHfAzOgnRTWsbPSKsM0AKP+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ipmi tree got conflicts in:

  drivers/char/ipmi/ipmi_msghandler.c
  drivers/char/ipmi/ipmi_ssif.c

between commit:

  8fa7292fee5c ("treewide: Switch/rename to timer_delete[_sync]()")

from Linus' tree and commits:

  7b1ee7900db5 ("ipmi:msghandler: Move timer handling into a work queue")
  55c5befa949a ("ipmi:ssif: Fix a shutdown race")

from the ipmi tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/char/ipmi/ipmi_msghandler.c
index 3ba9d7e9a6c7,ece6aa95fbb5..000000000000
--- a/drivers/char/ipmi/ipmi_msghandler.c
+++ b/drivers/char/ipmi/ipmi_msghandler.c
@@@ -5538,7 -5577,8 +5577,8 @@@ static void __exit cleanup_ipmi(void
  		 * here.
  		 */
  		atomic_set(&stop_operation, 1);
 -		del_timer_sync(&ipmi_timer);
 +		timer_delete_sync(&ipmi_timer);
+ 		cancel_work_sync(&ipmi_timer_work);
 =20
  		initialized =3D false;
 =20
diff --cc drivers/char/ipmi/ipmi_ssif.c
index 0b45b07dec22,b016fabaac68..000000000000
--- a/drivers/char/ipmi/ipmi_ssif.c
+++ b/drivers/char/ipmi/ipmi_ssif.c
@@@ -1268,12 -1266,10 +1266,10 @@@ static void shutdown_ssif(void *send_in
  		schedule_timeout(1);
 =20
  	ssif_info->stopping =3D true;
 -	del_timer_sync(&ssif_info->watch_timer);
 -	del_timer_sync(&ssif_info->retry_timer);
 +	timer_delete_sync(&ssif_info->watch_timer);
 +	timer_delete_sync(&ssif_info->retry_timer);
- 	if (ssif_info->thread) {
- 		complete(&ssif_info->wake_thread);
+ 	if (ssif_info->thread)
  		kthread_stop(ssif_info->thread);
- 	}
  }
 =20
  static void ssif_remove(struct i2c_client *client)

--Sig_/WHfAzOgnRTWsbPSKsM0AKP+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgUYNQACgkQAVBC80lX
0Gz89Qf+JYwPbGgX9g4ASo9NgnVs9jnKl0lknyUf1WBps8PAVFkiVDyi6lrOZt8b
B8D8XTq4CZyiiWoxPC6g77Ay3dQ5TfKtX7S9U+WxGUSdVo0QVYsATbN177Ir/0y6
YXcYCwZ8DxDalyob0l0YZhFG9nLWUZj6C7YCuvF5ABMUCxBS+HWv8sHzHCkhD7BI
Eb14WlHU3pf8j1hbErWgvPPrX8pKSEOKETzyUv5cEk6dXBARsppAmGa784ZYmC7C
xSleUMEr0tBSzdcyhN0qAdJUNYdVdtV17IoXH23t3uNaWJkYHvpAhyV9yCF5xSda
W+vFlWwGkHrFX50KFKptHzOwpQq0rQ==
=Fxdt
-----END PGP SIGNATURE-----

--Sig_/WHfAzOgnRTWsbPSKsM0AKP+--

