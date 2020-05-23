Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00AD81DF675
	for <lists+linux-next@lfdr.de>; Sat, 23 May 2020 11:54:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387687AbgEWJyr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 23 May 2020 05:54:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725270AbgEWJyr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 23 May 2020 05:54:47 -0400
Received: from Galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B6CEC061A0E;
        Sat, 23 May 2020 02:54:47 -0700 (PDT)
Received: from p5de0bf0b.dip0.t-ipconnect.de ([93.224.191.11] helo=nanos.tec.linutronix.de)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tglx@linutronix.de>)
        id 1jcQrK-0000on-M7; Sat, 23 May 2020 11:54:26 +0200
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
        id 33AAA100D0B; Sat, 23 May 2020 11:54:26 +0200 (CEST)
From:   Thomas Gleixner <tglx@linutronix.de>
To:     Borislav Petkov <bp@alien8.de>,
        "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Will Deacon <will@kernel.org>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        elver@google.com
Subject: Re: linux-next: build failure after merge of the tip tree
In-Reply-To: <20200523064643.GA27431@zn.tnic>
References: <20200522033119.1bbd99c5@canb.auug.org.au> <20200521173520.GL6608@willie-the-truck> <20200522171708.5f392fde@canb.auug.org.au> <20200522174944.1a1732fa@canb.auug.org.au> <20200523001223.GA23921@paulmck-ThinkPad-P72> <20200523064643.GA27431@zn.tnic>
Date:   Sat, 23 May 2020 11:54:26 +0200
Message-ID: <87a71zq8ml.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Borislav Petkov <bp@alien8.de> writes:

> On Fri, May 22, 2020 at 05:12:23PM -0700, Paul E. McKenney wrote:
>> Marco, Thomas, is there any better setup I can provide Stephen?  Or
>> is the next-20200519 -rcu tree the best we have right now?
>
> I've queued the fixes yesterday into tip:locking/kcsan and tglx said
> something about you having to rebase anyway. I guess you can find him on
> IRC at some point later. :)

locking/kcsan is not the problem (it just has more fixes on top)

core/rcu is the one which diverged and caused the merge conflict with
PPC to happen twice. So Paul needs to remove the stale core/rcu bits and
rebase on the current version (which is not going to change again).

Thanks,

        tglx
