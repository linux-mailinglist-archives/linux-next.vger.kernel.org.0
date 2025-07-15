Return-Path: <linux-next+bounces-7553-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC32B055A2
	for <lists+linux-next@lfdr.de>; Tue, 15 Jul 2025 10:58:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9302B7AF838
	for <lists+linux-next@lfdr.de>; Tue, 15 Jul 2025 08:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 917692D29C4;
	Tue, 15 Jul 2025 08:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="KkX8lgxQ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090DE2D1925;
	Tue, 15 Jul 2025 08:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752569862; cv=none; b=gUJGs4YdwyqObrpHvxkBIYbfj1NuzFwvNy9iDsGTRLeAt0AEqtDGcTkp+MClFZQGpfBkQft+dsj0vqzbfqVCas31bM5ufuQFL4KPjhqY0gCwu7D5QQ+QeHnhEQYaTa2Cr+oZeL88c1GWkakaUG0SdZJvTfMX5XUlM4Nvxjj4V+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752569862; c=relaxed/simple;
	bh=cHmMF1S1bpAEBQWZ/nneLvQGzfcIYdGHO6/cDM+kLj0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PMlhfz7j/nDTjVDCDYWlpBoWnSUnG69o1yxUualxoF2ZHVgSq7f0u4wfpOsZOAejOSYES2Bb8e/TBeiVlR137ijgyLTlL0ZzzXomQhKJVVXcsacQX581lrvyUH6k+/N2+a/iBijWxdDwi+Y7qDCZx13Jn9/00LmCk80KwXc8k0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=KkX8lgxQ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752569749;
	bh=sUlVi2BYX271i4cx/EwcVDe5v4OqF0o0Pd540J1c70w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KkX8lgxQE5srcrwUbV+TVycrALaCOiZylPoBk7L8dyJ9Jy9FNE3QpPBEr9ZnU3tC5
	 h7B1inYy4Fxc1Yf3X4Oa2sjRmKbZOcxl/UA2a+f/IUNGeU6W4FA3nLpeuNIII6KyYK
	 ZmNW1VrAPX5WUCR4K3ckNPRdE+sFnEPQiy15lqke6ngnqOFl3lFOYcy+MV5uaHkFlN
	 kZ3PitqWxapmxESBhcsBUFAGBh6bK8f9/LMyomIZR5YZ4fggD/CcGtIIK15ewGguUz
	 GrOvWlM1PQ6jglxA/wdu/fjhpf/LoaXxyZXWFS3fgjlcXUFN/OJRCOx16S//J/7b8+
	 pQjBzZT2/zLZg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bhChP2dmJz4x11;
	Tue, 15 Jul 2025 18:55:49 +1000 (AEST)
Date: Tue, 15 Jul 2025 18:57:37 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Dave Jiang <dave.jiang@intel.com>, Robert Richter <rrichter@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the cxl tree
Message-ID: <20250715185737.5d9c75e4@canb.auug.org.au>
In-Reply-To: <20250715184935.7e7c75c0@canb.auug.org.au>
References: <20250715184935.7e7c75c0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/VFxzMnXAjSjTkjCG./n=Gvs";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/VFxzMnXAjSjTkjCG./n=Gvs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 15 Jul 2025 18:49:35 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the cxl tree, today's linux-next build (htmldocs) failed
> like this:
>=20
> drivers/cxl/cxl.h:443: warning: Function parameter or struct member 'cach=
e_size' not described in 'cxl_root_decoder'
>=20
> Caused by commit
>=20
>   8d41af0d378d ("cxl: Remove core/acpi.c and cxl core dependency on ACPI")

This is only a warning (I ran the wrong helper script :-) ).

--=20
Cheers,
Stephen Rothwell

--Sig_/VFxzMnXAjSjTkjCG./n=Gvs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh2GAEACgkQAVBC80lX
0GwuJAf7BCswE79vfDD1SEVsePqfhu2QjuDfOHgij9Xc/e4Wy/AbU6HcUitpUThL
9gXHHR77bSdkAcmPTnKZ+rBM9lgX2aQSR4rCIS2CDEE7jIkPv3RRmre5uW3xoE1X
GJSI55el0Pt4bjPcO5jAyAicrT8gSE5T/qqZqWrQWE7gcRXRLVBEhPbfv0D9BI2i
b2xAe1yQpHXAr9ZipMuKP8wBZeK9eSyWa09u7riNmF2wFVgnEpMpzSSiQ0GRxata
cQ0POkYi31e6FGy07v/agffhAtZofIIWiG4FfhVyM+MnD9QtcixxPIKF+p2j6gqP
0o327V2JXnkKYSb7dt3swzlMMGEBeQ==
=vzT1
-----END PGP SIGNATURE-----

--Sig_/VFxzMnXAjSjTkjCG./n=Gvs--

