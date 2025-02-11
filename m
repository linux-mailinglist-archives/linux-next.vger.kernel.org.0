Return-Path: <linux-next+bounces-5411-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F445A3176D
	for <lists+linux-next@lfdr.de>; Tue, 11 Feb 2025 22:15:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6E4B188A18A
	for <lists+linux-next@lfdr.de>; Tue, 11 Feb 2025 21:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AE992690F5;
	Tue, 11 Feb 2025 21:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="HIMVq+7n"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B768E2690EE;
	Tue, 11 Feb 2025 21:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739308498; cv=none; b=k1NsC47kba5xAZFJKwQqA+YK8ot0FCy6RE0EJ7jpx1GBxA5MmQTSpoil3kGv78vlXpPz0tLiF+j5/zoXSulUJEKy/+Gum61958hT66Sa2M59e0lvdH3UQ7fGu1heu2N7J4aaPTXVe7dgVMULpBeEGoOKHX6Tzsx4novXnUpj6+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739308498; c=relaxed/simple;
	bh=fMz4aNaHOWbgxKZRfEYqYNgkk+2rSx+Se7TPi/dc3HM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DFY5JGGThZQ0mT9XhpiUfN0c0E7zMd1YvmxXU3w4HbpAsMoeP0Ykx+zvtLXuLmerQVVG8yAcnLLpRjVhUx7qjUag3A9CSK4cA4a0Wx2iAK+xQm0U2xb8PYfcVkn2hwT2VZYzKksd6lXLciizG+PrINP7j55vwILzcGQYaw5Y+Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=HIMVq+7n; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1739308493;
	bh=CHI5kJpbSwRguJw7AGUxH2yyrpKbkmCrXfCQV31mKbM=;
	h=Date:From:To:Cc:Subject:From;
	b=HIMVq+7nGOK2FMU7QHmwNNlaIAewf39mD7ZbqJ7VNTjNIsgeQT95OBnv9NGwmXigl
	 02/Sh5XD/egGfJWCOqVQjRpjz3pdmYMsLug33lQjXcQOHNsyPDDDfz0sgBClSvd9qa
	 xMPEBAt70d48qwxG9UojqEsNRXBgXxNxzwc1/GcR8SKt7t7gutYKcDjvszhuP6+7+5
	 AA28PbfWFqhK7F1jBX9ADT6N/0EFcsoZADdbOOCrvt3Pw7gCzHLZ5RVurwKyCn9O2r
	 9UgerBVYKKBdaCJ8pGXAe/+hacCCtLShls6IFsd+H9xR8bwePDWKBV2jQ3CzGFoi4W
	 aShGG0853ilpQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YsvNF55c2z4wcb;
	Wed, 12 Feb 2025 08:14:52 +1100 (AEDT)
Date: Wed, 12 Feb 2025 08:14:51 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Conor Dooley <Conor.Dooley@microchip.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the riscv-dt tree
Message-ID: <20250212081451.220517c1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/FEH/Etpbi2KE4JP11vpaBl.";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/FEH/Etpbi2KE4JP11vpaBl.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

ommit

  6b47db27468c ("riscv: dts: starfive: Unify regulator naming scheme")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/FEH/Etpbi2KE4JP11vpaBl.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmervcsACgkQAVBC80lX
0GwxuAf/QYURdzy7gDjwQTMxYm390tuEIW1TRFwMyv++kVq+SteJSD+VTYTlWfd6
zimEO4wwIw/nsySDExIv8biSxC5HWQ1FwZ6JGC+Km4LcBD8h9AyMX7IW9zouTrRI
oMCY7AlSNlcDpPEbyJoc8pROVIEmygBedK2oSikcDRZxnXDRepwr524ApZCg4X2M
X6/CzGeYlm/4W8n0e69wP9NwR0IomkXrq8xU/oe7l6DBI2e8FHGKalEJ0M0mNVT/
+obkoqcxVfI8z2OvE/XOZZtyxSB/4wQ1CAKiQ+HbEVGqr2/gsRURqA9eBkRNJeKB
xj2O66LQTAnTU+OHqu1Ht8aOSzwZDw==
=Tqs7
-----END PGP SIGNATURE-----

--Sig_/FEH/Etpbi2KE4JP11vpaBl.--

