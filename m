Return-Path: <linux-next+bounces-9413-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84190CC069A
	for <lists+linux-next@lfdr.de>; Tue, 16 Dec 2025 02:04:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1EB6C301E359
	for <lists+linux-next@lfdr.de>; Tue, 16 Dec 2025 01:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 339F8158538;
	Tue, 16 Dec 2025 01:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="reAptcBr"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1150B22097;
	Tue, 16 Dec 2025 01:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765847058; cv=none; b=JoMLfubKlcu15ULIDvV281lZnJengINQ87e4Eo8KHpYqMGq7DGVG0eRQ1w3/GbwdvmP3oY1PHTILn1FMDivoEcVq3aSIbS+1vMuE/nczj0AP13gIunQMcS9jHh+zzd80LAzWFxhUvyusT+C+4vf20Udj1YF6XUUPFGYVsQSY97E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765847058; c=relaxed/simple;
	bh=xu2pueqppoHgbuQntKnuX7CRbM+g9oHUpXjwWqHBZLI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kf5i4tJYNQNs7Rz+oxlZ+nfOCb2ZZV1qPCeH7s8qrX9DQ5bodTuea+WIB0Z+JiobzRjLiAd8JzLBvU/SW98CsnB3tGOJk2PLndtTbqAIpWKOlTR5q+CMOedP4WUZXCOoIA0Av4vQ6ajRYsZ/pHAGNM5sCkzJI2WirjA944eYtck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=reAptcBr; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1765847054;
	bh=FgBKxk2oSOsduDe/P4YZbjYHrMuYZqN20JZ4aYSI6hM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=reAptcBrTzt3x80A7OaEdqkXWXDNlJS3cRXhIiJbCgCW9nH3C1DeJRgI+CDV+WLPg
	 ys0w8CC1sUXMgPFsKGw09rDpwRoL+aZOdtw9hN89FDi4K2ePSBbsKZnhvx+UDC/HPV
	 XftRr/SZqxpTi2zjcpiXRwHkoUxIG9bTv/aOGBBYTdOmJdkX8P3ukYHFItppJYehcG
	 c/15YoT55EfhE83uAwtsaD/3hFTXs0Jkr08uwssdz1RFnTaK6U0TR2+Tx1QYwM2pRA
	 AGLRhFXRjZ0Y/aDBPyryu3dUEky/RKI509RgI8w8vKYE5rW191ShRLwLn72Et9luXj
	 CVfUn0gXl2LqA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dVdxB1rh8z4wCm;
	Tue, 16 Dec 2025 12:04:14 +1100 (AEDT)
Date: Tue, 16 Dec 2025 12:04:13 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Lyude Paul <lyude@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the drm tree
Message-ID: <20251216120413.5eca4194@canb.auug.org.au>
In-Reply-To: <20251106151103.2f1d5e00@canb.auug.org.au>
References: <20251106151103.2f1d5e00@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1iyXKLmPqaatZP.IwUyFEwS";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/1iyXKLmPqaatZP.IwUyFEwS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 6 Nov 2025 15:11:03 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the drm tree, today's linux-next build (htmldocs) produced
> these warnings:
>=20
> WARNING: drivers/gpu/drm/drm_gem_shmem_helper.c:104 function parameter 's=
hmem' ot described in 'drm_gem_shmem_init'
> WARNING: drivers/gpu/drm/drm_gem_shmem_helper.c:104 function parameter 's=
ize' not described in 'drm_gem_shmem_init'
>=20
> Introduced by commit
>=20
>   e3f4bdaf2c5b ("drm/gem/shmem: Extract drm_gem_shmem_init() from drm_gem=
_shmem_create()")

I am still seeing these warnings.

--=20
Cheers,
Stephen Rothwell

--Sig_/1iyXKLmPqaatZP.IwUyFEwS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlAsA0ACgkQAVBC80lX
0GyE4wf6A+MdgJAFyXvXinRWvmCFUF/jHxceoc3q6VTVREP90Gnu3HnrA7Ce3zsI
EzrHWxoGZAmEpZ3i2UiAf5tSpOMETHN1o32I31mzor9Es4sO6Mel2ycOh/nwbnui
yJ35nnO/9txoCbi8t/1DfZo9kbDojwv8OXWab2ZJjByB7/Dh5aFw1FUOcJO3k/MQ
UFgrQ1we6QrB8DAmREMNpJ4etsIlymuiLoL/t8roGnoBtMH8ayH6fPRrhjM/MIkV
6uH2tUPl0bXcjJE8XJo4+K3S+1nyE8DW0S5k6KFGDOiVrcux5RTCu4x7ZQAm97OD
UccQ6GSO57XTt6xfsJantI5LpfWnyA==
=jLkj
-----END PGP SIGNATURE-----

--Sig_/1iyXKLmPqaatZP.IwUyFEwS--

