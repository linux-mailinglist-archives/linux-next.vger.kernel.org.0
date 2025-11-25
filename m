Return-Path: <linux-next+bounces-9196-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C30F5C83107
	for <lists+linux-next@lfdr.de>; Tue, 25 Nov 2025 03:08:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 807393ADCA8
	for <lists+linux-next@lfdr.de>; Tue, 25 Nov 2025 02:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 483E519AD5C;
	Tue, 25 Nov 2025 02:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ZEUCerNR"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B354C1465B4;
	Tue, 25 Nov 2025 02:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764036523; cv=none; b=uyWzg4ZVDGL/C5lH2mb6wHrgcEGWSXATMDfwcCCQlb6h/ztbo/RSN8Nc0L0jrVmAALhz3MfpyqoTABeNQWMpaWLmHCobeQNRrms1Qoa9vM2SYJEAOU3l+6lEFwKXCHlIT5ZDCEmY8mvRn+oVZdFGe+vC4wghmp+pJUz2N62Z3R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764036523; c=relaxed/simple;
	bh=O2VCiuUfxqGrGarOmB1ONqRCtr4AWY/wgPzpdPkDrJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cSTkwwc80KyiwoMP/uek7h6iYHJ4fVDT1WGi2+dbHRtqv+NpbPIS8bquC4JmLYkk5Cyw9AIa15p0X282sySovmnWgR+uDFAAWnpmKX8q8QyDdVpp5NhyfxOVa2w5J3EeLQCpSbmlSEcTSXtnyquZMyq2TWoDh/ofA7UR5Sl37Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ZEUCerNR; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764036517;
	bh=g7C9hMvKD1hyIZ374MrWP6BcNB9cgUH6sxbAf/5qAJc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZEUCerNRxSFsaUKAlPDqiMVTAQrjcONh9cxEYk1JaTs9Bndjlw7VbbGHtTAO8gMC+
	 Ye2QjvWxVD8uJxIDMWfBSx2Ww/UCWeosKNKSQqm2GsKFUZ1r3DpXF4pBlvc2nkHWMW
	 hbsYIEEYQH24H3Xv4Tb+/RONVg4Ifhz+DvKN3zpgyYhEZX6+ldy2nwfNlhW9v9Y8gs
	 +KSduGGqWKklkv4KETmp/QBnmP8XhjxpXy7vHwl2XcGZd8V1N6Cy+8AbNrodlUXJ3J
	 2vyJVEPrVTmWpUUkjklaQVxg2kWjyOuA1WgkI5ETVhYRx74wCG3+oXyeyL1hkW5Avf
	 MxJixiMQtkORw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dFmM82Xx8z4w8x;
	Tue, 25 Nov 2025 13:08:34 +1100 (AEDT)
Date: Tue, 25 Nov 2025 13:08:33 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, ojeda@kernel.org, Danilo Krummrich
 <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 nouveau@lists.freedesktop.org, Alice Ryhl <aliceryhl@google.com>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20251125130833.3ffe5878@canb.auug.org.au>
In-Reply-To: <20251124191903.GM4068168@noisy.programming.kicks-ass.net>
References: <20251124231644.38d0303b@canb.auug.org.au>
	<20251124123249.GP4067720@noisy.programming.kicks-ass.net>
	<aSRlFB9PoOcZVmvt@tardis.local>
	<20251124144714.GT3245006@noisy.programming.kicks-ass.net>
	<20251124144923.GK4068168@noisy.programming.kicks-ass.net>
	<20251124191903.GM4068168@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/jh+qEKkSevzV=IAO6jdCcO/";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/jh+qEKkSevzV=IAO6jdCcO/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On Mon, 24 Nov 2025 20:19:03 +0100 Peter Zijlstra <peterz@infradead.org> wr=
ote:
>
> On Mon, Nov 24, 2025 at 03:49:23PM +0100, Peter Zijlstra wrote:
>=20
> > This... ok now lets see wtf the actual problem is. =20
>=20
> This cures it. I'll go rebase that tree.
>=20
> diff --git a/arch/x86/include/asm/bug.h b/arch/x86/include/asm/bug.h
> index a3dd6805b574..d0a96ff5c02c 100644
> --- a/arch/x86/include/asm/bug.h
> +++ b/arch/x86/include/asm/bug.h
> @@ -104,7 +104,7 @@ do {									\
> =20
>  #define ARCH_WARN_ASM(file, line, flags, size)				\
>  	"1:\t " ASM_UD2 "\n"						\
> -	_BUG_FLAGS_ASM("NULL", file, line, flags, size, "")
> +	_BUG_FLAGS_ASM("0", file, line, flags, size, "")
> =20
>  #else
> =20

I applied that by hand to the tip tree merge today.

--=20
Cheers,
Stephen Rothwell

--Sig_/jh+qEKkSevzV=IAO6jdCcO/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmklD6EACgkQAVBC80lX
0Gy2hAf/USQE1W7JHArsf6bnXP0qrS02oozrOWvZI+mwxd174VJFo1wY/r80SHHf
JZpgTNhCvDDZ/XCaMJvw9zh7XPt2bIz4T3vtcVy+eOEmAHTkOBQf1MLnUKVjcBQ0
VJ4IlKlEkvS0rr/e7gqyDyL8oBW2fPXJawkmADMJzbJgNiS9uQWeX9rRx+9bRMdi
9roTfrPGcYdwUCtNKl8JQqWnzJIM7e2QuvV3VlaNhV1ldmteZ4h3AN8awJuZestC
v4aSIOhcS6bQ7KL5AvspiH5ccQCqglfCnwYbosasnbTVFnGzA8aMnzvTpt/YbwSw
bUiCwEVr49aewd1uClSxlFVpW7A5Ag==
=kgEm
-----END PGP SIGNATURE-----

--Sig_/jh+qEKkSevzV=IAO6jdCcO/--

