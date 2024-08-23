Return-Path: <linux-next+bounces-3400-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F26C795C3FC
	for <lists+linux-next@lfdr.de>; Fri, 23 Aug 2024 05:56:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A9591C22466
	for <lists+linux-next@lfdr.de>; Fri, 23 Aug 2024 03:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87E4A39AF4;
	Fri, 23 Aug 2024 03:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="M2eFpk+f"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097B54D8B7;
	Fri, 23 Aug 2024 03:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724385403; cv=none; b=irR76G2yirtix75wINtYFT4KGeLSuwFH6aYSEigxaebAvfbh0B1YA7sRraNnPOeOHeYtziKe4ucE69qCz2mcIvsNk4IZmCopQEJrUfWEm/wdmbpKSQbWXxPyqk9sr2RXjRpv97aaT7bUf3N8WIXHG+Z9QVWec5/MeyyQpTf1yyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724385403; c=relaxed/simple;
	bh=edJX4QIhH5dn6aLwk3qYBmyyaoJ0cZ1vmSvykWhGLIA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=erp7J0JkVyng5TR6SXoiitCMktcJMZJ3fgHHica+X5J/5Q85OVYNiu3INcgyYSphKnpetMjD5cKUfApmdjm7aEQ+FRNwlsCbA8Mzgq3sciJRXHXXMXAheD+LzJ78AzTjqqBZ6enwRL5eZtsPO7MvzHIdwpYNhpWI0UiwNs7Q1RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=M2eFpk+f; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724385398;
	bh=79Gy4NGKtaK6VJHrFyAiB5AivMIucE5yU+Cgg26IwNk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=M2eFpk+fkcMkf/EF5Z18X+W4R3WdOY0NBCVvwhoNSFdur3Teu2LOL7l5imQSnjZZE
	 K0da39AIsKtpxvUTdauywQrhg6IfqXmz7Xx203wIYz5ghUACk5RITNjr2woZmJvnll
	 2ImBAOrMXk7xfSGRK5T1udSvL8HDNC4fljWEKDAy44Gtn0fv4kvH98462LlLqQt6Sp
	 CLqydZVtAbo18B/8WJmKiR6ealyF4GL+X3TTLrHfPgaca8FIbMivCOa6j3NH0ZRZja
	 nS2Yet5T4b61MN2uDzHyBXFVVCch1CyBnBdOsL6sJywMOtSMTUViOhYGhK56CpCVx6
	 Q8NAUuoYgN0dg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WqmTd6G7Wz4x8V;
	Fri, 23 Aug 2024 13:56:37 +1000 (AEST)
Date: Fri, 23 Aug 2024 13:56:37 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
 <johan.hedberg@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the bluetooth tree
Message-ID: <20240823135637.1fb15534@canb.auug.org.au>
In-Reply-To: <20240819110126.440e7031@canb.auug.org.au>
References: <20240819110126.440e7031@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zG0.GfbqpA_6cnAYzLUo_rT";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/zG0.GfbqpA_6cnAYzLUo_rT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 19 Aug 2024 11:01:26 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> The following commits are also in the net tree as different commits
> (but the same patches):
>=20
>   01bcdf3cfddb ("Bluetooth: SMP: Fix assumption of Central always being I=
nitiator")
>   7285ef081977 ("Bluetooth: MGMT: Add error handling to pair_device()")
>   8ccaf1a2bf4a ("Bluetooth: HCI: Invert LE State quirk to be opt-out rath=
er then opt-in")
>   96ddcf0e9e5b ("Bluetooth: hci_core: Fix LE quote calculation")

These are now also in Linus' tree.
--=20
Cheers,
Stephen Rothwell

--Sig_/zG0.GfbqpA_6cnAYzLUo_rT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbICHUACgkQAVBC80lX
0Gzjbwf7BwX3D4V+zDk/rQwrT/FB/pY2BitEGuuZq1CqWGhhojMPHO2h6PzUv/rl
kSjtTRvfO+4EmT7JGnGxWO8+sC3AUGQwUr9Oe2KY0VYDGU2djqokWTAgRn+wi9A2
fbEjSuRa2ZLFMT84mCEVm/Ke+wxTEexEUOr+Zg+mQH7tpw4SqCXU70ADfdaP5/v1
3L957ZkYnlblZfJT2yFYt2E3ZJ8Wav7irXX8cbIqqd5JgWLgBvqsMK1JP7KHOLnn
ZePOcTjA5CRBOpjxjejidUjcG0bUht3EVaK/iO1KiAhycAU3KV3lWa7MJce/GI69
uodTSGSnGH2G4YKOyLOalwUgTtFTTg==
=8I0K
-----END PGP SIGNATURE-----

--Sig_/zG0.GfbqpA_6cnAYzLUo_rT--

