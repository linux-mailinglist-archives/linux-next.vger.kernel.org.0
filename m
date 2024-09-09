Return-Path: <linux-next+bounces-3679-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1679713E6
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 11:36:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0421E1C22C6B
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 09:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DA3B1B78F8;
	Mon,  9 Sep 2024 09:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="jrF/MW2q"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF98E1B78FA;
	Mon,  9 Sep 2024 09:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725874402; cv=none; b=gthmD/E4zK9iN25OdVPiLc45kzWE6HMm1AnTjYI0RbzQoJF18+4mEzCPGRF30gOYabqWgqs6hUwkXwseOuFSdD8GlOwFR1jcFkEjEjgu01fEyrj6jbqMzKj64811DubWh++b085UV2SLlYT424D2p6PMJux6ocWFoXrzghoxU2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725874402; c=relaxed/simple;
	bh=PLDOu0hJeXUrdPFd45o3G1smItDcEQJxKOPJ8j6E0J0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o0NYHfpLQFzZKLRiSq097J3pLucoqgR0w2jjqgNgsZy0ajpQJ1ntC80a87QIbRXaOL0rsO0hBw09tTUBOx4Q+IJQF3snByzrE940uV8kTYV01ypjNPOGfC8iyL+XJEHcGVKwvd8cVb2odjRKwZBl1aPbc63rwEUsQqMuoSb1jNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=jrF/MW2q; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725874397;
	bh=Y3whYM0Hw06COQz5uKBqKXlBUIklvczzXpbwxID6qEs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jrF/MW2qx9wFMIzNy99FTuMz/XdERqIPxOJgQm50Q47Mr4C8CxmNxY7yhV/Xwzg5O
	 L4nmn4dSuF66ASAVT6sbNl8joUeu9qn/8P2z6bv0YBdPGSdLjx4vcIlJ4nEf33yWO5
	 y+cN+Mr8M1tHnUTBz9oHczRLkygWuyHzA3wKOx5k/v5OT0nKAJblV+oxtpfRKGD6IV
	 JGRYVz4yYxBgI/vO5Xs7oVlMU8+tWzF1sNpAVQ5F8eD6KHkCklBVrHMyT+j5xXSPR4
	 VBMc2ern7SWJE5Lq/K2zI0N2Pg3mJsZRShg571IMXg82Yxs0Ipy/ponqJNA/QJxL87
	 WRQhDC9gbujKA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X2M8F5lXhz4w2N;
	Mon,  9 Sep 2024 19:33:17 +1000 (AEST)
Date: Mon, 9 Sep 2024 19:33:16 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Christian Brauner <brauner@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the slab tree
Message-ID: <20240909193316.007148df@canb.auug.org.au>
In-Reply-To: <c741cfbb-f209-4466-9d35-aef32dc3424f@suse.cz>
References: <20240909171220.32e862e3@canb.auug.org.au>
	<20240909181035.4ffd7434@canb.auug.org.au>
	<bde596e3-365b-4fdb-8a03-0a4e40a56246@suse.cz>
	<c741cfbb-f209-4466-9d35-aef32dc3424f@suse.cz>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tRfC9vyh8EsWDiSalMzOJzL";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/tRfC9vyh8EsWDiSalMzOJzL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Vlastimil,

On Mon, 9 Sep 2024 10:49:45 +0200 Vlastimil Babka <vbabka@suse.cz> wrote:
>
> ... so it would have to be either slab tree from 20240905 (before it
> included the vfs commits), or vfs from 20240906 (before the commits on vfs
> side got different id's).

You need to remember that my time zone is UTC+1000 :-)

> I guess if you rolled back vfs side in -next, then it makes more sense to
> reset vfs, and if slab side, then slab.

The vfs-brauner tree is merged into linux-next earlyish in the morning.
the slab tree late in the afternoon.  My preference is to rollback the
later tree is that works.

--=20
Cheers,
Stephen Rothwell

--Sig_/tRfC9vyh8EsWDiSalMzOJzL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbewNwACgkQAVBC80lX
0GxUIggAkHHpOvWVe9thOJKuweIZkAOov6bcs850brOol5CiAvVmxsc0ckuWll+e
wEpcj7bHkXW0pVnUQaeFhmvRzKe0BxwE3h4wTENr/RavD/DjtpvtE2B2TQR1CenA
Sv6AduTcaWbPP5RhUP4KH161sv6bWFXYoZqXGvs2P8z/tT8/j9s79fIlZj3QV6ww
awd8XxYZz0BIkMGvF7oTs1Sw2/tuLwadx/+UUI0OvU3jryVA1ac4UHqq7Q4nXV/9
8JxGIaxF37ZoLigxgUbDWYnfDQ1RZ8qQqc2XSYxfcj92AUiWPOMlZ8cXRBiqyr+H
gB7BOBdnwnmkZccBwGwNQ7wy3cH0Ew==
=JVU8
-----END PGP SIGNATURE-----

--Sig_/tRfC9vyh8EsWDiSalMzOJzL--

