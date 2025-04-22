Return-Path: <linux-next+bounces-6308-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F87DA95E20
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 08:27:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 652783B674E
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 06:27:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D82AE220683;
	Tue, 22 Apr 2025 06:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Ht64uCXm"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BEA20E022;
	Tue, 22 Apr 2025 06:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745303259; cv=none; b=KRTM3b1BTKVZp3tMDPzT3wXeSRN3vOkw04pnKpOmAa0gWmZykZXco2QH5AP6jWgmUcDerTHJV522wpmpO1Ru7jD1IIxoMYw3KUL7xbO3faspD34df74hueehR1sQHAC89K/WHSx26aLv3K4jKijSi+7/xH9q/PLO4IdVhxKO/b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745303259; c=relaxed/simple;
	bh=J971MFlMG8cE20fQ7mW9nWhheuVP2D/JqVjl1UKI23c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pEnhixIgfW7SjvAPuOSOy4z+AaQmUL/A2zojDNDV/rQe9CdBSusYRPMR0jr80PcbqAk+ATBuG3O4/63UumCeKPPYFGa+Xehr9/L9ADDqJh3xG5Khin2FUDt9LWe2KHfgsgDXF82wyUqnN5eC/lOMR3aAG+Ra2flI7arD342fGX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Ht64uCXm; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745303254;
	bh=AeI6VNX6/tapPhXwbxOzLL+4Sz7nX6NAMD5Wvvgsuhk=;
	h=Date:From:To:Cc:Subject:From;
	b=Ht64uCXmXvN4o3N2wU80kS4rOgN3w7qO+CkGvyhCdMXseODsrroqUtf3CQu1T3DnX
	 DEEtmHlg35oUzz69ejsgyj9w23zWhwpziMg54Iwi5ISjzjzC46pdllN6iWXlDUOCq4
	 AJBewKOJ8vwRt3PTGKqJ0dLIQgegDkNBQ3y+RxwcWPvkDfycFpYkUdHi1WjRX60kPK
	 XPVNJMuOOnQxD1ncQrZcpNQOyLGVc9EWmKK7S+tvm2WX/OO22uIhxZXkBqHLFOj8mt
	 ZYQSRnCwOBt4V9edZ+C9zpPDYFGwe596tt073O9TQR94zvaS1/Mhs3canIUgLJyxEk
	 /006dD26/m6fw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZhXN65T0Bz4wcy;
	Tue, 22 Apr 2025 16:27:34 +1000 (AEST)
Date: Tue, 22 Apr 2025 16:27:33 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Linux Crypto List <linux-crypto@vger.kernel.org>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the crypto tree
Message-ID: <20250422162733.4793e537@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4oELhuUpE+i02aAvM9a+JK=";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/4oELhuUpE+i02aAvM9a+JK=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the crypto-current tree as a different
commit (but the same patch):

  5976fe19e240 ("Revert "crypto: testmgr - Add multibuffer acomp testing"")

This is commit

  aece1cf14674 ("Revert "crypto: testmgr - Add multibuffer acomp testing"")

in the crypto-current tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/4oELhuUpE+i02aAvM9a+JK=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgHNtYACgkQAVBC80lX
0GwT/wgAgB78RcY7M9lF7FJfHiDi+n4M3VRhTKiij0zxgLmGl7OeEXf12HZfmLoS
U5omYDK2Bpfq/IvajGmhgmJ4b2OoAXoTo0I9xVwCd8duaULb4RNQvG7v+3JxzfE1
tmuZSenVADbMdwn6GOFpVk92dtY8s2J0uumviwmlE760J5hiG0GInUiKSCKjroZY
AEUcIAwez44VeDfMIDePuR1zDILuQs78R/aMtTnobqeISi/NMQGEiJyIaFP0OXwG
bZi7hmcQPNmHOc8Q8T0jWNLtPW/Wlf1cd8vVvv/+uSpRkjXhWTpIY+mBoYE5GRXo
VADOc0OjpPJAeBuTW6yRmfTZwqOdpQ==
=UCGi
-----END PGP SIGNATURE-----

--Sig_/4oELhuUpE+i02aAvM9a+JK=--

