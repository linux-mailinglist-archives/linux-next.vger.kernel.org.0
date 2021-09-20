Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02B9C41136B
	for <lists+linux-next@lfdr.de>; Mon, 20 Sep 2021 13:19:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230060AbhITLUo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Sep 2021 07:20:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229926AbhITLUh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 20 Sep 2021 07:20:37 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B666CC061574;
        Mon, 20 Sep 2021 04:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=wXAGirnc05fwmDCRKFxCiuOQA8x4SwguaJpy5rQKuLU=; b=NiV0DVJz7di1ZXi+Un3kCjWpCq
        +fWvOftQyuI8z0PvT4qty/Pptb+bM4jNF7bRy7NefYC7E6zb+R5WgtElM38o/vRP5prZ3JXEAbWOd
        KioeBI8Pi3pehUXZqT8TVhlm1QQmOE/w4YrLlB1Ej1E0SE5qj4iLDOH9HGe203JR8TxF5pdm+3Z0r
        kt6CuGDJLWgkSNC53iYEjXMdTLdiYMIHiT3fodoRVP3nkPEl3vdXqH+eBywGE0hycCeEgZgQObK7G
        1B+z9DLZ+ECEkkc01DSbrYXuhp5MdBU8Cb6p3R1goAoagzG1ArH6RjVRO5JHxvrTFXv7C3tPF3Vku
        GmcXz5Ww==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mSHK3-004VBH-I2; Mon, 20 Sep 2021 11:18:55 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 3E69B3001EA;
        Mon, 20 Sep 2021 13:18:54 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id E180D212D6916; Mon, 20 Sep 2021 13:18:53 +0200 (CEST)
Date:   Mon, 20 Sep 2021 13:18:53 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Yafang Shao <laoar.shao@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the tip tree
Message-ID: <YUhuHcHeeNELK8cr@hirez.programming.kicks-ass.net>
References: <20210920113330.29f12b99@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210920113330.29f12b99@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Sep 20, 2021 at 11:33:30AM +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the tip tree, today's linux-next build (powerpc_ppc64
> defconfig) produced this warning:
>=20
> kernel/sched/debug.c: In function 'print_cfs_group_stats':
> kernel/sched/debug.c:460:41: warning: unused variable 'stats' [-Wunused-v=
ariable]
>   460 |                struct sched_statistics *stats =3D  __schedstats_f=
rom_se(se);
>       |                                         ^~~~~
>=20

So I've not seen that one *yet*, I've dont a bunch of SCHEDSTAT=3Dn
builds. I do think GCC is being quite stupid for giving it, seeing how
the whole thing is within if (0). The GCC people seem to disagree when I
brought it up.

Anyway, what I did in other parts was the below; that seems to 'upgrade'
the warnings from -Wunused-variable to -Wunused-but-set-variable, and
that latter *is* in W=3D1, and I'm arguing it should be promoted to W=3D2 or
thereabout.

Given that whole if(0) {} thing, I don't feel motivated to change things
overly much and quite strongly feel this is the compiler being daft.

---

diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 935dad7dffb7..ef71de01e4d7 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -457,7 +457,8 @@ static void print_cfs_group_stats(struct seq_file *m, i=
nt cpu, struct task_group
 	PN(se->sum_exec_runtime);
=20
 	if (schedstat_enabled()) {
-               struct sched_statistics *stats =3D  __schedstats_from_se(se=
);
+		struct sched_statistics *stats;
+		stats =3D __schedstats_from_se(se);
=20
 		PN_SCHEDSTAT(wait_start);
 		PN_SCHEDSTAT(sleep_start);
