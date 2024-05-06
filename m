Return-Path: <linux-next+bounces-2184-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0518BC777
	for <lists+linux-next@lfdr.de>; Mon,  6 May 2024 08:21:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F85D1C20919
	for <lists+linux-next@lfdr.de>; Mon,  6 May 2024 06:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 075E3482D8;
	Mon,  6 May 2024 06:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="jValbT/v"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5331C19479;
	Mon,  6 May 2024 06:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714976474; cv=none; b=eey1NkvC73V+6uMcpPtTQgv2nvpLQnbC1XqUgIxaPDcpFpX+Bfo7ZQg0Cfw+y1qyeFUQxQB/4N345IvFAa4PA5VeYxrOCZE8htTvsa3HIWVBk9DKqR12prFFUE705iq9uOKPcQBo5xnNAobW/f341y8g2AXWKj/7K29Ci5E2D4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714976474; c=relaxed/simple;
	bh=rTrcZ2Ey+HSmZyosGuv5YTYKv3f5KiODZUyecdrygFE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gNoRKZqoZbCgFIrb06vUkLXKIWR/dbZ7tn/Sd0TDJzVYKeVKTOqnuIjKGEFHlCrXkvtXjyDEkmq9IYCz/V3Bjav2EpnYVGxGwqIF7axV4u/eMK/pxFmipUj4HUL0Pp48LCsjNkj2d7HnxCHS3fM+eg3LlFw+4xZLzW7cBY285xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=jValbT/v; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1714976469;
	bh=+kVnrigFsk44ZRKuCiZYPez9VFH3nfM27ina23moXSI=;
	h=Date:From:To:Cc:Subject:From;
	b=jValbT/v/qQUx50Skmz0LAMiDa5RmTkeG2ixDJo4fPI+tHjwU3FkLioINh1fS5Y3m
	 EFP6aP48Zb+voF86aoM8ZFssPgrxN+Lbx++hFfQ6dh6C7+3jrAsAGzJu8o+6IjY7mW
	 8NXqZ0oy1pdek/cmEKlOEU1oTB2qdv7U46k33I55L6jEsi0ecfIuX7d4yhBy2/Ir+n
	 mB8t2hRtUMHFpyDf63+QAlsqoHC4IfIUlGm6B+blaHRsI6plk/itgCUVuZgWvXSKTN
	 FrNG5rB7sSPByGtHlF69B0FIAGt7f3fbw5lRHohp8gp3gjOxbjnsCiMzCVZjOREZAF
	 lrRmpFDDyOOCA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VXrrh6BbVz4wc7;
	Mon,  6 May 2024 16:21:08 +1000 (AEST)
Date: Mon, 6 May 2024 16:21:05 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the tpmdd tree
Message-ID: <20240506162105.42ce2ff7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gH0NBt2wvGYz2DnA6VIlJD_";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/gH0NBt2wvGYz2DnA6VIlJD_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tpmdd tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/security/tpm/tpm-security.rst: WARNING: document isn't includ=
ed in any toctree

Introduced by commit

  ddfb3687c538 ("Documentation: add tpm-security.rst")

--=20
Cheers,
Stephen Rothwell

--Sig_/gH0NBt2wvGYz2DnA6VIlJD_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmY4dtEACgkQAVBC80lX
0GztuAf/TRakWDElGvYzVmhW8cAehUp+cqy0DTRNiKJoE/Bh0TitSA/qm2i7q1Iq
QrFLfnYpMts2xQSo3tTCKV1qRsf8W03/ri2VztvAVcZENw+nnlfCdhwTzQYCsxNP
MOX8x0LtI4QMd2i6ByZgrwSFSNRPmDJ7ebWPhmyFu1C0ZHxalyCaF8aamhvEHZTg
04t2YOHKNxKpv41Ldu123epas9llPbLKsHRArnV6W2tm2/0lNLY5JxL9v9GjOm9O
Q5ABjQbGqj5ZnwmH/wViz/9ucWbUkXysmNc8N04uW46dR3J0b5wo9+KLOyWgdTfG
XJgzDZYljF6FyZI8UN4U5r3Klo9nLQ==
=31e1
-----END PGP SIGNATURE-----

--Sig_/gH0NBt2wvGYz2DnA6VIlJD_--

