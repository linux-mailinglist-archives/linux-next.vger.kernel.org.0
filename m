Return-Path: <linux-next+bounces-8185-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A64AB43234
	for <lists+linux-next@lfdr.de>; Thu,  4 Sep 2025 08:20:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E91F5188C69B
	for <lists+linux-next@lfdr.de>; Thu,  4 Sep 2025 06:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EC0825A65B;
	Thu,  4 Sep 2025 06:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="OLDNakxz"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E6225A357;
	Thu,  4 Sep 2025 06:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756966837; cv=none; b=KvYT+5o8FzinT9apLh0FkueaX3SV8dLdFomiCDNlU9RfpXDWoG2WayQmw2noRTBp7cAaJ8oQhjAg7vmhHI23yLfljKCAkdP7vsadVpQMGSFjd5jO3tD0irHsyVT/Ctf0L1ZBYijbX9479wYqPcxVPVKafI1V+6d4+63WEDJrclw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756966837; c=relaxed/simple;
	bh=TFskCd2sCXMGZZwuIdraNXnkFiaiP3yZCeJYWmNwYUY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dl3e5vlpZXVXq7RRqP94+1Fo+Ry5FZkzeyQEFNWo8ApDMjwccbO2EvV+1zPbaxk0y0f/g/8+tN6Nl/Ku9d43l845+rA4wx824yhwPMDYoh9Bxx23wrsURP2iI2+GttqDaTI0BuaRFAUNod1BFjnlW7u1c3x+vy1laIqhsLEe46w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=OLDNakxz; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1756966832;
	bh=ugJVMXeCsbqwSBnMaj8Nev6JALpfUFQHK+Yq+ydVikQ=;
	h=Date:From:To:Cc:Subject:From;
	b=OLDNakxzuGtmSFGQ+GmpGNDFMv9zxK8xi/cPWI5t5ugAqvIe+J/qbL7HOJplFQNvr
	 YGYPK0rOC9Y7zP3NAtZYPa33z7nZocqYO+L8NrlNtMj/NVP6SApn6glY8leB8Kh27K
	 ls/Tx4zfh27m4XyndPw/F6TPTW3cGwH7/Ifj0gjBcUhP5/JvpwOqtMjov52cSRWamC
	 Gp3gu7UowmBzISE6Tr05wxtPpYLHNaWW7ICR7de+TzLsPXJy8ItlriIntcr/lT3Cjz
	 XSzKa5JoQAvAB+TleMDx03dEffXeY4FJo2F3cA66W+IQ1e5IrRe2naHo6Ko8QTx4g1
	 /9ahWdjxxWgQQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cHTqg6MtMz4wB1;
	Thu,  4 Sep 2025 16:20:31 +1000 (AEST)
Date: Thu, 4 Sep 2025 16:20:30 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Vlastimil Babka <vbabka@suse.cz>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Qianfeng Rong <rongqianfeng@vivo.com>
Subject: linux-next: manual merge of the slab tree with the mm-unstable tree
Message-ID: <20250904162030.4b0b9d68@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ruyox2s.K8ZFEqvWR35pLAj";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Ruyox2s.K8ZFEqvWR35pLAj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the slab tree got a conflict in:

  lib/maple_tree.c

between commit:

  65d011b2bc05 ("maple_tree: remove redundant __GFP_NOWARN")

from the mm-unstable tree and commit:

  1094ea77b180 ("maple_tree: Prefilled sheaf conversion and testing")

from the slab tree.

I fixed it up (I used the latter version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/Ruyox2s.K8ZFEqvWR35pLAj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmi5L64ACgkQAVBC80lX
0GwmaAgApROpFaPs1Ac35KQprOWJAdUSsmhQD+i+lkHIzk4FtEq7Z1YCO+zNJA2j
6/cX5YFSqMqWxJhZsIHaRGI8m3PgmtXkhECegGAkqY8uTPUHxEVmrzs+wO7gP0Y2
VbKMPdA/5jxqJZRqJr+Tfj1+WxdIlMdSTFN/heMNWOTPc2mCdBFzc0/Q1neYyWzO
XtW0yJs3R3XaWudC3kKk/QBW8xcfpSZlA8AXla7PtyB3ff6YDxncvhEpAW6TLBPy
0g9z/sF1Ahs29zhz+WCv297LK2to1V22jRLsTZWYz2Q9O5W0MxOah8lEqKIMMjTV
vPh8M5hU9K4MZOOWlYp6kU+AJu2W5Q==
=tmeA
-----END PGP SIGNATURE-----

--Sig_/Ruyox2s.K8ZFEqvWR35pLAj--

