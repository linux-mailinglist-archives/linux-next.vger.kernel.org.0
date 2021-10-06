Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F24C423876
	for <lists+linux-next@lfdr.de>; Wed,  6 Oct 2021 09:00:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233968AbhJFHCr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 Oct 2021 03:02:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230227AbhJFHCr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 6 Oct 2021 03:02:47 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8702C061749;
        Wed,  6 Oct 2021 00:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=wBTyyFcBBtcxWCJ/gfsqd3HkEj6+cOF3wElfnSB+otk=; b=Cx1oyKd4nFGGk+UgnYKrNG5CeD
        G+N8PrAQDcUz7BHf1csIkaxlO18JVzFxtWxegM/cBtLkK1uJXC75J7IVGr09VXQXmuVgU5BlL6C+l
        yc5FKnHVt4T1JCFZ/cIevVTjV1GWKTHaQrx/jvEMzxlbIOVdy5YBG9bAMKwV31vvgEIVCAAjQw0J9
        9wuahyqHUyJwrCjGEh+PdLQirenBpgkzwojHUsDxvYbwcIvGg7neRs40tLu2NazsR16uKvqE7UREc
        8CzqNp15wQhNxxdCFKdBeyey6Z68JWvyT+NXBNP3jBHAAm/tjG7+m9IIh2psM2ZY65toc2600rRh3
        TQVYDUeA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mY0tp-000d5j-8Q; Wed, 06 Oct 2021 06:59:52 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 76EF430019C;
        Wed,  6 Oct 2021 08:59:31 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id AE14B2038E20D; Wed,  6 Oct 2021 08:59:31 +0200 (CEST)
Date:   Wed, 6 Oct 2021 08:59:31 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Yafang Shao <laoar.shao@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the tip tree
Message-ID: <YV1JU/wOFNn19MP7@hirez.programming.kicks-ass.net>
References: <20210920113330.29f12b99@canb.auug.org.au>
 <YUhuHcHeeNELK8cr@hirez.programming.kicks-ass.net>
 <20211006140655.6381bc5d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211006140655.6381bc5d@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Oct 06, 2021 at 02:06:55PM +1100, Stephen Rothwell wrote:
> Hi Peter,
>=20
> On Mon, 20 Sep 2021 13:18:53 +0200 Peter Zijlstra <peterz@infradead.org> =
wrote:
> >
> > On Mon, Sep 20, 2021 at 11:33:30AM +1000, Stephen Rothwell wrote:
> > >=20
> > > After merging the tip tree, today's linux-next build (powerpc_ppc64
> > > defconfig) produced this warning:
> > >=20
> > > kernel/sched/debug.c: In function 'print_cfs_group_stats':
> > > kernel/sched/debug.c:460:41: warning: unused variable 'stats' [-Wunus=
ed-variable]
> > >   460 |                struct sched_statistics *stats =3D  __schedsta=
ts_from_se(se);
> > >       |                                         ^~~~~
> >=20
> > So I've not seen that one *yet*, I've dont a bunch of SCHEDSTAT=3Dn
> > builds. I do think GCC is being quite stupid for giving it, seeing how
> > the whole thing is within if (0). The GCC people seem to disagree when I
> > brought it up.
> >=20
> > Anyway, what I did in other parts was the below; that seems to 'upgrade'
> > the warnings from -Wunused-variable to -Wunused-but-set-variable, and
> > that latter *is* in W=3D1, and I'm arguing it should be promoted to W=
=3D2 or
> > thereabout.
> >=20
> > Given that whole if(0) {} thing, I don't feel motivated to change things
> > overly much and quite strongly feel this is the compiler being daft.
> >=20
> > ---
> >=20
> > diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
> > index 935dad7dffb7..ef71de01e4d7 100644
> > --- a/kernel/sched/debug.c
> > +++ b/kernel/sched/debug.c
> > @@ -457,7 +457,8 @@ static void print_cfs_group_stats(struct seq_file *=
m, int cpu, struct task_group
> >  	PN(se->sum_exec_runtime);
> > =20
> >  	if (schedstat_enabled()) {
> > -               struct sched_statistics *stats =3D  __schedstats_from_s=
e(se);
> > +		struct sched_statistics *stats;
> > +		stats =3D __schedstats_from_se(se);
> > =20
> >  		PN_SCHEDSTAT(wait_start);
> >  		PN_SCHEDSTAT(sleep_start);
>=20
> Any progress on this?  I am still getting the warning.

Urgh, sorry, fell through cracks. Will commit fixup in a few.
