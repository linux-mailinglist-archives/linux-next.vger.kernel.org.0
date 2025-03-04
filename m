Return-Path: <linux-next+bounces-5642-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FAFA4F0B8
	for <lists+linux-next@lfdr.de>; Tue,  4 Mar 2025 23:47:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98517188D4DF
	for <lists+linux-next@lfdr.de>; Tue,  4 Mar 2025 22:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1A921FE47C;
	Tue,  4 Mar 2025 22:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="UAdTo2rc"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFF91F4E27;
	Tue,  4 Mar 2025 22:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741128467; cv=none; b=dG2xHZVC7CvgEWyTNjOtxhmPo04uSRVlOXwrXykpNkbLZqQf3V9wpdpajQhe41f68hXbZYbE2/jK+p+V+dlnxFqbgFTklCVA2A066oxcixIarJ0v54Qzlf2cgCMySz05KBYzwYeoJCqLBeJ9EwobaOWQmV8bRDCsaxBqoIacIqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741128467; c=relaxed/simple;
	bh=/SzcalMI3t0LsJj6KZ7r7qT0ul13zHtUpIDY55MySVg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XwkU6HLc43Fg8D+BTuFutF7bI6he+WCVU/avKtJqwvyKfNPNDo7V1kyRkofdrYwBuMxWns4ECLEsLG5uQS/E/M9fCoEb6uDT1LmP3waKYoJBlLkeX6W9sCF89R4RUUDlB+8BSyKWCvX8encxjhEsTz80FhqnRCU0HyxnR+3UolI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=UAdTo2rc; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741128459;
	bh=Kunaup0/Z/RDWuE8m1XF+pBbJyUM9wJARV/5ypUpfcU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=UAdTo2rceMFks30Z2lFfq07IK+OuxXX/eYUQTuX3TmIEvvw9RrW/4nRRNmVL3KtX7
	 lJr+PPcGFx0zIgFnG+7UXl3ujnHY80d8ALnLxnf83tNhB6ggUm5A7jFg7WaJY6xbLN
	 uO0z079LKC15IZGmChuOiuUVB1quZ5Vn1ecmHnYwiK9u6owMNpzvw0DElGvF42WlJK
	 GJEa9xpEyG6RjN7OI4lyTyReIpxlPR3fdS8EaTtHkWuw7YGMG8v3D5hC5Zpdglrg4R
	 HMzTRubZKYhmgaXFTDe8KKQRfPJA+oxXulGiMvQ9zs/9V0qDsEMxJXc19D36hhAR7/
	 9Bs5tPaZeRp+Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z6rRb289Fz4wj2;
	Wed,  5 Mar 2025 09:47:39 +1100 (AEDT)
Date: Wed, 5 Mar 2025 09:47:38 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Brendan Jackman
 <jackmanb@google.com>, Andrew Morton <akpm@linux-foundation.org>, lkml
 <linux-kernel@vger.kernel.org>, Linux Memory Management List
 <linux-mm@kvack.org>
Subject: Re: next-20250304 build failure
Message-ID: <20250305094738.6cffb432@canb.auug.org.au>
In-Reply-To: <81fa7a0d-ed4b-44cd-b2e1-779a42401cbe@oss.qualcomm.com>
References: <81fa7a0d-ed4b-44cd-b2e1-779a42401cbe@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rGjjH7nWAs=Z9aM1abWaSPh";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/rGjjH7nWAs=Z9aM1abWaSPh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Konrad,

On Tue, 4 Mar 2025 21:35:04 +0100 Konrad Dybcio <konrad.dybcio@oss.qualcomm=
.com> wrote:
>
> Hi, I'm getting this build failure:
>=20
> mm/page_alloc.c:424:3: error: call to undeclared function 'in_mem_hotplug=
'; ISO C99 and later do not support implicit function declarations [-Wimpli=
cit-function-declaration]
>   424 |                 in_mem_hotplug() ||
>=20
>=20
> building next-20250304 on arm64
>=20
> Caused by=20
>=20
> b4cfcc26f507 ("mm/page_alloc: add lockdep assertion for pageblock type ch=
ange")

Thanks.  That commit has been removed from the mm tree for next-20250305.

--=20
Cheers,
Stephen Rothwell

--Sig_/rGjjH7nWAs=Z9aM1abWaSPh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfHgwoACgkQAVBC80lX
0GwklAf/fJfyevj41pPukCy77hAn8P/JnqSRR5VPmfNPkMqG8sJRjHC13t7Q9E9T
bpFIb1Dy4FUW5pJGRfj7XYRvoN6rZdQ9qqGFf/oBs3lCkawhyRwOrHIwuKAoFAlT
pHE2xAb8oiGKDV/5DR4iAhPhv7eeAdfjz5sBDdn7uEqKqiboexa8q54D+mtm80zQ
HOLw7dy/+IfwYBNfRGfCGuYEAhrnJ6Mv1sJgje53a2Q+BKa6YBEFwwc3/NoY+I0d
kGIcmvIp05kDsd/NNl+Lidp/1S7XayXZLV3qCdzffC+ixhf7NIXLhXNkXDYJH9fB
VXxMdu7UmVS7FAFn3ir1BXB6w6Vs0Q==
=UyqH
-----END PGP SIGNATURE-----

--Sig_/rGjjH7nWAs=Z9aM1abWaSPh--

