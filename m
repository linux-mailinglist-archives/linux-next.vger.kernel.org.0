Return-Path: <linux-next+bounces-3358-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5EB957ADD
	for <lists+linux-next@lfdr.de>; Tue, 20 Aug 2024 03:24:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D596C2842B1
	for <lists+linux-next@lfdr.de>; Tue, 20 Aug 2024 01:24:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BEB4DDA0;
	Tue, 20 Aug 2024 01:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="W1T7u/nQ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD2A33FD;
	Tue, 20 Aug 2024 01:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724117046; cv=none; b=exQ3JiItPeSrEh/7PQo26Gjg1w1JlzcYFtx7dCucyX/iqPatPpSY2+6ZPud4P8h4J3CA5vtNLGONqz2vqm/1TQ9FqKSPq2Njv5WmtN21qOyqzRuxVNJb9xYSVe4cF4z06wmu5uXtZRzISPac9k3YK/nkHoIFqIMnZOhDJ3goMWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724117046; c=relaxed/simple;
	bh=U/tN73Hyc3LPXsbdHs/8J5/6NLZ/oLTpCyNfawjYisU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=kzt+/irWJ5NsmYA5lqdHqN5ltIj9EnIbW8IP3WlWKygxN1HmZEhqLV6rryYNJOIif1QKpu+33LCs+T4Lyf19Kv5350CJCKu4KBbWbdWU8dPJJU5sLmkZy30REZFNbmbnYamHFGuKzObSicCRfnFDtlo/flbt5XX6WY/N+82UmzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=W1T7u/nQ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724117039;
	bh=GYf1IMnpNxgP9nBQ0RAf+ZWqoGgAKqIJR9NVM7JX+Tg=;
	h=Date:From:To:Cc:Subject:From;
	b=W1T7u/nQamyryY645CNAubflBuSezcY1nuM6XUhAYovW3V2ng3E5ZdXnGvBYrcT7Y
	 Fgmrd9WVxgQnU2om3mURafWAzL4rKc6S1gPI0MhuDksMGgZC/SR1yP5+OTnYs49Jsn
	 RJcnzDB1JFEjdzrR8Zo8lToC3AU8As0NfhSPGCoPSkmz9F2LfcwQDQ62ggiHcPeZwq
	 IRMGJt1IWiBBtkCk5TsdngJtWtAf79EPNw6qbh1M5FG/Li1f3w2cuv897j1PWA7dau
	 sE8KpcTFbJiEXD+GVqrYDmPorPUBf3zjQBIRT3q2EgvH3+tn60fhDFcE3TRniu0GZk
	 tKb1U11WgkWFQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WnsDv24mXz4w2R;
	Tue, 20 Aug 2024 11:23:59 +1000 (AEST)
Date: Tue, 20 Aug 2024 11:23:58 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the input tree with Linus' tree
Message-ID: <20240820112358.665c5532@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kec=/xyDdR1vnJtoIqA+_FF";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/kec=/xyDdR1vnJtoIqA+_FF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the input tree got a conflict in:

  drivers/input/touchscreen/cyttsp4_core.c

between commit:

  cb04e8b1d2f2 ("minmax: don't use max() in situations that want a C consta=
nt expression")

from Linus' tree and commit:

  25162a4f64f8 ("Input: cyttsp4 - remove driver")

from the input tree.

I fixed it up (the latter removed the file, so I did that) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/kec=/xyDdR1vnJtoIqA+_FF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbD8C4ACgkQAVBC80lX
0GxmFgf+J28DCm5SBaINfhGNH2VCkTPPJyCvBdU3iFwieiysqqtK40AHU+uSOdn6
XKRiIF7ZSf+QrSULbCdeeAzFxHYwPaSNW4hf+ire25lVtq+UBSJfrvWvRyo+Eyli
/jHfZVntVJFJ2pucCQclp9imQUoeSXdD4xOnUzbsf0SnxqZQysQmSFRGDdBytLlm
7eY6gWYF02nWJUDqIZhbBKaz8I5ycykP0Z9OpRizHagmXbyfEKYa50xG1V2XHIky
nxbo1lH46gn6w3VMJTCAGU5Z/ha6Q80La9DQxxTomD7AkHXBpzQFDPlHf0mfF8X3
SSG8LusmOiaQPAP5MCe26suyDYYKag==
=yGcw
-----END PGP SIGNATURE-----

--Sig_/kec=/xyDdR1vnJtoIqA+_FF--

