Return-Path: <linux-next+bounces-2501-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FF6901608
	for <lists+linux-next@lfdr.de>; Sun,  9 Jun 2024 13:54:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEBDA1F2131A
	for <lists+linux-next@lfdr.de>; Sun,  9 Jun 2024 11:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 653EB3B79C;
	Sun,  9 Jun 2024 11:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="mMx70T9l"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C8917565;
	Sun,  9 Jun 2024 11:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717934056; cv=none; b=ROWZtvkc06/KYb+SoXL4tnzZt987/vGX9elNQSVCfnCTOKRESdvzHPYp6VQAYAWhi4/KV77W4E6TQQnkE69OItszX77Xgcaf22mwl/BiL0bXG/1x6UJ+xEjt3oy7NUwRy3A9DIS1KNNKRgeBFfaT0cKNfWZMgLmRPD16pNOy+AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717934056; c=relaxed/simple;
	bh=b/m/1oWHcJq06eFpAh+xa9o2uvaqbkd/Wgycs2ci46U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YEJmkDsYIuBmL6MjmjZu8jap7BwmWSipqcsIeCFEAfPeO+1v/L3JM0byUCbdcjkZQzYG4FloqoWuE1BdjJF7thCE3eUpEQqDtoO5LuqTZvebVEh/zQyFroXYl0XySL4uvMqVeILJXm9dvfUpLwpHs92GDUEp39w1RsWKv1iWiUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=mMx70T9l; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1717934044;
	bh=b/m/1oWHcJq06eFpAh+xa9o2uvaqbkd/Wgycs2ci46U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mMx70T9lj7rPDJS9E8c5ogdUgE0rKLOC89wQzmsN/79qP9fyYpbUVSkXIHV+XncXf
	 rasSiyOlAMZyE8yEsWPaiPNqY38JdbJFsRY0GT1VoqJ3sEw6TBVGR0S9pIofWyudg3
	 TbMt64Y+NKlJAhKkirVvjoTIu7Gm+x6iDN2nNI4Phw93D8o7K2+3FlETLbz9q4Znxn
	 wG8zDaSNEoMU+nSmrlkXGHLlBLF8HzdcMpRNZcFM1HGHdEYwcG+SuZsIbPZbJylnsI
	 lqqtXYDFnkHssi4kM0Moti2ykKTw8sUpXm7AG76feKApzNlzayfD0B4Gh1LuUPKTn0
	 JR6eph7uhsUdw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Vxtd83BlQz4wc4;
	Sun,  9 Jun 2024 21:54:04 +1000 (AEST)
Date: Sun, 9 Jun 2024 21:53:48 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Jun 7
Message-ID: <20240609215348.02ef4386@canb.auug.org.au>
In-Reply-To: <20240607131653.3ae8e5a7@canb.auug.org.au>
References: <20240607131653.3ae8e5a7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/d5AJ+PN9OuigG.hZpwJdMYO";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/d5AJ+PN9OuigG.hZpwJdMYO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 7 Jun 2024 13:16:53 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> News: I will not be doing any linnux-next releases between June 14 and
> June 30, inclusive.

Also, there will be no linux-next release tomorrow, sorry.

--=20
Cheers,
Stephen Rothwell

--Sig_/d5AJ+PN9OuigG.hZpwJdMYO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZll8wACgkQAVBC80lX
0GzFkwf+N1jqF/imUfzYGtB1OFAI8rzrEBB7hZ/GuG96ltoYCy0JiPmiQrW/jrQ9
whXeqFfgl2OF47VTX3kr1ucTZCFyyLXmE1xYFNhvu1niy88ig/1bRpdBSi0VrsRg
WZ7LzJdNIqlJHzlhm0lMrV/JKLId+2cPW2I4Bm25Le8ZZ7picgjUiK4LcwbhvXa5
348b4B+a9UVzVrFoTIZBzpWBkfLhV9ih75ZrTNHU7OLcDbqN4RljRwjOTgls5wo+
fYKffLVL3drsU6jgHqZd7jWMvklbNIdoq5YxFzgBRflt8yp0UYSS25e8yXNwrW3Y
QXJzD8AwxCkQCSTtj0Ls6EH6NDKPRQ==
=ldkO
-----END PGP SIGNATURE-----

--Sig_/d5AJ+PN9OuigG.hZpwJdMYO--

