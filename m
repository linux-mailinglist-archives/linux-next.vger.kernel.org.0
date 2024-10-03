Return-Path: <linux-next+bounces-4092-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C02A898F9FC
	for <lists+linux-next@lfdr.de>; Fri,  4 Oct 2024 00:42:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1F571C22065
	for <lists+linux-next@lfdr.de>; Thu,  3 Oct 2024 22:42:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FCFC1CDA26;
	Thu,  3 Oct 2024 22:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="HOfus9rC"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F28F1CC896;
	Thu,  3 Oct 2024 22:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727995356; cv=none; b=WzOB7YuAO9HTIW24uW+QTQMUapf9g/ziQoTkegWYDK9c9k+5sPs4LhkJXfCo/C9yFv1C4QOZa/n6xcE8GuJmjtNIQMKzt4c18nNjyMw95wQqsXxgQoug7V+8tgyQGa5sRVtsRwqAKqXpabX9QNu13QGlHcliDBGwDPbCSdemfuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727995356; c=relaxed/simple;
	bh=6ye/WA4fYzDoShMkDROapAYCFP/N/SAdDnm6XbgGypQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=g/X9RlXXB/3FVYHHJlPEQ+dmS85EBv93Fu3kBdCi1/y3n5c0ShmNh2uKnY4gUYRJrtNE3TDQBQiNakRDGWtFGpTdIwOEazYL4y0c6MpXVEDhSEYy0B3/9ofg1rxqMzZRfS8sBEPV4tMjLZF/Lduuokn774YfuSurR+YlHw/gI5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=HOfus9rC; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1727995343;
	bh=alSfqy8f7h0Q86FDIotfOqaXNEUeeJLNAVE9+h/TSkE=;
	h=Date:From:To:Cc:Subject:From;
	b=HOfus9rCyqoLEftpYs4RDa7M06ClvD9iAzGJEMTUv08Vn/JS98xzhyrco7TZIKMpw
	 p6mdbGSD895fgaiXo+GChdMfYYgQTg9b9WwV/n37e3XdmfEEyZTbctOOH2YBGtviCo
	 FsgV/VWkF7YoLQVxaK4UFQNQ/JhDoNU3b2ulB5c0yTCJpXBb0b/FjNE3rNi5DzRh68
	 EzknDx/gK/KqRX5vIF4ZzDKRcsG/AkscDKO9vvCk1OrADUg/Dteo36hnwtIG7gSyZ5
	 2ImJkyWh5+hK4FiKU9RfwQTMWJJ8H2dKuttIqrhoKuJat01t9Nz28+qpax1Gg+zJ00
	 yZGPxKElPpAYg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XKRWf64t9z4x6l;
	Fri,  4 Oct 2024 08:42:22 +1000 (AEST)
Date: Fri, 4 Oct 2024 08:42:21 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
 <johan.hedberg@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the bluetooth tree
Message-ID: <20241004084221.5b3b384e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/P9b09DN3riPmZrU=l9rA5c9";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/P9b09DN3riPmZrU=l9rA5c9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  370e38c32529 ("Bluetooth: hci_event: Align BR/EDR JUST_WORKS paring with =
LE")
  f9c212dd4eb4 ("Bluetooth: btmrvl: Use IRQF_NO_AUTOEN flag in request_irq(=
)")
  d93544ba0cd8 ("Bluetooth: L2CAP: Fix uaf in l2cap_connect")
  eb3ad76a07b6 ("Bluetooth: MGMT: Fix possible crash on mgmt_index_removed")

These are commits

  b25e11f978b6 ("Bluetooth: hci_event: Align BR/EDR JUST_WORKS paring with =
LE")
  7b1ab460592c ("Bluetooth: btmrvl: Use IRQF_NO_AUTOEN flag in request_irq(=
)")
  333b4fd11e89 ("Bluetooth: L2CAP: Fix uaf in l2cap_connect")
  f53e1c9c726d ("Bluetooth: MGMT: Fix possible crash on mgmt_index_removed")

In Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/P9b09DN3riPmZrU=l9rA5c9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmb/Hc0ACgkQAVBC80lX
0GwocwgApmbnRESNB925InL+7g/hE4gGwuF0SsAfONmHXBxd3/y9tCohTG0V/+Hz
RLZ1/Bx2pDmGK8vBGiNu3Uh1YZNb8nXL8NIsa2ZvRkIgx5qErvaT6/EEpF6dY5nv
1tXk5uhAzqvOQIjW7AgsC+rrYW3OjDYTP2uPg9GWGLdbHg79k8SUTdaprNcXOWls
oZF/DAT0XnHiFyMQkghB1EiHex0xQjBbcRdbgqjRdY8j+TRGTn0VUSYdufFhsgFm
QLqRNjODy/GFpHcQ9xdMcCkvcD0/P+aJbOVZ/U9nzJNZF/yPQ8kNX5C8wVoDgSbY
6ioxlmXKTd9uQ+ghi5pr2wRxq+iRvg==
=IAcV
-----END PGP SIGNATURE-----

--Sig_/P9b09DN3riPmZrU=l9rA5c9--

