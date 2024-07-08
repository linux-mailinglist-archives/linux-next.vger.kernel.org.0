Return-Path: <linux-next+bounces-2834-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D50929E26
	for <lists+linux-next@lfdr.de>; Mon,  8 Jul 2024 10:16:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 319601F21C35
	for <lists+linux-next@lfdr.de>; Mon,  8 Jul 2024 08:16:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C59EA57CB1;
	Mon,  8 Jul 2024 08:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qosDMRlD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC125381B;
	Mon,  8 Jul 2024 08:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720426564; cv=none; b=qGvWOzOs8Gwmkoch1JgziCUBIMJqQL8g8uF6n8jf/5K0xXHDIowiflQdjXYfIhvTgp+U1gznaDawWCxwp7yIYTvAiEHd3JeVWM5tZaiQrseo/yXY7xRp5IhAGqcBzmjPqSJlaG/qWwwHx5pNk5w3E9ChHwVGxZNKo96B1Erxf34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720426564; c=relaxed/simple;
	bh=7Maxygfa5fNiKsJMJxSJx694kB1ZQXoQbXW9iN64cpw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VkihJJaNpbQsmuf9O/TX5G5uBZ+u1qWkHlBJ3BQkqPV01GRy+oCS+bNdXVUbjSro5XC2WOyat4B8W1SGfTuSqh4Ur2Lm0PJev/0lAEhEgmCMA8xCVo9b+jXOYQHVDahykrZo0AgKWDQ3gblpR5bLGe7krj8zovRaJnpQUE8w2cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qosDMRlD; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720426560;
	bh=RPysfNfVn2FBf8tIW9CrTOPNzRzzCvPXJG2k4IiyDlY=;
	h=Date:From:To:Cc:Subject:From;
	b=qosDMRlDvfeJvFuLigXOwRzZpwgRk65X8V9203oBRwlZvEkaxEQC+Qb/SGgI5jO/O
	 1pjxyG30Ot+RF+EUSF4dIqTKdHcCpAewW7CBhjSpuKgxm5Eu3EUSUkt3V2ltxv7bW0
	 L4RPARhRogiPOOk72Y1zkoSZfHovhWAFtCenpx0vV+KsrOgOsnD42F07m38qXY1m6c
	 abs9BBmWBzs4Gq0C0oTOWSHFXGmfzvpP/QMQObSf8KodhRFqB1ZYUn7Pv11K9cea7m
	 1PZw9YMlE7djnevIVngfEXHhqpQUjeo4TBJmd2hY2+luTihsqWKp0PKvJ6LNNXrYpX
	 FG9JvSo35p6Cg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WHcQ84SZnz4xNg;
	Mon,  8 Jul 2024 18:16:00 +1000 (AEST)
Date: Mon, 8 Jul 2024 18:15:59 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?=
 <kw@linux.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the pci tree
Message-ID: <20240708181559.3920edf6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_HkEDvK3yRnVN8==iWXXV8s";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/_HkEDvK3yRnVN8==iWXXV8s
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  5f5817e68ef8 ("PCI: Add missing MODULE_DESCRIPTION() macros")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/_HkEDvK3yRnVN8==iWXXV8s
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaLoD8ACgkQAVBC80lX
0GwFuQf+Iv+NDWtO+df3aW1P0hdXDhhU+xqDnnXDBk0XaA0MAKZ/uklN3GrpdB9J
Tmi9X7uuqAPR4bHzjDeIRDtfYCkQ+orj4W6rWOxyZK5WG4bRCSv7S/0kxzpgP2gs
GXoWrN8vsUyEJPOdfef594R+gzJbCRIaNfrFzjQS2b+LmlP8P2qCqSvbiw7kUNtR
uGMGI5S95miWA8AgjYaA7G18WT4Cd0PRv8KzVEaavtVRsNhWWIFNWmWL7I5l9RtU
DCYU3w8pG/4UkQaBIAPoke+zt3VleYonLJEQqEw3nPX4YkwO5umPOASbJz4IWSzQ
T6hzS/g4pBA1JL6ozdh68rNd2rfY8A==
=PdMd
-----END PGP SIGNATURE-----

--Sig_/_HkEDvK3yRnVN8==iWXXV8s--

