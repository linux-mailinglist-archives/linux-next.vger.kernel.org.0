Return-Path: <linux-next+bounces-5827-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCB8A65078
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 14:17:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2669C18960B7
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 13:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1500237A3B;
	Mon, 17 Mar 2025 13:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Zakb3Y29"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963C87DA8C;
	Mon, 17 Mar 2025 13:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742217442; cv=none; b=TphS24g9seugSpfK9Uq4tjlr99m7k5IpsZ3kenaMTsZK8VGLUI6JBhIjGbRAK1MZO89tQ6gWldxckxsVN7n2IOH0+a3jY7JugHMRcuIZRQUwIfuMGNIJMZRQ+1UH2sU2Tiz1WleEmEeeKkNJUW8LB7XPGAi+JhKMS828HTohCaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742217442; c=relaxed/simple;
	bh=xpZOesL39vDScmd/eLApRorpDqcOAkEoBgtg1QjIhYc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QxOiTnJFv3jbD0OXHGD/Y3qUccICLtFoqWlmqYyZ8ruPtusWwflHHubUEhkripr3DTQY6IyPdjAnJG+J2PKXysCFNfKhT85keIfybMq9gtqsKvY2BEjWi1lyO0cKd0qhrdyXiAYAatteZt7mTzvqPWQK9SB95ujN3CMD94V70yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Zakb3Y29; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742217437;
	bh=xpZOesL39vDScmd/eLApRorpDqcOAkEoBgtg1QjIhYc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Zakb3Y29HtLQPqQEIJv2noEc9iOrMFe8Wr50+0hiEWu4wzHXKDFYCVcKJgObtF+/P
	 DfKY2j09Vt4qv2K9APdoU8uleWgEXBMmTehm36swfyUdvPc6MShy/QPZWb9JkCBHh0
	 zybyixbbvpy5fEWdI9peSV7L5QNv1ErD2WT15PXwgJiW+uvbBoaDya2MG02BRZ0d3z
	 1VLwQrr1zOXE6/QEwU2rTiogyrmiJOnc2T8EyvaB/ZC3rJfET9XnvhhhLsuKKM6QxI
	 PzhqECNFe82j6ShUxZlR/SBIDZYLxXI2sJbkSXWBoTUSTPkYNMWmB4HflXlcWMrBff
	 afRPkI7d+riFQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZGb9T0rT4z4wcw;
	Tue, 18 Mar 2025 00:17:17 +1100 (AEDT)
Date: Tue, 18 Mar 2025 00:17:16 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, jirislaby@kernel.org,
 ubizjak@gmail.com, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar
 <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20250318001716.794d2abd@canb.auug.org.au>
In-Reply-To: <20250317105702.GD34541@noisy.programming.kicks-ass.net>
References: <20250304162402.475eb3bc@canb.auug.org.au>
	<20250317093856.GA34541@noisy.programming.kicks-ass.net>
	<20250317215207.2d4fe178@canb.auug.org.au>
	<20250317105702.GD34541@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zJdkCcG8dHSBqYqUzRWSXA/";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/zJdkCcG8dHSBqYqUzRWSXA/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On Mon, 17 Mar 2025 11:57:02 +0100 Peter Zijlstra <peterz@infradead.org> wr=
ote:
>
> I pushed it out as a fix in tip/perf/core, figured it wouldn't hurt and
> it wont get lost.

OK, thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/zJdkCcG8dHSBqYqUzRWSXA/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfYINwACgkQAVBC80lX
0GyHOQf/ZjKN15f/gZ8sCdGxqS2DfSO3csuG+m2iDPcqGVAb7eCa67FoLnstrSXi
4BQqTB612GxYc6YvUJBEasALqb2DKeQTbnawFapGYOF8WmfIyNVzC+9P/fz+DChl
2R5MsH4yaHzPv9OCDrSGLoV9kK9Rml9h2kz/LJhpNotRSz+ngcNz3IL7dO2bRZHl
Ljz1A6OtEJVuzNMT2Y+t0U0FuCk6POC9zRH2hf/SeibXs7nP2ciX6mOOiWJ6rrsO
4cO/M4ruz2nVCn0y+pADaSB1yigw9LmW4cKAcBIQiqzVbHVNq7SzKnTtWL0IjKu3
S2R2n3B/G7OD74TfK4Ca5nSR1psSPA==
=gSu7
-----END PGP SIGNATURE-----

--Sig_/zJdkCcG8dHSBqYqUzRWSXA/--

