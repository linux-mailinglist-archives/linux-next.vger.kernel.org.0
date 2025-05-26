Return-Path: <linux-next+bounces-6928-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AFDAC3AE5
	for <lists+linux-next@lfdr.de>; Mon, 26 May 2025 09:52:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88C66173D96
	for <lists+linux-next@lfdr.de>; Mon, 26 May 2025 07:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 372D51DF270;
	Mon, 26 May 2025 07:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="GuSIrM3e"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE432AF0E;
	Mon, 26 May 2025 07:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748245932; cv=none; b=jCf/sQ0yK4WvMhSK9WsjL2OqU8QsEJSVieTQvTm4vrZ8Gw/+B/Y2t5QE7My0+o3RaxBQ9BHPvUCp/QeVFhyBUeUraZImqhnrTZF5By/Wtpe/0keHfARzWF63VB/YmpGmDasumzyIGGHQKM4ir1Ot5N+c4Z5siielXJ83+cQ4p4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748245932; c=relaxed/simple;
	bh=hYSD3PlF9L+v9qfDL2Kg4V0Xzph3OIvTrB7L2EivZCM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=sPDsBSIZhPHvstmIHpnM/uP75eeDEDGh9rPryFwb1NEHcC6d2wcGi9mnMkeK91FmLiFNMxonbBoOWt5JkfNzNgSaUc7E7pDeUL9TgK65wEqcMyRIolYxP9HXUdE1zJxLKgLRca9XKbbvbf+hEy0XsSJgzEcjH0w5XM0MAJSxWBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=GuSIrM3e; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1748245927;
	bh=NNanZOm7YG80Od8y51VaKCs3A96aFr3Rb6FDLU5HGoM=;
	h=Date:From:To:Cc:Subject:From;
	b=GuSIrM3eccbSUiPu2KL15wnC7qKLKRc72RM1YGjXlj0ywcvcRyqnyn7yTQVkO8I5M
	 cI4u2vaWGRejuvVp5DQhnqeWyoVLPAs8rV+XcAJrAoFe7TkKehOLo8Xg6Sj7nkEmFH
	 EMS60cObxzPNlRY24ZZ080EET91wQcYT17dRBu1VG0nULw5m4CWAfdwEVRZMnu0ZNj
	 PjE9enBXNNF1/o93j3k9VaC6/BxQjdC1dWTXeSQEYs1KtWNXG8/x0SmXk2Y5kKgr8O
	 w7tOnB4HfVxPep4mWJx2mOQH45pBH4rto6r0BgoJt8QRW2JREJKlS+jBa8Pu+zSFnV
	 0Ime6H3MBfgiw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b5Sdz1T16z4wbW;
	Mon, 26 May 2025 17:52:07 +1000 (AEST)
Date: Mon, 26 May 2025 17:52:06 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kees Cook <kees@kernel.org>, Wim Van Sebroeck <wim@iguana.be>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the kspp tree
Message-ID: <20250526175206.42307d8d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aISM_FPhuyRXvrM8YMCJTQT";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/aISM_FPhuyRXvrM8YMCJTQT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the watchdog tree as a different commit
(but the same patch):

  8e28276a569a ("watchdog: exar: Shorten identity name to fit correctly")

this is commit

  f2019c0c8b7c ("watchdog: exar: Shorten identity name to fit correctly")

in the watchdog tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/aISM_FPhuyRXvrM8YMCJTQT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmg0HaYACgkQAVBC80lX
0GyM3wgAml2fHuuTLTuTNLJ+5MN9nNJ+lBg1cFu6KE0byLMRwC1YipKzUNnoSIi6
RxyzOzFol3gPS80ieD29TSKMynJFmkHOJgn/PZd9aoZi2gBIN91jj8erx7yuBcZ+
spt6RYiQwDV1S6ktmwpCLI5GEfE8zaSFcb0OwWgproWNPy91YeCOWYHyqsQPsTzA
bh9u4PUCnpn/lDbdGRGU0b4TNQvkA1Vw0PB1AZEAnZZ+76GCHgh7ratQn9sSXGiO
TjyT4HrtEeo5HTKVVrcO7zM5HfS6NgRCBNxed7YWPIHagqz8lMJ4FRAzE5Ak8t7f
c0N15MCtjGa4PBweAmejge2q1IdNEw==
=WhlG
-----END PGP SIGNATURE-----

--Sig_/aISM_FPhuyRXvrM8YMCJTQT--

