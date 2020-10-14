Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B6B028E2E3
	for <lists+linux-next@lfdr.de>; Wed, 14 Oct 2020 17:13:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731689AbgJNPNR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 14 Oct 2020 11:13:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726006AbgJNPNR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 14 Oct 2020 11:13:17 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC039C061755;
        Wed, 14 Oct 2020 08:13:15 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id f21so2637024wml.3;
        Wed, 14 Oct 2020 08:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wKovQW/BZuEib5N5VKz8qE8nvWBDTtqg2/y0GWx/Iik=;
        b=YmNXzgrXVkV698eCXfcnujqTNF3EKUMoTQh9uHThFLNUxNiPJDLk1hI+WU0Ps9QUO8
         cuGhKieHQH6XcpjSiluSYv1h/NGuD32ednc4pR2Ezz0Rq+theBtb0TZBFhpDlgJmXc9V
         hco3+4ai/fq1K56tqCHnVcnjupTq/p1U2PphwPR7Wt64HcAYz86SXfeulVdAhSNbUFVm
         zfIn6oxR22rIYftr0tStucjaJmYIGWbUbAagURiSTfk3JLPGHd51QSmFkqzkzqukniDc
         pl0WWTAtuUXEOUjZo2U9yxTtBVzMmZQO2CdVtRcngXRmPqGUZz21aqyeQswvfLRLbx/i
         hX1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wKovQW/BZuEib5N5VKz8qE8nvWBDTtqg2/y0GWx/Iik=;
        b=RbSpnkH3YL+i79sFKi2BJA3XqBvkdgCU7v5E8SmebEgrYDMbCAMRaZk6lm+0FAZOiJ
         1ulUBwgdXs97uB0xbALK/wjkK/3CwDRP9509oWvy5fjhWWP01rcvxbg8FHfGp5iOCA2m
         /7Tw5irExAuwqPGi0z7SAQJ619YOfVq8zjD/DRO/QwLMxTDMEMQ6ZD6Fy0/3GT29RWoH
         Sk8K20LsRMP1t2acCz0xPOdi45gWadp/xmqroyBBDO1tWMjQog2sVjScoV7Ngox7hcRg
         U7hjtNxq2E9WfJ1EC0rLTtEjIn1EQM+kpW99Z/sZU6CMKKVp8jUTQhcAosjxD/Zy9Zd/
         jvvw==
X-Gm-Message-State: AOAM530FYqBZPYD3aPEgSNMK3zV4NUjLJKnzELu9lHweIwCP1jnZORlk
        8ItzHwSxU+N89PjXTw3KXXM=
X-Google-Smtp-Source: ABdhPJwNJFUjgI7k1EEdEK1tFg+hZKBTmpSryM9LzxTsfjZfGH0RpcayvBv23jwUUqfioArrIn4Aow==
X-Received: by 2002:a1c:495:: with SMTP id 143mr3713978wme.63.1602688394508;
        Wed, 14 Oct 2020 08:13:14 -0700 (PDT)
Received: from alley (176-114-240-43.rychlydrat.cz. [176.114.240.43])
        by smtp.gmail.com with ESMTPSA id p4sm5463735wrf.67.2020.10.14.08.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 08:13:13 -0700 (PDT)
From:   Petr Mladek <mladek.petr@gmail.com>
X-Google-Original-From: Petr Mladek <pmladek@suse.com>
Date:   Wed, 14 Oct 2020 17:13:11 +0200
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org, LTP List <ltp@lists.linux.it>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        John Ogness <john.ogness@linutronix.de>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
        Steven Rostedt <rostedt@goodmis.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: BUG: KASAN: global-out-of-bounds in vprintk_store on x86_64
Message-ID: <20201014151311.GB13775@alley>
References: <CA+G9fYt46oC7-BKryNDaaXPJ9GztvS2cs_7GjYRjanRi4+ryCQ@mail.gmail.com>
 <20201014140514.GB17231@alley>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014140514.GB17231@alley>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed 2020-10-14 16:05:20, Petr Mladek wrote:
> On Wed 2020-10-14 16:19:18, Naresh Kamboju wrote:
> > While testing LTP controllers testing on x86_64 KASAN enabled linux
> > next 20201013 tag
> > kernel this kernel BUG noticed. The oom-killer log also noticed while
> > running tests.
> > 
> > metadata:
> >   git branch: master
> >   git repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
> >   git commit: f2fb1afc57304f9dd68c20a08270e287470af2eb
> >   git describe: next-20201013
> >   make_kernelversion: 5.9.0
> >   kernel-config:
> > https://builds.tuxbuild.com/TXP6cqokP8BCYJrv7zf6kw/kernel.config
> > 
> This is the last string stored in the ring buffer before KASAN trigerred.
> 
> > [  221.922108] ==================================================================
> > [  221.922111] BUG: KASAN: global-out-of-bounds in vprintk_store+0x362/0x3d0
> > [  221.922112] Write of size 2 at addr ffffffffba51dbcd by task
> > memcg_test_1/11282
> 
> > [  221.922114] CPU: 1 PID: 11282 Comm: memcg_test_1 Not tainted
> > 5.9.0-next-20201013 #1
> > [  221.922116] Hardware name: Supermicro SYS-5019S-ML/X11SSH-F, BIOS
> > 2.0b 07/27/2017
> > [  221.922116] Call Trace:
> > [  221.922117]  dump_stack+0xa4/0xd9
> > [  221.922118]  print_address_description.constprop.0+0x21/0x210
> > [  221.922119]  ? _raw_write_lock_bh+0xe0/0xe0
> > [  221.922120]  ? vprintk_store+0x362/0x3d0
> > [  221.922121]  kasan_report.cold+0x37/0x7c
> > [  221.922122]  ? vprintk_store+0x362/0x3d0
> > [  221.922123]  check_memory_region+0x18c/0x1f0
> > [  221.922124]  memcpy+0x3c/0x60
> > [  221.922125]  vprintk_store+0x362/0x3d0
> 
> It seems that vprintk() store was able to extend the last string
> by the two characters. So this is likely:
> 
> static size_t log_output(int facility, int level, enum log_flags lflags,
> 			 const struct dev_printk_info *dev_info,
> 			 char *text, size_t text_len)
> {
> [...]
> 		if (prb_reserve_in_last(&e, prb, &r, caller_id, LOG_LINE_MAX)) {
> 			memcpy(&r.text_buf[r.info->text_len], text, text_len);
> 
> But very likely the two characters were copied to wrong location.
> There are many similar lines in the full log and they always contain
> 
>     task_memcg=/0
> 
> It means that the size of the path is 2 characters but it should be
> "/0". I guess that "in" was in the log buffer from the previous
> wrap.
> 
> So, it seems that prb_reserve_in_last() correctly updated the size
> of the extended record but it returned wrong pointer to the buffer
> or wrong current length.
> 
> Anyway, prb_commit(&e) moved the buffer back to consistent state.


> > [  213O[  221.922182] The buggy address belongs to the variable:
> > [  221.922183]  clear_seq+0x2d/0x40
> 
> The address ffffffffba51dbcd seems to be from the range of
> "module mapping space" adresses.
> 
> "clear_seq" is static variable from kernel/printk/printk.c.

There is a bug in data_realloc(). We return wrong pointer when there
is no need to resize the record and it has been wrapped.

It might happen when we add only few characters and there was
a space because of alignment.

It would cause writing outside the buffer into another statically
defined variables. So, it might be it.

The following change patch should fix it:


diff --git a/kernel/printk/printk_ringbuffer.c b/kernel/printk/printk_ringbuffer.c
index 2493348a1631..24a960a89aa8 100644
--- a/kernel/printk/printk_ringbuffer.c
+++ b/kernel/printk/printk_ringbuffer.c
@@ -1125,7 +1125,10 @@ static char *data_realloc(struct printk_ringbuffer *rb,
 
 	/* If the data block does not increase, there is nothing to do. */
 	if (head_lpos - next_lpos < DATA_SIZE(data_ring)) {
-		blk = to_block(data_ring, blk_lpos->begin);
+		if (wrapped)
+			blk = to_block(data_ring, 0);
+		else
+			blk = to_block(data_ring, blk_lpos->begin);
 		return &blk->data[0];
 	}
 
