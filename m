Return-Path: <linux-next+bounces-5623-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB74FA4B6FB
	for <lists+linux-next@lfdr.de>; Mon,  3 Mar 2025 04:47:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 562171891295
	for <lists+linux-next@lfdr.de>; Mon,  3 Mar 2025 03:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11BD219C54B;
	Mon,  3 Mar 2025 03:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="rz57hsA0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D84B15854A;
	Mon,  3 Mar 2025 03:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740973606; cv=none; b=hfLAVQHCtuk8syqLkwTAkZE9de7DbBGzOzDxBYswrmdRZ8UgxDkYBTKyfSIynjdtriSXDiH2i+Z8kUUbrmooqtIS2TmQMul0B7DnTmlpaXd8f4BwpYOi/VNohNq4OD6VTBBR6W1rVpdSu1FJeBcRkl/EO5WMb+aqtCdwYcfROZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740973606; c=relaxed/simple;
	bh=Gckh/ycN09Z74Fo2Bxi44nwY7FtAl/OObixU2gXQDTg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DhVziE27w+qNjQ0Yy+Ntzvg7QEpTLCZxg9Fl8CwkkWJtdfxmzquyCOBh41YgbBXcdve6230u/MHlMDTvTekdOsMo+wsAVWJCHybne77G/2aIFrwEMr/7XukI3/JPU0BqOyVHwG+hv7ulHNZeQ1jWtNnY32WF8vI30We+7Z62huE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=rz57hsA0; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740973599;
	bh=+A6+WN1oynsISedBOaLvXP7v9UZ+gCDGlsHaH38dKF4=;
	h=Date:From:To:Cc:Subject:From;
	b=rz57hsA07AOEb/XHq9kTaac1lLmpPm6E+t7Rm2x2eYizFIAI9vmjwZd6QbjCn5EhR
	 KE5h2Vay+6g2kiIiuLt7aBdNErSHFsK7XDAz6tYwQM72ZOMmUp09YskKZTJdJOKpLJ
	 utjozia6ft3h7/pf6gVXUoR81er5WvQlNlYAtgDWN8MT9AlNnnh/3A0ldlG6TGsu8W
	 UHa3eBI/tGKtI0KWXoeNCkHqICtKEBbM4KBMYYZG5P7ENgvfJV595q06eUXPbK7owK
	 OIMwYoHqAnuvfE54qpf0257j4QzKYypo34jpeTnF0p/K9FBGDqRvTmWPGBDqyrKo52
	 NzYZ6BdxpR9Kg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z5l9V6Vr3z4x0L;
	Mon,  3 Mar 2025 14:46:38 +1100 (AEDT)
Date: Mon, 3 Mar 2025 14:46:37 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Nam Cao <namcao@linutronix.de>
Subject: linux-next: manual merge of the tip tree with the mailbox tree
Message-ID: <20250303144637.71c25bc3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/57Da8jKAIYl2S5fX1i27fTN";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/57Da8jKAIYl2S5fX1i27fTN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  drivers/mailbox/mailbox.c

between commit:

  791d7e70a9f4 ("mailbox: Switch to use hrtimer_setup()")

from the mailbox tree and commit:

  c158a29c5c5b ("mailbox: Switch to use hrtimer_setup()")

from the tip tree.

I fixed it up (I just used the former - only a whitespace difference) and
can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/57Da8jKAIYl2S5fX1i27fTN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfFJh0ACgkQAVBC80lX
0Gx4VAf/XQYHFNNjUM8UAs3mqV5O++L59Y37ulFYPgwT6kFA5iYD1QG8TxVf6hxR
VeTYcO9zUNUIp1bGity6m/W3vfeZ6YPFSGxoPi921FT7KIz0Wt5GcR9wDohSclaP
6JRVC79XpRtI9puRFont+mo0tDhLCcGSApJYGhCIzx2v4XY689HROY8xInSROvjt
l7qluwRJ56FbDfudMglWwv8MhwWtB8M1LNiDPNUJmW2n3DZfxVbZcj1thJbGlFd4
MH7q3+UqyELGseckT6of/Memq1T84rPP6vFwpbZyOYd/rC6TUkV/TtosCuW74S0q
7G3tS7m/ZRTB7ikM981+8g4fp53OvA==
=N4C3
-----END PGP SIGNATURE-----

--Sig_/57Da8jKAIYl2S5fX1i27fTN--

