Return-Path: <linux-next+bounces-8822-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C2824C33341
	for <lists+linux-next@lfdr.de>; Tue, 04 Nov 2025 23:24:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 457ED466B3A
	for <lists+linux-next@lfdr.de>; Tue,  4 Nov 2025 22:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23B782690D5;
	Tue,  4 Nov 2025 22:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="EDJyKSj0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657462D061C;
	Tue,  4 Nov 2025 22:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762294796; cv=none; b=kDeAhsQmcT0eY79czomVbQ3DQdEbvWqRfV/Ea4CNE4tpmvuSZL5QaZKQbbaySLo/4dijvxlk2yDtWfQaORgi3FfGlmMJEjNseVArbSUYOR6rybGRJpT9xNn43QARxVq1nqrqyxZCL0id4ViZaNro8m1B4el4u0Cjkd4Z1w/lK98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762294796; c=relaxed/simple;
	bh=Qz/fqXRWiPHQN3ewpaRgvnz+eM4EoT2NCq5O9Sx62/8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LAgIUEqTgxEbQT2LqeY7HBKB40w61bSJcH82XX6IhC7jS9XhIKgM/GQzrCfGb3BHe+BOF+HZGF3mpTNQhWUN5cASsodOG5vI/1xGOKItxo46x7jsZTxEeJwQqdh6yc6ZMtpJ0hlKWsRde04GMXhO5MhEa7QeDu5vfrl8DqKlh3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=EDJyKSj0; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762294788;
	bh=CPd1XVl0PC+zgXR94idC0ZyTnwALPOoPLFtBmKFwa98=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=EDJyKSj0QxhQdmj2JMQYkGNx8tM7ez18EGIeVjYopIeCATY+pG6kyJ1V3TMBJU6yg
	 UsRgzOU/SHAPL1AYH0f4xfc5BAu5bwET4Msa+Nw4RDe6EPxJ+FRKKEMDR01hvSr0sf
	 PBOtH2mzo5F/EvRUNdzqrbs0WB2zh/qVGcCdTerSatopUjFISKbZN5ndAhXkOHRjS8
	 sR3dM/jEb+lDYpm02vOtniFQybn/7ZQG6bSQzOHo0kkYV7h+dJuTT9UasnvtvzCoz3
	 I7PjoElVaBhaxhTjyzX4ZrK3Y/kGIrOL4SS7f1i86ER/TayjZsO2tyMStzbwmTqz/b
	 B+fid2E7MDXzA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d1NDN0Dqjz4wCZ;
	Wed, 05 Nov 2025 09:19:48 +1100 (AEDT)
Date: Wed, 5 Nov 2025 09:19:47 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Drew Fustini <fustini@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Conor Dooley
 <conor@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: Add tenstorrent to linux-next
Message-ID: <20251105091947.2692a796@canb.auug.org.au>
In-Reply-To: <aQpkDYXT3N6qWiZs@x1>
References: <aQpkDYXT3N6qWiZs@x1>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ULWV=an8W5NfKQGUzapEptF";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ULWV=an8W5NfKQGUzapEptF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Drew,

On Tue, 4 Nov 2025 12:37:33 -0800 Drew Fustini <fustini@kernel.org> wrote:
>
> I have setup device tree branches for Tenstorrent RISC-V SoCs, and I
> would like to add them to linux-next for testing coverage. I have sent a
> v6.19 PR to Arnd to add the Tenstorrent Blachkole SoC device tree [1].
>=20
> tenstorrent-dt-fixes git https://github.com/tenstorrent/linux.git#tenstor=
rent-dt-fixes
> tenstorrent-dt-for-next git https://github.com/tenstorrent/linux.git#tens=
torrent-dt-for-next

Added from today (I called the second "tenstorrent-dt").  I have just
you as contact so far - should I add anyone else?

Also, should I update your other trees (thead-clk, thead-clk-fixes,
thead-dt and thead-dt-fixes) to use your kernel.org address as contact?

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/ULWV=an8W5NfKQGUzapEptF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkKfAMACgkQAVBC80lX
0GzALwf/fyDxySEYKsqJatdQeIxMChR8AMtPBSNdDU/+v38ZI1d8cpsIibMC+T9J
8jcu0O0NZKPre6v9dOr4qOcbGBWRvtTYxu888QnT+P2Ck1VqlcG9wWjVv0u7LoLW
A87WKE8XV3DbL0VgEgY+5kqZs3c9i3zGj23dgDCx+0syCW1SL8M1fOP2xd14qs10
9OQZH2utD/W22vvIkFmSBIiSpF6qDmRiuYS5IBKnD091MexpYjFR0K/4q0tNEzG0
z0iZY2KOOoqUSCfRgxp8EPecXOv+BW/pBJACUFUk4QilsJq+j8ACE8Ntl5gc7cPS
CgwWGXf+Q4mXNHvePnpObPmPOctWtA==
=XONg
-----END PGP SIGNATURE-----

--Sig_/ULWV=an8W5NfKQGUzapEptF--

