Return-Path: <linux-next+bounces-6025-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 558EBA7209A
	for <lists+linux-next@lfdr.de>; Wed, 26 Mar 2025 22:14:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 624BA3B1022
	for <lists+linux-next@lfdr.de>; Wed, 26 Mar 2025 21:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8315625F7A0;
	Wed, 26 Mar 2025 21:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="nGcnQnUb"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2854D25EFAE;
	Wed, 26 Mar 2025 21:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743023585; cv=none; b=Ox3oZuvIOJ88JPUAeK+jR8TmG1ilrsEcfLEi4RzX9EGfq9kz4eqQUUrow6KQdgUs5L0X+OA4tEiQuKSEvK2EzGg3msLabxc9Ab2YHVzsEmAEkWfOzC0bZ+K+h9GmC7AqB0Tc0/3LmUZOjNFdNSn+edrwayShQnvT2+wrgnaIbTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743023585; c=relaxed/simple;
	bh=5jWkqYMQktVqP8qOq/0MmNQviI3gDyOwiaFmvYdX8os=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X2YoWeIBo8RrUnOL8z6KEvz9VZ/QS5oiAQ6EJRfK6sApDrQIqIiu7ZJk9L9gr+0ZnmNOszE6ZSni6Tb9IM+8IL/CGcY9AoZF3NI/h4UWpJ+Xub/UsVaPaIHmKMZJC1Waf9WFwwHwJ35iA2Ujgd/QwWYPOCgeSo8uDPtw9acpU/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=nGcnQnUb; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1743023579;
	bh=ZQOqMzTB9Nw9yW5ORLIgV5ky4yrSJVWQWRiTkHfEQTo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nGcnQnUbdKgVNcJ/YekuZlMTd2xTmuy4RDbppKmSj/0Tf0E2xN/8aiUvRQwEnoJzF
	 oWr8t3gg4J2Y4veTVN1vtuYAjhbfcnQ/qzsEQLwzKs3/8hwrGAEVgYlIblZUxeHVge
	 u2qTLOyXSlZNR9r2Bo3GXBgeChxPvjSE0aqVZRUkCdOEVGpXDpI7B6FHspeRcZcZol
	 bCdcjdamN2WLYU24jO3y0AmlKq+ZzYAukBX92xQaeOKFsW+8ZXy1Y+W9jqtvpAV0Ud
	 JNkK+42zsyyPklxWz1cMmt+bvwWye7osZl1f9acU3xl3nIUqyDM93tBSLclN0ZtkrH
	 hl3+RMfvQfIDg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZNKJC5Phnz4x8Z;
	Thu, 27 Mar 2025 08:12:59 +1100 (AEDT)
Date: Thu, 27 Mar 2025 08:12:57 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the drivers-x86 tree
Message-ID: <20250327081257.74074ee6@canb.auug.org.au>
In-Reply-To: <20250325172326.2037bd6c@canb.auug.org.au>
References: <20250325172326.2037bd6c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8f5lmWg88ed/5K1F.o_Um6E";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/8f5lmWg88ed/5K1F.o_Um6E
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 25 Mar 2025 17:23:26 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> The following commits are also in the mm-nonmm-stable tree as different
> commits (but the same patches):
>=20
>   96b8f4658b70 ("platform/x86/amd/pmf: convert timeouts to secs_to_jiffie=
s()")
>   b3e8dc1143b9 ("platform/x86: thinkpad_acpi: convert timeouts to secs_to=
_jiffies()")
>=20
> These are commits
>=20
>   8ba1b428cf1a ("platform/x86/amd/pmf: convert timeouts to secs_to_jiffie=
s()")
>   66644d80a4f9 ("platform/x86: thinkpad_acpi: convert timeouts to secs_to=
_jiffies()")
>=20
> in the mm-nonmm-stable tree.

Those driver-x86 commits are now in Linus' tree.
--=20
Cheers,
Stephen Rothwell

--Sig_/8f5lmWg88ed/5K1F.o_Um6E
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfkbdkACgkQAVBC80lX
0GwaEAf+NiVTtNT7ZrgqU1/yM+RhgstqDw9gx7oWuLMOTDD5Dt8IZqacAK5kj1ED
XfI3/2Rj/9KvrVtqZGdDC2wxmhI1/tpeoxd2aXKk9QM7qSlfOZix3eXYkNgYnACL
x+V88t659LYGREMflNEIbOajvfEPFwWnEsUDSMwiYw/WxDrjy4uf4CA4wv6Rw883
exAHQR0xtiw5mV7cCcmbfNfiYTBajESVd3rHr21rpyM6yrSTRBtFkU5hOa92Comr
dDjRa1kZ2pSAlb2CzhCQYxVDtFWA5jWT75L9BFS117vscUlfVenFAL3sRCAD/Ht5
Lj94wBaBQ3tcvoD2yIbpY0nspLmvrg==
=aBu6
-----END PGP SIGNATURE-----

--Sig_/8f5lmWg88ed/5K1F.o_Um6E--

