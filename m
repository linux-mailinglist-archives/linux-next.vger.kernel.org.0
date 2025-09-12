Return-Path: <linux-next+bounces-8268-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4020EB53FE4
	for <lists+linux-next@lfdr.de>; Fri, 12 Sep 2025 03:32:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 611C51BC6F5D
	for <lists+linux-next@lfdr.de>; Fri, 12 Sep 2025 01:33:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11ADE2C187;
	Fri, 12 Sep 2025 01:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Le26QgI4"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E701400E;
	Fri, 12 Sep 2025 01:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757640760; cv=none; b=SdsHzTC98TSu8xLS9jC/RQd30NJNWbAgmzU6nF8n6VmLVFgYLgb4HaqW1WhRvZ9X6NqMJmXyfHSh/qA/fnEWfJnpJCaFsfyExBNkvklEaxlGSkNdk+GN3J4xXk7FUiVW327R0AtJOpEGuCBfj3t2FMcT+Zb2vcYjt3nLxI55LI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757640760; c=relaxed/simple;
	bh=M+p+Ji6lKg1Kv6f75ESzVI0sjOenMFS3balK+uadlfs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=YyF01MSuSn8AQE450CNCCNcVqUKoa8QuWF/rrBSNHP5Umf34cL2M1pxNai0ZnXIhcSYOwQPt9ITT5g1k9/yqJrCAZkVDTM8UZJhHc56Sel/fJPj7xatbtFkTv7gdp6XCs/Hz0ySWX7LkFUlypQ8AR4MgirLLihe4W/4IwNMA8F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Le26QgI4; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1757640755;
	bh=fvQ3wLw8KlobSh3bB0huuO76GR7hmVIKTAOLFAsiESU=;
	h=Date:From:To:Cc:Subject:From;
	b=Le26QgI4+PrnQfKwN6ShP3jjk8AjgLz0cCTtNPZbVTOysfBNz51d11nDqZrqvO3Fv
	 DBkirJfYE9jTM7U9fKbTDskhSgyis5IS6GcndJ3QD0HrBxG2Eu3vl8ZUQpNw9iNwI9
	 5vMQ5YiPox3NQxwyW1Ie/IL7gCZLGuzjo+sKnxjeFZOhVkg/aWWPa+ZEbIDMQsRBPF
	 E6q76fzZPQP5gVoNH0yGmUHgvXB3FnmYSLg+oY+j5nnqk+6BaaevU7+IEIdLrxnp32
	 hKl88IgJoBw5MaYF61p0fZem7D7nT8Hmw5WTJBQoDhTfvotUEDs9+MyaAOatvV2b6R
	 gcIsEmrnekJcg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cNH3l1my5z4w9Z;
	Fri, 12 Sep 2025 11:32:35 +1000 (AEST)
Date: Fri, 12 Sep 2025 11:32:34 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, Andrew
 Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the ntfs3 tree
Message-ID: <20250912113234.283d8e64@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zcFf942Urx2xB+03k_d/lx1";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/zcFf942Urx2xB+03k_d/lx1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the mm-unstable tree as a different commit
(but the same patch):

  7d460636b640 ("ntfs3: stop using write_cache_pages")

This is commit

  5c059d9d0947 ("ntfs3: stop using write_cache_pages")

in the mm-unstable tree wher it is part of series.

BTW, Andrew, in mm-unstable "mm: remove write_cache_pages" and "bcachefs:
stop using write_cache_pages" appear to be in the wrong order?

--=20
Cheers,
Stephen Rothwell

--Sig_/zcFf942Urx2xB+03k_d/lx1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmjDeDIACgkQAVBC80lX
0GxXhQf7BTYoSQ9pjwVqsImkG96MNXklCRWbEXuDUmLbEjuyWIzMT+s6Hrp/hj7T
u+4WBgKlrQJgUl2Hj/iR63E53r2Q6ZKOFpDZVjnMSz8luKdB3TDBabeLo9iDzXFH
DEHkia0XxGQmIid21rDt62ld01y5cXuriqNfrULlvhVjMUK+yxO1tTICsL06WJ57
5gQVzKvb23aSI2wEUQ86+pl3RneVT4NdeNaaDFa3eWoYJF1LoKVY0gtI7muQBK5C
hy2u3vx6nBPPka3LJOdGKHWSL8XDnriYGyUoD42a0rLrTT5vLEM9e8//yrWpFFGA
1fmVqrf0li9R5xYdel/BMF51Izay7A==
=+9Xa
-----END PGP SIGNATURE-----

--Sig_/zcFf942Urx2xB+03k_d/lx1--

