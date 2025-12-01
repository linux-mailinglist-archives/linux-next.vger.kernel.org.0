Return-Path: <linux-next+bounces-9289-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A28C991A7
	for <lists+linux-next@lfdr.de>; Mon, 01 Dec 2025 21:58:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A1088345527
	for <lists+linux-next@lfdr.de>; Mon,  1 Dec 2025 20:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83F3F26ED59;
	Mon,  1 Dec 2025 20:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="jnxdZCD7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98612376E4;
	Mon,  1 Dec 2025 20:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764622673; cv=none; b=dLcNvo4Jsz+NK1KTPXOt4dElTlyLtmKFrtKzIctNFFJNOpt1j+whDp9NPaeH+BpqIlEWvPdju6nXL6iI93HVttm/hJdKXgvFRu3MEyl3pufrT9ck/srzVRb1yLADmI97QXW+1GQZyWrnzo/uvuaHmDXQipnaccQC7va+xnQPL0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764622673; c=relaxed/simple;
	bh=K6VzkbakN5L9TTtWa/PmcURAHX9i2Ltb3/Cy37/edZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u8EZsmtlTL90+55MBXiN0hnV1swn00iUh1bWUpzu9LsCN8VDk32PkXtCiYAc26gjHQOPKhd3cGJC/bvMkFknGOjY1bNBwNCPImDMe5AX6j+XnzRo3eYv6mMqEvpVfbNKIX6JSIWiuSYLdaRPsPR7iYP+qNW3hPdM5rqAgHtEpv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=jnxdZCD7; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764622658;
	bh=K6VzkbakN5L9TTtWa/PmcURAHX9i2Ltb3/Cy37/edZ0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jnxdZCD7XprSukUYbZceoXNtlB1v6yZr6tn4GsoXhtEo22EINNj8TXxjGCEWniqcW
	 cS7Ix1i2RyoXDmzuNGflWqkS+MEg6/zu/cpcdBi7Y41QZfNmMgjig33pDmz7pMSMuI
	 CQ9Pe/apkKFKvcEAronRoUXqwxi4jjlGyA0nm56yE8zegAqVUZ6fGlwJFt4w8ilX3r
	 ZgedjA2Jizeh4q2+MbfHd5qaQwz3Glp1RnehbYKiiW+vWKxtfKTiVaHpbK1B6OYMBm
	 +pV1RWdqsuU4nO0gBxD4RamhX5p1+cCISBEHz4Q4mDXDgshV2jSiN4wR9bVvgRmoW8
	 WFzl4jE8vrrzg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dKx760KS5z4w23;
	Tue, 02 Dec 2025 07:57:37 +1100 (AEDT)
Date: Tue, 2 Dec 2025 07:57:36 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: <dan.j.williams@intel.com>
Cc: <dave.jiang@intel.com>, Rakuram Eswaran <rakuram.e96@gmail.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the cxl tree
Message-ID: <20251202075736.753c995d@canb.auug.org.au>
In-Reply-To: <692df82fbccc7_19811004a@dwillia2-mobl4.notmuch>
References: <20250822091206.7d0d57be@canb.auug.org.au>
	<20250911093554.0ce45f3b@canb.auug.org.au>
	<692df82fbccc7_19811004a@dwillia2-mobl4.notmuch>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MfYDb.EA/QiVfu8cJkRyYMp";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/MfYDb.EA/QiVfu8cJkRyYMp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dan,

On Mon, 1 Dec 2025 12:18:55 -0800 <dan.j.williams@intel.com> wrote:
>
> Stephen, may I request that you add Dave (dave.jiang@intel.com) to the
> notification list for linux-next reports for cxl.git?
>=20
> Dave is running that tree thesde days and I had not realized until now
> that he is not copied on these reports.

Done.

--=20
Cheers,
Stephen Rothwell

--Sig_/MfYDb.EA/QiVfu8cJkRyYMp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkuAUEACgkQAVBC80lX
0GwkeQgAiubOd42HjcFxUg26c8IKj3PC2nmBc002f7gp/6TAv1+q+e6KIzbh+41h
obBDWSEScRg/ukXP9zU0IC6yPhFH0bEWIf+L0sDaPPWZAAsnbvtFAtTCgv82Eo9Z
yb+a0/Eb8PEvb96vcms7Wh/+Y3LCtsGI/4nSUUDyMfVTpkRhLGSZClCQ/GIkr/VJ
yAt4TpTqMetd2Ii3pi3JgeQ9MeOjI1MIgb565w5pfzYw1EitDPK7MbXk+fD9Zgp2
pq23BoaIFPwy8eD2zOeylbP2OkppsutK7X5C1VNymMRBxET2k2rdoGgt0v74Yuq5
rBv1FHC3pj4ujmAP199NKVV5iMfaIQ==
=aaxl
-----END PGP SIGNATURE-----

--Sig_/MfYDb.EA/QiVfu8cJkRyYMp--

