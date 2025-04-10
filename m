Return-Path: <linux-next+bounces-6196-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC49A837E8
	for <lists+linux-next@lfdr.de>; Thu, 10 Apr 2025 06:40:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 133161B6155A
	for <lists+linux-next@lfdr.de>; Thu, 10 Apr 2025 04:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3AC41EB190;
	Thu, 10 Apr 2025 04:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="I6ATp2oQ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15335259C;
	Thu, 10 Apr 2025 04:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744260019; cv=none; b=gUttJPOqr5xao9xDW1PE2ooz3Lj3J48vszXla0CvsO+PxEDphfadMUKBuxZK7SvtH540Oj/Ja0Gmo90n2uO4DIPyaC4pXMEx0EIgDCpvjpXSO/zgIKL7QLCnuYWu3wKq42fe6Obj0dc+bmv0Gc3BBPDsZlkGELKnqWqfqfoqcFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744260019; c=relaxed/simple;
	bh=dgU+r1Kd+5sVDT1q85+jZqDo4nSjljnAEFJdkLJ5Lbc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DF4JMHBIxJw8uwt0W/cJIzCc6tOCOFr7SIlljtJRhnmIIztmFIISZKsH/OLBpIKYsP8T2VCawoCxJTG2CsXlsCYFjZ+8P/Ukfqo/Oww4fQm17upznRVxfsM7g1eZOY1auwm6F/nHc1a1qOahO3amb1K8ppby7ZG4sdtPG3+MyJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=I6ATp2oQ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744260011;
	bh=rltrVT1Cc74K5pmQLyPNXg9Ms+Yl+JLn5rcLT2KUgOI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=I6ATp2oQq9yyJpaX9B8fBZVxGY8W72YyzmBPufVYQBxbof8s0PXOlbp6hrNPI7mqo
	 m0un4vSMg5wdinQGwXC55EWFizjOICUWPTSEU3pGzmZPvw0BGN/paZfJ4A20Upqa7O
	 +ccAHFlKOzDnBguV3x7OpSX2BSkLuNqz4FGiFGxlcPoWaqzK6nkFp1ZYsjRopmWV8G
	 LN04IM2rMhdw+NDxbCHyE/QvcmWFmIzo3zc2ny8aM0Fy/uWvZwPLs128A6Rtfz+mO9
	 rgmHDtH93RfL84w+Ukq1Kk5mMvnspw2IUQhh6WMOhFUKzxwbxMuu/5r5/feHXo7BzB
	 LU32rtJilPXNg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZY6Yl1dCwz4wcD;
	Thu, 10 Apr 2025 14:40:11 +1000 (AEST)
Date: Thu, 10 Apr 2025 14:40:10 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Dominik Kaszewski
 <dominik.kaszewski@amd.com>, Roman Li <roman.li@amd.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20250410144010.502f7802@canb.auug.org.au>
In-Reply-To: <20250409131035.1df305e3@canb.auug.org.au>
References: <20250409131035.1df305e3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/V4lgCNzN2lW0tg5YojRK4J+";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/V4lgCNzN2lW0tg5YojRK4J+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 9 Apr 2025 13:10:35 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the amdgpu tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:646: warning: Function =
parameter or struct member 'fused_io' not described in 'amdgpu_display_mana=
ger'
>=20
> Introduced by commit
>=20
>   ce801e5d6c1b ("drm/amd/display: HDCP Locality check using DMUB Fused IO=
")

Today, due to changes in the kerneldoc software, the warning changed to:

Warning: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:645 struct membe=
r 'fused_io' not described in 'amdgpu_display_manager'
WARNING: kernel-doc 'scripts/kernel-doc.py -rst -enable-lineno -internal dr=
ivers/gpu/drm/amd/displayamdgpu_dm/amdgpu_dm.h' failed with return code 1

--=20
Cheers,
Stephen Rothwell

--Sig_/V4lgCNzN2lW0tg5YojRK4J+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmf3S6oACgkQAVBC80lX
0GzkMAf8CQOnqqEHZ3SGcrIg5O0bCP4GkikQu1ss8W0vbZnhu1JRuWYHjsgMiKVZ
/e/51RB2zK1cayGcHhiDUw1vGdlq1GFJg3cisA6iHfuzXUf+ptit6/5DbxuKsOGC
q4ud3JPG4j0DkrMIHaCivNkOEWNNfpTi+8TyeKl3SgAWQx9EWDACgZxMLiKT+CCl
Srv0orIhpJ2Wg4C8thu0vs+xNaaq9qgUh1MdzXk0L3EgSLdDQcvOh6owuOfOvM4X
c1HtaS7yPHjH6suWepkoqXCwE4UwdvTNSY/G+f0Zt9dxmAIZ3u5nODetfKaev3B7
/txgT7bbXvk2kvrwaJc2vrpkBdUAMQ==
=UQ9A
-----END PGP SIGNATURE-----

--Sig_/V4lgCNzN2lW0tg5YojRK4J+--

