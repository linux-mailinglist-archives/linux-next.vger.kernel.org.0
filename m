Return-Path: <linux-next+bounces-4804-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA419D1A19
	for <lists+linux-next@lfdr.de>; Mon, 18 Nov 2024 22:07:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C126A1F220E8
	for <lists+linux-next@lfdr.de>; Mon, 18 Nov 2024 21:07:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E01921E7655;
	Mon, 18 Nov 2024 21:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="CX/rdxK1"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6872D1E5728;
	Mon, 18 Nov 2024 21:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731964023; cv=none; b=kou7klDYwxW0mr8OA6n18pfNr9GV+PYc+9aEpT783JjZgXx5Jg+Gn7MWFm/g595Ap9bWnTYRmOovOrK4h/MpRaYwkAPRX/gORnDDxImJSKFh80o2AEBpmcBg7iT3fU1VC8sQWhmtg/tQCXdWRnw0wI1Ai+sOuFBAnowZwpR5GDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731964023; c=relaxed/simple;
	bh=f6jmlQ8aYz223GPUTGITWrIb/97BwB0HGmHcBS0EEVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IuXnU7J4KOnjlueglV6u+LKwFmr63+zV6OMSbl5YitjVoofLR4i3EUlbpq/AoWJo69b8Sor6QNGwHCZoBbrtXrHDwo5apHyF+mqKeO/WjSjd6Stdu835TiJpFfU+wJ7/51FoQN5b1gwgVJZNzRCOAmvpFLd8+L3OqImeG+1MfUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=CX/rdxK1; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1731964016;
	bh=9Pp2pioH5u2RWDVUD0nuEcKZEcm4sEQphNEovDxuBwQ=;
	h=Date:From:To:Cc:Subject:From;
	b=CX/rdxK1yd0Gf3JPwiw1kyZA19x1rSis0rl5WIE/zItClpUPm8ffN1fpNJThTu9ju
	 HHE4WdqwcBSNYd6304XRtXLtQ7oS4TTZOoX5QTILJdSp+VzZMg/rYrqhx19S02+M5g
	 0adtMGpObDL1G9o2F/tMaZXqt/BtEId7ldRmtgLgW1lhTDHlg0ckmfneWeaPUZQ4X+
	 p4b/kfJYsE74OBy+aJq1R/7ccd8i41QIsRs0FTnLYC4IriAe/IB1lLtKqH68sriWha
	 B3C3OSeZsgZVP0TeHErblKLS4kZ0BP4XDHsOHk77JfQm20wrFwSWWnMSZ4GZZVp20i
	 qdoEC9JiDPHsQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XsgDJ1Kprz4xfl;
	Tue, 19 Nov 2024 08:06:56 +1100 (AEDT)
Date: Tue, 19 Nov 2024 08:06:58 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the drivers-x86 tree
Message-ID: <20241119080658.7d0866a0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/e7bggWCyLBrr5w2hfTFjZUQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/e7bggWCyLBrr5w2hfTFjZUQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  c6a2b4fcec5f ("platform/x86: p2sb: Cache correct PCI bar for P2SB on Gemi=
ni Lake")

Fixes tag

  Fixes: 2841631a0365 ("platform/x86: p2sb: Allow p2sb_bar() calls during P=
CI device probe")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: b28ff7a7c324 ("platform/x86: p2sb: Allow p2sb_bar() calls during PCI=
 device probe")

--=20
Cheers,
Stephen Rothwell

--Sig_/e7bggWCyLBrr5w2hfTFjZUQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmc7rHIACgkQAVBC80lX
0GyxwQf/aMD+av2vXZ6kSUZkBFFoqQ/BDL5zgmcvoZBDz6Rb88n3mtbzVPQAWgvH
JKNOP2wlVkEABLCKQH5/VV6dONVwq2CgyxPnGpeCBdxlkwAhn0L5OrsVRLLuvF/+
Mcv/ih3EuBMz6pJ+lkgB9MBcutUID40CIkYTDyzd8QoxNNgz+bHVj4b+C1wkJlqO
s1OWy9MKOUhGrftFlocY8VNGtZU41gw/bf14ed0IoGKZ/i3zjp65mmHy9/OAiLp7
L288AbfoUGNCfUjVzGps/LmGgIRt3HikfA8q173/nvWd8HbvOFTYnZ6QkFQvgTj4
o5clrtCT+uJG9FkQ7otxvatrv2tPmg==
=WkUZ
-----END PGP SIGNATURE-----

--Sig_/e7bggWCyLBrr5w2hfTFjZUQ--

