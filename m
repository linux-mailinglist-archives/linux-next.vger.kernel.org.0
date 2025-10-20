Return-Path: <linux-next+bounces-8641-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FE1BEF063
	for <lists+linux-next@lfdr.de>; Mon, 20 Oct 2025 03:39:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 160CF1898622
	for <lists+linux-next@lfdr.de>; Mon, 20 Oct 2025 01:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD57D20468E;
	Mon, 20 Oct 2025 01:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WmjhfGdC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35AE20409A;
	Mon, 20 Oct 2025 01:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760924353; cv=none; b=BVcW67eLc8p34sy7KBHGaVDUlYjmsJM7uxS/snnpzSG341DO4D2WW3g5tMxF6cV3i/v0Zf6bSOy5GI/HyVv6pbRQ4JhPJ61buQh9FxmDhDAbBNhyYXpuyLk1rt0U/UjAD6cOl11AjhcQoindKOjy1Z0JcUx20QtdpV2qgcRmyf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760924353; c=relaxed/simple;
	bh=GyWoor8gS8UbJX5L+eoJALouqLGeSExH8nQZRvcnW+w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fOHBu0Swu+VGklNvyMEuZVYsMcJlcT4rpFbD0JKXNFmmFQBky3VZcbIehxV4WBD7y2xx4JT2W81Fd8syWWFNbls6FJyFiIueK+dIST1gJ0R99Hq5dFYlhRbTJPg98QGXhD9+2GrTrwYHHQt2IUECztCUBk9uyIiLWjcA3fSN5CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=WmjhfGdC; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1760924348;
	bh=so7N3ZVTvwSaZj354Wqg3i7SOmjQ+EwXz94RSRXJtOY=;
	h=Date:From:To:Cc:Subject:From;
	b=WmjhfGdCYDefudirPYQ9/YQJk+MxOz8xrmqmWY5YkAE4KurCFrcXuiQ84l3ltBZdG
	 N4Nk28YmOz9AQ/TGQuu29yBtgmpK0YAxYHGz2uY41XUNuUhqykmNzQeY3cc/+/yMkt
	 bJDePVsce/2M//xvKu/tmzEb9ERw24Q7/Sqv+z8SdGRz3QYqqm/RJhbRYppZpLxtAv
	 8nwgpQov/BXAPl/EwoLV0UHIn/9AN4ReWI7X1A798RbqnH2oxe832GCXRazIRYTFRJ
	 wn8OKdLNzKFjto4yYR0hr53uVf0p2l7hyLfkbsbaf9+eJJtgdpCh3QlHdn+95j7d13
	 A0M5i8nb7Tlng==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cqdPm1nXlz4w1v;
	Mon, 20 Oct 2025 12:39:08 +1100 (AEDT)
Date: Mon, 20 Oct 2025 12:39:07 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <ojeda@kernel.org>, Greg KH <greg@kroah.com>, Arnd Bergmann
 <arnd@arndb.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the rust tree
Message-ID: <20251020123907.13e15922@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pS11apW4bJG=EJXoTrgti1y";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/pS11apW4bJG=EJXoTrgti1y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the char-misc.curent tree as a different
commit (but the same patch):

  abae8f3c8374 ("[TEMPORARY] rust_binder: clean `clippy::mem_replace_with_d=
efault` warning")

This is commit

  7e69a24b6b35 ("rust_binder: clean `clippy::mem_replace_with_default` warn=
ing")

in the char-misc.current tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/pS11apW4bJG=EJXoTrgti1y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmj1krsACgkQAVBC80lX
0Gz3gAf/ez4NjSDhZiVFoudVSYvL7kkK8ZQUObhfMQs4MBwWUqktKfP+YKWNMrxe
HU58BVCBumU5AVHU8FD/a3Dpxyixwa48G0pXRm4bGe7xKhfKwsVqXs0yLpzkFbuD
09su2MRxoYDVl8hN9ZSKGG5uRqYl7gPjK7clQ0Pe4U3NLpJlXqHrLr4gkx/cvcKG
UB3KToDhVviXCtUbjyrd7uiMFhUl8+EaSGLkrGbYBNaeEwSqGO83JPVHCdguJU52
IDIcJf/UecC2RuIQjnVEFEnYPqKJriu4eLt9457GxPzPJb9nNPt/vBOYibeiKrsg
c9UbnLV29K/We9jmairScEXvsXPNpg==
=TjIF
-----END PGP SIGNATURE-----

--Sig_/pS11apW4bJG=EJXoTrgti1y--

