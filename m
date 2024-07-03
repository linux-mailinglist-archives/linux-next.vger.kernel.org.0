Return-Path: <linux-next+bounces-2814-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A770F924CD5
	for <lists+linux-next@lfdr.de>; Wed,  3 Jul 2024 02:45:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45D552853C6
	for <lists+linux-next@lfdr.de>; Wed,  3 Jul 2024 00:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EC61138E;
	Wed,  3 Jul 2024 00:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Eh+48ewi"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFAE39B;
	Wed,  3 Jul 2024 00:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719967521; cv=none; b=AK8/0441qTBJYkYqqNJ/aHiYvybmui7uV3i+l+9+2fG4rUlngwIUQtl9tz5+bi9ZoAl4AQaIO6p4yW/+yOCZl1D/VFw63EzSx/jdSWUaLIBJLT7m7VcbhJl3+gaoo/P5CNAYhTA1kzQoQRgrRe/FIL28VL8mXapi4E6+IEqi8aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719967521; c=relaxed/simple;
	bh=JRvImNJVh3IE+TRUEbKFf4gUehZKbpK5IUwRCx4A7dw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rteOzCDrFMiWJ8GmdoEdtXEKEqos3EPZ4rUrxf91KGJ8UOUJ8l4LBQS8al82x4+75OGcsU6VgUWrFDWN7e5Shhe6GAtOWb/9OQakWzkCeSwY9y47RbrxBQ7/JogSGBnDfpYKkZgbtwPwwAAZ+VCGZ4UHbtHoxVZJOUf8MqVH2RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Eh+48ewi; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1719967514;
	bh=3ue08OFQehkb0TAxkVgfve8ILTSDW8vnt+9GdDW7g+Y=;
	h=Date:From:To:Cc:Subject:From;
	b=Eh+48ewifT76ZjZPMWozHc7rZI+IqSKebs/TfNeOtXXQE8VdBKbuNCt76jvK1iGzX
	 Z1CLF/59we+bwwpUfjq54UFiB8fFtufxU2swHg7q2KLVJDPr+ARAe/iItG8F4JYjEt
	 0tSzcHh6sv2PmErX5I/esvJGC9rcii4XBxcoV8aAQxlWRZjplU+IZhIyhkgjztvy+q
	 6llykwxhpSijwl0KXvTZl82lqUw0/kCjgas8Jkk7yhUQM7rXMMWFeGtGMjpyRFo//3
	 HahgP9MUkV8N/71xD2GCkrDtZ0q/OF0MTfBbMJ67XGaYUt+XOGg2ajMEywJBDJHRWB
	 Wzf6+uEPrDxlg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WDLfK5NXCz4wcJ;
	Wed,  3 Jul 2024 10:45:13 +1000 (AEST)
Date: Wed, 3 Jul 2024 10:45:12 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?=
 <kw@linux.com>
Cc: Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?= <kwilczynski@kernel.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the pci tree
Message-ID: <20240703104512.59dfc264@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UBJZ0aAiAao6L6NujGGGVi6";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/UBJZ0aAiAao6L6NujGGGVi6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  1ee61ee40d2b ("PCI: endpoint: Introduce 'epc_deinit' event and notify the=
 EPF drivers")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/UBJZ0aAiAao6L6NujGGGVi6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaEnxgACgkQAVBC80lX
0Gx7qgf+IrhWz6bA1tOo11TaXsHbeY99LCsDf63+5KAD8aG6Yu0pdK1ZHeJ6RhOl
LHhJH1rAc+pbcbHY+WoXoD3Hxb5eNjb92WbZ9OdXQ8xbGzkVdywmF607qYJg65xg
vcMIoj/mcXrahUFyAavT5jj3SGyYSAxBi2OB7w5Bi7jNw3CHeG+5+4gq0BOHVIpJ
4mQrdYobbe6Bqm7PlX050/sw8hhLd4S5XekdoE1KP9DR27iiGP5/Qnj1YAAG0s9f
4DyRyBK9pieOvFhLV4rGV68aimh/DWFeVkyAzqFsU0VoJtiIva1duxFolOSe8B6U
915trFUD91/fVkv6kQjEgNUz/ueYdA==
=uEmO
-----END PGP SIGNATURE-----

--Sig_/UBJZ0aAiAao6L6NujGGGVi6--

