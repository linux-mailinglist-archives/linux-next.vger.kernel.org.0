Return-Path: <linux-next+bounces-7214-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBE0AE5A19
	for <lists+linux-next@lfdr.de>; Tue, 24 Jun 2025 04:30:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6745442EB1
	for <lists+linux-next@lfdr.de>; Tue, 24 Jun 2025 02:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D98023774;
	Tue, 24 Jun 2025 02:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="dnMALn5A"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC2B8F49;
	Tue, 24 Jun 2025 02:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750732254; cv=none; b=p+x31vlYP7Do34WTaVVS8US/5H3uETf8seC5+0plVekq65bcmB/v8tWJFmhbd/NhKeUBo3I0w+zwD+e2wYcsUzmHNZf5Dj5YwI5tOWxuT9nbwn84J+KuHl5BWZ8HyhpiAl1XvSlh/Rkxca2wIqtlag4Bfg9WlGNjzb23yc348eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750732254; c=relaxed/simple;
	bh=9E2gQ5sa8g7l81o15SKktLJuLXWPfdMuDWu1jZ5mjPo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=NfecA9//b2SRpf+DPygaJDcxl+hjfrnbizrn7EUKEnglN1onhI/kqjHBpQkS8SOK/jnr1/CXDn/EOh/sCeb0RGWFSw9G8PeQ1MKZ5EBJe/6bZmEzaBWO2W215ArPk5i5SQjDGTJyp7rSoTCVmbO+rA3ldAgYZK1YMdXhAhai9u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=dnMALn5A; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1750732247;
	bh=kdbGqSbXqZPdoxJW8W7QGA97CrMsEGr9Cm9br2QntbA=;
	h=Date:From:To:Cc:Subject:From;
	b=dnMALn5AE7PuQVlDaCOTPcDR5+dUSF78JG8dsPq6eoq38jQKtLyXyQpA6HhA3qWv8
	 Hz3PUMoLe8JOC/1RuKlG/mjazu/p5Rvo8lyA02DrNLepUMchU7LPTO2SFrCycNQ1FT
	 6k83mUeOCg/6d+gawIcpuXIy5Cvzp/sMSVGTSL1ZZo6xhtH5zuCLfGRWZq0YhOhRU5
	 Wuvzw6OuczfCH6VSzCwSymsz9+AJ4Oc1xsKDuRYoujnA9PoD6WK/YFxw8vO7WbMK01
	 VcGR404HJt6H1UweIi6aTnrkJySkR9s1rj8wgNK2XHI+wkOh0QwaBmeqKB25kz6B3W
	 oUpF4VSa/lGAw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bR87q0YhMz4wvb;
	Tue, 24 Jun 2025 12:30:46 +1000 (AEST)
Date: Tue, 24 Jun 2025 12:30:45 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the net-next tree
Message-ID: <20250624123045.33bc18fa@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/H1eaIiFXTUT=RX5Yn8r.rGq";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/H1eaIiFXTUT=RX5Yn8r.rGq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the mm-nonmm-unstable tree as a different
commit (but the same patch):

  7df6c0245595 ("lib: test_objagg: split test_hints_case() into two functio=
ns")

This is commit

  8c8f1e89eb88 ("lib: test_objagg: split test_hints_case() into two functio=
ns")

in the mm-nonmm-unstable tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/H1eaIiFXTUT=RX5Yn8r.rGq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhaDdUACgkQAVBC80lX
0GzFGAf+JslM3X74yKGwwv5s0AjJuRGSSZ91ublIX+00AcdHCu1QkufvGusdPTM3
9Z0n49ksJKrn/K08tPdMcrHrYkcqBAIhTtbgvm1iUiGIe2MfXffFbIsQJfGyc3u+
3QruSuFRCA7S1HvAL+aJuL74QbksphA1BYwsHf+nDStkd/5rn1hQBm8Yt7p4DFDk
0aB2OYOnufWmOdC9plclofJLJClpo+MG5eXr7MI5iSBt9VdxMMjQhpEDJrpXzujn
VFrONTIzFITq5bYAg10MjDiqVHZNX4it3porWOLD/Dk3xV6eihj4UzUtOFaO+HRF
7+4CIVUXGLBd0a81McIEwW1nhKnKXg==
=TCz4
-----END PGP SIGNATURE-----

--Sig_/H1eaIiFXTUT=RX5Yn8r.rGq--

