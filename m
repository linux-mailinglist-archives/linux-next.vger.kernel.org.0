Return-Path: <linux-next+bounces-5326-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 676F5A1CF99
	for <lists+linux-next@lfdr.de>; Mon, 27 Jan 2025 03:57:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C263A1658AB
	for <lists+linux-next@lfdr.de>; Mon, 27 Jan 2025 02:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C57661426C;
	Mon, 27 Jan 2025 02:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="tHxDwPAk"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4A73C17;
	Mon, 27 Jan 2025 02:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737946644; cv=none; b=jSszvrvaHv5EoEa1Si9f90qpqcg4Ta9cUrP55NbALi6TkS5nCDRXq9MhqsGbEx+n8oIL5R7hTOgiuKjA8btAILifp41QWV9ki+OHolrKHTUSj7Ll9nDqSVwtbV4RhYvd+DfHjwZKOKFgvNpnxVbhqIdbpzciW63PVR8jkgsnocI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737946644; c=relaxed/simple;
	bh=1pkG8yx0CUTFXBBYmJChKdvCLEMQPy8ehfCIax0H1N8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Kc75dGugV0eLiF/BsGU7tyhA/WMrZtwgfrkBncDoaHSPrNDFN005s5dhIXtnV8ueSoHBoxowoAAwKv0067PEr86f3V3vs1kKFIiCOgLXoikct4AS4Zkk7hMTpgApUrcuimqj4WJ6Y5Rv7Nuiedp4IbDqAJWI8x5TF+MqgxtmcZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=tHxDwPAk; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1737946630;
	bh=oh7jzSmsQDJzqrCC2soRTneSSG0lG6DGIKX1qOh1XpY=;
	h=Date:From:To:Cc:Subject:From;
	b=tHxDwPAk5hTLSd1tmtNgpwvhHTkqp7GbxzQ+xe6L+fLVXblYq/tOPRX7czOr5tfW+
	 9ptoMKBBmsO1dUCS2K95xTBEjVbTcGEp4QqZndl71cb25QxapYtTcc4AKqy0N6J0Jw
	 cJ1Xk/IpjfdZFGMs8Anp44WjFpXGNhnNYYSKjB7+HAEpurOZB64bV0qCImqQaQWlTS
	 RLL+2rLu+RLKtzYoSbpJpxwNE5/Q99yhTLl3dNiPe67/nXvhJElLfmPi0SLPPF3Xtp
	 h4OuQZQVT1y6FI3WrAt1Z//B/r6h3uIjSRjVSdcdCsBTWkZBN1gNgZzs/5bskhKXuI
	 elqXpsShm44pA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YhCkZ0FF0z4wc4;
	Mon, 27 Jan 2025 13:57:09 +1100 (AEDT)
Date: Mon, 27 Jan 2025 13:57:17 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Arnd Bergmann <arnd@arndb.de>, ARM
 <linux-arm-kernel@lists.infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: warning after fetching the arm-soc tree
Message-ID: <20250127135717.00817b0a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MwCwuNwhD+.CQldh/v9wnWZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/MwCwuNwhD+.CQldh/v9wnWZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After fetching the arm-soc tree, I get the following warning:

Commit

  1f8dba7e7b83 ("soc: document merges")

added this unexpected file:

  arch/arm/arm-soc-for-next-contents.txt.orig

Not a big issue.

--=20
Cheers,
Stephen Rothwell

--Sig_/MwCwuNwhD+.CQldh/v9wnWZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeW9g0ACgkQAVBC80lX
0GwfKQf/ah0aGwaTifNF/3NQgyATxLAzQarWXqvZA/G6vie+/FfYsdlQKaPGAsrS
d4hkMfzmI8tRgPHAGpEjPXccxZVOQRpHackBTVZBIQEIT3Oz8yoUVUs6oAVak/36
Jr9Br//9nmndpioaDLbwCiU4rxEXwJRukxW/6I2Aoy+qEML3G3iFKXZpt+YKpMY0
3ys840gBOGcP3BhbmjlklIw5FknN0Wh2WLQOQX5pcQfWGZua5LAb9Wn2N2ORm6M3
jXCI1eeLn52zjxAszO7MEhvwM+JK08i7WB0A/rjxNNO1Ci3SrZXmIeBJdWeJiP17
WBjJ2x38FJHJXkm+Q7VzG2WV3bPTaQ==
=jQEq
-----END PGP SIGNATURE-----

--Sig_/MwCwuNwhD+.CQldh/v9wnWZ--

