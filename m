Return-Path: <linux-next+bounces-6038-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1440AA72A56
	for <lists+linux-next@lfdr.de>; Thu, 27 Mar 2025 08:02:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8FEE1768B1
	for <lists+linux-next@lfdr.de>; Thu, 27 Mar 2025 07:02:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C221014EC62;
	Thu, 27 Mar 2025 07:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ICN7wira"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D3315AF6;
	Thu, 27 Mar 2025 07:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743058918; cv=none; b=aX3nbVJFvpKnY/V7/FN3oa1ehLoSyJCOkreaCZ7sdxr4CTBr+qZXHGf5iN1SXzfoMNqVUp5E/mtO4jYFOhjs+24LIR975/er/B5BZDz6lsc7x2w5j+x7W8+6/XDl7LDUKyepRZMVFBa6fB7aV1+cN7DX3MbBqWgI23Mst/qmSqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743058918; c=relaxed/simple;
	bh=uM2CEGNM27h3dBkb5OTn3I+jyS7qg2Tp0GRk5E9s++A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ASa5w6bocazgb8d+m9bDQ+/syDHfm5fcScM/SiQIq3slbKqlJ4ElCsBqY0VvhRT1W3hDTuPLWRBdmm4MSqfrK4DzUY87y/npmDz07qHNSvoFj7NwqXpguS4YFgG9JYsU7Q9GFnZDlIfPw4d6Sx8LHz3KX415KZoqrBJ9A5cJ9ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ICN7wira; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1743058913;
	bh=UCIWTAwXMlpUeBf1oudYMiXg6Kha1Ct6VaWigN9NTIA=;
	h=Date:From:To:Cc:Subject:From;
	b=ICN7wiracIqSHzS4xHFup4JwOjNa5Bm8pq40hoIJT/nqdvDkV9xpQun6Dc3sCaNzZ
	 0XZDb09poa8EU/w+3fkEfcK1nAjwriNkIyB5IvtPwChactFu+SRS8JEmKwoiQiKb0b
	 dSxp15l0bWDMnAh5Zu5h0laJFFSVdiiGdSfPvKmXIzDCHOw88u4t9kvReR4Y537tei
	 I7QeNmtfBR1Z7az+htzggyzF24whwYHxiILmYEv8fFLOMDqW232TZ8VszQeWpLlp94
	 jklIp0N9yW8rxvGk3pTV/0TZz9qqG/HZLGzmuxCQUDV8grRPlbdJVxr++zlceAtqfz
	 KqXnLCFf/4v5g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZNZMj1h2zz4x8P;
	Thu, 27 Mar 2025 18:01:52 +1100 (AEDT)
Date: Thu, 27 Mar 2025 18:01:52 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>
Cc: Gabriele Monaco <gmonaco@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the ftrace tree
Message-ID: <20250327180152.260be33b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Oe.TjX=S2cBLd9H/lcg=EiX";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Oe.TjX=S2cBLd9H/lcg=EiX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the ftrace tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/tools/rv/rv-mon-sched.rst: WARNING: document isn't included i=
n any toctree
Documentation/trace/rv/monitor_sched.rst: WARNING: document isn't included =
in any toctree

Introduced by commit

  03abeaa63c08 ("Documentation/rv: Add docs for the sched monitors")

--=20
Cheers,
Stephen Rothwell

--Sig_/Oe.TjX=S2cBLd9H/lcg=EiX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfk9+AACgkQAVBC80lX
0GyU6wf/aX1Cfq0IGAwAeda2QKBPASN9ukfzBDO/0/w8EQHiJKSprylTYcTbNO3y
yogz746yxFqFymjnkkCvxbwJ/9KU0tiDSOqGgBV22hJ59Btju+Md3bwHJH9Sn0TE
38MxBEbmZdt7SuzC0LZqjcIGJwz+5E3TAV5qaH6xJMABp6JhADdaEjnC/lnx2JdV
mNHZ2FwuAdY3+BGvV/Kw0g33GjKmqo8abRaFZ/FjtehDeAJJU3QaAzDtHQvTHER2
4XuPjMI6e9TtgRRuCUbZld6C0vDQ8Yb7px2Zd27kq0+FmZZUmG2hVbu5XRm47w2Y
MzMwg4Nw1IzKyglrN7qUpm/9H6XRjg==
=uxuL
-----END PGP SIGNATURE-----

--Sig_/Oe.TjX=S2cBLd9H/lcg=EiX--

