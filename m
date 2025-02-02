Return-Path: <linux-next+bounces-5354-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A39A1A25094
	for <lists+linux-next@lfdr.de>; Mon,  3 Feb 2025 00:05:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D8AF3A3C46
	for <lists+linux-next@lfdr.de>; Sun,  2 Feb 2025 23:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EE2C1FDA90;
	Sun,  2 Feb 2025 23:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VKX1mUFf"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F23C1E511;
	Sun,  2 Feb 2025 23:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738537514; cv=none; b=KDG8U8RBss/btdRgf68QnGWDt1fZTo99A2DKolLn12/TozIG9lNclM63My6UoRlpjc8EfjVNFE/FrMBLmPucSk+biu/HHAqUMxNYqFr5z165xlIPKLmHtsqyGstNXysuNoSTTWWDFedyy+mbxhWU7byOrds8p2JMcTJkpARQMaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738537514; c=relaxed/simple;
	bh=gGvg1+y5u+eAuFyvkwvUnPFr4Zsa3TpNbkAhBxqxMnk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MuoySkKHABUQ1cvgOLTCYf7LLYJCtrSVGLGfiZ5mwWPF5znMpKa+htf+6BoGHTVMyKFS6EbVuTdrWIXOhlmGzxpKh7D0iLnWB74AG9/qeMRjTaj5k8kSI6MAo+gpjQRkfAWpgrLUTcNKgeuNaXbl1fUrg6GTzJoYASXOMaogf9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VKX1mUFf; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1738537489;
	bh=oIx2xK9gZy/u8ioQABUpJkTas9CX78kxEFyq225hwVo=;
	h=Date:From:To:Cc:Subject:From;
	b=VKX1mUFfb4FEl9gbtd/lKYpNFpy94aEowfRw0HyKPIUeqMBPikxDBsviIkhJBunw2
	 u2h9vBWlDU7Fp+0euJKY4f6DRmBz7KGwihCLXXn8j8VUffyYIsvjhhtaUvIlq5hCvc
	 vCx0/JhrZVSJpZSA/MdofHuDHfu1w9OdMxjJ26i/TUXUA76/gLAmoSw9jLl3cewm9A
	 /uMzunImdR1lXsDe2LlWDtFOoIQ5vutInWLjqFbJgxb3d0+OXWl3UNDw0SpVwpxlZ5
	 cz6X9Q4X4PIW+wKO95zGh4SpOro89ojRdEJgl8ciPtNZc6xipiPvEmf1v5CcFp72Xb
	 wCzZEeitTZsvA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YmQFD060rz4wcD;
	Mon,  3 Feb 2025 10:04:47 +1100 (AEDT)
Date: Mon, 3 Feb 2025 10:04:55 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Guenter Roeck <linux@roeck-us.net>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>
Subject: linux-next: manual merge of the i2c tree with Linus' tree
Message-ID: <20250203100455.638449d2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wcL0ifQxoMr3/M6kCF5YK_Y";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/wcL0ifQxoMr3/M6kCF5YK_Y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the i2c tree got a conflict in:

  drivers/i2c/i2c-core-base.c

between commit:

  6250ebe666e4 ("i2c: Fix core-managed per-client debugfs handling")

from Linus' tree and commit:

  83ae27d87cdc ("i2c: Fix core-managed per-client debugfs handling")

from the i2c tree.

I fixed it up (I used the latter version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/wcL0ifQxoMr3/M6kCF5YK_Y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmef+hcACgkQAVBC80lX
0GwTMgf/RF2VmlAg6T4hB1pN3jPlfMO6A1Ztr1Vd1bcwCRL2llkOIvt4ZuIQKeRs
B5r+69CQKHNlLDNeIGmi3MfnsKj4ilyMOzaXzugNcKnt/y0cg7SdCZCC5er/fCM5
PDJMihQD/Yu4hy/P1jg5bdDimYKKknoici5125FLWMyMAfnq5gRbxzIf9I5NId7p
Z+lO3vramBMGgOslr0Ql8gpfYleHFGR9HWiwtMMQjvc3Ecr/YE50EydzGjAWMm8e
ck5LuxgJFvVRRafaTv6IgmU7KDDiZOUa5tOg1Sw+67LWal6HxG6sS+vp+PSfNT18
ECfUkRjGIJj6JF4Eu8/nubsprVu+uw==
=SVlZ
-----END PGP SIGNATURE-----

--Sig_/wcL0ifQxoMr3/M6kCF5YK_Y--

