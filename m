Return-Path: <linux-next+bounces-3347-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8049C955FD6
	for <lists+linux-next@lfdr.de>; Mon, 19 Aug 2024 00:09:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A2891C20A8B
	for <lists+linux-next@lfdr.de>; Sun, 18 Aug 2024 22:09:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 783D11547DD;
	Sun, 18 Aug 2024 22:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="a2d2mzam"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4821E8BFC;
	Sun, 18 Aug 2024 22:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724018970; cv=none; b=oKjspwXAPEYZAgasfLG7p38TkCDM5QssVMfwFiLmvHyhsEUZVZKqAE9bXPtl+PcdppaHE6nG7zhyBJnHlgUzHg7EOewHObhUjqhTB/wdTZWsbd9GbOt7nLIJaJ7TAW87320GhoevcwaLaK+Ful+vY107AbyU7BcMe1Tj2xNeZ/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724018970; c=relaxed/simple;
	bh=HWNC4E1E0k1NPFEIR3RYfx+dYNcPOVlbC5W+8hiG8zg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rxf3EcNnfuv/WoA3VLIo0lnREL+eaqn52gN4TDolSLVlA8UWsTQPl3LYhUAtDY2y2ugisr9vtojpKoI88KlWbQ+K272JATDrHlGfAzFJ/J+9pkXSgzAaSwNXrA8bHXhYDLchskDrQ3Pp53CtLSpkWV6VrWQlYVcu/DtPWGudU4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=a2d2mzam; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724018965;
	bh=diy1/BtK3IrG5Pj9rgu8QdHQEUMbQ7CxSi+yRkcVEqU=;
	h=Date:From:To:Cc:Subject:From;
	b=a2d2mzamEQ1qOFmQbRUvCINRXU9l7Br+k3Pryhb8d92DSc/1FC3+G//xzXkgInzTm
	 qVB4eAJdupDhUQ2wlbMaX2TMzm/pW+anBa2xX/GcMAG2KGr+/+6gE57kALP2eKI8Xg
	 41Tf6YUGx10WmGq5bp7z1/dRirkphimx3xCyIkaT7yJw4VUp/oTFyYuXykbUm6lh3+
	 Z/WTJlE+AFK9GV2Dk2JCtjq5Ivv7caO8znWqwLDf0Gikz1iLNhDd5vopR33mIEh6mQ
	 5BKnAmHHbib49tF2UPq6233taNjuhpWnvjZjwVdoMiCGgTZM/PwRUiDLwQQ9SqINwd
	 +uSE3GGVubOGA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wn8yr41VDz4wbp;
	Mon, 19 Aug 2024 08:09:24 +1000 (AEST)
Date: Mon, 19 Aug 2024 08:09:23 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the tip tree
Message-ID: <20240819080923.39087b2e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oAZjJPTQJbdkfW/Ip0ANSkb";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/oAZjJPTQJbdkfW/Ip0ANSkb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  50059ccaa3c9 ("irqdomain: Always associate interrupts for legacy domains")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/oAZjJPTQJbdkfW/Ip0ANSkb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbCcRMACgkQAVBC80lX
0Gy2YAf8DLt3gKirOUbmEt9ICwFVLNoeQWErZaPOH5Qto7L40dkVjcJJeLSKR72+
hVPHVXW2JzuYDH9XUPjKtaxJKy6yvtfu+hjEbdRo08m/AKIkj36kr+X9tbGWS89t
NjeoyT9wZaTIzNXxi6D72IlIRH4yNUm/NlZdqjY8dpWvjILGxdn1TCDDyShvK+I/
FnlAa+WTxyiiq0nklRQRVDRXoL1ZOHXUdSvK+e7Dg6qu/xCkXGSJG6i8SA+nwwYb
zc3d1DPL+DGqplh4mZE1h174/wvNGRqm0PO6NVRVJYFciYkRH+3JoRD7X3mo7BQ6
2F4MsPWjBwk63Dfya8ZVAPgw6B/YoA==
=zQTL
-----END PGP SIGNATURE-----

--Sig_/oAZjJPTQJbdkfW/Ip0ANSkb--

