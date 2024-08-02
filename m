Return-Path: <linux-next+bounces-3209-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A74945646
	for <lists+linux-next@lfdr.de>; Fri,  2 Aug 2024 04:21:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F5A2B22D45
	for <lists+linux-next@lfdr.de>; Fri,  2 Aug 2024 02:21:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42D8617740;
	Fri,  2 Aug 2024 02:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="h9zk08eU"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7ED168DA;
	Fri,  2 Aug 2024 02:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722565289; cv=none; b=E+hAcRQst+DJSmGytT56ApriZFrgbPOhJUZ9jViEOQnGyT2r/W9CCy1+6jMKqzy2YL9r3glk9FXsT86twYjtbqdBkb1i2aJmYVL6TzGSIM+2BKdu/Mcv0OnnPdNxMKwDabnVqzhmtXuW0KUnllWXkAM/TQ3qCmNodB1+jTKQQFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722565289; c=relaxed/simple;
	bh=FZAW0oaZMiOoFMjNtgxtApYHPoDwFm7fpwFkO2u4Dcc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dJGj8tYXMdfNHrtbtFa0cJXNY3Vdc3zbkvug5j8FRIQWJ3N+cK7z769WeRI5LLKJ4Zm+PQ2gnBr4CHTux7YY0tuRE4rCdnF2qukg70E8LdEUtmZYuLSHCGGt2/Suglw2lernpg59tXwRMWqky1XKB+he2+clEMeD8vas5DkYKuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=h9zk08eU; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1722565281;
	bh=ht6MsSV5KimzjQnGJjY4UeLBKAX+DfOGBI6IF2U0NFk=;
	h=Date:From:To:Cc:Subject:From;
	b=h9zk08eUZMCNT2CWOoI6PKHW7nOVpAbSrjc27pwQSXYZaAIyZO0nxwg8HzyMSW6zF
	 0wT69HCZxBOYZY6ogfJX4JxOJR8vKyFhjKKHkQxIbLNRC3H2ebN0NPAJz8ou0VAsFr
	 By7QkOJqZFhfKuNxfiqSEOyg/lsg+GMr2FyMB06tR3S8Prk/fFvKc1lyR9eAVzDlT8
	 kgCdtoH9Opm12RYIXnluVxej5Ztr7eViIJR4kk5wCn9s9HcKHqaenBuUC5afEeMrhT
	 TiNQ8QixX5PpSWkR1Y8mjclcdDmwizXhTw4vSDPLNXtsfeg1J+wYrxHSjrAJoVhFp2
	 u/ABlL2GWSlRA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WZqMP3RzTz4wbR;
	Fri,  2 Aug 2024 12:21:21 +1000 (AEST)
Date: Fri, 2 Aug 2024 12:21:20 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>, Takashi Iwai <tiwai@suse.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the ieee1394 tree
Message-ID: <20240802122120.480789ac@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LkPx7irOW3sDkkGWApfUv5C";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/LkPx7irOW3sDkkGWApfUv5C
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the sound-current tree as different
commits (but the same patches):

  c2f9fd3d6ad7 ("Revert "ALSA: firewire-lib: operate for period elapse even=
t in process context"")
  e29ed9a81fd4 ("Revert "ALSA: firewire-lib: obsolete workqueue for period =
update"")

--=20
Cheers,
Stephen Rothwell

--Sig_/LkPx7irOW3sDkkGWApfUv5C
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmasQqAACgkQAVBC80lX
0GxfwQf8C/LQisGyz6vA97FEPZRV21jN1hSuTa6dNLrD9C5RYnUJQ/T5p/DbKwgz
GsmBAfWdFAbl2RnpUzndekM5VwNNrhRu2CU71irRtzPi70fgHAra4txv5a6q8Dd7
p1iNrRrJ3YXlPQ0nRvuwyDRPeQDKebA9dvxz88nvBuirq5l53JqFqPdq+lk3DLfS
Ybbg11phumo+nsKpvdOtYro+hHJm7ltXLkrK/ZVHf6WCQOljKHLXDlVn+xWh32/o
5vRx1Op9eT1S2fTL/zv/K7QUoHF+QLsbRf/iIxQufT8yaUskG9t/G0cNtcWIktW0
7xQq4V/lfHhlgdjhE4vZ3k/aEviQjg==
=fkrD
-----END PGP SIGNATURE-----

--Sig_/LkPx7irOW3sDkkGWApfUv5C--

