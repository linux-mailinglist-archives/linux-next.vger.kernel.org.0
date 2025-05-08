Return-Path: <linux-next+bounces-6612-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D176CAAF9D2
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 14:25:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE8E13B5BCA
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 12:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EF291DED57;
	Thu,  8 May 2025 12:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Ft5KV2yb"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095EB2253EF;
	Thu,  8 May 2025 12:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746707140; cv=none; b=KiOi8ongUGXdFeDZT/y/Mgp8pcVq98tzb6j6Xy04aUyZU9fKPKdaFOOLr/ey4BPNU2e0RJrCy5wjxUFPBJwQUIoE/FrieeFKzO/afHNvh29pkC/0O8j8XWyLonvzRzw/LtFU8FHdJImvifzFVm0G3oUfULmU9Hc5pKCZystqcMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746707140; c=relaxed/simple;
	bh=gCHJQCcbRSYIN0cE1qeXoLD24QyVQtR5eGLVxoooMa4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V3mJB69tUglWmExN3zJP3rppLXvtF2qW172rRHsfcfSNQwPBafRxIDrPa/jJgrD1YgQPGxOyrIOzhY31IYJhwUpR1BrZRQh4XiVnFhdCmY1DhoALxl46Jg/I/kZ2h2D41mCHKHt90RCDktUtzwbPmw1kemk6N4PwXpOvoBGIpxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Ft5KV2yb; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746707132;
	bh=rX4s752VsscDbXgQ3qyovnmqZcwVFUdWxkbxxpSISF0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Ft5KV2ybe9UIhy5WexFY9JbKtXSRWcmkCZl8H34ZmlI31pSJkWCQ/sVj2g3e5OBjL
	 B0jxCDuxFU2l7umybj46W/Xq9pz/5me04Wz96B9zvg87Wqv2J/ZfzDLa464IqAulbw
	 iOOzltwpiUfgGOWxjneLOSV+lx09pbhoaUzXtHCvmFGhrGYVh0h5KEQU9D94DEj4Py
	 eu7oD/4FuoFZL8BLb5WbOoGbI0+KlfRyhaG5bYAZWZi39t/GFSKXcyFNqWETVuXDwh
	 xcmhQc7/8ldfTPUJ1D8aypkCWLevsgA17vvMB4PcdcuHN5f7E9huYjI35BEgv9/MUG
	 VfIDUxs9HqS3Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZtWYm14dyz4xQq;
	Thu,  8 May 2025 22:25:32 +1000 (AEST)
Date: Thu, 8 May 2025 22:25:31 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: corbet@lwn.net, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, Dan Williams <dan.j.williams@intel.com>
Subject: Re: linux-next: build failure after merge all the trees
Message-ID: <20250508222531.0e7fab9c@canb.auug.org.au>
In-Reply-To: <3b35840a-7b87-44fc-8580-219ac78ad112@gmail.com>
References: <20250508184839.656af8f6@canb.auug.org.au>
	<3b35840a-7b87-44fc-8580-219ac78ad112@gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/157dxLOm3ktKXpY3aCBwMf6";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/157dxLOm3ktKXpY3aCBwMf6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Akira,

On Thu, 8 May 2025 19:54:08 +0900 Akira Yokosawa <akiyks@gmail.com> wrote:
>
> Please try:
>=20
>   make O=3D"$HOME/next/htmldocs" KERNELDOC=3Dscripts/kernel-doc.pl htmldo=
cs
>=20
> , assuming your $HOME/next/next is the top of kernel source.
>=20
> I'm suspecting that the conflict resolution done in
> c84724f2137f ("Merge branch 'for-6.16/tsm-mr' into tsm-next")
> ended up in mismatching path names given to "kernel-doc::" somewhere.
>=20
> Looks like recent conversion of the kernel-doc script into python
> has changed the behavior in such error conditions.
> With the perl version, you'll see a couple of:
>=20
>     Error: Cannot open file <...>/linux/drivers/virt/coco/tsm-mr.c
>=20
> , but the doc build should complete.

OK, so, yes, the build completes.  I get the following message
(multiple similar ones):

WARNING: kernel-doc 'scripts/kernel-doc.pl -rst -enable-lineno -export -exp=
ort-file drivers/misc/mei/bus.c drivers/misc/mei/bus.c' processing failed w=
ith: [Errno 2] No such file or directory: 'scripts/kernel-doc.pl'

So, I used "KERNELDOC=3D$(pwd)/scripts/kernel-doc.pl" and tried again.

I got these (new) messages:

Error: Cannot open file drivers/virt/coco/tsm-mr.c
Error: Cannot open file drivers/virt/coco/tsm-mr.c
WARNING: kernel-doc 'scripts/kernel-doc.pl -rst -enable-lineno -export driv=
ers/virt/coco/tsm-mr.c' failed with return code 2

(and a few other innocuous ones)

So your guess is good.

It would be nice to have the Python kernel-doc fixed as well as the
devsec-tsm tree.

Thanks.
--=20
Cheers,
Stephen Rothwell

--Sig_/157dxLOm3ktKXpY3aCBwMf6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgcorsACgkQAVBC80lX
0Gxqtgf6AqxTVAVlo03cWs5oBXUAohOPXubxx7PsIP4HmVUWkJerRHcYi2HFV7xF
3cHtzJngRGnFMwd9k0Adwktilr6O1NdA0EVj6Sjn7HyrSsDiSoFYYgkfqOwaKv6+
t88dClMmY7meMzy9BktUqgMHzHdihtclHQuKCGrLbsr8D/my++nT5wyRqc30kgzN
wGTZ/55StgsE0cwkPSs4T0L81oiae7A4bUiy3t1I2WeThMdD+z3cxz1vKB01dUgS
+OF8rLQujNdbzwWW2dWQkeWJET/XuPUMkrqY8jejcWRSTOai4Vfu6/YcwTup5p1S
/IbZ5tvPCSZaOysjrQBMvNt9u+4Yfw==
=4/Y1
-----END PGP SIGNATURE-----

--Sig_/157dxLOm3ktKXpY3aCBwMf6--

