Return-Path: <linux-next+bounces-3557-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3719690E4
	for <lists+linux-next@lfdr.de>; Tue,  3 Sep 2024 03:27:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B2E9B20B84
	for <lists+linux-next@lfdr.de>; Tue,  3 Sep 2024 01:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26A6A35894;
	Tue,  3 Sep 2024 01:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VuwAbUFQ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFC119E989;
	Tue,  3 Sep 2024 01:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725326831; cv=none; b=GM4O+MOxEpmpfWhuBs/C36/K54ItWeqJjObvK/3olKWT5ww4JrkReZt4suopLNQdC8sw1cU94b+E6y02gIMffKFvdcVV5MMY0dESQBGVGgmSBKOMNSiUpYI/z4aL+Qlj0Mt6OSMgJ+wJMRYiytFTLOp0hguSkEzDCFN6HQsTa0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725326831; c=relaxed/simple;
	bh=Mr46UhT4hkd2HOTt+yzG6o+WAooFRbQ0Pa5ltlxHd8U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=scfSWkmqoSI4Wsv96oTv1yjUDOOjQP6cKyXXm9sKSlCgn9RJ0weJo5mlJBL8Q6TN+BBehTicOfJ4YLe1/uGTNjlp0DY5q1KRAiVy1txKG3zggewqPKKJ82+JlDbdiqKBDJAjKWdqsU9LVY1dzrawFAfo53ZxZaM/jkfQwIxePFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VuwAbUFQ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725326825;
	bh=TT8J1Ll0n0QIgEmFuVx7GxH6V1fn6yLaq1Tev9GRUlU=;
	h=Date:From:To:Cc:Subject:From;
	b=VuwAbUFQFPiFezJtanC+flNOHR6xB0+InPkYAB0aH8e7hFtDegx+lHu5xO4wdgYz/
	 xqeBgANYfDOhOGYtW4SsEhpYB6RjrlmpyVy60ghK1m4Ak6NqEg3I5xl3F6FTKoGIrE
	 tcJAFTmnu2IIwNO73TyUmJ0jHrb4wvTtbs0gcHL93vtW/WBYpuqE0Y3MQwpQtFUq+R
	 WTM3FmTs8GkW/4RobmhV1bVSf0si/LJ4UcxkyY2RQuSc7Rx3CLu6mGWXFxYdak51hP
	 QWZnIZUSAuabDwmnPmeG3z6MXPRlUEvt7TAVwaS/zrsv5Gj6n7OyrAcNfmIXqOwfxV
	 KBIPoy4RuVxaA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WySf04hGRz4x1V;
	Tue,  3 Sep 2024 11:27:04 +1000 (AEST)
Date: Tue, 3 Sep 2024 11:27:03 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the clk tree
Message-ID: <20240903112703.5e9e68b3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rU0nHq6XpQM7s_ZpbKCkjEj";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/rU0nHq6XpQM7s_ZpbKCkjEj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the renesas tree as a different commit
(but the same patch):

  042859e80d4b ("dt-bindings: clock: renesas: Document RZ/V2H(P) SoC CPG")

This is commit

  afec1aba0860 ("dt-bindings: clock: renesas: Document RZ/V2H(P) SoC CPG")

in the renesas tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/rU0nHq6XpQM7s_ZpbKCkjEj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbWZecACgkQAVBC80lX
0Gw3wwf8CJo/QlqXTXFiUGaRNAy2Sgg5Y5IIj+HhJavTknn9qpycQWGrOKSUznJi
TcGqy0a2sgzFfUtlxu8PVKUtYiEq6zLRZEKFvCo5k65u17j/Z4v3Q2paGwK3TtfI
YU0MvrhuIrkMmxxrE9aAi5mTNQsHJHUX/iMRMiJ6WWozYSrQQ0lpZIbSPRfHqViP
U9hXp0PAGdb/YqHaW/hJ/RBj0sTXA/jtCbQt+eveBsrbN+CG58zDIkoakzmhbFqw
hE4/ogspm4aIFdsAQS6rvkqzXpff8X9j9VCaN9FyRlIy31Ks1uqpBQ4fbRsTvGRW
Q522ByAfKihEisM7N+s8PLyBKPGVGg==
=/B4u
-----END PGP SIGNATURE-----

--Sig_/rU0nHq6XpQM7s_ZpbKCkjEj--

