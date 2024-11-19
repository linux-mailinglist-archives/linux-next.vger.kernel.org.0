Return-Path: <linux-next+bounces-4808-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8989D2062
	for <lists+linux-next@lfdr.de>; Tue, 19 Nov 2024 07:40:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9ED98B21A8F
	for <lists+linux-next@lfdr.de>; Tue, 19 Nov 2024 06:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BE7535280;
	Tue, 19 Nov 2024 06:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="QRuMGxgg"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B09211C;
	Tue, 19 Nov 2024 06:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731998429; cv=none; b=TJ4Nx3WHWl0RkndZDp5trPvG4qllPAc0+KJGwyBHzwNYZfkKDbBiCP7lhkedfMLwp9hA3aIasmPQe+4QneOk0B+gxX5AZLxSaqmQdXC0qSp1QVYm7uvcTVwbaZUJ4JKtp0xZPVKbFdiUJNvs25x6WOnqp/qMcq/hfKFRZkyuBbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731998429; c=relaxed/simple;
	bh=kcuViE7XTY7h3zm83+JmdgJxlFokIkEoZ8VEC8xhtSo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=AvT54bv56woIvXeYnNWz5rub4GvsSs+Y1eJUXo8/yi7nObquvukbcpR39hBOiwF3WgxvKg+P+cxdZa9YqFd8f5myxi5zSO5r/diQKbQMb6+rxmhfU3N+6Ly05xH822YK91kkT2BoNF5mH5LzFjO8qa0u2UJ+o8FtSDZri1FgsqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=QRuMGxgg; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1731998420;
	bh=yXjP0ScQgmyPH7l6UGCRWd2YZV0gxDOKjSNaRBidR3g=;
	h=Date:From:To:Cc:Subject:From;
	b=QRuMGxggQ2WCSmO0XCB8biKHluqA1enAkiLj6oK2AeLNrKt/6mvIyQooQ0vrdvzzk
	 rHgO993vsLCuOkM1KogoS5Prry5xskbLgN5vcG3I+SjnUnWUZWDHrUhA9Mlfs7F/+2
	 5DpxihK2CT9HKcpqSvckDKi7p09gjkpaMTRk3B8isaa5yFcxtaYrM2ZrkcjaXmZwiZ
	 KYIp1F9henhAA2zpCKypm9Z4ebI6aOj2HRfQEF2T8jag1tomMaOFXrO/wbhgwk+ZmZ
	 DFjnVHq1rLjXjFJoCnaqEWzudycV5vPuvfCHAeORIakm3BrsiXmwyXQJD016ds9t5C
	 Yqhdy5491gVzA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xsvxw3GPJz4wcn;
	Tue, 19 Nov 2024 17:40:20 +1100 (AEDT)
Date: Tue, 19 Nov 2024 17:40:22 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>
Cc: Tomas Glozar <tglozar@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the ftrace tree
Message-ID: <20241119174022.23e0ba36@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DH.nyemlbXtex9u0v8+BnDB";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/DH.nyemlbXtex9u0v8+BnDB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  859dc5e29cae ("rtla/timerlat: Do not set params->user_workload with -U")

Fixes tag

  Fixes: fb9e90a67ee9 ("rtla/timerlat: Make user-space threads

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

Please do not split Fixes tags over more than one line.

--=20
Cheers,
Stephen Rothwell

--Sig_/DH.nyemlbXtex9u0v8+BnDB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmc8MtYACgkQAVBC80lX
0GxOdQf/RS8TSF5v434wovR4JtEvIbc0W2aAd4ClN0nX57Raxua69IhobTZXYWfv
4RRIFmTDFWUjo8xCbumJy2p8otlCnucK5Yoiht+dINcI/cMSFhCkZanaA/943ied
ATTF3tmFXsSwtUIvxYgHO86YQPUOo5GVkj02ksrH7uDeF9zPZTMKz1Lx2wDSktQ1
b7dio/z0HcNs75tNdqhd4WHVhvCXBbfydnoP7T8+M5vwMPQkQ7QP9mp3fEH0S6mX
gRetEHBRnrrzdG0KAJRuH1xjWU3QM0EUKO+kpdhtdJN+pAFwpy1/8rqQtqf6ZpcW
ZLnCdvstighcABhBQ0XME8Gh4B2Pdg==
=XQzY
-----END PGP SIGNATURE-----

--Sig_/DH.nyemlbXtex9u0v8+BnDB--

