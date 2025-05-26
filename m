Return-Path: <linux-next+bounces-6925-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E599AC38C4
	for <lists+linux-next@lfdr.de>; Mon, 26 May 2025 06:42:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D20717150D
	for <lists+linux-next@lfdr.de>; Mon, 26 May 2025 04:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E92D1A8F84;
	Mon, 26 May 2025 04:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ghWZRD9g"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED7A1A5BB7;
	Mon, 26 May 2025 04:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748234532; cv=none; b=Hbg+DMVs+I4o73UOujAc7mPz7ZWzmIpzC+PCNGZCTv1JhcOBBIYVLY7vnk6qHKXxwC3Cs4bYFNmQGUzSURWiwjjsWkvdi45d3psWDJqgcghJZFgm+NvDs70Css7t7anRSgxkoh9cVEfMyU16dLsBOso4ccpogfQ4xLSCZCr8uq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748234532; c=relaxed/simple;
	bh=wh6FAG1MYBL44zjA9AdlYjou/dw0Qo4I6P1h8EWlDlE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RBr1b0ybiGzcko2CDGsF3QD2b8pGTx5RVYeINvgBYigOAb2l3sosBSKFWO957Ut0DXb51vxiWvImOs+Bk8UHeXsqgTHbarUvWGfBD4EVzIvboQNPaj1Kto8LL6WBB6rtxR+jbzr5oqg70k3dcgleeCzeDTOPIAeNnPq81srkBEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ghWZRD9g; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1748234526;
	bh=Exd92gNvIvV9e2aFllw6Zejj3A4JmFBEJQTUCw7k6T4=;
	h=Date:From:To:Cc:Subject:From;
	b=ghWZRD9gXbi9FWreBoWxK5fSGTObTrZdrsoRRB5M1eE2rdfCKuW0usoFa/TfS9yLp
	 a+tz7nB3SEBd1rWh/VsSrVSgAXvT2p5Z7NhMOpAg5kboXeTD1fjU38nA1ArznprgAk
	 fOK+oK/kCO0BJAHqxWWrK5BWLhqNiJY8Ah39XLbhV22k4cRplWQjf1fgOpTsaaliaF
	 yUNzplMWZfGoEDHrnN7EdlQkdzVEsKS/HYAx2nRBzoxIm4QLkUmbKvQqUEwkC7Z6Oh
	 ULj0r3mxA/LYH112Z7o7HfTbkbL/2MsS92Zopr5umE5vd4mBcpkuufBf7hPjrrukmV
	 TN+aGgKMZY6HA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b5NQj0KBGz4wvg;
	Mon, 26 May 2025 14:42:04 +1000 (AEST)
Date: Mon, 26 May 2025 14:42:04 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Kent Overstreet <kent.overstreet@linux.dev>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the tip tree with the bcachefs tree
Message-ID: <20250526144204.658ddfc7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lHW/FY9AoZ/Fkf+_J3nU15Q";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/lHW/FY9AoZ/Fkf+_J3nU15Q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  fs/bcachefs/clock.c

between commit:

  881e64bc3a17 ("bcachefs: bch2_kthread_io_clock_wait_once()")

from the bcachefs tree and commit:

  aad823aa3a7d ("treewide, timers: Rename destroy_timer_on_stack() as timer=
_destroy_on_stack()")

from the tip tree.

I fixed it up (the former removed a line updated by the latter, so I
just used that) and can carry the fix as necessary. This is now fixed
as far as linux-next is concerned, but any non trivial conflicts should
be mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/lHW/FY9AoZ/Fkf+_J3nU15Q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgz8RwACgkQAVBC80lX
0GwwyQf+Lxvwe209syGhno5KfjjLHEQzxCjQsodDjF7u+TVZsm7DCVmtx+CtCvHD
fwWdUgpgoxtrp/E0Z1zVbhOUHH7tkoyx6XjOuBSouJxvT+Bs7RIDW6JDH9Ks/UFg
4z+aUYDZWCHpqpLD+05wNWDA5rDXEcN/oUAzVaHN7QR6nre0KtmtGmqmxHS+M6/N
XpvrtXxvHwIVw+lJZUtKw7DA7JQCgevuRExEkIIA/gqg+xdt6kY4+Kcal8pVtjP4
FVgyH3KDyWROeoKaB0p4gr4XeCJPM5HikKYAt5kxHx58Yn/KRxvgton9dbT5pHtQ
qsHLD63+42O0EBZLDxS7slJBzFAEfw==
=rOOe
-----END PGP SIGNATURE-----

--Sig_/lHW/FY9AoZ/Fkf+_J3nU15Q--

