Return-Path: <linux-next+bounces-6869-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A56E5ABEA87
	for <lists+linux-next@lfdr.de>; Wed, 21 May 2025 05:53:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 536F54A55FC
	for <lists+linux-next@lfdr.de>; Wed, 21 May 2025 03:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AAB022DFA3;
	Wed, 21 May 2025 03:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="DELJkOor"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D74322D9F7;
	Wed, 21 May 2025 03:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747799625; cv=none; b=PabnctGjejVeikDeJG71td+y5Cu7TPmM7i8nh4R+kayBxLLO/SKRK6rFkWvd4std+u5M2DUk/Ha+RguV4OqrrsEGpuvkGI6QD2XdsoVThZD2Nikty+WpEdeQzXhFacAkQNXAtLw3STYSiBYXbeCcFjs+BYWnU6hy6N06shXJCdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747799625; c=relaxed/simple;
	bh=H5Di+RULWPhsfYHi11Ocs5RG3vC2b8mp+CPve+LNscs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=bEKImbuUT+yi48FNYJqv8IvO8LDFK57k5trJ1zbpX0vFlIFBVAs5i9rwC/nrCi4rVtLuC5MRaIuO2Lp61aHhK2RtXUbQHTrfZfd+zUNwsdlA0nxKjGZNhXjrH9zlQG2u7IkSTpD638TF28IzI0kNn7y3ufHJw7oOSsYdr/tqs0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=DELJkOor; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747799619;
	bh=EGBP9R+zYNqgTZhq+ds2UGElo+1X8iC6K7KTrMxNHog=;
	h=Date:From:To:Cc:Subject:From;
	b=DELJkOor44vd8UnLlUSpcwSIMTkh7S2kgGZrcm+N9RzVmcIYkgZr39xqTWcIFHXJ7
	 nztXPn52JTvih6S5MxeZ1+17Xc7q/EXNQZOF4JqL+SHYqqYDZN0EGZEOM25nk0fulr
	 eI1XdjBbBkS59Rkh4qUj2aeEpjUoWZCDZS3b/uINTjholkD9Se5MqSLDaYIyt9Shlp
	 cc3S3b/HMyNTjFZVn4TPr3qF4zse/btyVzd/AcLyjK3m0ujWO/dUfAi9co0iefs+SI
	 j9HB3aBWtW+A4bazIvFQ/wdeoitR/j0dDlXUSB5yakNjATi9FSNU2+jzvpiX5v8TgT
	 iPZI6n6WYyt3g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b2Hb62z2tz4xck;
	Wed, 21 May 2025 13:53:38 +1000 (AEST)
Date: Wed, 21 May 2025 13:53:37 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
 <johan.hedberg@gmail.com>, David Miller <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the bluetooth tree
Message-ID: <20250521135337.2abb2ad9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lVVKadu.uANdWU.XBMYiQEq";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/lVVKadu.uANdWU.XBMYiQEq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the net tree as different commits
(but the same patches):

  259a6d602310 ("Bluetooth: btusb: use skb_pull to avoid unsafe access in Q=
CA dump handling")
  18f5b2456b36 ("Bluetooth: L2CAP: Fix not checking l2cap_chan security lev=
el")

These are commits

  4bcb0c7dc254 ("Bluetooth: btusb: use skb_pull to avoid unsafe access in Q=
CA dump handling")
  7af8479d9eb4 ("Bluetooth: L2CAP: Fix not checking l2cap_chan security lev=
el")

in the net tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/lVVKadu.uANdWU.XBMYiQEq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgtTkEACgkQAVBC80lX
0GwrQwgAlBHMZeZT5bZSM9ZUTQKVVheneluwI3B+CM492CjyhhjQeYcieKqSOr6T
0Yepcdl16Bo7IWYwiheO6gLgLt2xuvCGPVtm+9vC1dDO21TUKSuFF9l3iTpsNbvj
U/9BayVPCajkfUWdz3nOjbjCaLuqxI6hI4soqFPPUwehWJ5D/QxL9Dgv7ePZ3FLZ
VFy209nU5bTGSyR444KwnyCR1IJn/G2KWQjPJgkJJSEMLZlXeIGw9m62TIzLZd2P
cCGnEWAoHUi88hK8L321J/DkXkyaxXMlHPTEunqTHlqB/epBkXAimx21Rm2ZRMfJ
+xYrL9Icd5KkZoDCntKtyY+0uUfXLg==
=L0Mj
-----END PGP SIGNATURE-----

--Sig_/lVVKadu.uANdWU.XBMYiQEq--

