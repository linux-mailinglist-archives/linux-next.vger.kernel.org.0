Return-Path: <linux-next+bounces-7603-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F9EB086FC
	for <lists+linux-next@lfdr.de>; Thu, 17 Jul 2025 09:37:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 657EC1A675E4
	for <lists+linux-next@lfdr.de>; Thu, 17 Jul 2025 07:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 299D8213E66;
	Thu, 17 Jul 2025 07:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="jUWlAsLn"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D36125A2BB;
	Thu, 17 Jul 2025 07:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752737643; cv=none; b=sUiZfxvtVj3lrZqzTGs7MuURdC3Iri5v5XSE0JLKpv34tmr8VFuvKYM87ki0LZp0VJCjF5ZjE96II75UCW9+kSwKtTSGReNI9vuGcLX7m4XtXIwu52EuPpUQxHlPe7MRh+MBBUdKeoMRMcNm9OPK6zQt+GLLcwqZCcUW2hK/Eik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752737643; c=relaxed/simple;
	bh=C2Knpz1pSYA/0fdoCiWIrnVynajJXoKZPw4peh90VKc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Dk0CzKrdgLGNheTMNgnCfPHD7cr7a7xv6PDXJnj2sCbFGk0iblvKBSMjA8J2BM7VtXXPJu+JHRZnQXCOqKkb+U+UqENZ8He6kSRnFdOFY8TV/89okBI75pY7II+bIWYSrOiBJ/7ZUuHtEB6dozGQa/dapvXcwfM+XcPH1chQ8OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=jUWlAsLn; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752737513;
	bh=BPUYIamb6N7FX3qyzOaoxS+iIm/KUzVAZDKzhZz1N3E=;
	h=Date:From:To:Cc:Subject:From;
	b=jUWlAsLnYgAg2mmFSxqgZU3yPwbYvufAic2dfzJ3ydyEWlcztzmFiXjpqUXAOoR/i
	 j/bcQD1I6sgIU8mtV0YGmr45msyOgsgZNRgHrKEfEmDD1sh86zlP+TJ0wiNGdF9QZ5
	 beOPUAjuszdzKqPeuy+hazRfFTAWBpDYx1mZrsbqe90HxG0b7GCuMTGwQbAU5cJ7RB
	 3hHKu66jVau3HaGxrlzJB+MvcK0LQgEh8dn1/T++Cnuki6sGjHtCjAf0yC9lV+xKlM
	 VNWL+rYU5IhvBxVYifqWgsvdMpqXUFGQuKqq2U/+UPn5y5jj5o9j1UUXEl1NZs86js
	 FzUYaxX7Gdy/Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bjPkd0RbBz4wbn;
	Thu, 17 Jul 2025 17:31:53 +1000 (AEST)
Date: Thu, 17 Jul 2025 17:33:54 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Dave Jiang <dave.jiang@intel.com>, Peter Zijlstra
 <peterz@infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the cxl tree
Message-ID: <20250717173354.34375751@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/V+RjaJJcObUoSjmH.Au8cDu";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/V+RjaJJcObUoSjmH.Au8cDu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the cxl tree, today's linux-next build (htmldocs) produced
this warning:

Documentation/core-api/cleanup:7: include/linux/cleanup.h:73: ERROR: Unexpe=
cted indentation. [docutils]
Documentation/core-api/cleanup:7: include/linux/cleanup.h:74: WARNING: Bloc=
k quote ends without a blank line; unexpected unindent. [docutils]

Introduced by commit

  857d18f23ab1 ("cleanup: Introduce ACQUIRE() and ACQUIRE_ERR() for conditi=
onal locks")

--=20
Cheers,
Stephen Rothwell

--Sig_/V+RjaJJcObUoSjmH.Au8cDu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh4p2IACgkQAVBC80lX
0Gxzpgf+OCNq4MJvZg2yrnp7s0Ne/mJEDRQ57S/IWZ/l3xZw6UvCOJouXgX4MVD5
W6K5+vOp+b6evyE2GixGfUWaRokzmeGqmJE3nBVntSEeCmyt4QNgKZWYLxfw6x8l
2c6WMvyZWF8f16mykEAZ2KFF/0gIaq+f0O/ez62pjfV1HapnF8BGd5SA3cUipg4N
fjF1whxXmvSTYzMULomUOj3ctLGLnOdYiIDc2WcZ24PvqV0N4FMaz2J5f59lL+Mn
M9ZHPAkwB3N3K6y82MExXpyfpEYR1VywlSO96Ad5B1mj0t5bCZpc865ZKmFzFzqw
6AmtD2afim1KRd9/hJrYOMxUPRBi2Q==
=82L3
-----END PGP SIGNATURE-----

--Sig_/V+RjaJJcObUoSjmH.Au8cDu--

