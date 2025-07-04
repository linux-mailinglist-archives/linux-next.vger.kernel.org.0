Return-Path: <linux-next+bounces-7355-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C2FAF8802
	for <lists+linux-next@lfdr.de>; Fri,  4 Jul 2025 08:28:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C6E41CA02F8
	for <lists+linux-next@lfdr.de>; Fri,  4 Jul 2025 06:28:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0316C256C83;
	Fri,  4 Jul 2025 06:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="QecQ2JOR"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E374C2561DD;
	Fri,  4 Jul 2025 06:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751610504; cv=none; b=qoXoGnxBxr2TZdE028yWHiPXf4dkZkYtpJYcFjjKy7iILYU+pNpYNz1Xh9ymKrEVW0WDVSc+i1sKh6rvk5+YT0u55JewehSq+Fpof5gDMs0WuagkkMo9yCUgnsVqbKJ2/gce+1g37us4HGXCtii6BcWzvPDkkP3IewIOovpI8sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751610504; c=relaxed/simple;
	bh=Q9RYV6cUqTbv8CavUxMur1RSdGmZWCvmLmbWwv5pBfs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tve5kMV1UeoLYDljbSqu8qIU7B/+LFU7Urce+b4w4Y7NiZ7M3NfdPSV97RlFerlVuS9KIDERFEm7IQ80CgMKaE/7UOvxXVNixoThxzltMX5dP6Hi44ZwpVJjs55z03ZKm0NsaSV6VkcMEclJtsDFZJ0buSg2bQmtJr5eJ2p0e8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=QecQ2JOR; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751610470;
	bh=2mhIUNlzWyrqyhDrKkHAaaSs0j4eeeqr+64tc/45pno=;
	h=Date:From:To:Cc:Subject:From;
	b=QecQ2JORotwtJZQ46D1I9hh1OvbUXTWllflzf5d3djnIcWSowLC35o5aO5yChMUQh
	 KFzjEZGoQ0ev5tHXJAVu203oG+UYo2MjQt0jjROth6eH+1NOn5wShAaFUGcU3oV/cu
	 YboiqE3Usogzuh/uNEbPNm+vXgDR+gdDYDRcgatLZA7hGlGUfNr9nKvyxRgH5nd2NG
	 ECMVbwZizVid8bWduTye/ENCQz1ismzm/3bl6PWOZqH7i+hdb+9o7sf59FaJRvrRly
	 I4ZdMPz5j9AfpuX3vRT3B9NjIhiz2Ds/xFzlv0RwdVpOChvYmi/+fqoSAz7uOCSksZ
	 jTBmm0Xh7Aehw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bYNwj5VdXz4wcy;
	Fri,  4 Jul 2025 16:27:49 +1000 (AEST)
Date: Fri, 4 Jul 2025 16:28:17 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>, Networking
 <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the tip tree with the net-next tree
Message-ID: <20250704162817.14314a06@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AhwB/cwOZfTpwguigflw+lM";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/AhwB/cwOZfTpwguigflw+lM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  kernel/time/timekeeping.c

between commit:

  5b605dbee07d ("timekeeping: Provide ktime_get_clock_ts64()")

from the net-next tree and commit:

  22c62b9a84b8 ("timekeeping: Introduce auxiliary timekeepers")

from the tip tree.

I fixed it up (the latter just removed a blank line where the former added
a new function :-( ) and can carry the fix as necessary. This is now fixed
as far as linux-next is concerned, but any non trivial conflicts should
be mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/AhwB/cwOZfTpwguigflw+lM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhndIEACgkQAVBC80lX
0GwNxAf/bDsnKwrgRIvS+TrCTxID+kgAT1Y6p1uVITgJZ7kji4IDnyj+5n7jhRaf
L1G6YZ79Bz8u5YRGivsWDbrUOQEDLUWU/tyw1mrRtjmZlzt+DxSXLEY/RAr3/yng
IYGulFLS5jIhe6u9X8qDR7SLfZVSLY9nlvoOieLHenGdITPDdXfa+LEZV6aC0Nm4
9ObSLc76uzU0a4usnl+rX1FeA6/Sb9hi3tWQxjvC0merOLVGfbDwn4gf7ljkc6Qt
EXQx3hLwUFtKTZIUh0dbIYY1loafjZ1HhnMP7/m/6iFa0PmK9Wk/1qnujTP1F3ia
2MczY+WeO/Hm8r3fvwWywraNxGvYjw==
=rJcS
-----END PGP SIGNATURE-----

--Sig_/AhwB/cwOZfTpwguigflw+lM--

