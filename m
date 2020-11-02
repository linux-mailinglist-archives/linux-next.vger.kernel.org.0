Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A1142A3374
	for <lists+linux-next@lfdr.de>; Mon,  2 Nov 2020 19:58:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726392AbgKBS6O (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Nov 2020 13:58:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43734 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726533AbgKBS6N (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 2 Nov 2020 13:58:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604343491;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KiFFtp2v2OzZxtB5aSwfZtbGyO8aZuVS/CYOJRroQx8=;
        b=JFnkFVLOkrLDM95fzVSTN2A29C6lRtmJgItbpMlLcaVnrcWhZLbWuoYi4Dvl4VUJtwhreI
        y0O8xap4Zt/h1HVTTiq3JFcAu4VZV36VxYBfnjeWIz7xg+czl4qjuUWwGQl4qbmEBkobvZ
        qqFuEU4DMzShy/ygnNKgdN5bu7jOHvM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-oDfcHmi6OeOM-azEQBhOOA-1; Mon, 02 Nov 2020 13:58:07 -0500
X-MC-Unique: oDfcHmi6OeOM-azEQBhOOA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 048BE108E1A1;
        Mon,  2 Nov 2020 18:58:06 +0000 (UTC)
Received: from ovpn-112-12.rdu2.redhat.com (ovpn-112-12.rdu2.redhat.com [10.10.112.12])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 690191002C1A;
        Mon,  2 Nov 2020 18:58:01 +0000 (UTC)
Message-ID: <d60d24de6b7c9b948333e4e288452fe0a39d2380.camel@redhat.com>
Subject: Re: [PATCH] s390: add support for TIF_NOTIFY_SIGNAL
From:   Qian Cai <cai@redhat.com>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
        linux-kernel@vger.kernel.org, peterz@infradead.org,
        oleg@redhat.com, tglx@linutronix.de,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Date:   Mon, 02 Nov 2020 13:58:00 -0500
In-Reply-To: <54c02fa6-8c8a-667f-af99-e83a1f150586@kernel.dk>
References: <20201101173153.GC9375 () osiris>
         <362e3645e2c0891309c07e244a147f0c32f106da.camel@redhat.com>
         <54c02fa6-8c8a-667f-af99-e83a1f150586@kernel.dk>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 2020-11-02 at 10:07 -0700, Jens Axboe wrote:
> On 11/2/20 9:59 AM, Qian Cai wrote:
> > On Sun, 2020-11-01 at 17:31 +0000, Heiko Carstens wrote:
> > > On Thu, Oct 29, 2020 at 10:21:11AM -0600, Jens Axboe wrote:
> > > > Wire up TIF_NOTIFY_SIGNAL handling for s390.
> > > > 
> > > > Cc: linux-s390@vger.kernel.org
> > > > Signed-off-by: Jens Axboe <axboe@kernel.dk>
> > 
> > Even though I did confirm that today's linux-next contains this additional
> > patch
> > from Heiko below, a z10 guest is still unable to boot. Reverting the whole
> > series (reverting only "s390: add support for TIF_NOTIFY_SIGNAL" introduced
> > compiling errors) fixed the problem, i.e., git revert --no-edit
> > af0dd809f3d3..7b074c15374c [1]
> 
> That's odd, it should build fine without that patch. How did it fail for you?

In file included from ./arch/s390/include/asm/bug.h:5,
                 from ./include/linux/bug.h:5,
                 from ./include/linux/mmdebug.h:5,
                 from ./include/linux/percpu.h:5,
                 from ./include/linux/context_tracking_state.h:5,
                 from ./include/linux/hardirq.h:5,
                 from ./include/linux/kvm_host.h:7,
                 from arch/s390/kernel/asm-offsets.c:11:
./include/linux/sched/signal.h: In function ‘signal_pending’:
./include/linux/sched/signal.h:368:39: error: ‘TIF_NOTIFY_SIGNAL’ undeclared
(first use in this function); did you mean ‘TIF_NOTIFY_RESUME’?
  if (unlikely(test_tsk_thread_flag(p, TIF_NOTIFY_SIGNAL)))
                                       ^~~~~~~~~~~~~~~~~
./include/linux/compiler.h:78:42: note: in definition of macro ‘unlikely’
 # define unlikely(x) __builtin_expect(!!(x), 0)
                                          ^
./include/linux/sched/signal.h:368:39: note: each undeclared identifier is
reported only once for each function it appears in
  if (unlikely(test_tsk_thread_flag(p, TIF_NOTIFY_SIGNAL)))
                                       ^~~~~~~~~~~~~~~~~
./include/linux/compiler.h:78:42: note: in definition of macro ‘unlikely’
 # define unlikely(x) __builtin_expect(!!(x), 0)
                                          ^
make[1]: *** [scripts/Makefile.build:117: arch/s390/kernel/asm-offsets.s] Error
1
make: *** [Makefile:1198: prepare0] Error 2

> 
> Can you try and add this on top? Looks like I forgot the signal change for
> s390, though that shouldn't really cause any issues.

It does not help with the boot issue at all.

> 
> 
> diff --git a/arch/s390/kernel/signal.c b/arch/s390/kernel/signal.c
> index 9e900a8977bd..a68c3796a1bf 100644
> --- a/arch/s390/kernel/signal.c
> +++ b/arch/s390/kernel/signal.c
> @@ -472,7 +472,7 @@ void do_signal(struct pt_regs *regs)
>  	current->thread.system_call =
>  		test_pt_regs_flag(regs, PIF_SYSCALL) ? regs->int_code : 0;
>  
> -	if (get_signal(&ksig)) {
> +	if (test_thread_flag(TIF_NOTIFY_SIGNAL) && get_signal(&ksig)) {
>  		/* Whee!  Actually deliver the signal.  */
>  		if (current->thread.system_call) {
>  			regs->int_code = current->thread.system_call;
> 

