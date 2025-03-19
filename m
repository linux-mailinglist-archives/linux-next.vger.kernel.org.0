Return-Path: <linux-next+bounces-5884-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC42A68A75
	for <lists+linux-next@lfdr.de>; Wed, 19 Mar 2025 12:03:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 919D019C7FB8
	for <lists+linux-next@lfdr.de>; Wed, 19 Mar 2025 11:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77FAD2116F4;
	Wed, 19 Mar 2025 11:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="eCjPz2+t"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29106251788;
	Wed, 19 Mar 2025 11:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742382042; cv=none; b=Jq24noUerfMawOsfUJYvkYOFGzc2MnzwtL6d6BasohKBe5PrqO5R9PpHSIs3FrO8ctcKiQPqnII55YVou+VZFDI/i5PCQ/r8qhSuuq89L8HA/NwIkQjDEWeHrUq5rogUdXB6b2BRm10tO3gFlebE2cRjFAPJiJG2yqvt3E41t+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742382042; c=relaxed/simple;
	bh=CRi5LJZrWTWg2TEZaepmU8c8RU2lOgwsNIuuCn/+hx4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bfx8FZz7ZQXQC3UB9OZwwc6APN2U01cr1KezSHS5rxy+byd8jtF5qyiMrNKJeZO9ygeLUrJGsYOsNO/UvFwq+7nQx6ZKSEu2ueawQcrFSc9aLl9kaezAHvW3BEzmFlWyaTF0yx5fnNuURUPSZXVvCOPUz6jEFI/8OjHM70/DOs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=eCjPz2+t; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742382036;
	bh=CRi5LJZrWTWg2TEZaepmU8c8RU2lOgwsNIuuCn/+hx4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=eCjPz2+t7aQuVJ1tccvAB7dcTpLTQ2AOObmz8KX9F+2da+CuDJOkvoPD0sxmSKP6c
	 dHO9oM5KHjOnotWTjI76StXAdXuJY0J7t5QW7AXzDN37W0KpTQsFdOiH2cXxVupg8P
	 gRfhQ9xOYv47oAQt3qri346Lxa+yp+e2nMjj3Sm9yK92N6yK8eUC3IGzSXXizX0ZvA
	 mDf+JwcQ6WO9TJ7c7CO0Iw5IfWU3AKTKkE5JChZmLjnkfX4RBLhwp2S2S/c1alQB9Y
	 V9tjF86aMoRbW2EO17yAfK2J0LAUiXiDL8Ily8tGI0ksxhE3gey3zPrLaO5cyOimu8
	 HJzUqCC6kK7IQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZHm2r01Vwz4wyl;
	Wed, 19 Mar 2025 22:00:35 +1100 (AEDT)
Date: Wed, 19 Mar 2025 22:00:34 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Kaszewski, Dominik" <Dominik.Kaszewski@amd.com>
Cc: Alex Deucher <alexdeucher@gmail.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20250319220034.424ce383@canb.auug.org.au>
In-Reply-To: <LV2PR12MB579836A210FC20C79513D268F0D92@LV2PR12MB5798.namprd12.prod.outlook.com>
References: <20250319203449.386f9e00@canb.auug.org.au>
	<LV2PR12MB579836A210FC20C79513D268F0D92@LV2PR12MB5798.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3H5jk=lgKkfCBfR32sEUC1+";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/3H5jk=lgKkfCBfR32sEUC1+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dominik,

On Wed, 19 Mar 2025 09:38:50 +0000 "Kaszewski, Dominik" <Dominik.Kaszewski@=
amd.com> wrote:
>
> Could it perhaps be about the missing colon before "If set"?

That would be my guess.

--=20
Cheers,
Stephen Rothwell

--Sig_/3H5jk=lgKkfCBfR32sEUC1+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfao9IACgkQAVBC80lX
0Gz8WQf8CRmD+k3KNynS3REtWCUneEVyWLeG8EVIxOJZaNDQ9mksB0nzrbIKzp8x
Y7F5emstO7h8/zzFhllwtvY2v9WQYxJll9iKETWlEwLRgjILbV5f+4S55qLHjx15
kkKxvoY1MiZdv51Dv1l0fLM1ACch0LSfbden4/bQmFIA4VxFEQDudEL9wNTQHtb+
KcICtRPStncZvIvBc7hpUCVd4Wz36RvitkjAh4C3xht2CD4hwbEErSOYCZ7GX6vM
7ksSLP25LVGXkCX1Vf8sNT9Ih2/XnAEcpwc2aT3OopY7wPumesLMoc89pZe8NBEv
2Vv7CwvCwy8272SB+1B4cMiotggc5g==
=NwM8
-----END PGP SIGNATURE-----

--Sig_/3H5jk=lgKkfCBfR32sEUC1+--

