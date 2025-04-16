Return-Path: <linux-next+bounces-6261-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED535A8AE65
	for <lists+linux-next@lfdr.de>; Wed, 16 Apr 2025 05:22:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E3451900FD9
	for <lists+linux-next@lfdr.de>; Wed, 16 Apr 2025 03:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3343F15CD55;
	Wed, 16 Apr 2025 03:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="e3aNNheh"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D0DBA49;
	Wed, 16 Apr 2025 03:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744773730; cv=none; b=hqy0x2++ynIuE1+h4HbiIV+VpPygMBPWJiGaWB06Qa0REHC1Wap2ErruGiL/8MpiOYW6HYH7Bu/TrU1IknCC7Z3jMR9ExzIvtWYZPS25nV/xZw9BwC1HrrRWvrjlF9dZi5KMq4RZaj0VbV7QKtbM/yGyPEp7zA+jFrRedsXXpJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744773730; c=relaxed/simple;
	bh=YU8td45G+lxM08Vy+vmuKgn2Mf6Vb/hhYM+zTwENdeg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nRzv5NxXMTQy3u8mOBC84P14mOai/OCiGwsWlV9qHWg/GK0qiZeCoXgvpy6eqHK9xuBVCglxDa/eNyI7Doox1YVNjUXVhYORvU634fCyKzzHDW24e6QztU9jIV2QWO3o6CHTH8l7S4tyt7dVARrzwxJYX9SRFWSl0I68/9IG9+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=e3aNNheh; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744773715;
	bh=u8Yr7W7zjn3+a4fG0VOgSW0XqeXmxgR5zUYlFB0fKwY=;
	h=Date:From:To:Cc:Subject:From;
	b=e3aNNhehxvBF4HmUhC49smK/29jjhkMF0YOQLhNtg+vbeASbkLBLZRRkdlUgWjfmm
	 kd0E3XEHq0uDugqYYuJfISx1Zwfxb14yY0Pv/qQFs7rYydlG4hNGo5XU8y8GukpoIh
	 1Uv5dVkwtenpLt4JyxNitoXoJziOnrzENOqYpm3uue4vg5NHyL1CwytngcMX4NGg88
	 DtdVhUDWlyVcs7RmtCnb3CcLA6xBAbb03BqeI6qjWR3pKjl8s33vD2bKm/K87aw1i9
	 JJ3ZejYW+Nm6QdAi2XVSzBWuQT5DSmRr9xwGF5fevcnxkT4QeEONj0HFXuerGjS6ot
	 MY1XMobgw8bYw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZcmXd4b8xz4xQ0;
	Wed, 16 Apr 2025 13:21:53 +1000 (AEST)
Date: Wed, 16 Apr 2025 13:21:51 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory
 Clement <gregory.clement@bootlin.com>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the tip tree
Message-ID: <20250416132151.3b0448d0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ryBkb_rNx0A+3VyA/jxugVB";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ryBkb_rNx0A+3VyA/jxugVB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the mvebu tree as a different commit
(but the same patch):

  73989a38268d ("ARM: orion/gpio:: Convert generic irqchip locking to guard=
()")

This is commit

  5b49e7ff76b7 ("ARM: orion/gpio:: Convert generic irqchip locking to guard=
()")

in the mvebu tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/ryBkb_rNx0A+3VyA/jxugVB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmf/Ik8ACgkQAVBC80lX
0Gw76Qf9Fqrygq6M3Sxri8WTn28i2TqtA2jr7dAXwdiSWXE2aGSKekya7uuQu1mo
bqARYF4aDFXGAcSuc7oEHnZ1dNWbKfXaRH3pCbk3ovZeP/bEGH/RzbeS0jo2IPLH
/F/0tyFgwgfieGmKN9fJ+0J2ayTciZnGkoyueCNjMwErXztGBQhvoAa1WqnUOHIs
+7uOmfvjXPYcqmv7nK7EG8dPausqu4VwwXVIqMDIwTso+uKBQUSH/8XuEPlx8rVc
RkK42KC9YzgX/yOCp9hWYn5+su4aXR2QN+IOeb0IdDQukOc1ECfno84nSiE33wRE
xKDoOzUmmEJ5VovykiatQQmfb2I9SA==
=mll4
-----END PGP SIGNATURE-----

--Sig_/ryBkb_rNx0A+3VyA/jxugVB--

