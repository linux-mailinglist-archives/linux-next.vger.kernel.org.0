Return-Path: <linux-next+bounces-8046-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF68CB2E885
	for <lists+linux-next@lfdr.de>; Thu, 21 Aug 2025 01:15:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B699A23D23
	for <lists+linux-next@lfdr.de>; Wed, 20 Aug 2025 23:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D79962DC344;
	Wed, 20 Aug 2025 23:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="eVGrjRgN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A652DC349;
	Wed, 20 Aug 2025 23:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755731754; cv=none; b=u/IYFeDWt7eiJXhVSOmviACeerPUW+X4WcU57WjnFrVZ9HGZCrp+b0NK2vL7VRqGVQOZOepYhL1jemkRyvBS9c+4ruNRVXP4AFSEAz2eEVCKR3g+P6fSPEHo8VOLRv1ZnHCfmjcwvER6aDDy59JAtJAnv2BOGLJG4luVB7NwdbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755731754; c=relaxed/simple;
	bh=4GS4XIcZdI0kIlZg/PQBpkbBQAVg560C20BDTOyNDyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p+zo2jXRA4bOifhotx1B/VAI8vXUqqg3i31lqugO7dSch3RW2i0KhKjEcxhb5dYMwrcppu5cLQaoPDWcHa4q0Ymccib81DjtMHaTVElLGhxRrr/7EkUFefEVzZGub16bYlG8gT1bc+PzU5tIndr1BtMTZGoMz8jhV7tdzg4EZi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=eVGrjRgN; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1755731749;
	bh=nCNrLTAvibZSKygPVR1PYilp7r9cUKKg0/4tHxtndPk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=eVGrjRgNL4VLfcHH6fko8p7Qii+Vv8ce1nzMneNvHYxNMQq0vIZhZpe7BQyFDLQQT
	 ivTHuwJsLaGXizfQdisI8FBQ6EX/Iga9cG4j4jlT1c2NTiVmCmNU/S3r6Cu1d9x9B2
	 XXpgKtyVGRvBvcQtW29sSNf06LQbXzKqGXLVuFQkxbJJCnXruLylwQeOML8qExmFGP
	 FScluGDIKuWbplSXFgfCfjfHWnJrzlNCmbnGLEZB+4hEOrQgROpY5vuvq+O/lr/HeX
	 jOuHMyuqSIwvPEC4ufbJHpuuNwKT5TSnJdXUIgloSkc8CI6LsvLT2Y1q0N1RlgFuHD
	 hHzemTYfE9Tiw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c6j4467yFz4wbX;
	Thu, 21 Aug 2025 09:15:48 +1000 (AEST)
Date: Thu, 21 Aug 2025 09:15:48 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Pankaj Raghav <p.raghav@samsung.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <20250821091548.4925bd63@canb.auug.org.au>
In-Reply-To: <20250818090559.3643eabd@canb.auug.org.au>
References: <20250818090559.3643eabd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/amCTPm0=NK29OMWW8RG978.";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/amCTPm0=NK29OMWW8RG978.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 18 Aug 2025 09:05:59 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the vfs-brauner tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>=20
> fs/iomap/direct-io.c: In function 'iomap_dio_zero':
> fs/iomap/direct-io.c:281:36: error: implicit declaration of function 'lar=
gest_zero_folio'; did you mean 'is_zero_folio'? [-Wimplicit-function-declar=
ation]
>   281 |         struct folio *zero_folio =3D largest_zero_folio();
>       |                                    ^~~~~~~~~~~~~~~~~~
>       |                                    is_zero_folio
>=20
> Caused by commit
>=20
>   5589673e8d8d ("iomap: use largest_zero_folio() in iomap_dio_zero()")
>=20
> I have used the vfs-brauner tree from next-20250815 for today.

I have, instead, reverted the above commit in the merge of the
vfs-brauner tree from today.
--=20
Cheers,
Stephen Rothwell

--Sig_/amCTPm0=NK29OMWW8RG978.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmimVyQACgkQAVBC80lX
0GwZeQf/deN8RqXgAB+t12Y6I4fxVqoOGVk7ix90Hq3rzlhUjGmr40o3IefcJ1j/
MtysuodV7RMJapsuw84kG/y2PAhTgPoZspq2TYRLLNWXV+RquZjpyJdDFgR9/k4C
ZMRX2Nut3o07biIVCuInlmwj0SswGsdD6rm56ZjQ4lCXBVzK7UZPKBu4R2U6eGQa
Uqnhb6Q8As9cGisaWqMzeKnAJJ/bU1WO2m0leFW6CXJ3/vItJmCsm99J8ANMskaT
yEswV2DiqrGBhSZysqN06DGgz2dfbyWYc03xZVjDr7tG4T/tNSlvThlcTCI8Pj30
sJ6ikya2/oZ4HahbS4M3I3d6kfvNPg==
=wiye
-----END PGP SIGNATURE-----

--Sig_/amCTPm0=NK29OMWW8RG978.--

