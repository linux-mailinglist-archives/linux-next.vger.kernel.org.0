Return-Path: <linux-next+bounces-3041-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 395919333D9
	for <lists+linux-next@lfdr.de>; Tue, 16 Jul 2024 23:50:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AFB41B2492D
	for <lists+linux-next@lfdr.de>; Tue, 16 Jul 2024 21:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8182A13AA27;
	Tue, 16 Jul 2024 21:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="lwxTAIjB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A849D224D2;
	Tue, 16 Jul 2024 21:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721166616; cv=none; b=nc8YjtpDv8UlSdc69AmfQ/8np3JwWY/o+0gx95LzBujrnqGGYr8ODjW1Clv+bDRPFdKs9UTUtq2lGy1Z5li4JipxERzzK+H5bMvJYCs8T2bqQIwmpCcJWrvebrBU7UxYekY1pBV6Z3i02bSGL2NwoRdQKz/ipMaad4ip0qMfUuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721166616; c=relaxed/simple;
	bh=p/Clfb18ZoaSNF6ugDDrz6kpNo42uImzHOVw2ufCAUE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=h85CRxU1fm2xwLFCgb+DdC5Df9dwDSiauDqFu4G5weCTZgIJ0vxqyUgtMk2ePXrBC9ZdOhrAH4zNZ6qfV3Rpd3jNR5cEYNnThklbdmu6WqpzWZTLZeLJyNIj22Jn+XSKrb5pDRbsu3I5VVQFK6F4HBeAuYuM0lvaIzLLWpeQybw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=lwxTAIjB; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1721166610;
	bh=8Qt1mD8P/cLduL62LjEBr94ICurhjdMszfxg/+LJb1A=;
	h=Date:From:To:Cc:Subject:From;
	b=lwxTAIjBcq+uZAQonqZ/YXuhWDYHR3wxk+wisy3lFavY/HSsfqKuv00dJ9tQYI4PJ
	 XTFCkt9nfVzzera9F728n4YxSZWGv+iHKGyNfIf9w9onrcYvuFj8gp/4G3xVbBVJi2
	 rEoSv2kY8kB4vHE9tx3zK8DdR5Ma5MMVe38ZR75/lWlJhO2XkFdfp03jBjRFbQfbKn
	 COW18hV0vjiowH29vodmPLXHWCAQBzSYol3HPH2n2iCdXS4xKeMC6TUtIh8RAbcTfJ
	 GuJN5lqPS/0rJEYzFt5QSXBOCCGjJxDq2iIHLoyhT07G+mDyBzjfziPrDE1877uid7
	 gP2hAWSEGNM2A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WNt5t4Vnvz4x1y;
	Wed, 17 Jul 2024 07:50:10 +1000 (AEST)
Date: Wed, 17 Jul 2024 07:50:09 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>, Namhyung Kim
 <namhyung@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the perf-current tree
Message-ID: <20240717075009.64e73349@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AtsnDWx=PSxuoN9HPd7JLPL";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/AtsnDWx=PSxuoN9HPd7JLPL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  1059fb529114 ("perf dsos: When adding a dso into sorted dsos maintain the=
 sort order")
  feaaa8be0b1e ("perf comm str: Avoid sort during insert")

--=20
Cheers,
Stephen Rothwell

--Sig_/AtsnDWx=PSxuoN9HPd7JLPL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaW6xEACgkQAVBC80lX
0Gxo8gf9GY57PZ9SD/lHBsFklGGvzteo3YX7k+KUTu0ts4JYfZh6smWnVPx/CTix
ik6N0JxYGhrdE+q0SaiFuHEkU978mSnvD9MzhitPhOMLElQjr0iCsxY8CEc8z0Ny
h/Pjz9c2SnISDER/BC5VO6MkEzptBto8O7S0zgtP4/JgHthiWIoQhLq2lSRxfhur
YKnp+iT+FCNexNyHlxGMgAtRHaQCiiqiyxL6TNqYcrBRW8SsHR9qsRl75IP/n8LW
XLEYut82wJs4zzXZtFQaEMMhFulUo8dpbLmzYTTY3oHpp6ScZFEs7v6wbkQE4lTZ
1DKWB7CygL3KtxcBrFw1mzdRrVWUcg==
=xpVB
-----END PGP SIGNATURE-----

--Sig_/AtsnDWx=PSxuoN9HPd7JLPL--

