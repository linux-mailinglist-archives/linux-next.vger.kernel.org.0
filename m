Return-Path: <linux-next+bounces-5019-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 089B0A01B72
	for <lists+linux-next@lfdr.de>; Sun,  5 Jan 2025 20:33:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 509F91883695
	for <lists+linux-next@lfdr.de>; Sun,  5 Jan 2025 19:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EA2114A4FB;
	Sun,  5 Jan 2025 19:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="JPHiHfcP"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046E01448C7;
	Sun,  5 Jan 2025 19:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736105602; cv=none; b=U3bY2BfIBNUQ089KqXTeVRS2ok1I2HDy4Ipv+OZ0AdujR/DD7n6kaVcc5JEU5i9GI9nbbvzVRp7YavfagVB/51hiFkmbtNJ8JrlDvHb8NfGCiqzqiIaff1oRZurtMqufWM6RFyFHLCHPRUkx/rNfGvWAggcELiQwUN51E9VUHdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736105602; c=relaxed/simple;
	bh=prso5FcxBYERSV6mhm2FH/K7iFdxl/Klj4Y4X1VTiGw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=W7I7VQnsXsKcPqunC2wPM8cM2vZGQJMH1w8B899enZ8N7NvkHWeHNbs4NX9QVWdtEcu8kEsvlX6NId7GgiqUAjbGfPo7WaQiYjjvXk0kvjtsU4UwzWUgPU2VQgdi9J1vJHkSpqDLqUFr8AomaRgb3ocQUnGaChH/W7nkQXPFNeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=JPHiHfcP; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736105588;
	bh=WGcx66a3BMB4VVYlGzswpUaCUK44vOu5GNbROJDmBTw=;
	h=Date:From:To:Cc:Subject:From;
	b=JPHiHfcP8H4xWtq12Pjx94Wpx/eP354zSHWyC+QQ8w/puzcOVFhQJ0lVuMAGdijQq
	 SdfjNPMGGT746cghqDsYDXlKZ1UmXZpyBqIBuqlzPSfkaBrF8h/RsnoZ68D5NVm5WC
	 3lDzZQhhtQsU96jmYsJKJ3q1l4MAuPF2+4I0YJT8Q27NckLyCKcVdG/aGwBz6U7f9o
	 xfJ9i5mY78XiVm4STYdX6aj2XezQGyYKOJ12zZKq44z5Ewe5MS4OxGaUD+gex7PdoL
	 mxxTSm5OuZDFCHuLj3qDwtbYQll5SC4g/VB4A1TvbyKWtIVZHkZiDkVjCNQOYszEDj
	 Z92nGeNa15FYg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YR6sw19SHz4wxx;
	Mon,  6 Jan 2025 06:33:07 +1100 (AEDT)
Date: Mon, 6 Jan 2025 06:33:13 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the ftrace-fixes tree
Message-ID: <20250106063313.0e7fbc75@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bbVrmOY2NlpzhVp+opuwEaw";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/bbVrmOY2NlpzhVp+opuwEaw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  ab9d98250259 ("ftrace: Fix function profiler's filtering functionality")
  e99b3d0cb6cd ("fgraph: Add READ_ONCE() when accessing fgraph_array[]")

These are commits

  789a8cff8d2d ("ftrace: Fix function profiler's filtering functionality")
  d65474033740 ("fgraph: Add READ_ONCE() when accessing fgraph_array[]")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/bbVrmOY2NlpzhVp+opuwEaw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd63nkACgkQAVBC80lX
0Gzirwf+Nl4NdM30P+pGIlCu9haJhO3gTpnTjqRetCG7JlWWTVfeA/rrMav02brJ
407jLr7+uns8Gn0z5sgXaBi/IOb0KYnEAKqgX8ARc8iyny+peoPXyP946t0a7Soa
Kez5cwhZr6tOn/JWMxOCxEvvsLPDhas/BE1gdpM0p8JAvBCTHU7VGLetGVQG/Sqn
6WLp+xbhFUXI6yIKgkA7lKjJyEEeqS1aKEJVCzvcjHzCYJAGjXeDWe01Bzhe/3Q8
R5VK1CAecCfzCmNTh9uvZ5V2zWWnXZzAdBhpLSopOBpU4chXrzCbAxZP2+JhYffE
uN4MmHqwUh+EtQc3sGo1+rvVN5IwDA==
=EQMu
-----END PGP SIGNATURE-----

--Sig_/bbVrmOY2NlpzhVp+opuwEaw--

