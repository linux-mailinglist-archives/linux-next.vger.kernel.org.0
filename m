Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBA6E29D5DE
	for <lists+linux-next@lfdr.de>; Wed, 28 Oct 2020 23:09:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730340AbgJ1WJ2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 28 Oct 2020 18:09:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37037 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730320AbgJ1WJ1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 28 Oct 2020 18:09:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603922965;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=284b5r+7PQhFjN0PmG3IKEcminvVA7d407HnU3mjfkE=;
        b=VZS/5aq5iT7jByT+bagzx8vzPqQHXTY2ClAhq/IA8csEDMZG/rIpbmtlM2xM9TFENNtDM3
        hf7B6pwDwmZfoqlZUlft9lP2h9HW6NPeWSbTYO1Bkxqt9AEfo5/VTq3n7LM2/wNPE/Mu3e
        yz/HloZna19HQFNiC6Kk7/H0/o+8U9k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-KC48yM7BOjKGJFAyziTMpw-1; Wed, 28 Oct 2020 16:09:03 -0400
X-MC-Unique: KC48yM7BOjKGJFAyziTMpw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8ECDB8030DE;
        Wed, 28 Oct 2020 20:09:01 +0000 (UTC)
Received: from ovpn-66-92.rdu2.redhat.com (ovpn-66-92.rdu2.redhat.com [10.10.66.92])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4472D5B4B6;
        Wed, 28 Oct 2020 20:09:00 +0000 (UTC)
Message-ID: <7cd579ccdacb4f672cf2dc3a0d4553d1845e7ebf.camel@redhat.com>
Subject: Re: [tip: locking/core] lockdep: Fix lockdep recursion
From:   Qian Cai <cai@redhat.com>
To:     paulmck@kernel.org
Cc:     Boqun Feng <boqun.feng@gmail.com>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@kernel.org>, x86 <x86@kernel.org>,
        linux-kernel@vger.kernel.org, linux-tip-commits@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Date:   Wed, 28 Oct 2020 16:08:59 -0400
In-Reply-To: <20201028155328.GC3249@paulmck-ThinkPad-P72>
References: <160223032121.7002.1269740091547117869.tip-bot2@tip-bot2>
         <e438b231c5e1478527af6c3e69bf0b37df650110.camel@redhat.com>
         <20201012031110.GA39540@debian-boqun.qqnc3lrjykvubdpftowmye0fmh.lx.internal.cloudapp.net>
         <1db80eb9676124836809421e85e1aa782c269a80.camel@redhat.com>
         <20201028030130.GB3249@paulmck-ThinkPad-P72>
         <8194dca3b2e871f04c7f6e49672837f8df22546f.camel@redhat.com>
         <20201028155328.GC3249@paulmck-ThinkPad-P72>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 2020-10-28 at 08:53 -0700, Paul E. McKenney wrote:
> On Wed, Oct 28, 2020 at 10:39:47AM -0400, Qian Cai wrote:
> > On Tue, 2020-10-27 at 20:01 -0700, Paul E. McKenney wrote:
> > > If I have the right email thread associated with the right fixes, these
> > > commits in -rcu should be what you are looking for:
> > > 
> > > 73b658b6b7d5 ("rcu: Prevent lockdep-RCU splats on lock
> > > acquisition/release")
> > > 626b79aa935a ("x86/smpboot:  Move rcu_cpu_starting() earlier")
> > > 
> > > And maybe this one as well:
> > > 
> > > 3a6f638cb95b ("rcu,ftrace: Fix ftrace recursion")
> > > 
> > > Please let me know if these commits do not fix things.
> > While those patches silence the warnings for x86. Other arches are still
> > suffering. It is only after applying the patch from Boqun below fixed
> > everything.
> 
> Fair point!
> 
> > Is it a good idea for Boqun to write a formal patch or we should fix all
> > arches
> > individually like "x86/smpboot: Move rcu_cpu_starting() earlier"?
> 
> By Boqun's patch, you mean the change to debug_lockdep_rcu_enabled()
> shown below?  Peter Zijlstra showed that real failures can happen, so we

Yes.

> do not want to cover them up.  So we are firmly in "fix all architectures"
> space here, sorry!
> 
> I am happy to accumulate those patches, but cannot commit to creating
> or testing them.

Okay, I posted 3 patches for each arch and CC'ed you. BTW, it looks like
something is wrong on @vger.kernel.org today where I received many of those,

4.7.1 Hello [216.205.24.124], for recipient address <linux-kernel@vger.kernel.org> the policy analysis reported: zpostgrey: connect: Connection refused

and I can see your previous mails did not even reach there either.

https://lore.kernel.org/lkml/



