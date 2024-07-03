Return-Path: <linux-next+bounces-2819-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4547A924DEE
	for <lists+linux-next@lfdr.de>; Wed,  3 Jul 2024 04:40:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0285028590C
	for <lists+linux-next@lfdr.de>; Wed,  3 Jul 2024 02:40:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9456B524C;
	Wed,  3 Jul 2024 02:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="dNzz6FLA"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59E3523A;
	Wed,  3 Jul 2024 02:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719974408; cv=none; b=NYdZv/7BEy4+epY6uzXVgz/rerk1ibGwNcsNlkpt0VgK7IcCgBdYENNIwRZOXvn2wUfulYi1mTY9m9lYpqvQ8OU66iDhrcmiyKgq7PssEXevUJeeIUc2tWML/LIMIUaAZ+/818wNnnIJp2S5bxR13PjjGlx1blo8a8hAQmM5+ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719974408; c=relaxed/simple;
	bh=vPBhSNjWQ+xKJJpHAZ7T0HL0LQ9w3+F32kzIIzRV43I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IQykCbcnoCfoEapUXRwJlRSenZGzFRsTDaVBmRrw9MZI4g3XDp3zfRpOgoG3UpQ/yGKQ3yCj3rZi5Tg7DU3E5jn8LOJXVZi4vT9xmlfsg7dciIrNbURCGlR28mvExUgmbanIu9qr5R8vxLfiWozs9NicAhcXSNZZK5IedkzzHcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=dNzz6FLA; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1719974404;
	bh=/EDCIQAEg/p+MMLYNbszg680nHn24gcRpI+TzuKcU9U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dNzz6FLALGPfiBBeUd9mFzjTACHs3c7VtDmmOlzIbDb9ExivdmeboVLwjOCuGmFlX
	 8JHOe65oS15FjvwbiJsxRawcevEG1qyMNiWHu4rhUkAdKXKI4ccsz71CKZtgOYqjiJ
	 x6yi5mPfvQsy2k5QW7Vr9IalFMl+gdRn5ac+DocdUnKsr/o1OHQXH3WxPnEo8RQYz5
	 tiUcrHAfKmwHbYAC244CfiR60uCmb5gIos3dJDc8X/w58S2UzWg75hlT2QE2gJcaIv
	 aLhoMoSV1rBx1dux0GkzFonVX8vjXHx2xbFOEgvCSMy/ak5/u103SLEmQ9tRgH63pv
	 yA+tiaObozFpw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WDPBq6FBXz4wcJ;
	Wed,  3 Jul 2024 12:40:03 +1000 (AEST)
Date: Wed, 3 Jul 2024 12:40:03 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: DRI <dri-devel@lists.freedesktop.org>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: Re: Comments in Fixes: line (Was: Re: linux-next: Fixes tag needs
 some work in the drm-intel tree)
Message-ID: <20240703123930.13edbfa5@canb.auug.org.au>
In-Reply-To: <155844385673.15761.3434506339174536733@jlahtine-desk.ger.corp.intel.com>
References: <20190520221526.0e103916@canb.auug.org.au>
	<155844385673.15761.3434506339174536733@jlahtine-desk.ger.corp.intel.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iW/ag6FLZSTW2BV7u.6x/zr";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/iW/ag6FLZSTW2BV7u.6x/zr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Joonas,

On Tue, 21 May 2019 16:04:16 +0300 Joonas Lahtinen <joonas.lahtinen@linux.i=
ntel.com> wrote:
>
> We also have an incoming patch where the Fixes: line has a comment in
> it. Does your tooling account for this when checking the Fixes: line?

No, but I will ignore it manually.  The tooling just produces suggested
notifications - I don't send them all.

--=20
Cheers,
Stephen Rothwell

--Sig_/iW/ag6FLZSTW2BV7u.6x/zr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaEugMACgkQAVBC80lX
0Gz4Jgf/UF7YP6SfzyE5+288tj6hS1FY8cZ48ltYoAR9PRxR4qY3m/+2f45akRCU
F4TmPbvvLVtB0XolGcP6OL7DyPoPp2KXG5yu5DUugxm/jLdZNqKJDM8F65oSc9Cg
jQdEy+CtBjJOXgSaX2sMP1ITeLa3CIUexX/McpAsRJTJODDEnAkzrDS+wNYGGU5+
FrF/gwBHi3Nx+ncrAmIh2KLXUS6Jtt2PWVbzbgvrBgbRzsZ0idj5jeC8P2Lcco6J
ftFxLt7sS2x9wFKTW+L++60F2XJFfdsYYqnTd5280gSrX6RvhihxKD3ShPkb9rW1
XVorTzC+YUyPO7ImMsStLKC9vsEh0A==
=vsZB
-----END PGP SIGNATURE-----

--Sig_/iW/ag6FLZSTW2BV7u.6x/zr--

