Return-Path: <linux-next+bounces-6967-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1A8AC72AB
	for <lists+linux-next@lfdr.de>; Wed, 28 May 2025 23:18:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8C979E77F4
	for <lists+linux-next@lfdr.de>; Wed, 28 May 2025 21:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4389B21FF3B;
	Wed, 28 May 2025 21:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="YwfJM+Wp"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C986D1DEFE0;
	Wed, 28 May 2025 21:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748467095; cv=none; b=foV0zTCaKtOht+OPJDoLv+C1AbeNnaKM0G1lHS7RqQHEpHpmeq/P87obMsn40YLnHMnXWd//pF09sxOVZ9SnWc4nIUuKgfk1rDfn8kqo25IRdWdbnqDS40UdiVwZw8LhBW22zDxqO6EDb9Uxki1IhZgyXMKJmlTwLH7OzLZptEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748467095; c=relaxed/simple;
	bh=fn57j03hCE8XydwtnvWvK1GwhipQuM3zn7RdwR1g1Bg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=TJKWT+5WaABT1BkQEarML3J90GR98LpWAaEhIFYtAtK1JyymJdAuxLJ9yRhuSY3acDXNag/Bim7aj1/Ty4OOvFMKnNIIEb1EDEYtbX93EroRVL08jd+/BJodB+yJ1ZwGmKPKTf+6NL2vWuYgoTxMeFtpx+DJeAxdcZcYhfvNaO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=YwfJM+Wp; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1748467091;
	bh=CgpXzOfc2xUcMwIKm+QAbawu8Yo3oj916tKaRT9eqjs=;
	h=Date:From:To:Cc:Subject:From;
	b=YwfJM+Wpos/VY1TI8pipU/Gm/0hVMG6m7CcVwhRv7PQR7LDh4PQQYtmAJ4oqokflh
	 gJPdMDN4rNdeDIo3hIDIgYXwsKQVpxlc1awhZrKtKJRgLpCX+pIh7ZPJeM1gouDqfH
	 ySqLDKH7pKp0Knty9cFYa6ytStzwdyC+XPEQnVQmghgeSWoJdmcHacgjc4CrFUtPDV
	 6dPdCW87hnflti4mXt1nvQ7GqtW3B9pmqMMsW5NXdUghGBzsO6IQs+wGeuQGOm104F
	 3Q9yCQtTRBAmzcaEqN8eFVruppDiTH7jAr1SOcP+ea4uExWpuPNTKvjk2CTrUhmEE5
	 ZR+/w/NeTaKPg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b72R709N7z4wcT;
	Thu, 29 May 2025 07:18:10 +1000 (AEST)
Date: Thu, 29 May 2025 07:18:09 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Arnd Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the arm-soc tree
Message-ID: <20250529071809.482ab217@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RijOY7O_/dforjHEQ6Op8aJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/RijOY7O_/dforjHEQ6Op8aJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  0d4d6e699a4a ("media: dt-bindings: Document Tegra186 and Tegra194 cec")

This is commit

  5bc68bd3826e ("media: dt-bindings: Document Tegra186 and Tegra194 cec")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/RijOY7O_/dforjHEQ6Op8aJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmg3fZEACgkQAVBC80lX
0GwhdAf/VqaUCB1YfJQaW63il3bVi4EqL1R31N+d724vaAdqMqwIvIWsyo2eufOg
BpTbD8fjOQh97Ewz2qdOceuFhjmdnC2z2F1qmaV0eg2uHMjj6Z4RGkh1usUv/xSl
9hzF1hhT8FJ9R3BBn36MunHKOQ1eKuWjq7o5pbWgMrnfrG7NBEFVu2nPZbOGYnvr
2md+BDzSDieUz9SWl9gl46zpueMEGwP4B41C8hITQUWJjW6BJ70C1vJxNtQE6Np+
88FTE4p+gadxihCGY3TVpeUhgi2E2KZS/nOGn9Le6sMtkQ/s4O74YLc5VDBSXj6Z
dhk1yMneEhtsrqfNNbgzwaalS6YO8Q==
=l5nZ
-----END PGP SIGNATURE-----

--Sig_/RijOY7O_/dforjHEQ6Op8aJ--

