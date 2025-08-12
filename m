Return-Path: <linux-next+bounces-7905-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F38AEB219FE
	for <lists+linux-next@lfdr.de>; Tue, 12 Aug 2025 03:03:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30A4A1906F79
	for <lists+linux-next@lfdr.de>; Tue, 12 Aug 2025 01:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFD422D4B5E;
	Tue, 12 Aug 2025 01:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Fe158qLE"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CF728641D;
	Tue, 12 Aug 2025 01:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754960634; cv=none; b=HZeQGqYUlACRq+k++9o+ZTE9PeLjJXhGpGoPuvgra0TmRxfxaDaUdmr+7AZxRL9uyaWZC/v6wWCklojh9P3PXy0Grj0R9w5KwI74vQqjq3+3RWIOXhfaM5fyXiX8vmgHe1B9tT5XCwh05y37wtPuyGyGEr32DlAFe6rTW3TvvVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754960634; c=relaxed/simple;
	bh=nRB5p7wN6S+MA1ZoqdVvsPJNWE6Wryh2NcdsCtXed0I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kDz5Nnd+gYKHq4bK8zVU+Ha24ad1i3gZoFE9dS8Gsn73h6rEqqRVU6ILpkSfyVYgel72XVNnUPqwo5H2/ZDSIoIR0eDTqsB8gauufEftlBB8m7e5nInouWOhRJL07jGfv2Z5kiAjIAuOPbs4qAO3B6nx+6nYkSbxFtOvmezu6QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Fe158qLE; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1754960626;
	bh=lKLrL/vRTKmPzP1dHfBCVayfLMY1Nn/TghmhvHD8P8w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Fe158qLE/YdAJDDB6MTuOIzElWxiZNc5P4D3y8QIWwhAHGQQiYEc0pQdoxficA8J/
	 dXZU2Yi4joD0IA4J+llokgoJO2f2ef4ruNq8bf1vijuQhisYvMqjFfjhw+PJ8Z0T6u
	 o2uc+NE5N7VYOg00HwPtDehpFGGLtJW2EaG6tEzO5T/LDU6giwxzL5DQcOUUYWkSg7
	 XLMygZeJWpIQT9AX7vAfVouRBO/nSadOUWHAGu9GSEap2YtY1jyd5SFzEuFuDqndLp
	 j9SoAGiXL6+MDeLN5QkXGJn+DtY0GgTTH9ErJhNWsBofK6tGvebaYuJtdMKsp7Syas
	 E7ab5/rw19WeA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c1Ctn0rLxz4x6n;
	Tue, 12 Aug 2025 11:03:45 +1000 (AEST)
Date: Tue, 12 Aug 2025 11:03:43 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Arnd Bergmann
 <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the fsl tree
Message-ID: <20250812110343.6dd82e9f@canb.auug.org.au>
In-Reply-To: <20250723094558.5bcfca69@canb.auug.org.au>
References: <20250723094558.5bcfca69@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DaDPZBJq=QWB.EGQY09Q2OW";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/DaDPZBJq=QWB.EGQY09Q2OW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Christophe,

On Wed, 23 Jul 2025 09:45:58 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> The following commit is also in the arm-soc tree as a different commit
> (but the same patch):
>=20
>   8b3da0519ae6 ("soc: fsl: qe: convert set_multiple() to returning an int=
eger")
>=20
> This is commit
>=20
>   12702f0c3834 ("soc: fsl: qe: convert set_multiple() to returning an int=
eger")
>=20
> in the arm-soc tree.

Since 8b3da0519ae6 is the only commit in the fsl tree and the
duplication is now causing a conflict due to another commit touching
the same file, you could just reset the fsl tree to v6.17-rc1.

--=20
Cheers,
Stephen Rothwell

--Sig_/DaDPZBJq=QWB.EGQY09Q2OW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiaku8ACgkQAVBC80lX
0GxXWAf9Hohi3miKwerAUjseiUccCgRTs9/q+n5WYDNFtNc6BeWyQi03X6MYREnp
Y8KowA0woFzw1BU4WTYywdflH1mdEakDfpdQpIbAtO+FXp5F+6Wg7UEzKl+EdO4V
mUV0TXkB1gj8Jo2f1ctuC50f4LzGZDqYfnBryRqkmpdszvBcAE8MULchqwYmcrVk
hlO7D+1/nof9BB8YoD6jStxcGvgcn78S1jxUYj1w1871yP8bnxNIM0OanJeubtwV
FhV/ifsPnn/enEtVd/dWKmg9d+Pi+pjbfFU08m0rXIGpsworG4mzGshIoPzDPMQP
uxkGM2Dia3jmWWGLJ45uClrFtYVkOQ==
=cAi3
-----END PGP SIGNATURE-----

--Sig_/DaDPZBJq=QWB.EGQY09Q2OW--

