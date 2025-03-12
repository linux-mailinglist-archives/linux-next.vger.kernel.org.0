Return-Path: <linux-next+bounces-5757-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F15A5D462
	for <lists+linux-next@lfdr.de>; Wed, 12 Mar 2025 03:31:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D78383B894F
	for <lists+linux-next@lfdr.de>; Wed, 12 Mar 2025 02:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B613B78F26;
	Wed, 12 Mar 2025 02:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="JXnx/+oA"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64869566A;
	Wed, 12 Mar 2025 02:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741746658; cv=none; b=m6RkBHeEbwRfwBMH+/Zvao/e8I6R1vJmjmC1/NdCynZB5TzosPgpd5+l3S6XQ2XdNtkzZFXhLoyIywdau53RJZLzt6TTU8fVr7wYPbnM8kEZlW/8TaUgjSkIIp06FUDvVXknLc/HXFaiOf4XXdpIHoGPGM/YkOL470ZZyBf+I0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741746658; c=relaxed/simple;
	bh=Rs8den/fX1H8sYAS/HU3SQBgVbI8FDQo3dYey2vIAYI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iaXrEBx9G8GPPJvVhVic7llt+3aUIRfEnSCYuSY1dJ0MXSD6GONjNuGWJNztc+QvQ0WzIP9WZyJpJ2fIZOrnSYC6MzWVzCSmCo41KIOku6a2cvgzS92mwH87z1MQnY8vXRkpzp2iV8COJJlwxfQKzIo5kde54jNbxYrb6yWvdvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=JXnx/+oA; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741746652;
	bh=Rs8den/fX1H8sYAS/HU3SQBgVbI8FDQo3dYey2vIAYI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JXnx/+oARBIninFVaF8ZcQe3j4tR8Q92sc+5MDv4Y82rF4YCoO2eC1VG9s4WdqEav
	 QbPIVvxqhXf10rv3SQfTpzWoWwH73UJvdD3iTbwaqM5pF//bx2Esx3Dq4+cnQCoYJ4
	 14OpGG0WFRz0O8MnuvKi2Kcn+0vW4Nysjj5Q8EaDzUd7h+fw87AeTFvfboDM5AV/gz
	 Gkskw+fUmzs8eKRGP1L1DQQ2H+uvYGzCRZ0sEEQfBn84WMKPQv2PHKupqz9lqRpLsS
	 dGjjbluZMqtfa/ifVTqMIO6CjXw6UNaKUPzO1cBWGOFaIRFulRLV7XoYfsHSqEH/iu
	 /b8KielCTbvXQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZCF3v63Wrz4x3p;
	Wed, 12 Mar 2025 13:30:51 +1100 (AEDT)
Date: Wed, 12 Mar 2025 13:30:50 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Wei Yang <richard.weiyang@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mm tree
Message-ID: <20250312133050.1d23ed5a@canb.auug.org.au>
In-Reply-To: <20250312021420.nvkahcd3enlt3i6s@master>
References: <20250312113612.31ac808e@canb.auug.org.au>
	<20250312021420.nvkahcd3enlt3i6s@master>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/U_l2bx9bPlN7ZlxDmJntc04";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/U_l2bx9bPlN7ZlxDmJntc04
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Wei,

On Wed, 12 Mar 2025 02:14:20 +0000 Wei Yang <richard.weiyang@gmail.com> wro=
te:
>
> Thanks for your fix. It looks good to me.
>=20
> If it is ok to you, I would like to merge this into the original commit.

Fine by me.

--=20
Cheers,
Stephen Rothwell

--Sig_/U_l2bx9bPlN7ZlxDmJntc04
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfQ8doACgkQAVBC80lX
0Gx5gQgAkKtZ1XugBj9Iat7EI575bxJmVFFqh/SxPN/flLDR9lUNPaGVx0Awd16x
oP8GkFgCKKHKJCPbDb/ZmhYWZXHtX2k0o8LKSN+J6UInbrwy4dn+5B8fCpriUkeU
QyR6oQQG+LePPVNb2iImY5aOmWYqtlaYBj9a4ZmxhZN3L4tQh5dZ/8IQtSSnH7vZ
k8YBfTMDilSe98cOVK8uYy+SN3NWaHVatDlOXhDQF9xpcY6HBH+p7frasDbhuz9B
HOmvDmi8E4RsLjfqY4hIDA8wj1h81AcHc6BFK2ha6ZVhmnuxhfVf/3xe9SOVRNmS
xwALxslVsfiVEBJ2E9PaRSjO/wBXYw==
=L8yj
-----END PGP SIGNATURE-----

--Sig_/U_l2bx9bPlN7ZlxDmJntc04--

