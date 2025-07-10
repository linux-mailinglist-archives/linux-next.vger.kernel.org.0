Return-Path: <linux-next+bounces-7452-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B41AFFB54
	for <lists+linux-next@lfdr.de>; Thu, 10 Jul 2025 09:50:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86A3D5A4666
	for <lists+linux-next@lfdr.de>; Thu, 10 Jul 2025 07:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B17821F1313;
	Thu, 10 Jul 2025 07:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="O5u+t2J3"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8056A8BF8;
	Thu, 10 Jul 2025 07:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752133829; cv=none; b=bYowxnZpTrcssZ2myOnxEYiF15TV0b0mh/e3G09uilqzxPT3/cE6qVsUE8eUtRI8CptE0y3dBNgh5Yqn36mKrLjhVtgEhRasSpSKKV5wjgwKucd6YS8/edQZp/NjAnQv4nlvUcIgIVFeX6fZ2b8XoBffAOz2hnx2OwPFy+CjEfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752133829; c=relaxed/simple;
	bh=HpZ+dfDSNkY49OjfSC+QS6crvB9YufmTeWdXa2A4my0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Osu1BiXYffM9XhWGlLTIqVsrXG9+EZD0o92XOHygVvhJjPAsHEpE3DYCfxYm0fQVgh2LH+oWN2GC+UI2iy9hezHW4oGTH3mll3O0NODJ68mc3DI4VeUKB1iFSnSHexa5flpgpQBunaVFRt2ju39vE8g9awszPzibmUMEyu5i78o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=O5u+t2J3; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752133748;
	bh=w1AyeoVG+2z8V4xMI8xI1G0Y8bMnfcHFmHwou6xpDFA=;
	h=Date:From:To:Cc:Subject:From;
	b=O5u+t2J3BKCT/G/IRnDu0u+8FOPXeSyW+XnoLHxJmBqgFgrgPWYQcj6DPD9eEtIRK
	 o4fqnKUFmBYdVYh94IHv1/XETHm++svjI/XXbkf/987cdHuiQqGw+G/RjVCUqHrkqi
	 uXKA5WyxALMs7dO8SqobF7i1X+mEDQ5BJIZ/PY4NkOZ1YyRwRZ1O2rDDPgRy3SjNRq
	 2Pp8+T/qepTOJAb2LcfqQLxk8RPm7PvpgGhQYB4wWNASjHSGaQDmbPXT+rLK9JzxOv
	 THOC0jK+EvI1Q9DLYd1j7TACQRPIva3cz/2hnBwlwH2cmylVfGIGurGVnx15DJOv+Y
	 iYelC2+g34M5w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bd6Rm1cqZz4wbb;
	Thu, 10 Jul 2025 17:49:08 +1000 (AEST)
Date: Thu, 10 Jul 2025 17:50:20 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the mm-unstable tree
Message-ID: <20250710175020.6efdcc8f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2_yOVWzUoPUIsyLFEJ/26Tr";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/2_yOVWzUoPUIsyLFEJ/26Tr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm-unstable tree, today's linux-next build (htmldocs)
produced this warning:

include/linux/page-flags.h:1161: warning: Function parameter or struct memb=
er 'page' not described in 'page_has_movable_ops'

Introduced by commit

  7a93faa2375d ("mm: convert "movable" flag in page->mapping to a page flag=
")

--=20
Cheers,
Stephen Rothwell

--Sig_/2_yOVWzUoPUIsyLFEJ/26Tr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhvcLwACgkQAVBC80lX
0GzELggAg0X6Hgv6apcVp2FcWBgMsxNQFSpDLJf0gtjdr8d/vylNxNj/GaZYgMJb
O9tQrz+8m26Dh5uad9WEmCKSk8YPxZTtNSPVJfPHzRjEmc1FY8DudcPUk1nEdpis
2SI9a9qgCn1+vFONpSYNsBidPmOIk3AEOEnjiclRWE7JOFE7wJfTDzhPbANcXwGf
1t8c5G2qfYQTJ6AL3bcyQc+48B9I1AM1KP+0w2ojlJz96rSYcb1gS76yZ8wmq9kU
UkRFrR59WUKXZCubDn4VL+8Dba4TNpkpSHidcR0TBs6ehKjQtZXvRmHnrQ3E+ZCW
YFOGJEayEKP0o9jH9AiK9a6mvRUmOw==
=bsAp
-----END PGP SIGNATURE-----

--Sig_/2_yOVWzUoPUIsyLFEJ/26Tr--

