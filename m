Return-Path: <linux-next+bounces-8830-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8E7C33D6A
	for <lists+linux-next@lfdr.de>; Wed, 05 Nov 2025 04:30:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74470426326
	for <lists+linux-next@lfdr.de>; Wed,  5 Nov 2025 03:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9ECA18BBAE;
	Wed,  5 Nov 2025 03:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="dyDMjZCf"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B138F4A;
	Wed,  5 Nov 2025 03:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762313434; cv=none; b=QIF4nmmjAsf9mjCgjmOW4JGOW+EqLhGeRbWsELXqE+DaosOu+OGL2EmOBWwyAReGn1gkLf8YKJIS5EN98XechzK+40Ws7Dgl89JnGhjD5ljMgKovmZI57BYcBBHYRnAVEBX6lr1UcJ3PKb5+IYbBySRRicICu0NllaSAlsoqKPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762313434; c=relaxed/simple;
	bh=eT3BZi+5sPqFB4z9Rk311qAkkCUr6WTNyCKVTm1XJE0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KgbTMX4H5AQKJvJ9b5RvtaKG4nLC06Qj8cknOaw2aV6YqyQSsQqeIvGtQcE6Af9Y/dCjHg3MoxcZy6zyP5Wh4rWRzCYsdqaTftRZzGuyn9zNpVQ+4J6Eb8n8ppgdxg3WV+iEQk7x1ZxG9qFrf6FFdEnM3/gBJLNITByWqkEhHIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=dyDMjZCf; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762313428;
	bh=NoX0TaXICTAckgNWU+qmhek9oO8LZUr7AiAd0doE5r0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dyDMjZCfyJXUBWTyRUhKeRYT0xH3sJ+Q3TaJAhCEQnI1/LMeNnz8oaxSOShnakCuU
	 OaItlP9UiOGgylw6sipbngNWVKBLnDK65K/qfR6oYTatA40SP9JGQ7OcJcRlmQAcba
	 QsjLRRV4sU2ep9HYYRpVSMFUQvzx4Vmn7enaX6AYBjJXIn+kWxZBKrLycpxAfYYbAr
	 8Ax9mntjbGI7UiAJbd/R9+n++WFOGcFtw2hhUUETUiD3XgPWTq5RyUKQoOJvyXc6XV
	 e7k/H3Ra3Ojb+0oGmZSAJ6TCuJkSq6Z65VUAh4AlJizC9WpVVX7fKMduzKg4wuycA9
	 IrMqgduto7LFg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d1W6r4BYHz4w0L;
	Wed, 05 Nov 2025 14:30:28 +1100 (AEDT)
Date: Wed, 5 Nov 2025 14:30:27 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: new objtool warnings
Message-ID: <20251105143027.214f491c@canb.auug.org.au>
In-Reply-To: <20251103093804.GY3245006@noisy.programming.kicks-ass.net>
References: <20251031111515.09c9a4ed@canb.auug.org.au>
	<20251103091006.GV3245006@noisy.programming.kicks-ass.net>
	<20251103203256.5ac39302@canb.auug.org.au>
	<20251103093804.GY3245006@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3sk+RQrI_4wm/uJ7qnL=.54";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/3sk+RQrI_4wm/uJ7qnL=.54
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On Mon, 3 Nov 2025 10:38:04 +0100 Peter Zijlstra <peterz@infradead.org> wro=
te:
>
> On Mon, Nov 03, 2025 at 08:32:56PM +1100, Stephen Rothwell wrote:
> >=20
> > On Mon, 3 Nov 2025 10:10:06 +0100 Peter Zijlstra <peterz@infradead.org>=
 wrote: =20
> > >
> > > On Fri, Oct 31, 2025 at 11:15:15AM +1100, Stephen Rothwell wrote: =20
> > > >=20
> > > > My x86_64 allmodconfig builds started producing these warnings toda=
y:
> > > >=20
> > > > vmlinux.o: warning: objtool: user_exc_vmm_communication+0x15a: call=
 to __kasan_check_read() leaves .noinstr.text section
> > > > vmlinux.o: warning: objtool: exc_debug_user+0x182: call to __kasan_=
check_read() leaves .noinstr.text section
> > > > vmlinux.o: warning: objtool: exc_int3+0x123: call to __kasan_check_=
read() leaves .noinstr.text section
> > > > vmlinux.o: warning: objtool: noist_exc_machine_check+0x17a: call to=
 __kasan_check_read() leaves .noinstr.text section
> > > > vmlinux.o: warning: objtool: fred_exc_machine_check+0x17e: call to =
__kasan_check_read() leaves .noinstr.text section
> > > >=20
> > > > I can't easily tell what caused this change, sorry.   =20
> > >=20
> > > What compiler? This smells like a broken compiler, these are all
> > > noinstr and that very much has __no_sanitize_address. =20
> >=20
> > And today I didn't get them.  So who knows?  I did *not* change compiler
> > since Friday. =20
>=20
> Oh well, lets chalk it up to gremlins for now. I'll have a look if it
> happens again/reliably.

These objtool messages have returned today.  No change in compiler.

--=20
Cheers,
Stephen Rothwell

--Sig_/3sk+RQrI_4wm/uJ7qnL=.54
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkKxNMACgkQAVBC80lX
0GwtTQf8DsXHQzbVJC0VmaAERoYUZAqyiMPpLzd/ZP5M0VLXypPJlvgPc/hROpz4
rP1KSxuL8HdQC+T63QQMUlxWamPOnLndfzAzmELTwHoyTGOBn4M9+6OcrIBkTJ2b
XogHUXjx1060pDl73PYNHuN4ISxXUskejKOVg1JzkX+ozCQQax9gmQ1iRUzOlA2I
GKUNjR+UioJeTWdPtHfZcl5ApFq1bKustbJZs6XUI/0gUkv/4yCTgYDNufRRTIoC
VRLYixTVYMKn5FRACm3RaL1XlUKNk3NV8FKbB8PDcCVXf+p3J0kM6Ddkt2DTWVfu
eoponhdSqdSOh6fPUW06nfuDCCeyGA==
=k4Ti
-----END PGP SIGNATURE-----

--Sig_/3sk+RQrI_4wm/uJ7qnL=.54--

