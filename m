Return-Path: <linux-next+bounces-6395-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9224CA9E509
	for <lists+linux-next@lfdr.de>; Mon, 28 Apr 2025 00:41:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C75333AF1F0
	for <lists+linux-next@lfdr.de>; Sun, 27 Apr 2025 22:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECA1A1C3314;
	Sun, 27 Apr 2025 22:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="GERQ3Cm3"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D289E1FA178;
	Sun, 27 Apr 2025 22:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745793687; cv=none; b=cc8NaiIAUk6i4ozlucxgqzA2gJicG9FDFewKCOlsVIGbTd/6S+hgtmAVpCzQ9aQ9O5Vs01sN9sT2H8Wg5gQDE+N7eIGNIkae3oZ7H+ca5IsRpfH/EKHH10GjMEJY6PH2MXcpQsFlVugE2tkvvsYRzWGoYOGH8VAT9yVfQ4pOHqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745793687; c=relaxed/simple;
	bh=wtjd8L/0azCH9T+z6iWF+p97hxjlqggSKTwSzYAvbEw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=or/4GYAmcv4oIJ9x19WB7iqnHqesDtI/+wRm7ZNNL8GxImyAOkDfc7MlE8XEIQuYEUuJQ9EVXKKtPlqF4q+nXKt3Ng9e1C+mGvilqMEsKTArsiuav5LL9eIu9T3FTPcGryez3NKLpT7eWzZsDYPuLWPezfBCgwlVyjG3ZPfc9kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=GERQ3Cm3; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745793681;
	bh=h8Wke9512R7pLsZpDTyHYp9yzeWwTS+aTzs0lF2qGso=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=GERQ3Cm3q5WA0s/eHDRDK250fBFKxjgdWFLnsQiD14tCm8ZR8ZO1XQjMrDjEnbZwV
	 OmK7YU9vLMN/M96WDb8jg22p/faiOIuQdPSAIdL9C/pYnGNtF1wBFCLCjK+MF1JF+2
	 qCaZuWC7WGH6Rb8ZlkWgkjbNxFnCId63ztc1+vZlaMTrJnuMHzYVBcqHBn5FE381oo
	 EXa5vbd41973WlMc0WjkjgG5R/GQBvR7l2Gc6gsBC+DibXSrVKAsrTh3vMm/24ctnV
	 0FdF/2ggXVwwRzREEgiw140exQm+Ln2Y5zEqF5cDbfdJasbqFuYc2LUW3N240XKi2U
	 N75V+7GcDlt/Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zm1lL5qwqz4wcx;
	Mon, 28 Apr 2025 08:41:18 +1000 (AEST)
Date: Mon, 28 Apr 2025 08:41:17 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: luogengkun@huaweicloud.com, Andrew Morton <akpm@linux-foundation.org>
Cc: Venkat Rao Bagalkote <venkat88@linux.ibm.com>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, LKML <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, dianders@chromium.org,
 joel.granados@kernel.org, song@kernel.org, Thomas Gleixner
 <tglx@linutronix.de>
Subject: Re: [linux-next]Build Failure: kernel/watchdog.c:936:2: error: too
 many arguments
Message-ID: <20250428084117.31215b8c@canb.auug.org.au>
In-Reply-To: <339e2b3e-c7ee-418f-a84c-9c6360dc570b@linux.ibm.com>
References: <339e2b3e-c7ee-418f-a84c-9c6360dc570b@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5C_pjXH_9j8aHU6ya_il4iO";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/5C_pjXH_9j8aHU6ya_il4iO
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

On Sat, 26 Apr 2025 20:39:26 +0530 Venkat Rao Bagalkote <venkat88@linux.ibm=
.com> wrote:
>=20
> I am observing below build failure on IBM Power8 server with linux-next-2=
0250424 repo.
>=20
> This issue seems to be introduced by the below commit. After reverting th=
e below commit, kernel build is successful.
>=20
> Bad Commit: 6b07f9a0fa41 watchdog: fix watchdog may detect false positive=
 of softlockup
>=20
> Note: To hit this issue, one should first resolve this [1] <https://lore.=
kernel.org/all/e8bf676e-7bf0-4896-b104-ac75e1b22d2e@linux.ibm.com/>
>=20
> Repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> Branch: master
> GCC: 8.5.0 20210514
> ldd (GNU libc) 2.28
>=20
> Attached is the .config file.
>=20
> Errors:
>=20
> kernel/watchdog.c: In function 'lockup_detector_reconfigure':
> kernel/watchdog.c:936:2: error: too many arguments to function '__lockup_=
detector_reconfigure'
>  =C2=A0 __lockup_detector_reconfigure(false);
>  =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> kernel/watchdog.c:926:13: note: declared here
>  =C2=A0static void __lockup_detector_reconfigure(void)
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> kernel/watchdog.c: In function 'lockup_detector_setup':
> kernel/watchdog.c:940:2: error: too many arguments to function '__lockup_=
detector_reconfigure'
>  =C2=A0 __lockup_detector_reconfigure(false);
>  =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> kernel/watchdog.c:926:13: note: declared here
>  =C2=A0static void __lockup_detector_reconfigure(void)
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> kernel/watchdog.c: In function 'proc_watchdog_update':
> kernel/watchdog.c:962:2: error: too many arguments to function '__lockup_=
detector_reconfigure'
>  =C2=A0 __lockup_detector_reconfigure(thresh_changed);
>  =C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> kernel/watchdog.c:926:13: note: declared here
>  =C2=A0static void __lockup_detector_reconfigure(void)
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>=20
> If you happen to fix this, please add below tag.
>=20
> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>

Yeah, the CONFIG_SOFTLOCKUP_DETECTOR unset version of
__lockup_detector_reconfigure() was not updated :-(

This is now commit

  45c4eb661074 ("watchdog: fix watchdog may detect false positive of softlo=
ckup")

in the mm-nonmm-unstable tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/5C_pjXH_9j8aHU6ya_il4iO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgOso0ACgkQAVBC80lX
0GymOQf6AkqjWHoMD+xeE+Vc/n/Scxt9D4TlOKi7RAit52MZiyUNZoopiHxt+jqF
SG0qkc2oeuGBkX0c07GIKbVKuazvqCRfA7f2Nn1NRomDQOQrPtkCCbUAoU21SNJS
+8PyDVUzpEoF9/NF0cEfJ3eRKzetuQTuMpubGfnJLPOwqubWTSRqX1nprUbsVry2
fYLURanrBUT5aWBtCBderR+kioWuJS70qTVZiHuPnyrJ/PjmrhTaVftTm8vkfJCG
Ttx2X3MeWV//tuPAHGbh25wpq6zZaMkT8LgAwWK2koaJmNzEoA1DkN/C26KJZfct
9ZtKNUxT3r8OjJJaz6SuEq63H9Bl/Q==
=n8ip
-----END PGP SIGNATURE-----

--Sig_/5C_pjXH_9j8aHU6ya_il4iO--

