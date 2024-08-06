Return-Path: <linux-next+bounces-3243-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE9B948999
	for <lists+linux-next@lfdr.de>; Tue,  6 Aug 2024 08:51:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0F4A1C2270A
	for <lists+linux-next@lfdr.de>; Tue,  6 Aug 2024 06:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98DB21BB683;
	Tue,  6 Aug 2024 06:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="trLWNAN/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EF515B147;
	Tue,  6 Aug 2024 06:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722927071; cv=none; b=KtLK22zv9HFg3XDnkIijtR7+NnqwgTUNLsy9BUJkS7w+yMBu/8ipwp0Mm2phVBR2Z6tsPJzrlYFeOYeVIhw8T71m6QFkcmVe3YlcXmX5VQzO8UHzp/h5oayhl/IqAEEp1zdOtek/pMtf2IRWOFrwpJM6wWf6eTkfo8lheBx+b6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722927071; c=relaxed/simple;
	bh=2vOPurazSJ1srXpGqSTW+az72lhdQC6hwtTQ9ZWAw28=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fth6FQvNI685dP48E/ee3jZWoQQL1Z9MIxJLmtMHBpsMehqcvQ0Fusp0tWtKH+HJfzH68JuRl53VjNe9M1S3ZhhKB/PQ9XPOdyW+Uc6Z0XAexjHhaQIbbIbFBgn0LoGNrTt2hoGKfCSqR4o/A20LTwVMaF1jv73GEqG3rgST2JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=trLWNAN/; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1722927060;
	bh=2vOPurazSJ1srXpGqSTW+az72lhdQC6hwtTQ9ZWAw28=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=trLWNAN/fJXy9UPxaT4NALvLZnw8NmsqW6mV4Ac24bvslnWCBMP+gUlgN3xEz8Yrt
	 BNpyajmxUz5obcQxlziuT365ePUM7qZe4QidL9ZewjWp7r0PXaDUS+/YW8iq9xbQob
	 F85DWHz/LLATRKq0gMHPbXC+HyJ50YftC+go8+Zn8vjz3TmVfa2LwBxm+QV4cRQ36a
	 19SEK8keYFkROFUpGNlMz3Goa43EAK3IagKk0pT/wypjF29yiWBwb7Td47iks0ehAB
	 +3SRtcUkH+2OjXvtolFQtqWcUvsUZpqFboaJ/Iyc7in6Q7otp9OFntUEJ23PQyZuaI
	 VvAjwocG3aAUQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WdP8h0kgwz4w2K;
	Tue,  6 Aug 2024 16:51:00 +1000 (AEST)
Date: Tue, 6 Aug 2024 16:50:59 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>, linux-next
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the asm-generic tree
Message-ID: <20240806165059.456e57f8@canb.auug.org.au>
In-Reply-To: <f978393a-0250-4493-8e38-a4d80b2b5698@app.fastmail.com>
References: <20240806145453.5297d452@canb.auug.org.au>
	<f978393a-0250-4493-8e38-a4d80b2b5698@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8MhX29N3meCMEbD_GK7O/TY";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/8MhX29N3meCMEbD_GK7O/TY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

On Tue, 06 Aug 2024 08:30:14 +0200 "Arnd Bergmann" <arnd@arndb.de> wrote:
>
> Thanks! I've pushed a fixed version now.

Um, it looks identical to the old one ...
--=20
Cheers,
Stephen Rothwell

--Sig_/8MhX29N3meCMEbD_GK7O/TY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaxx9MACgkQAVBC80lX
0Gxdkwf+Pt9UFdBiGOyhm9z6W8J5jsqugivepVUk+DzEC9b4BZFoCCowkT78oUOG
EgacXyTQ1VB8I5OGy6JlftkeasdS34Kh+PYlJeu3sbDXi9XwMYdC1xveA/tZN7lU
wYy2oLtPYWZsg9zpaLU4fFnBW9daNM2TfCXb2NmQtA8MJ23kywqOKuKo3nqfo2o5
I7K/P3d5dxYUCJp2W33ofa5WjRolNwq/LoZ3SPmg1Pv56KUYx59pzCrPq2IFAYtf
xBY2iSaeJOvGsM0SdgNYe5LeZ5oDxR0MghH9egef7PiCsYiTQpukKVg49+YLtTiZ
lza5aiuzfv7U6pQek1uKsiYXKatwXg==
=lRji
-----END PGP SIGNATURE-----

--Sig_/8MhX29N3meCMEbD_GK7O/TY--

