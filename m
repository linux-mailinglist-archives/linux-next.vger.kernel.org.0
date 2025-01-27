Return-Path: <linux-next+bounces-5325-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CB10EA1CF92
	for <lists+linux-next@lfdr.de>; Mon, 27 Jan 2025 03:40:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 25CBF7A2F21
	for <lists+linux-next@lfdr.de>; Mon, 27 Jan 2025 02:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D33DB67F;
	Mon, 27 Jan 2025 02:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="D3PmiEsv"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE2225A64A;
	Mon, 27 Jan 2025 02:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737945594; cv=none; b=neKArx/T/XHEBCzWgRSlWdjYOqSYNHJUKz8LdfKJ2wwrhvfS+O32vfNXBMg4qQQ3fwLW+e3mdjddQ7EhOyaRKpWbSR5ymVRADkW58M6K9rT6qO8r1wsH6tR2A1bGEChN7vkDge42dpMidBrZHcP/HX6EgJjopnDj0ZApwKf3ExQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737945594; c=relaxed/simple;
	bh=kCvPv2xSmCL7AGbB2Y1yo6Wn1OBoQB3fzhF4+EJ5RSE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j8yHxFAz6Kh0OFEJC6EFj9mFi4bcmtqxhPkgaFy75cCY9gtaPtlvta+GiU9wcUrFS+09ppG3e6CIu3+XkLwUEUMRSkg0YNEVKOYg4JbyICJO1l23+Pp4P7p7c/PkzDbS4LEx9/yIW/FoTCP/ZteObM7GLzPko2aqmDk9cCPWPF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=D3PmiEsv; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1737945574;
	bh=O7Wm7RODfmijh4p+oZg16/+x0mupWcSqhlhSOZzl8e0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=D3PmiEsvmtV4dCo/p23kgw27jk4shQ8xz7EW4W37afmsw7ZkmsF6X1FRcEbainpeP
	 K3LtOTMjZ0AJgNYxYImPQo8crCcAPT06YWFxAj1fjskaVYbFWY9tILAGvU15Of+Ri0
	 YhyLEToT4qC8+Lm38lYqKft/2Pa4mlMDVBkuoNOG5z6C82fPSjNR2FIDuRCkB1v6IS
	 +5MTSNQlzHwgpy/yjsuZKAUhDe2KhP+byLkxAqG5v7JCKuk0N+OkYJQQlt2THcjG/s
	 dneOJJuyQiwRHqWdqsOGGakWlluH5LFFFtmrSFqGIh+TOp0aKtk0xSrmB0f+GkDP+c
	 uZ/KU47nOnmVQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YhCLG401pz4wby;
	Mon, 27 Jan 2025 13:39:34 +1100 (AEDT)
Date: Mon, 27 Jan 2025 13:39:42 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Howells <dhowells@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the afs tree
Message-ID: <20250127133942.516e8d96@canb.auug.org.au>
In-Reply-To: <2422893.1737702587@warthog.procyon.org.uk>
References: <20250124142722.7b8a4681@canb.auug.org.au>
	<20250121091525.6ff05253@canb.auug.org.au>
	<2190350.1737644541@warthog.procyon.org.uk>
	<2422893.1737702587@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GRnAe0J9J68vy4o93qetMG9";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/GRnAe0J9J68vy4o93qetMG9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi David,

On Fri, 24 Jan 2025 07:09:47 +0000 David Howells <dhowells@redhat.com> wrot=
e:
>
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>=20
> > Do you want me to remove your tree from linux-next? =20
>=20
> Yes, please.

Sorry for the misunderstanding.  Removed from tomorrow.  Just ask if
you want it included separately again.

--=20
Cheers,
Stephen Rothwell

--Sig_/GRnAe0J9J68vy4o93qetMG9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeW8e4ACgkQAVBC80lX
0Gz8qwf/Y/r4lYaBCFliAOC3b8IF/NQd7RKZ4fL2mHXT4TJYTKH3pbVoa34ylZ94
EGkf/7+pqWiVBJCo/ejxdc5DKi6v9pj8qqhpOzDqvliAo/mkUl92U1oOi96N0/pW
jLpAJsgoymJ9SjOlAVBDI8X9VsQopSV7mVw71pqmMOGIMrF9Nvq/dAlxNnYK5l2/
JpMstUyMMLBbHsC3EY1cZaEOxZvwG5Dz/Q5eBOOSvd5DUO1rWQHzRReGiPQcfcLh
2iUfsBLAdcOBB3NfyQdTuXHgyVbU/He0319xtzlNIPxko4HYwl5FpbTY3dinErRo
OqC684AEvc7Gn7WCgdhM1MkRpFJGiQ==
=8LVU
-----END PGP SIGNATURE-----

--Sig_/GRnAe0J9J68vy4o93qetMG9--

