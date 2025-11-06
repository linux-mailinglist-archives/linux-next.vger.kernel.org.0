Return-Path: <linux-next+bounces-8881-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F87CC3965D
	for <lists+linux-next@lfdr.de>; Thu, 06 Nov 2025 08:27:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6D25A4E5960
	for <lists+linux-next@lfdr.de>; Thu,  6 Nov 2025 07:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65A7D2DE704;
	Thu,  6 Nov 2025 07:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VagYr5/c"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BA82DEA86;
	Thu,  6 Nov 2025 07:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762414028; cv=none; b=LnK4IV4Vo0Y6I99pmDRlUXy9Bu/GYBi6JENCjI29m0s9YUine96iY38XnsxWDmtRmbQjOWSdPy4P6EbSqkuRGcFp0QXO3WXCawQD6I/HZU/2OOi0FVo+EFuMC1I6V60oSQjTysbjX4uHbO6+n0zudroDUIkSg9P/KfXYSpsLydU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762414028; c=relaxed/simple;
	bh=ANLZ4nuzI28Jw/q/dw1oy3HkAMfTnpYAiKK29auuSQw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uREku0c/GFDgT6VQvPnUBrOBU1PnGUXJLZ2B2e8WhxYxZJMx2hwQxU3gNbTVj2qAaWTF4L26fWkcqy73Qwo7euS0TCPyBB/O33wp1aNQK4VofX18PJdxrJMYRqCfO2pThxswkurLBmZxsgqB9nHO5qRX2xqrm/ZcDMdK4bygyvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VagYr5/c; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762414022;
	bh=Vz9mhb435f+hOkgsRUlA5LdbIcbxh8AyNii3iCi92dQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VagYr5/c7IU+3HcZZDJxK4Gewbq8o8fLChSOHHEOsPFfpdoR55bLFotd9BdlZ4Kdc
	 4eMPcLV7Hyda4iOupAWapEMdif9rbSWxjIs/TkserVMpgt7DAQBJLrHAEq+neNVNRw
	 xsy0T8uOdegnWwZ/u14u5uXv7LW4PYnSmWxr5Gg+iTb2p8SybFRtrQzBl3Dtpj3h9v
	 D0r5YPUcjWIAfOhlx1d4NvP11XGoLKSZp4ybItSQaFKucH8HC2zSfUjxE4wSJg85bs
	 wVk2lXGRA0NI/OI17jDeSdgpDvYsfzJZ/BB5ofE7GX7SSV+5iGIgLZJvGDKijxT7Qr
	 NnWLRpejiQGgg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d2DKK58YQz4w9q;
	Thu, 06 Nov 2025 18:27:01 +1100 (AEDT)
Date: Thu, 6 Nov 2025 18:27:00 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel
 <ardb@kernel.org>, David Howells <dhowells@redhat.com>, Linux Crypto List
 <linux-crypto@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the libcrypto tree
Message-ID: <20251106182700.092a328f@canb.auug.org.au>
In-Reply-To: <20251106041953.GB1650@sol>
References: <20251106143623.06b23d57@canb.auug.org.au>
	<20251106035521.GA1650@sol>
	<20251106041953.GB1650@sol>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_3AyMO_=V=iRL6QgN5LCRd6";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/_3AyMO_=V=iRL6QgN5LCRd6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Eric,

On Wed, 5 Nov 2025 20:19:53 -0800 Eric Biggers <ebiggers@kernel.org> wrote:
>
> Okay, it's because some kernel-doc warnings were accidentally turned off
> for everyone :-(  And they just got turned back on by
> https://lore.kernel.org/r/20251104215502.1049817-1-andriy.shevchenko@linu=
x.intel.com/
> With that applied, './scripts/kernel-doc -v -none include/crypto/sha3.h'
> does catch this.

Yeah, I found quite a few warnings today.

> I folded the following into "lib/crypto: sha3: Add SHA-3 support" to
> convert the comments starting with "/**" into proper kerneldoc comments:

Thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/_3AyMO_=V=iRL6QgN5LCRd6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkMTcQACgkQAVBC80lX
0GytUAf/eLz0/CNApPaPG3fxbGJ94IakX4pARYdnDig4Pt0NUV+ZJpQU4r6tJ5FM
vA+jjQdzrtzuLDjOB/WZ9z5nFNMaGMuC+sOQUOQ6/mbmq9jvbcMdMnFM/QLbubzV
/smdegYosizg0DwacpyW0hlmjr5ECAreHqR/NZOOEsxx6mrOB0Z0evOx/QHpG0v7
X7u/2TSx1Zf0clAwcHx40vuUBMKI0Jrz0B3Tru+bzEW8HIE4Gu1gAahmgsCYncWE
+e69O58Wx9CxcMoKv3vhAbhxFfO32P/HpGVl0ePu1Pl+8H/FATUP1qHvZRtJ+ocX
ODA4LdGCkr5hJQRClGoWr8yNUCgh5A==
=Ho9X
-----END PGP SIGNATURE-----

--Sig_/_3AyMO_=V=iRL6QgN5LCRd6--

