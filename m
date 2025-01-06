Return-Path: <linux-next+bounces-5064-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 224C4A031E4
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 22:15:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A144E18837E5
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 21:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EEED1DFE18;
	Mon,  6 Jan 2025 21:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="f5SZnqT/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291581DF721;
	Mon,  6 Jan 2025 21:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736198101; cv=none; b=FTGw/Y2tPUEck5AxpIrLab3JWzGRK0A4NUvSvPjdmGcIP5jKe5PsGQkZrBmh3YbSKTn6cGNjbD+nMaaAcce30KVzj1wbJX/y+A6aatpo6BdPrRddGH9pghcPpb7apvC9FP0ueSOlM4sgKDVxL5y9HEJwCijlCXBLB2jvGL8M+Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736198101; c=relaxed/simple;
	bh=2UwQNxYD+AOvhwLH/NHPlwZ2I4cdcC0agObmVHF/q8c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IVziyQyGq4asxPaFpWI+06OSjJ7DnWvWRfzmPn9XATEIw9232mdr+Iu9pLpitLRLMPpkGSUVfTWNM5oBt8fc3T6klDbFT7w2Bg5PotrYpi9RpUI3Q+n2PnxI6L0cx8CJp7pzl+2FpGp6C/5ARbkgawGyCr8hmEfPKp2kwZONF9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=f5SZnqT/; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736198087;
	bh=2UwQNxYD+AOvhwLH/NHPlwZ2I4cdcC0agObmVHF/q8c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=f5SZnqT/M2qu7MbMfvQki2ZyhcS4JBHTuBuOFsEGa8AZiKttomzKKZGAk505iqWlL
	 zXRFhfX6KlqdyV0KJ3dmWHoDAcYPVofdceyNAGBl7QK2jTWd+putp3zlNj53spQcs0
	 t2/a8qslUuRjP18uEgurCyqvN1LoyX3EfaYpKB5Xm8umNWcn5ptji3Dw91juWhVf0Y
	 4daJKW86Qqnotm+eC8sv7BbpsSzj321KTUFhUmox+GHo6wq4NvwY0zAO3WRa/QbQHb
	 sdyDSqIsDkTK7FP+cbyT/1b9c0LMn4zrT291cjbirnZF2Y1294i79JZrU1knl0MJsn
	 rVPm3c+CvjwdA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YRn4k1ycfz4w2M;
	Tue,  7 Jan 2025 08:14:46 +1100 (AEDT)
Date: Tue, 7 Jan 2025 08:14:52 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the tip tree with the mm tree
Message-ID: <20250107081452.4294c7fd@canb.auug.org.au>
In-Reply-To: <CAJuCfpEyhm3OoeOqfnYVoOo+C4PafX1zXakPb+wjCFB_9Q9NnA@mail.gmail.com>
References: <20241209132446.77fcb14b@canb.auug.org.au>
	<20250106140928.50569876@canb.auug.org.au>
	<CAJuCfpEyhm3OoeOqfnYVoOo+C4PafX1zXakPb+wjCFB_9Q9NnA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BhdnXdUTyS0kOApyA=9qHaw";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/BhdnXdUTyS0kOApyA=9qHaw
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Suren,

On Mon, 6 Jan 2025 12:21:14 -0800 Suren Baghdasaryan <surenb@google.com> wr=
ote:
>
> On Sun, Jan 5, 2025 at 7:09=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
> >
> > I got 2 more conflicts today due to the duplicate patch above. =20
>=20
> Have you been able to resolve the conflicts? Can I help with that?

I just use the version from the mm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/BhdnXdUTyS0kOApyA=9qHaw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd8R8wACgkQAVBC80lX
0Gx8nAf9E3Fmxjeb/CcG5Q355TlWB3k5bI6NY/NjaZOvDsJYqiUgje1D7GnppjRv
TIwOYUEIrWlJOuMyopWsrgcIW/YHxb//uMSGWYwuQs0lywISn6uQRHaZ8ns9DSJV
zUck755HKY1QRojeC3GBWv5SqeKOkeui/d/wI0DowsyJMLLWxyDp30B3wnD0w5td
lu5kbFtcZMhf/7/uYekUm2fqVOW/woFRcITyYKSN54jEAII0K69lxEahehTtccJb
Ow+bRf7lsGdWb8U8YQc3mhqjvr+MqhGJoAeek6Fh8FZI8pysMOIO77Id4jXaoTZd
c+PYf481pF3OoKc4WVwsd5jgH33OFw==
=MPpZ
-----END PGP SIGNATURE-----

--Sig_/BhdnXdUTyS0kOApyA=9qHaw--

