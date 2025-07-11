Return-Path: <linux-next+bounces-7473-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D11ABB01288
	for <lists+linux-next@lfdr.de>; Fri, 11 Jul 2025 07:07:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DACA1188EE1E
	for <lists+linux-next@lfdr.de>; Fri, 11 Jul 2025 05:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B185F1AC43A;
	Fri, 11 Jul 2025 05:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="RtYuTOg0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5292C13AA2A;
	Fri, 11 Jul 2025 05:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752210421; cv=none; b=dYsyOsq5aHf5bJ/yOnYy4rng5LPfonAxW9N1Md5TtvPr3E6QJgTjKAHIW9nVeU16tz6mSQS3xrDLi+dp+FpsZCFkg+sV3t6V2tegUQ8Z/zYn5/5IXEZsvegJXtQQviEPmOGyE8PfGITyqAxmx8dBs82ZcfMsr4yUzfw8TKmWd0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752210421; c=relaxed/simple;
	bh=1AUJ+28d/UVSi0B1cud+6JEcI73qNMK9T+MEygp92WI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=YovUcxNcQzs/2X10IwHCm3u4gJuoTQMYUB6szv99XszfmLkoJC87fpthZnvwtBq0QaDmcgnn73nouknS/QUNSYvjrW5BJ8GZJnVGf+P6n5v68Yi8sdAXwgFz/0RB7Fl5li9LMVhZxMOY93fZq8nOZhcRYPbQJMw2z29iX1Pul80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=RtYuTOg0; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752210337;
	bh=3oh5in2r62AyouZtKIXMctCWZh/poeIQVk5vGrzUFg4=;
	h=Date:From:To:Cc:Subject:From;
	b=RtYuTOg0b1VF/hJr11B41gwcGHE8GLLuCDr3XBReLSJbiNCScf07+wJV9m06W2mvM
	 XvQWJ/lKUJ3c204mgdyUFAsGl5jfjG9tEo7ZwpVHtWkf7PJBmsMpVIWFcVSdQt/NtE
	 b1HbrwS9IpL3i+dYKBZtdXBPhgkf8K4ZK7SIwx5ZPimQRU9hF8jOyMKzwrwGOEHQ6H
	 VSdVcHcyT9j9nb/+t3YOvb0WCbIxEjGngREXeoKcqZF7IbVEYB9vwkIfpTB3jnnJDo
	 WFhds9NBRZ7Lj6TLpMgTkFW7+hGd9N/TPy088TJmphZZ7w46Oy0RPQAWKh0ANV23Lo
	 YuzugYdQoIFsA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bdfmd1Pdhz4w2R;
	Fri, 11 Jul 2025 15:05:37 +1000 (AEST)
Date: Fri, 11 Jul 2025 15:06:55 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Paul E. McKenney" <paulmck@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the paulmck tree
Message-ID: <20250711150655.6e18b0dd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=IRNuBlTzpUnebDuH0kCuQP";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/=IRNuBlTzpUnebDuH0kCuQP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the mm-nonmm-unstable tree as different
commits (but the same patches):

  5c23ce0cb897 ("lib: Add stress test for ratelimit")
  5a5c5a3de1c7 ("lib: Make the ratelimit test more reliable")
  d19e9fa61f60 ("lib: Add trivial kunit test for ratelimit")

These are commits

  7074799065e7 ("lib: add stress test for ratelimit")
  5ec9048eae16 ("lib: make the ratelimit test more reliable")
  cf09bc65d491 ("lib: add trivial kunit test for ratelimit")

in the mm-nonmm-unstable tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/=IRNuBlTzpUnebDuH0kCuQP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhwm+8ACgkQAVBC80lX
0GxNnAgAls6ZIQtwoqEd+v+cB/c0yhDAEbuQjJB+/z0Kwl8E4ai4KBvjDG+L6bJ2
eIUAxDWxlM8dSVzUmqUcbl9j8JcMGF6Xx9j7K+4NteIqXA0DdLeB/h+OP5Ac+7Bt
ARGhsfxji6SdUfeLjF8N3oB/bHI0JlfYvkJHFkkHMPH2kW4R0eQscCXrhqpnsE52
EZ1aU7tnH8Z+jLjdA2dcqD0Ta6592T5Tjjs1NufYMzM/rxLwnVcFHBTumbfOkMmb
DAusLEcnu6c9m98cVO4mqRlPnAYuFitijyXyw1wr2CEyP7WQq3CXdP+NQRiR3W2+
jf8OBytnR+8mjkcXXFTpzjOj8EnLIQ==
=Ts2+
-----END PGP SIGNATURE-----

--Sig_/=IRNuBlTzpUnebDuH0kCuQP--

