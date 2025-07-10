Return-Path: <linux-next+bounces-7467-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D151B00F06
	for <lists+linux-next@lfdr.de>; Fri, 11 Jul 2025 00:49:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B8C61CA2FEA
	for <lists+linux-next@lfdr.de>; Thu, 10 Jul 2025 22:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 023532236F4;
	Thu, 10 Jul 2025 22:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="sX8GaYid"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223B01D432D;
	Thu, 10 Jul 2025 22:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752187760; cv=none; b=jpVtpJ/QA1hHOg0j6R3CmhpUuiy6nAlUlJu9iqROxT0mMmUBbESs3fW738EInKdge6MLpxLSZurQhoQ7Ta5VHluNf09bgNUzDCMCxzOmXrKM/f/3RjEqsLO8y9VME3ge/hLuhalSBtnDg6NHzoqmUWHi0GASIst0Fvw9VHS6DYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752187760; c=relaxed/simple;
	bh=cRBo3kGQapkGoR+8bsRxAAR+ujiJ/BvrFspvXRNlZIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l8P6qtmSPWXSGRZbl1qJ4Z6glf6jLRxLhjx4TPhO7N4mKq2/oKSAH2sx1CLzRN35/VwxYaD8qo8avZruRigZNK2Xs4ESAZKU/Kw7+Ptwn0d8lscrIR8vEylI3Jo00CDmAQhOx0rDSJAS2KxXUEg6f+nPZ63fVoPpE/PfKYNZ7X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=sX8GaYid; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752187677;
	bh=DXxondijW1e8MsBqPbwPlbMkxosHe8r9/EBlGE/iGt4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=sX8GaYid3MKPW99coTCOZkR00Lc8fe/XGByPShmKhNmOI3e66Ic7mN9hGGKsIunvZ
	 m4zkdp/D7F5UbHPtesmYtXbPe2ziT2UgIlfADiAoPHDK/1gwopxsHd7L5jxriGitor
	 Cm5HP2UZ5QDDH7xtbfoUXUVS3EvIAJDJyWVMhLKKKK6lqG5Bs0ufI8ttOlGmdT/cch
	 HLsF4SFkKjnm8bEJOUMTF32hFSgGnbm/ODa2gnWakL9jZduh6TL7SMsslug6vJW6qn
	 5evs2F9c8LzV6B99ACw14CxUvBosQuCZdC+WzQBkYFmzZQM6D61Wv5LkzWI5fhoNTa
	 qXRyDCUq9aJ/A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bdVNr5r01z4wcd;
	Fri, 11 Jul 2025 08:47:56 +1000 (AEST)
Date: Fri, 11 Jul 2025 08:49:12 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the mm-unstable tree
Message-ID: <20250711084912.22886e3d@canb.auug.org.au>
In-Reply-To: <20250710153017.c17ca59f1df36eec90db8b54@linux-foundation.org>
References: <20250710175446.128c7def@canb.auug.org.au>
	<20250710153017.c17ca59f1df36eec90db8b54@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/s2wB2/2tQWD7PCemrqsn=oG";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/s2wB2/2tQWD7PCemrqsn=oG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Thu, 10 Jul 2025 15:30:17 -0700 Andrew Morton <akpm@linux-foundation.org=
> wrote:
>
> How about this?
>=20
> --- a/mm/migrate.c~mm-migrate-factor-out-movable_ops-page-handling-into-m=
igrate_movable_ops_page-fix
> +++ a/mm/migrate.c
> @@ -161,7 +161,9 @@ static void putback_movable_ops_page(str
> =20
>  /**
>   * migrate_movable_ops_page - migrate an isolated movable_ops page
> - * @page: The isolated page.
> + * @dst: The destination page.
> + * @src: The source page.
> + * @mode: The migration mode.
>   *
>   * Migrate an isolated movable_ops page.
>   *
> _
>=20

Looks good to me (but I haven't actually tested it).

--=20
Cheers,
Stephen Rothwell

--Sig_/s2wB2/2tQWD7PCemrqsn=oG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhwQ2gACgkQAVBC80lX
0GxaBAf+M3hzgrWNpILBqFmkYVw88o8yBFqEltyYCYJlMSgNqHVwhwLSY4QSAZAM
hJ7NHYj0xi+ujm59X2AZx/MVpuDB2xZysZzdun7bK3O7X2DyqTn6XHx22EniDn9f
d7bvjX37hVR9svHvtoIly6SpXocX3kldoly43DbGF/K49obFdfaMrJGNXTAce1t7
ANtoxiiHkncN5ZSb64+zE5fapBmhQqLSg2nNEskjr+Ie4jN3bi3Ewmg8MZY4VdHZ
YIEuZSk1Q0izEZBCiZv+FN7Hiv9HXRTrDs7XzYXzepfXWFEpsSvXdCBx+fmCQXQQ
STIBqBfb2xBNbXI95QpQLMGVms9N/w==
=PQcW
-----END PGP SIGNATURE-----

--Sig_/s2wB2/2tQWD7PCemrqsn=oG--

