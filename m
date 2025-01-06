Return-Path: <linux-next+bounces-5034-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C647A01D1C
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 02:51:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4A0418834E1
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 01:51:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8EE0BE6C;
	Mon,  6 Jan 2025 01:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="T5WfUDWf"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFD4184F;
	Mon,  6 Jan 2025 01:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736128269; cv=none; b=soEhwAAVZDs6SD/PMKb1/opDgbBMYLLZRdvKzEREq75cmvESnwI4DSMuiXKyoADx0bpHxSSjkRjadIOPg9+FYPo/pv9g8oNP9wdMUeNhefdomw3U5Hg3dCuqnLYNgZ1vzTT5Xqzp9lipwobKZFLzLIMz8DMmwUr0BDJMbFJHp0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736128269; c=relaxed/simple;
	bh=Heo8iqUxJpRIzrkFigrPuMTBXHU7LHG6AG7WEMCU3Ic=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jIcKuDUHFO9l+mBU8NvfvMQ1sKoHBOgGHAdoFYhaDeB5AudA/dlGrAQ7CM2S05vhNgo+/igC0MKoInegb3+4qbdoauEXsKNWfixleIqnCGvXYSix0O98YVYQSQkDzPaG4zEDr3ogsiyqEU7PxZD0g/uUuBB7b6I6c9G5YZiTY9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=T5WfUDWf; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736128258;
	bh=6ibZdhDTeJcSS/ToP+tHQS9w9kD6Ypbw/Skiio0OQDU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=T5WfUDWfWFM4YVBffvydt4wtg70qP/lBbWYnWACdjIXowYZhPwweM5nM7eqt1zD3I
	 faKxnoRpnoh0IgfsPbd8Kb8PWs7btM8H+H/eIvbRdrWmVwe9xgdUwcPW4YCYAoJSy/
	 8aV0FgRoQ3ZKdnXznCovxEqQb2j1djHWaU1+SMLnxeO9jBwTZGbgbv57GphdN3eFQJ
	 PgGDXYcER4bRUOj1CIEk7w0X3dTqXv064JMmEPgSsMPROfFy1UtUE3a+wYidrJs/iH
	 JVEF29dshLMuAyRGmoqjMvNCnPq96EPf6HsnPw8MdcYEn+bykKY8UiM44njaS7U5Dn
	 /RBOdhw0N9OEw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YRHFt0wwCz4wxx;
	Mon,  6 Jan 2025 12:50:58 +1100 (AEDT)
Date: Mon, 6 Jan 2025 12:51:04 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Boris Brezillon
 <boris.brezillon@collabora.com>
Cc: Md Sadre Alam <quic_mdalam@quicinc.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the nand tree
Message-ID: <20250106125104.16305a1e@canb.auug.org.au>
In-Reply-To: <20250106124834.5a82a6da@canb.auug.org.au>
References: <20250106124834.5a82a6da@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Vxmh+78sve4Xc2.V9p.U6QD";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Vxmh+78sve4Xc2.V9p.U6QD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 6 Jan 2025 12:48:34 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the nand tree, today's linux-next build
> (x86_64_allmodconfig) failed like this:
>=20
> In file included from include/linux/string.h:389,
>                  from include/linux/bitmap.h:13,
>                  from include/linux/cpumask.h:12,
>                  from include/linux/smp.h:13,
>                  from include/linux/lockdep.h:14,
>                  from include/linux/mutex.h:17,
>                  from include/linux/notifier.h:14,
>                  from include/linux/clk.h:14,
>                  from drivers/mtd/nand/qpic_common.c:6:
> In function 'fortify_memset_chk',
>     inlined from 'qcom_clear_bam_transaction' at drivers/mtd/nand/qpic_co=
mmon.c:88:2:
> include/linux/fortify-string.h:480:25: error: call to '__write_overflow_f=
ield' declared with attribute warning: detected write beyond size of field =
(1st parameter); maybe use struct_group()? [-Werror=3Dattribute-warning]
>   480 |                         __write_overflow_field(p_size_field, size=
);
>       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
>=20
> Caused by commit
>=20
>   fdf3ee5c6e52 ("mtd: nand: Add qpic_common API file")

Actually caused by commit

  8c52932da5e6 ("mtd: rawnand: qcom: cleanup qcom_nandc driver")

> I have used the nand tree from next-20241220 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/Vxmh+78sve4Xc2.V9p.U6QD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd7NwgACgkQAVBC80lX
0GzVygf+Ka6PAhW6rcPkT5+1YWoR3JBVKWyxQ2oWzWSIIYeFuR5R1eSt7E9zBWgW
npsuexS/dduksavZ8a2yY+j18Yho7MfIUWdNUoOysIppNMy7fb6fy+wsB+LKRRoX
gcms5yX1puWiZdeWbtxXhNhyzg8Mg1gAmXzWlXGPm2siEVnFOab3uQ/SoU6LNiLJ
54iAfe+enrnsuipU0XrDoKHG6C3BRLlGl9HIsUSaWH2m+C1CiwkKMsEeaDccfuE+
94nNwDBH2A4GJWwlTYg4e9l8bk1AsbqSBFAJzijGcnhV4MOehodgMaqPJk8p/6AS
bZAei6glLtkOwgLWJmTkAcWoBLzjbg==
=2Qm/
-----END PGP SIGNATURE-----

--Sig_/Vxmh+78sve4Xc2.V9p.U6QD--

