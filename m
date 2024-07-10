Return-Path: <linux-next+bounces-2925-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D049A92CCD3
	for <lists+linux-next@lfdr.de>; Wed, 10 Jul 2024 10:23:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2EA0D2819F1
	for <lists+linux-next@lfdr.de>; Wed, 10 Jul 2024 08:23:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D2858526A;
	Wed, 10 Jul 2024 08:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="MOZwAAEX"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C961BD535;
	Wed, 10 Jul 2024 08:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720599786; cv=none; b=OMOfH1ZpX2kLs8bS6b+Abii4Js7w0TiSqSSjYEWHaMbh28DDpUA4qy5dgu8f60EtoAksIDwrvQB2DDTAhHTg9yAszyaTObO9BBYrEl9FCWb9HyaOe/A9fF+AOwSSLwSg6/5Db+m+rCWop47/ujyi1pIQ1IVD/fp04pohW1jlk18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720599786; c=relaxed/simple;
	bh=a+SdLn0AdX5kzkREvLfIiGf4N+CAn38CS4KAjX0P6i8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=kNQrhCGDP8bS4WMBrrmnjPV29kS4Og9EmC9gF+c9RhKdDLingB8cruz/mrRFDLxa1uHyndrYwyj84AZ3QEpXXn03jdmdjrhbszWLF3jNCjti7KL3LCWryuyxT/PCjPU0orPnbPyZLHhZGcIidNnCyuiMLhjTw3COIwKHcHyAuwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=MOZwAAEX; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720599773;
	bh=ogoArgW/ndq45wvozPK1FxmEuUKiWxqco2rTFd+Ussg=;
	h=Date:From:To:Cc:Subject:From;
	b=MOZwAAEXA8duVIA9b3aqnwgkjR20LFqrWZ+KQ1hJM1OW6M3G8wpelKovVIH5+Fq4y
	 iitm+85wLKrU2NkHD3PI2ujJWWWBdOCPq//EoNkDIt8EjFXNrgCLCT5nvolhMBYdrt
	 oslqkPFas63T/gUyL27DOWim2FuEqNB/kmnMUCbr5EFzpEEU4ZkpEO6iHGED5nIQOX
	 45fhN7QJLu+LHE3l8L1MtQr0PQlMlDuKffFfeMmqivQBujSRdD3+SEPqhIDScNkx2q
	 68pgPSl/a6gD+99LWCcryRYs7wCQxqvNdjr2kVkg0U2Spy72pFZtlK5Yoq9eFJ5y35
	 9v2/KQIYQozwQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WJrT85zf3z4w2F;
	Wed, 10 Jul 2024 18:22:52 +1000 (AEST)
Date: Wed, 10 Jul 2024 18:22:52 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Theodore Ts'o <tytso@mit.edu>
Cc: Jan Kara <jack@suse.cz>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the ext4 tree
Message-ID: <20240710182252.4c281445@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.Uoj9Y1oARnVP=oisOvXYic";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/.Uoj9Y1oARnVP=oisOvXYic
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the ext4 tree, today's linux-next build (htmldocs) produced
this warning:

/home/sfr/next/next/include/linux/jbd2.h:1303: warning: Function parameter =
or struct member 'j_transaction_overhead_buffers' not described in 'journal=
_s'
/home/sfr/next/next/include/linux/jbd2.h:1303: warning: Excess struct membe=
r 'j_transaction_overhead' description in 'journal_s'

Introduced by commit

  e3a00a23781c ("jbd2: precompute number of transaction descriptor blocks")

--=20
Cheers,
Stephen Rothwell

--Sig_/.Uoj9Y1oARnVP=oisOvXYic
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaORNwACgkQAVBC80lX
0GwZnAgAhOQzfQx2EqKIWj9j2FBhHBjfJxKSLWSgOM3qJ7NVeTU/LTcT5RQPqmcq
30pOXC/3Faq7Iu9ZbQVjJwTiD4oYtCCx9JeO65XC1zOBrGIwtowpYcUY2Dd+HCbM
0mH0/4PLgknYrKxLQYkxam2U3AbpdUH4d+P6T6CgX1DO8323JAK/AFhj76cuPntO
j5BFR+qvSTQf3qwToliFZc96QTIZQrEnknAQWyp07J+rih18LJIvT1IjZ9YkCqRG
XnOJckDHmLxu6oY6JdVB4+8wbd8PQE9THo8APdoj/Iw7ZILEh5rVcUuSE4TcMSqj
wkYunKXnIQOLbmlfbUkp6lq4y6sn9g==
=X85O
-----END PGP SIGNATURE-----

--Sig_/.Uoj9Y1oARnVP=oisOvXYic--

