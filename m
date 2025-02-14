Return-Path: <linux-next+bounces-5451-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EBDA35AFB
	for <lists+linux-next@lfdr.de>; Fri, 14 Feb 2025 10:58:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6ADCF1892E09
	for <lists+linux-next@lfdr.de>; Fri, 14 Feb 2025 09:58:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FD2924CEF1;
	Fri, 14 Feb 2025 09:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="BNpZJ+0/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD5F21D583;
	Fri, 14 Feb 2025 09:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739527075; cv=none; b=KvnKTPtQlvNNTwIpcJ30gflDKOsPml2DbX+E3Temgooagfk1X5vpoqLRnMdlu0UezZxtXpS4qwfIg98/hvKD96CJlR2YDe9Ego2/sfnRq2ykz6KjPF7I5kB8uSH/ts5NDylQOUdChNevZjxi7LQiyzAgeu+2a4YyPg1/cOmH1oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739527075; c=relaxed/simple;
	bh=lg5PJMZgDXBJsHXG2leEhfTCxQ3AwRGBAyiq5iYMp8w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=OcFh/aS6qLQClQ5V6nTxOUxRLYpdfXq8OyE76XOTwZOCglCDVck3IknWDcAuIgDwpcqKA2zr8SzKWlgT8vx0iZNAfWCHH3ly9FTwX5HmZuKWZT26sNcQ/iy3+03lczXmHnR7EycHFljDbUpc6jLgjECEl7yeoT95g3QRnrbqgzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=BNpZJ+0/; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1739527067;
	bh=2EFx2eR+q14F87f3v84BNZqBD5bxUeUxRN0LEoo9+Cg=;
	h=Date:From:To:Cc:Subject:From;
	b=BNpZJ+0/eZpuafLjhQiszt9oCbz0kdZOZ8kzWq2frsW/+DHFASIwbfHweB9iMa9kJ
	 lGyA7ixd5w4Xnq3wzTmMmMsuBv8N3eC0QsiqIAIP2L/MHShrHUpEEbmwFRI1xKchXL
	 hyg+aPXQoxk5bPCAmj1pKzvdE0AAk9/aW86cOhnrSY6dCH6ENlOhTgXE1qd/eeKMbP
	 Cih6CdiEns5iKJHrEnVXR/yLB78wybx/wjneQPjDbRrMpfrg1ucA64EDPjGlAbbhQ8
	 p8EkmXZ8olJAefb1IcZaLqXA6dheFQoiwLV0y1ynbpDgiJGokHgjjGB+j0JmM9x1O9
	 Yzxke7xncfG6A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YvSCb68F6z4x0t;
	Fri, 14 Feb 2025 20:57:47 +1100 (AEDT)
Date: Fri, 14 Feb 2025 20:57:47 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Usama Arif <usamaarif642@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the mm tree
Message-ID: <20250214205747.62afc7b4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qx2y_o_ojaXK_m8UuyTYcQ2";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/qx2y_o_ojaXK_m8UuyTYcQ2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm tree, today's linux-next build (htmldocs) produced
this warning:

include/linux/damon.h:394: warning: Function parameter or struct member 'sz=
_range' not described in 'damos_filter'

Introduced by commit

  7d745211df6c ("mm/damon: introduce DAMOS filter type hugepage_size")

--=20
Cheers,
Stephen Rothwell

--Sig_/qx2y_o_ojaXK_m8UuyTYcQ2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmevE5sACgkQAVBC80lX
0GzsIwf9EvNiNaR7tyPp5Jf72FmHrwmI4VfdsRsF7c6J1H887WUqnq2FxGptjmNy
MIZY2oWdw6z9RPnBnbecl/xVR5TBAH54jB5p9rNwVAoDufR546Thk5amH7ofSGEg
YM8fBqmNMOkPs7qzLod8BzwluXRBzatQ9UdYsz4pz02XrLDQQIkdZ+WcEzPpu3sU
16QCy0dIjhwB8AkdODQnKqAFnwZzxbeRxN8V5/5OdrLdiP7oNA7oBleDbO28XJzt
2+jdTsnbqo0FNqohSNIrs57PKnMy26jV8wmNr4w0nfvpdcu4Drbz+cyaiRAuo8ct
q0rhW4InuwjW68aH9hd/8OJXPn5IRQ==
=ekwP
-----END PGP SIGNATURE-----

--Sig_/qx2y_o_ojaXK_m8UuyTYcQ2--

