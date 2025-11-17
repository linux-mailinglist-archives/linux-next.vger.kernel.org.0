Return-Path: <linux-next+bounces-9040-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 87758C62844
	for <lists+linux-next@lfdr.de>; Mon, 17 Nov 2025 07:30:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5BAA04E3220
	for <lists+linux-next@lfdr.de>; Mon, 17 Nov 2025 06:30:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3468315761;
	Mon, 17 Nov 2025 06:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="rwM4FagE"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2179D74BE1;
	Mon, 17 Nov 2025 06:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763360998; cv=none; b=bzFu/vbDeYbrv/dW/QmHmQFoL8qzdfiuVceDB97qCCUuBsNULwk6O0I60Dlv5JGEQsc5F+2FcIV5UGAEd+bQhK+9+2vQLfcYQhdYtSRI5Hq41utd+kqCK48Gc1VMxZDDjDmu2bC8nE84EfFNnH46hR+5R/XCJqpJe9MaaQe8He0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763360998; c=relaxed/simple;
	bh=oj5CQeWURbx2eYKkfldhh0/4RigUdTC6X44MGsmIri4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FcvDe9T53Ixd6Pf03JCNmAdu6/Y5EI2ZlRsLxWXBv+gHclNrn4di/jN8O51mJVlWJVrL9pgKjiv7nZ+tvm0AsPjT8jwqF8VsfFa+KFE1AE1gdEwUopHii//T+xIeW813frBh3BTBw0EPvjN4vNrFmgQXJZrDliumm9fHfxAT1fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=rwM4FagE; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763360989;
	bh=dM423Ay4QdeuLKnovqGWo2XNgQGEhEyMDZKHTtkh9uI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rwM4FagEpZ/j4dHbvmc+kIDVFtc/jNypMKxcvYYGShVd3layUPRVNy8KoFH4z+3ub
	 VyGycY9Ewu0uKEoDbOOdIGJOcS+HAuEF59gbEYFPSq9qTH67vdmUqaDCacflyicKmh
	 QX3xS0h8Qe+ZPH87k0zrOgeKIlykTZegGixLmmCdwbPBD2GU+HuOnLTYm9b3aBZKff
	 /UqENqsG4xmaCEIqlWy/edwPdNL4gBmmtnBIpNEzxRE70HtTfpJ1oBeV847KDAn7+q
	 fpDQgvxPxmou1TS9v7iU/h3Rr/Z2brYjso7ab+zcPYeh4Veox4bQXOW7+r14FT2Dg1
	 APr1vIQf60HUA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d8yXF23F5z56lV;
	Mon, 17 Nov 2025 17:29:49 +1100 (AEDT)
Date: Mon, 17 Nov 2025 17:29:48 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Michael S. Tsirkin" <mst@redhat.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the vhost tree with Linus' tree
Message-ID: <20251117172948.6095ab57@canb.auug.org.au>
In-Reply-To: <20251117165118.2163d5e7@canb.auug.org.au>
References: <20251117165118.2163d5e7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/eR3AOjqgqj2.K+t_tyWMim1";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/eR3AOjqgqj2.K+t_tyWMim1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 17 Nov 2025 16:51:18 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
>  +    (KernRe(r'DEFINE_DMA_UNMAP_ADDR\s*\(' + struct_args_pattern + r'\)'=
, re.S), r'dma_addr_t \1'),
>  +    (KernRe(r'DEFINE_DMA_UNMAP_LEN\s*\(' + struct_args_pattern + r'\)',=
 re.S), r'__u32 \1'),
> ++    (KernRe(r'VIRTIO_DECLARE_FEATURES\s*\(' + args_pattern + r'\)', re.=
S), r'u64 \1; u64 \1_array[VIRTIO_FEATURES_QWORDS]'),
                                                  ^^^^
oops, I will fix that up (should be "struct_args_pattern" I assume.

--=20
Cheers,
Stephen Rothwell

--Sig_/eR3AOjqgqj2.K+t_tyWMim1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkawNwACgkQAVBC80lX
0GwT3wf+KVWSRpW/GN3tSju54MCiTr6EL11mLn4H63u2IXBT++bz55eUvWqtxVhQ
rlgifzuPQbEFFCHyOTSqih0NG7mmtI4W1Q9vli8YqA7J8+IyuPKsTctjeZmroXat
mJvVslijzV8sPOmMyqY165pWZ27BrKA4x5f5DC0vCvesi4pkAqW3oHuP1yYZF8ip
6dDL2IfvJDq84fe6nvPdjBSxq0+GWB4VdR1B874mgE7WShi8y3midt1b1IZ2q9V+
cRUQos7ZAnabSkKsHPe3GNq+f3WpQFpFU9yzj0e6kQUY2t/S/bw/QJq4WcdJsc0x
tVPTFfnvfvAVJg5hmHdQWLzQBfXFUA==
=4+fV
-----END PGP SIGNATURE-----

--Sig_/eR3AOjqgqj2.K+t_tyWMim1--

