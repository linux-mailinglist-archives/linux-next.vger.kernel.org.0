Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BCEA2C8391
	for <lists+linux-next@lfdr.de>; Mon, 30 Nov 2020 12:55:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728293AbgK3Lyz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Nov 2020 06:54:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727020AbgK3Lyz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 30 Nov 2020 06:54:55 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CE08C0613CF;
        Mon, 30 Nov 2020 03:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=oeDNwpJhVlqOIA77uNB1zDWPXFgDlGIvJTe3QvUDO+c=; b=fTuV3r00EUOv0BF+TENTfaH0bj
        rO31wMqeWH7Btt9o5Apax0NnbvCE0bNqkqcgxnLnsS1KCHgFVpRmKq2YW4XA/3JoZGQ54LKGztNjP
        44rbik/hlurkpGmlu6FA9jA4vZw/08CO8ceZYCxBaksiKZRx0yz51btjLHAJ1dKDxPLCW9bIYtwhA
        VcIsTZlRdmuzWy6IKnI6vMPZFefw8JvI199Tf5E25TQeXCCwYhEtw3p9xP8TylcUMLq51+FLXdQaD
        rejvlK+0+/mOE03PfZuFn2RYox0HjQanKTr7sKTP0qKOPPQ0HG1HC7tUaB/YE3gDTDcwDgKJ2NIZS
        +lIeUe7Q==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kjhkr-0007wJ-WB; Mon, 30 Nov 2020 11:54:06 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 00FAB30477A;
        Mon, 30 Nov 2020 12:54:02 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 82FCF233D603D; Mon, 30 Nov 2020 12:54:02 +0100 (CET)
Date:   Mon, 30 Nov 2020 12:54:02 +0100
From:   Peter Zijlstra <peterz@infradead.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Len Brown <lenb@kernel.org>,
        Jacob Pan <jacob.jun.pan@linux.intel.com>
Subject: Re: linux-next: Tree for Nov 27 (drivers/idle/intel_idle.c)
Message-ID: <20201130115402.GO3040@hirez.programming.kicks-ass.net>
References: <20201127200457.1ffb6aaf@canb.auug.org.au>
 <0a6cc4c9-c48d-dbc4-6044-3b22cd133b76@infradead.org>
 <20201128083617.50021fff@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201128083617.50021fff@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sat, Nov 28, 2020 at 08:36:17AM +1100, Stephen Rothwell wrote:
> Hi Randy,
>=20
> On Fri, 27 Nov 2020 07:57:32 -0800 Randy Dunlap <rdunlap@infradead.org> w=
rote:
> >
> > On 11/27/20 1:04 AM, Stephen Rothwell wrote:
> > > Hi all,
> > >=20
> > > Changes since 20201126:
> > >  =20
> >=20
> > (This looks strange to me.)
> >=20
> >=20
> > on i386 or x86_64:
> >=20
> > # CONFIG_ACPI is not set
> >=20
> > ../drivers/idle/intel_idle.c: In function =E2=80=98intel_idle_init_csta=
tes_icpu=E2=80=99:
> > ../drivers/idle/intel_idle.c:1510:7: error: implicit declaration of fun=
ction =E2=80=98intel_idle_state_needs_timer_stop=E2=80=99; did you mean =E2=
=80=98intel_idle_init_cstates_icpu=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
> >    if (intel_idle_state_needs_timer_stop(&drv->states[drv->state_count]=
))
> >        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>=20
> intel_idle_state_needs_timer_stop() is only defined when
> CONFIG_ACPI_PROCESSOR_CSTATE is set, but is used once where that is not
> necessarily set.  I assume CONFIG_ACPI_PROCESSOR_CSTATE is not set in
> your config?

Bah... :/

diff --git a/drivers/idle/intel_idle.c b/drivers/idle/intel_idle.c
index 7ee7ffe22ae3..d79335506ecd 100644
--- a/drivers/idle/intel_idle.c
+++ b/drivers/idle/intel_idle.c
@@ -1140,6 +1140,20 @@ static bool __init intel_idle_max_cstate_reached(int=
 cstate)
 	return false;
 }
=20
+static bool __init intel_idle_state_needs_timer_stop(struct cpuidle_state =
*state)
+{
+	unsigned long eax =3D flg2MWAIT(state->flags);
+
+	if (boot_cpu_has(X86_FEATURE_ARAT))
+		return false;
+
+	/*
+	 * Switch over to one-shot tick broadcast if the target C-state
+	 * is deeper than C1.
+	 */
+	return !!((eax >> MWAIT_SUBSTATE_SIZE) & MWAIT_CSTATE_MASK);
+}
+
 #ifdef CONFIG_ACPI_PROCESSOR_CSTATE
 #include <acpi/processor.h>
=20
@@ -1210,20 +1224,6 @@ static bool __init intel_idle_acpi_cst_extract(void)
 	return false;
 }
=20
-static bool __init intel_idle_state_needs_timer_stop(struct cpuidle_state =
*state)
-{
-	unsigned long eax =3D flg2MWAIT(state->flags);
-
-	if (boot_cpu_has(X86_FEATURE_ARAT))
-		return false;
-
-	/*
-	 * Switch over to one-shot tick broadcast if the target C-state
-	 * is deeper than C1.
-	 */
-	return !!((eax >> MWAIT_SUBSTATE_SIZE) & MWAIT_CSTATE_MASK);
-}
-
 static void __init intel_idle_init_cstates_acpi(struct cpuidle_driver *drv)
 {
 	int cstate, limit =3D min_t(int, CPUIDLE_STATE_MAX, acpi_state_table.coun=
t);
