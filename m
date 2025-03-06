Return-Path: <linux-next+bounces-5676-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 028FBA5595E
	for <lists+linux-next@lfdr.de>; Thu,  6 Mar 2025 23:06:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 655441897A97
	for <lists+linux-next@lfdr.de>; Thu,  6 Mar 2025 22:06:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C396207DEB;
	Thu,  6 Mar 2025 22:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="mFSeYwJv"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC171E5B86;
	Thu,  6 Mar 2025 22:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741298807; cv=none; b=GlyEF8mmWwW7l5/fk7FA3yIaqrfbhBVT5Zmc5g2cCKckt0PriH+JxnsaCgzVpzxmRSPshykhTZ+b1sWt7WjJrHreGQqCh9HIPyGAAGwA3glZr+06TsnsVVZ2SN73EVZ8pwJF0SCO857juN0ZamY0ggJMyl4MDDGtzVvIKDTpDCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741298807; c=relaxed/simple;
	bh=iTF8ppMN6fCiAQ5R8gaeHJUCHhVFNmTxr9N7FCNV8f8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=n6gkIpGKXFAOR0MJIJxQ15PzF4QKAV6VHfPc8HWSAImVlgB2YQHRvK0sFicAz3VJ2D4DtXmsWxPDCI3/f1gZygO5Oi/sDeIuZkO4g3JGhzy7I5AM8PAx/n0NTddRAgvJND9WwsC55tOG2X+ByS0fYyEcm/CTNoxISlNHQowwsDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=mFSeYwJv; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741298800;
	bh=2oEQi1LZ6xfE0bhgFOyz7ltxkaGs8EDtR40dQPh+GcY=;
	h=Date:From:To:Cc:Subject:From;
	b=mFSeYwJvFazdUS9+uw3atWdbT3EuD1iAivDF+iurlA/54ZUrzCx6dYZJOhrOfdla/
	 PoU8EsZJI+xuC9SM0I8VMKkWskgRsmiqz+AzmpOmxJQtiGldfmzknnIQnRu+P6/3KI
	 nWa/cWUmKlKZddqqQmsZrPVWgmfonNGRPGHxYIr2HEiZFgtcrkWvQpX6d0f/Zok0o7
	 nquYHb5QWpEEYSvCH+GRhnWCYzLgi498JGBDpypNv1RKO+XQ0YSo0AaVqxN53Gh46Z
	 ZDNUnklhkbxVRSDWicW8QiDv7BgtULNctD/1f7lo74jVGCLcrfTCA8dyYHiIEfbbR+
	 1cbuL66kCHaAw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z83RN28zMz4wcT;
	Fri,  7 Mar 2025 09:06:39 +1100 (AEDT)
Date: Fri, 7 Mar 2025 09:06:38 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kevin Hilman <khilman@baylibre.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, ARM
 <linux-arm-kernel@lists.infradead.org>
Subject: linux-next: duplicate patch in the omap-fixes tree
Message-ID: <20250307090638.50776e07@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/J8OBaT5jmFBD_wXUWwzJR+7";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/J8OBaT5jmFBD_wXUWwzJR+7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the arm-soc-fixes tree as a different
commit (but the same patch):

  c2a5f8c4f28f ("ARM: OMAP1: select CONFIG_GENERIC_IRQ_CHIP")

This is commit

  98f3ab18a0a5 ("ARM: OMAP1: select CONFIG_GENERIC_IRQ_CHIP")

in te arm-soc-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/J8OBaT5jmFBD_wXUWwzJR+7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfKHG4ACgkQAVBC80lX
0GwKVQgAmaElUzhxVDZCZ9+6iOJiUfdWkczTvDEGc9MM09eQVj1jOH4rqeUhQw+w
3o8gY6W0Slpk0yDbA9UOpyALs26vbEC25ivA2dz+exhxqkIYgdIJvoi1jjP+G86k
U+fbpV/2VoPQQbUiuI1tUfDQ5e5p1B3eBCtdI/ZeY71a/cVZ2m/EpimBwE/pikxa
Es6c/I2ursNu1eZJaB2QzRFjZ+TC43IJ/hm3/SJovOnmMkYWeNm10iMRajM48aEF
tEoH557wLxEzZTF6OMscOVIL8MhEiZoyzhR0uusBWSSnCqlaU99/rtMhZiaBTPWL
RyifnRRP/WjVJp78vJSK9cdvEfP1vA==
=n2Nr
-----END PGP SIGNATURE-----

--Sig_/J8OBaT5jmFBD_wXUWwzJR+7--

