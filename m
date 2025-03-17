Return-Path: <linux-next+bounces-5818-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38723A64AF1
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 11:53:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F5731743FC
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 10:52:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9F0E233127;
	Mon, 17 Mar 2025 10:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="aWBcFQef"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167732343B6;
	Mon, 17 Mar 2025 10:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742208733; cv=none; b=XbnL41KXthkKGx0B7VBT5qMXPsPsKFGTypUooB000/q48USnMV4zJOOEnq50dVQujpYNnZ6h4vbTJGvRAxNpIZRscMNFe3ihgU/tCFg/0XgKj+9ouJ6AX+1aPq1kGTkVy3e4ILzO4JBTJckyOGQCK4K9fQiU2yhu3pZHBX8p284=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742208733; c=relaxed/simple;
	bh=sh/KyfAnziY9OsFZk47IIPWbid4Ev8+60ek/aHfQZhY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dj1jN1QO5Uvqzg8L6jjAaK2AtxS/rDWSJXXbA6a1lfOEMYO4OZpDYTpQZsMMqQFisEdh4LpDSSb18zoP6F7R7VVytoCAEHgUEGG6ZOWAt2sLFieE6F+tA0UK6aIijauDrT4gFxLgCA2CR6JwnpR1rKfMcwY7y08xNyWUz0lD8E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=aWBcFQef; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742208728;
	bh=pxvRw1vscXy0SIWcxb/cIfbElhBR8dbrzl6eY4xjZtc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aWBcFQefURK3BjHTU56sBQd0399vy7dzODCOaN6yDZBFAhRB4DrXN5Brtq8aWTBfY
	 N+Vs3WlOKa/qYqveB81otneQtr3qatQD6aJa4EtMGoQGQBCD18e21KwBoDqPrcb7Bz
	 h37Q4kfCYQscYiASarOQUi5mnp/65Itf5BNNXp1iTdTJDqCj18mhhB4o1AB5B9zDYp
	 WFcQvqhXZJbafHQCavfDLpXv3n9D2Kxckcim+1AlDtMEIqPfi5hW6DQsg1OKBMIOwu
	 pWL1FJxC13fWpuvyJTzdoTo+GL9VmIYwB5FVXQhlL/8EWp3gfYgppvoKJO8KiZL/xl
	 yKJHufuxc0Jlw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZGWy00Dwpz4wcZ;
	Mon, 17 Mar 2025 21:52:08 +1100 (AEDT)
Date: Mon, 17 Mar 2025 21:52:07 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Peter Zijlstra <peterz@infradead.org>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: jirislaby@kernel.org, ubizjak@gmail.com, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin"
 <hpa@zytor.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20250317215207.2d4fe178@canb.auug.org.au>
In-Reply-To: <20250317093856.GA34541@noisy.programming.kicks-ass.net>
References: <20250304162402.475eb3bc@canb.auug.org.au>
	<20250317093856.GA34541@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2M7dWpnKKfgXzaOAo1qJ8HJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/2M7dWpnKKfgXzaOAo1qJ8HJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On Mon, 17 Mar 2025 10:38:56 +0100 Peter Zijlstra <peterz@infradead.org> wr=
ote:
>
> Right. Sorry for not noticing before, and thanks Jiri for poking me.
>=20
> So the below resolution make it go for me. The problem appears to be
> that due to:
>=20
>   bcecd5a529c1 ("percpu: repurpose __percpu tag as a named address space =
qualifier")
>=20
> this makes that this_cpu_ptr() wants a '__percpu *', instead we feed it
> '__percpu**' which confuses things.
>=20
> What would be the best way around to getting this resolved, should I
> stick the below in a fixup patch in tip/perf/core, or do we carry this
> in a merge resolution somewhere?

Its a conflict between the mm tree and the tip tree, so I will carry it
as a resolution in -next and you all should let Linus know when the
pull requests get sent.

I will use your resolution from tomorrow.

> diff --cc include/linux/perf_event.h
> index 4d0b0b007498,76f4265efee9..000000000000
> --- a/include/linux/perf_event.h
> +++ b/include/linux/perf_event.h
> @@@ -343,7 -343,7 +343,7 @@@ struct pmu=20
>   	 */
>   	unsigned int			scope;
>  =20
> - 	struct perf_cpu_pmu_context __percpu *cpu_pmu_context;
>  -	struct perf_cpu_pmu_context __percpu **cpu_pmu_context;
> ++	struct perf_cpu_pmu_context * __percpu *cpu_pmu_context;
>   	atomic_t			exclusive_cnt; /* < 0: cpu; > 0: tsk */
>   	int				task_ctx_nr;
>   	int				hrtimer_interval_ms;

--=20
Cheers,
Stephen Rothwell

--Sig_/2M7dWpnKKfgXzaOAo1qJ8HJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfX/tcACgkQAVBC80lX
0GwdVwf+N7d/R06zfOQIrjVEwJIlPatzsv5HP5/4XKlXr9yZV6nT1cmZR9aamEuY
goPgzeCQ32Pu1Ge1BW9uteU/cWC/8sdr0ILqb/f7d/nIEmlNXN2ONroFCG8lejrE
cpxnc6CZtsFV+MNc4xiC5/yLlkGDFnRloClztRGnLYoPiZyS9BRT5W7I/c6ofxUD
lshV2LKB3vlBVMyS0YqnWQVEaX5Yw3UtF9nYbdyr7olBOrp1sDOTvWBwcY2yJ7BI
UDFPYf9fo29IdwtlBj2gRz7/AoYlcTbunz5S3xc2K2piCNQ0OR9YoJU4IMIEJFoR
qIbQnqzwsn8f6/zqD4BNH/LnclCj+g==
=3LPV
-----END PGP SIGNATURE-----

--Sig_/2M7dWpnKKfgXzaOAo1qJ8HJ--

