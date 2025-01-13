Return-Path: <linux-next+bounces-5167-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E8031A0ADE5
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2025 04:26:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FB0B165667
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2025 03:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C368E1420DD;
	Mon, 13 Jan 2025 03:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="gsLN8TJZ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C230136351;
	Mon, 13 Jan 2025 03:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736738806; cv=none; b=CLiKxFVGerVYA/rIEhPdqqFkWcM8ZxrE4LDnEbH+0Ip0iTVlp1iP5O6AekozqDP/gNDN5GfYGgdZs7IiGyJbIOhPyMSyGdqL+IPmtZNtBDRqovIVh2/jHeI7ggt76NSb58gvEvfCMXFtAEvciQhc7tDLOrQu86c3e2umY9N9qBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736738806; c=relaxed/simple;
	bh=HrFp+be/K4UG5hPpCuaJ788CLRbpqsIs5zWcNlIME7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=eennNISm14b8ZQvu4aCb9X5IXCpHfUdN2I1fefoMUJYjKinrc6EP8FjvJT3gg0YXBPRCGzRw8/uYx/w5uxC35tMU0X4UBgngGLdoORzuh/fLsvUU3pDzeohLeJai7zowDvFmdCiK3t3KEd2Q9dOpIfx8xPu1swQY5UslQJwkYgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=gsLN8TJZ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736738794;
	bh=XMlXSQNn9cofaSiknXWM69+2in+IYxovC7UW3+EvL8I=;
	h=Date:From:To:Cc:Subject:From;
	b=gsLN8TJZWCl9DVvr+JQztGpz0SFLze3vLBIErD+RwBDN8wG5mEwaDPwKVadbByude
	 t9W9eE3HaylUNW6CMJdDXTroi3+UGhwUjW21kb8GD2inmdRwt0wz20/5RWiguk5roA
	 4ugR/QKRR6zFh1nVP2VuFGWi0yBxdes/uS4vDT+Ha9oN1pbYFLUnuTmy3gvLUhLL3e
	 b/3Uvcqa9er2SRR/31bBTh9g1AmO4H8SToJc/7kKKi+qSgQ3N50Ga8a/lW7KRlplRj
	 i88aULo8nDZo3x6LUWuzwKK6AW2rDs7qZ87oaHOalKUldvHN+RpEmP02Da2Ml0REzh
	 HWNB39FZcKyVQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YWd2y4Ndvz4wdF;
	Mon, 13 Jan 2025 14:26:33 +1100 (AEDT)
Date: Mon, 13 Jan 2025 14:26:40 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Peter Rosin <peda@axentia.se>, Greg KH <greg@kroah.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the mux tree
Message-ID: <20250113142640.54d5eceb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9C05tXA32Jp3pF2gfu1l99s";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/9C05tXA32Jp3pF2gfu1l99s
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the driver-core tree as a different commit
(but the same patch):

  49a9b01803e4 ("mux: constify mux class")

This is commit

  7685ad5f08d9 ("mux: constify mux class")

in the driver-core tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/9C05tXA32Jp3pF2gfu1l99s
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeEh/AACgkQAVBC80lX
0GwtvQgAjxBYa9ZclKLIF9whGsctEWSyWkUR8t/wGC8PRpB1GHfGI+jAo7vIukME
6YPDnyLYJS/25moW6hwP/+gKJMVeb5P5sMYIZ0hYRg8d+10W85QSNHGX1RBm1xrG
PzfxPHk/atNoIhMS40ueVrzOYx3xklnd3mK8YIj+dPy3QDaaWgofYEa1VUsI1VlZ
1eO0zfxxdmEscgE+iefweP9EjdfZqCh1wrceyJ2zEUkyPSSuRKGurb1NKq+30uzg
pkpauVis3KstBeY4Cl9pUAzyce8IiG+sVK+Ex5xnKOO+5RA6YPuGrJIIaN8aoc2P
jo0i4IzGaKdvJ0KjQAah22uFdxT7pg==
=Na4S
-----END PGP SIGNATURE-----

--Sig_/9C05tXA32Jp3pF2gfu1l99s--

