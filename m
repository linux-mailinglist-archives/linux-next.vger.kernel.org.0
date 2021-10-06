Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2700E423629
	for <lists+linux-next@lfdr.de>; Wed,  6 Oct 2021 05:07:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237159AbhJFDIu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 Oct 2021 23:08:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230306AbhJFDIt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 5 Oct 2021 23:08:49 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33427C061749;
        Tue,  5 Oct 2021 20:06:58 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HPK9r0WbYz4xbC;
        Wed,  6 Oct 2021 14:06:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1633489616;
        bh=FpJb17O/OK8AZco1UjAOqyAOGqm9kvGdwy8j1IJGb8w=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=mo2WjpEGpb7AdQE/7SuCHsCwnfve1S9T68OJq6v6Hvvupw4r1lfgQqqPt2jEFmjja
         tnsrKnPNRde5++Rf49WSkyZm9JSXmO7/Ij/4nXp+5ojBcj1l+GQxdLxcJlbsY+TAZ9
         VQKucOskwGASGsrEMEWP9FSpIFkf0bc0kfnkeO5z9eKiRAeMAGlWk6TuPbLH1XNdjk
         I9lQ7R2VIEhbKE6xuAmIlUqUozDNGP0RCBTSmkBKxpeo+vLTXq+I5FRQP9EEc0OS6b
         ixE7rJQlYmzLIAmG1Ws7N2vWVXYQTaLqAD9n6Sa615KKIQ+Yn0F3LDGMvZWOmx6H4L
         Dd88IwQzolWng==
Date:   Wed, 6 Oct 2021 14:06:55 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Yafang Shao <laoar.shao@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the tip tree
Message-ID: <20211006140655.6381bc5d@canb.auug.org.au>
In-Reply-To: <YUhuHcHeeNELK8cr@hirez.programming.kicks-ass.net>
References: <20210920113330.29f12b99@canb.auug.org.au>
        <YUhuHcHeeNELK8cr@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vX4IllVywMMtwm8gQ4235.v";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/vX4IllVywMMtwm8gQ4235.v
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On Mon, 20 Sep 2021 13:18:53 +0200 Peter Zijlstra <peterz@infradead.org> wr=
ote:
>
> On Mon, Sep 20, 2021 at 11:33:30AM +1000, Stephen Rothwell wrote:
> >=20
> > After merging the tip tree, today's linux-next build (powerpc_ppc64
> > defconfig) produced this warning:
> >=20
> > kernel/sched/debug.c: In function 'print_cfs_group_stats':
> > kernel/sched/debug.c:460:41: warning: unused variable 'stats' [-Wunused=
-variable]
> >   460 |                struct sched_statistics *stats =3D  __schedstats=
_from_se(se);
> >       |                                         ^~~~~
>=20
> So I've not seen that one *yet*, I've dont a bunch of SCHEDSTAT=3Dn
> builds. I do think GCC is being quite stupid for giving it, seeing how
> the whole thing is within if (0). The GCC people seem to disagree when I
> brought it up.
>=20
> Anyway, what I did in other parts was the below; that seems to 'upgrade'
> the warnings from -Wunused-variable to -Wunused-but-set-variable, and
> that latter *is* in W=3D1, and I'm arguing it should be promoted to W=3D2=
 or
> thereabout.
>=20
> Given that whole if(0) {} thing, I don't feel motivated to change things
> overly much and quite strongly feel this is the compiler being daft.
>=20
> ---
>=20
> diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
> index 935dad7dffb7..ef71de01e4d7 100644
> --- a/kernel/sched/debug.c
> +++ b/kernel/sched/debug.c
> @@ -457,7 +457,8 @@ static void print_cfs_group_stats(struct seq_file *m,=
 int cpu, struct task_group
>  	PN(se->sum_exec_runtime);
> =20
>  	if (schedstat_enabled()) {
> -               struct sched_statistics *stats =3D  __schedstats_from_se(=
se);
> +		struct sched_statistics *stats;
> +		stats =3D __schedstats_from_se(se);
> =20
>  		PN_SCHEDSTAT(wait_start);
>  		PN_SCHEDSTAT(sleep_start);

Any progress on this?  I am still getting the warning.

--=20
Cheers,
Stephen Rothwell

--Sig_/vX4IllVywMMtwm8gQ4235.v
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFdEs8ACgkQAVBC80lX
0GywCwf9FqdLggpxZhSH93X3gPvN72Es9QkzqDcYS6b3me34+2uwiayPgQi65O8c
zSkeTRqBJSy7bcBnX+1zJCdQG5djwRrekXu0UkkZKe/0PrwTLxHmsQUWPWWPfFdJ
DyiUEES9gBiQ449xovjPhvkhRTKG5pL2qdQ4i3vvl7sOIhoZIUIhHfNzQA2mCh1u
sWFp4NgTgvuzhaICSYCTbZJl51FvL/NE0Eljb+vSq4Ov/4OBSfpcgtFQ1amv6Gsx
eFHvH8WEHCCavi9AZmKQKVeDpDM4Aeb5dz59hHPuABQ/NtqfmyZYMKqS99ixARLw
sHGIv4vqr2tvcf8v5ZVe63gxGwfBvg==
=TUTX
-----END PGP SIGNATURE-----

--Sig_/vX4IllVywMMtwm8gQ4235.v--
