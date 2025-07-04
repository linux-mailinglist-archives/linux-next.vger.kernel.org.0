Return-Path: <linux-next+bounces-7349-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB0DAF8599
	for <lists+linux-next@lfdr.de>; Fri,  4 Jul 2025 04:36:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3283956528A
	for <lists+linux-next@lfdr.de>; Fri,  4 Jul 2025 02:36:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 918AB42056;
	Fri,  4 Jul 2025 02:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="fmuq5eOL"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27602594;
	Fri,  4 Jul 2025 02:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751596567; cv=none; b=WbjMqmblT5e8Dy/kewL60mp6NW241p+FUKgrkmQUNjk2RZvb4cZjaJ5jjZetOkNRGFfWXtni4kg0Y8Fd0nlPcPqYtxB86NRcv9xYADG1Tsd7Db3nYf7RNWhyeluDnWAoXjnYZu2FW23wlI4TZlVnALVmOeFTNQoJ4HdPalfR+iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751596567; c=relaxed/simple;
	bh=2b8zokJZgo4Vhm/mHrpKVZXDuC3bMs4PzdvLi2mhRQA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AB1ZqAa1Trhexapmh7IfHuVFt8MMex6mDv0fntyfWY2ul/+RiaW+3KPbMs8km+537korSDENC4k8vdDEovyZ3ZEeAoBrXKxLJczn6pmfQlAvdsIFhhkUhL+H2JkujO/QKZmGIxxLouuVKJUJVQoPhdKRIMpNl1K0IASQnE5dkos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=fmuq5eOL; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751596535;
	bh=vArQ1lePuBue9mgxxQmB1+zLVA1HAnQTH8xBQc9MfCo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fmuq5eOL8kuKWVyJF0fQjwNIrXWrTmU8ZL/qPO5L0GAEet+jaDc+CxZcXRxTRa51p
	 PMb+7fZ9ZByXJEvkrl2mT40OHm99oO4HySxu3XJvaILSY9t1nQCtvWKXTszFJhk/8b
	 lY8OsiNTbbkwE57ev/ufwpKzoWHE9q278WqDtxyKT3bgNtZ+EBMqmC46oLBAk0DM1U
	 XI6woCpXVSnOorwTK3fMvLT5wpJdrvrIqxhcpHjWqp7Xh2zsJdgCsrinsZqWgG9r/r
	 xX/Gw6igaetOAmQl4Xjy+n8TIgWZ91gN6bX7N0SNmkfoHep199zooMdJzOldaUZVSw
	 qMtBzRk7SOGAg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bYHml10QSz4wcg;
	Fri,  4 Jul 2025 12:35:34 +1000 (AEST)
Date: Fri, 4 Jul 2025 12:36:01 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the i2c-host tree
Message-ID: <20250704123601.52101f49@canb.auug.org.au>
In-Reply-To: <bd7bf583-5c75-4e73-9672-657749a72b1a@vivo.com>
References: <20250704120207.3e7d0d7e@canb.auug.org.au>
	<bd7bf583-5c75-4e73-9672-657749a72b1a@vivo.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+8MdG38uNNeWqp9S5+pMyPV";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/+8MdG38uNNeWqp9S5+pMyPV
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Qianfeng,

On Fri, 4 Jul 2025 10:16:08 +0800 Qianfeng Rong <rongqianfeng@vivo.com> wro=
te:
>
> I'm sorry, I made a mistake,=C2=A0 can anyone help to roll back this patc=
h?
> But I want to ask if it's because I didn't compile with W=3D1 and
> didn't find this compilation error locally=EF=BC=9F Anyway, I will learn
> from this lesson and be more careful in subsequent submissions.

I just did an arm multi_v7_defconfig build.  Building this file depends
on CONFIG_I2C_ST which in turn depend on ARCH_STI || COMPILE_TEST.  I
don't use W=3D1.

--=20
Cheers,
Stephen Rothwell

--Sig_/+8MdG38uNNeWqp9S5+pMyPV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhnPhEACgkQAVBC80lX
0GxL9gf7BXU/Ge8UhU3xwHPfF6leOPp3OtwU5nMjavLH4nna/dhYGwt0QVEZ3+v4
DmMxNS2fzIqZbrsz2kAiiOZXtySmRRUuKPndoJQJxhVT/AH6+O0bx5jEhdv6wtJp
8WusW4ZUeWBaF64ZjE6GjlJ4A2qioN+wbWt40JEf25Ujz3r5zBHgkMX1iM4zrxwI
zjH9OxUHbbhUdyfgw35HhFIUzAysBZmB9Z30zeSX8opHSh9AFrzHOuJ3Ad52+LDy
zdKsuOqbIsTpM0jYXHQL4i4iy9/fPuo1qKIqIIkooIS3KajcMQeKuHWdn1xsbv2m
s1b5N0jyH2Yjo1bSNBLgqUD3iWi67w==
=96f8
-----END PGP SIGNATURE-----

--Sig_/+8MdG38uNNeWqp9S5+pMyPV--

