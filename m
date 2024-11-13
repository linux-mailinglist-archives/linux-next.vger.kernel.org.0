Return-Path: <linux-next+bounces-4779-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7599C7D89
	for <lists+linux-next@lfdr.de>; Wed, 13 Nov 2024 22:18:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BD944B2B7E2
	for <lists+linux-next@lfdr.de>; Wed, 13 Nov 2024 21:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E563207204;
	Wed, 13 Nov 2024 21:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="V2oFNlY4"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81B6207217;
	Wed, 13 Nov 2024 21:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731532402; cv=none; b=GYpodjlctQhxjrZSLcuz+HWxeLy4z09V5dqkv2hF9ZLJLxrvFW1i59sQR1/ZifMuFxju/wjuqB38yqoKKk7akBQE/89vEVxCq/qAenw3zoEDRRLT7pKfqLISs0NlN8HHxrCLZMhjmdRs1eWrJtEFvRUz9Oc1kUTM703qN86nBTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731532402; c=relaxed/simple;
	bh=idkSI0w6nKoHM0b1V/ejwpNP+VHT0mP1s/Az6uRS6vA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=HpdBpXuOdGzkbtc0q9U7WzD6fQOP0XlMtN6oIJud15ONosv1ou2tqRO6QNbv3eica7SqqjCnR3XUN9cLO4HLTxPe0ryc968aMjeM2rRFj/+fgx++SogqSHPk1c8lZjY2czMDRfHysgNO84/qL8k50ArtbYZxjC6rdav/B1fy42M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=V2oFNlY4; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1731532392;
	bh=YoeutCeqtyL1J9IpqI30I53OmtFMu0kpx93F6/ZZsh0=;
	h=Date:From:To:Cc:Subject:From;
	b=V2oFNlY4agQHTIoOF71nN4WLKIkrA1AT6AnzJopcPNz2zduZ2PScOJulqv4Q5yhv9
	 +l8dWwD59kfyJ7+kyR59QXxkNWeUKI+Uuvz+wvdpyu1ule4LAIt8pvcUUhwVbWN8KH
	 PabyQpetli0CyzjP31VYfCsyOGNhTBWNJ0MsMzEt3V5UdcimI2b5vKURhxymOpTEjo
	 o41j0153wWFbrr999VMuHxmfRDHryQUK5NyUeS0758Eg5n0Kjm+zGn+molprB8zBRT
	 8ZihQSXwFh56yKnUqTRnIQzvRNpW4x1gExPLdfuDgJs0JtMPmVc7WJEgTug4/EDQ/D
	 AH1Pt+K7RQIvg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xpbbq6PCmz4wc3;
	Thu, 14 Nov 2024 08:13:11 +1100 (AEDT)
Date: Thu, 14 Nov 2024 08:13:13 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Chinner <david@fromorbit.com>, Carlos Maiolino <cem@kernel.org>,
 "Darrick J. Wong" <djwong@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, <linux-xfs@vger.kernel.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the xfs tree
Message-ID: <20241114081313.3f0be96b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lu+ExA++mUnEtfPeSscuGus";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/lu+ExA++mUnEtfPeSscuGus
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  dcfc65befb76 ("xfs: clean up xfs_getfsmap_helper arguments")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/lu+ExA++mUnEtfPeSscuGus
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmc1FmkACgkQAVBC80lX
0GzbtQf/UDZElp+SaV0Y2ajpt7md8YdBsXeS1GVihgITJcNPd0amEDXULEbdER+7
iteogtyo6VeNLRolgrFGtwYuLs9L/SQS693dMzpAiL0FDeOoczYrPQjCMEFGp0CI
7Ov0Wv2nGMqXDTRHoTeHWS9DvtoIq7x3mqqW87ME8Dz17Y4nvrF3rON49jdJDEC6
hfYAMlMkv2YqEkay0AlzkVcd3FUk8x7iVwQI9l+rB3KAhgZBA1P8QnoaulRM3cVA
e8/kAoM8k9GdE0qL5opH5YBL1RxZO7eBhZhrWIKF0i+6/i7Ip6XetMIXORxXDgOb
iu5AtNPh7emO/6cIXFFhGIAUB12iww==
=TZOO
-----END PGP SIGNATURE-----

--Sig_/lu+ExA++mUnEtfPeSscuGus--

