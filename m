Return-Path: <linux-next+bounces-8238-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AABCAB49CD8
	for <lists+linux-next@lfdr.de>; Tue,  9 Sep 2025 00:33:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 559EA3B8B4A
	for <lists+linux-next@lfdr.de>; Mon,  8 Sep 2025 22:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 237C52E1EF8;
	Mon,  8 Sep 2025 22:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Sccjw1ZZ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FCF2E0B5C;
	Mon,  8 Sep 2025 22:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757370796; cv=none; b=kDN1/cGiJ092TO/4uMHRfcnaSYOppH2g71ahmE17CwLs8pypNhoUwyuQnOycGdu1dHUdG9p/HLht6ThJ1h+l9Wy/i5Vf2oqLNMXUZqicoSFtHXkjQ4z8LJc7jNrfY730g9N6h0RG/CaytXBjV2CF6oYPBboGkhz+QOdraVlmHes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757370796; c=relaxed/simple;
	bh=Bv9DG7NvEACmkngPR29kVONkJ+uhR6cw5LiF6tkIktc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tgmLp2Xldo6wtqM5PAXxr914bxubFjkrirlnP9t6+ueyTkKdtJ+OFrVOhdEWuGAM9orv0fTjQ8j+YFJfmQ2l8Yb9ShCy3DKYBAGTWyVS+uIC0WO+/3x9wQ78GdaXO4ZGy5GjkSlzJPPnwXDHyyBgtWNvzRsNqDfaInToCMiYE08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Sccjw1ZZ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1757370781;
	bh=j0CjhsWMQ8bILkY81kFCeQtJHCh+PKx6p+HnmsFuj8c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Sccjw1ZZxKrM+PrUHNokR4nHFXslIYa5lL4M2f61kS1OmXDjH6pUXvHi+hqflbAox
	 frhKMGbw7WzffOzbu1gvuUVzQnuvohSPC33IZ5PHk9PPbd+epBn86RlQwHqHDf6jH+
	 5NwbaXlfMJ7CEUTgaACSHpissrGnOXXdXiBFo79DYrKYPPcJZpsFDQWLTq921P/1To
	 KMuytcY8jbisytq9nrZ0q4cgUHGk9EfEQmgn2X4he5ZVVutlwH7TTeqbIZ1h35CJce
	 56+iX85NNp24v9UaEXvYayvNpcg4jU8lJhhNt2UxmzNejVR1V/5eXnV7GUZ5ECH6lk
	 CSUPfcvuRv/AA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cLMCx1WfYz4w9W;
	Tue,  9 Sep 2025 08:33:00 +1000 (AEST)
Date: Tue, 9 Sep 2025 08:33:00 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Thomas =?UTF-8?B?SGVsbHN0csO2?=
 =?UTF-8?B?bQ==?= <thomas.hellstrom@linux.intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, David Gow <davidgow@google.com>, "Marie
 Zhussupova" <marievic@google.com>, DRM XE List
 <intel-xe@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the kunit-next tree with the drm-xe
 tree
Message-ID: <20250909083300.23c7f85a@canb.auug.org.au>
In-Reply-To: <deyhm73xdrnlau54pycgquovbdr2pcqzeumdegavukzly6d6hf@xtgrsovs6i73>
References: <20250908172938.68a86c52@canb.auug.org.au>
	<deyhm73xdrnlau54pycgquovbdr2pcqzeumdegavukzly6d6hf@xtgrsovs6i73>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fCzIml7uGaiMiE9g1lgiliu";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/fCzIml7uGaiMiE9g1lgiliu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Lucas,

On Mon, 8 Sep 2025 08:26:37 -0500 Lucas De Marchi <lucas.demarchi@intel.com=
> wrote:
>
> >diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/test=
s/xe_pci.c
> >index e29ec1ce7231..c789bfb8af96 100644
> >--- a/drivers/gpu/drm/xe/tests/xe_pci.c
> >+++ b/drivers/gpu/drm/xe/tests/xe_pci.c
> >@@ -66,6 +66,7 @@ KUNIT_ARRAY_PARAM(platform, cases, xe_pci_fake_data_de=
sc);
> >
> > /**
> >  * xe_pci_fake_data_gen_params - Generate struct xe_pci_fake_data param=
eters
> >+ * @test: a test pointer =20
>=20
> to make this the same as other functions in
> drivers/gpu/drm/xe/tests/xe_kunit_helpers.c, I'd document this as:
>=20
> @test: the &kunit where this fake &xe_device will be used

Thanks, I have done that.

--=20
Cheers,
Stephen Rothwell

--Sig_/fCzIml7uGaiMiE9g1lgiliu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmi/WZwACgkQAVBC80lX
0Gw2Qgf9G5DfQ35QsjsrOwOWWGW//o4zjRNSN+zjMn379K3cGph1cZupBVcdhvar
Vy+Dz74c9oUgMDprC2RWKh7Sv4eu4ZhgjitR9etA4OlSJ+aOewrWY0duznWhEG2R
y2OwEAFWaT5L39XV83BcuNEBc1EOC4Dr6zVWu77yxCcG7ip6go6/3Lq27VU4UybR
QnHKDB06zz1sCV2K/gmeRVwOYvCXrdUFkGOKuSp6e+k1GNachf8YEKHGM4ZWC61S
syeYlIBxyXH/01WjgF83LrTUh1/lcHKi8EPDqAMg/5YjHpa83xSVTb7IezzcaBEV
JOIqwSUDnVhFgo/Ae3pmyJN8I1ZgVw==
=mZLu
-----END PGP SIGNATURE-----

--Sig_/fCzIml7uGaiMiE9g1lgiliu--

