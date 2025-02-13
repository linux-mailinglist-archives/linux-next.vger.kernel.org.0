Return-Path: <linux-next+bounces-5431-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 18581A333EC
	for <lists+linux-next@lfdr.de>; Thu, 13 Feb 2025 01:21:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4016C3A6E8F
	for <lists+linux-next@lfdr.de>; Thu, 13 Feb 2025 00:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FDF335961;
	Thu, 13 Feb 2025 00:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="tTurbWUj"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED8E2A1D1;
	Thu, 13 Feb 2025 00:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739406055; cv=none; b=QiKr0uqMQRZ731l+URvL5GNl4AGKbpOL5j0SEUj3rAa9fG4zf52ZsTvdW1l5sjJbO9ao8U6DslK5lyv1cQUVkVZBsDpd/SjWh8CwwDj13MFFo71mH0K5ftP5YFJ2j4QtTF7N3OVjmlqceFPToNIwo4OueNWSHYPlfb92aFDwdU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739406055; c=relaxed/simple;
	bh=Uze1rABa8sIUopEhSCd6Hm49KaVlltIaf9z/O9ucjlo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eGaBMp+FShXcHgr/rCGJNT8eI45rZqYZpvd0ebb2+nngVspwgSftjHnDm2vg+vXAQDYE8kwOifKnJAJj767ZdHky7FbANhLN4oGZDyQqt06UhuZOqSbRIltVBX/BDnHLkwhbylc1oh1hyfugPq3CvzGVtyFOaiCOwnRUcY3i1yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=tTurbWUj; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1739406048;
	bh=Uze1rABa8sIUopEhSCd6Hm49KaVlltIaf9z/O9ucjlo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tTurbWUj4apCgT7t5Zp/v3wfhV/4CISzmfyLg621YLWTtdS/dGumsk8toXDiCKYgy
	 xGT87iSyY7BSiNO+oeFqSsEj0nvqYm6irzEL2oDb98l8LIf60YTaV7xSIIEJp14nmt
	 2RPfE3civkBYBmsLmiv44EThezNIqsoM+YusavK5SG4Xr5Xt4rJgWSsgb8kmkXGWy2
	 542+SQhsl8HTJTWuIOIru+6p4yfsT57IGujHcBOwa7itfMZH8u6mklagN5TT19hroR
	 EdCoWuChaAXpbTy4t1nqmuQxBCj8HyRGK11UhHuLpGvQdPGNYbJ74NpRP9Cdwlj/nn
	 Wo3Dr2xGyU87Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YtbSJ0J6pz4wcm;
	Thu, 13 Feb 2025 11:20:47 +1100 (AEDT)
Date: Thu, 13 Feb 2025 11:19:06 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Richard Weinberger <richard@nod.at>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commits in the uml-fixes
 tree
Message-ID: <20250213111906.1e8d2944@canb.auug.org.au>
In-Reply-To: <2038149484.28376811.1739400158648.JavaMail.zimbra@nod.at>
References: <20250213092427.4f149099@canb.auug.org.au>
	<2038149484.28376811.1739400158648.JavaMail.zimbra@nod.at>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/q/qN0lDSPgE5cpW8L6DHXj6";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/q/qN0lDSPgE5cpW8L6DHXj6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Richard,

On Wed, 12 Feb 2025 23:42:38 +0100 (CET) Richard Weinberger <richard@nod.at=
> wrote:
>
> The branch was prepared by Johannes before the merge window and now
> I have rebased it to v6.14-rc2.
> So, I'll add my SOB too, ok?

Yeah, that would be good, thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/q/qN0lDSPgE5cpW8L6DHXj6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmetOnsACgkQAVBC80lX
0Gw2Cgf/avGBVjaUGpLm5VHUsgZziwPxV0yKsV/yugEHWmwfq73Nr5ljC8sGhR9Z
kXpxhRoOiWIQTGPBoW6poUa580IeOb3hZIDfmThb8s6PXFPdzgC5xAg3m2brYRZo
N/MFPjg/DnpfbjqOaqQQVDuI28SZAwIIhziNQq8vyq2MarFTv8SQ+NhBJVjfWdBn
FK6K2JPS1cmVQN7lQV+/YT07gjBO0j8r2yhJwrg38rVLb+ZuwmUTJ0QSeyTUuEP5
Sh4gxIiWzjouxQF6aRgmUoMOg2zZbgwd2I2BH1xqJ78A+ZuoRqURwRND3aE+Rlo/
MH5XuVlOCU7bJQbl41JNiCP7NBLaRg==
=5Tpo
-----END PGP SIGNATURE-----

--Sig_/q/qN0lDSPgE5cpW8L6DHXj6--

