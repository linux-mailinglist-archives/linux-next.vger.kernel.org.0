Return-Path: <linux-next+bounces-5733-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F1AA5BDD8
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 11:26:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2C4B3AC72B
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 10:26:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91602233737;
	Tue, 11 Mar 2025 10:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="MFNHUwPZ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C3B233140;
	Tue, 11 Mar 2025 10:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741688774; cv=none; b=uQ3UoqGJ+HbmkgWN7wfUgzsdXcWnorT+CmYT/2ze3fbKp24Uc3y26quUw+46mqKdsorVoZobo24i+sLUrtL5r/oR2GVib2XI6n6/cT812LiGUD1Mh+POt7xN3gJiYeHuWFfLgzdVB5CXoGcetQx+2F58ZFbuTZm8pbEgwbCuUs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741688774; c=relaxed/simple;
	bh=+zHk2fQ1KSrzb3IjOjIZHkMraUg3UuXfAU7U+MPyGuw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=D07RlXJwK1tN3EXwF7EJ/EJjp+pyxkobu3Qqu/aQ+SKovIiDNEvQSQSt0iGxsIaUkZ++p+rkr5N7GvRLi7y/4P4wdVgXopr65q3OkO0H1QCgVT1B8Bd1pmDRxwMZPQY1b6766u5eKgKhzOLrpt72N3aL4CfzCn6Im3xu+KQaX8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=MFNHUwPZ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741688768;
	bh=vcErrWATOZwbbPb3zq62oFD1f2qcVOHGBD3KADoneu4=;
	h=Date:From:To:Cc:Subject:From;
	b=MFNHUwPZO9WRxQYKNbpCVdy8Fa51ZVAan069ggUX8UWp21sk/RYr7ILT+OIt3YXlu
	 OVHahYvx+8TRic6d9oNaMDDT6ZQC996+1eC9lRa8a4SIzp1usoqnz4lQ4zNoksX227
	 U6vy9O71+fJJ8hxMXpW/Sum6gjJLsc9f/4KwELRFdzxT0C99Wh8MnrV/fqh/Q85J5J
	 AEhC+VWbwP/3BpCwklvFBEPBS3kcLMHnpO3gfBMKXXUg42saMVIGrIS61tGj05D7dp
	 LdQemh2P/UjrHTmyWIV6xC5cfzoeAWlAtDOVP4lkevACkLeezE8280Vc/3Qrgl99RZ
	 NXos5Rz9xbbxA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZBqfm0b2Kz4x89;
	Tue, 11 Mar 2025 21:26:07 +1100 (AEDT)
Date: Tue, 11 Mar 2025 21:26:06 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Zi Yan <ziy@nvidia.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mm tree
Message-ID: <20250311212606.0523be36@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/msQTpgB+tg0K4DGM+A7f55t";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/msQTpgB+tg0K4DGM+A7f55t
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm tree, today's linux-next build (x86_64 allnoconfig)
failed like this:

lib/xarray.c:1251:14: error: redefinition of 'xas_try_split_min_order'
 1251 | unsigned int xas_try_split_min_order(unsigned int order)
      |              ^~~~~~~~~~~~~~~~~~~~~~~
In file included from lib/xarray.c:13:
include/linux/xarray.h:1593:28: note: previous definition of 'xas_try_split=
_min_order' with type 'unsigned int(unsigned int)'
 1593 | static inline unsigned int xas_try_split_min_order(unsigned int ord=
er)
      |                            ^~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  da74be1b063c ("mm/filemap: use xas_try_split() in __filemap_add_folio()")

I have reverted that commit (and the following one) for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/msQTpgB+tg0K4DGM+A7f55t
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfQD74ACgkQAVBC80lX
0Gz1SAgAj4u+S0dwoo8uH3wURGucfPsa8CYO+hKoWCMtur1vHJVGFtwwNED3O5Oa
zNYywvCWHS/Bg0ODuLZ4u7PcI73cDV06BWgT4KlLascbTu/YQo7+tCZHkDEMJrkI
JosuLDooVL8m3VjsRLvWtZgkVwmh7GbIK3KcjIDbB2/EMG683OKh5kpj1UG0shul
7XTduR1NGgl/DlT/NKnLoH/1CuSewwFArURdv9HSccTtGZksF9M5KEG/uU1BSznk
Mzlg7Mbr9o2smBaToYRCMIUK8NhZnyPBMfZUeoSvS6pOhRtCDKtUWNUBpEhU5WaD
RHAHACYVGyw4W61/s2sSH331NXZciA==
=e/SR
-----END PGP SIGNATURE-----

--Sig_/msQTpgB+tg0K4DGM+A7f55t--

