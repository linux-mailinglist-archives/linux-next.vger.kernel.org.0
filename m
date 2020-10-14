Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECA6928E0B9
	for <lists+linux-next@lfdr.de>; Wed, 14 Oct 2020 14:47:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727310AbgJNMrG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 14 Oct 2020 08:47:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727061AbgJNMrF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 14 Oct 2020 08:47:05 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B15F7C061755;
        Wed, 14 Oct 2020 05:47:05 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id o8so1708375pll.4;
        Wed, 14 Oct 2020 05:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Hj+ZCgQKhreBQYhtsAFJvmMRs2GZZ5ANAJ12F6nGDr4=;
        b=poYkB0CJLjO7PdZQDsYFRdcRLzsclNxELfpx/QRkPvqChsQu42qJ0/PcSrs/QTMY3n
         gkV55WRhQo4ucMaqLwdZoV/f9OMmYxkH7pWvXC6ROIamo1+Y4wevRQpZuDRppEzA3FVs
         D4RSLRZ8TOQ/zXF02YPrbFxV1Jlwk2wHS6PPQUsJfMF1dHPYO1gausj/vwFiOlDBcsmK
         YxTJYd2dg+nbqkF6pM1nMCWQQ3fZvAF45JMIAc2i3nYjwxrS4V2xbxFjD7ooIhasQgOh
         za8gR2HZFnTtsKbeLuWrGA3HvtNuB25wsZELIvGAlg5B1xIrJklz0EArt745PSyW0U8T
         7bfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Hj+ZCgQKhreBQYhtsAFJvmMRs2GZZ5ANAJ12F6nGDr4=;
        b=RQEjJkMR8ZyqEeBUmD8+Q+WZmvsfm3/Yfejxi6WR1+ov/mNJ1uAmrvrunpLIvuDkZk
         zEOQ63pfuJ4bfUV5yZWP20GDoACtcf1pncM9rragPIbBoKLt373YDSzMdyqyVzT1TFA0
         WoGbSAKccr5eSkglIwJSeW2IQsl1yxsGMYmA2JXc6G6eo78KSzvCrToWmzwoFcabBiNL
         EKhqsdbysg/XHyFeGJMp5KhrDEwrlvDyO1YYkGlpnyGaKkzAptIvH1jMPQ5iCcDQ4MNU
         wIcpcH0WXpYYSDXuA9MZtl9IWFqehav1qTC2Dk//ZG+3qdc8W2aKwUpWMdB8xf5ey9sr
         YshQ==
X-Gm-Message-State: AOAM532cA4YckWg45hWCKZa3N1Y27IjBxjC22ORDr3fEgczOJSwwTT+n
        PbvigygRsTaXR+igetdQ5qepv0lGNGM=
X-Google-Smtp-Source: ABdhPJxhROKW+4z70T9DiNRMPAyHbvrReUSWvahNL8E1zlFIQEEUB4pcIQ4uaTFWt6dVFM3rSBqTjA==
X-Received: by 2002:a17:90a:dd46:: with SMTP id u6mr3604305pjv.67.1602679625208;
        Wed, 14 Oct 2020 05:47:05 -0700 (PDT)
Received: from localhost ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id na9sm2659609pjb.45.2020.10.14.05.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 05:47:03 -0700 (PDT)
Date:   Wed, 14 Oct 2020 21:47:01 +0900
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     John Ogness <john.ogness@linutronix.de>,
        Petr Mladek <pmladek@suse.com>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org, LTP List <ltp@lists.linux.it>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
        Steven Rostedt <rostedt@goodmis.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: Re: BUG: KASAN: global-out-of-bounds in vprintk_store on x86_64
Message-ID: <20201014124701.GA614@jagdpanzerIV.localdomain>
References: <CA+G9fYt46oC7-BKryNDaaXPJ9GztvS2cs_7GjYRjanRi4+ryCQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYt46oC7-BKryNDaaXPJ9GztvS2cs_7GjYRjanRi4+ryCQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On (20/10/14 16:19), Naresh Kamboju wrote:
> Crash log:
> --------------
> [  221.921944] oom-kill:constraint=CONSTRAINT_MEMCG,nodemask=(null),cpuset=c,mems_allowed=0,oom_memcg=/0,task_memcg=in
> [  221.922108] ==================================================================
> [  221.922111] BUG: KASAN: global-out-of-bounds in vprintk_store+0x362/0x3d0
> [  221.922112] Write of size 2 at addr ffffffffba51dbcd by task
> memcg_test_1/11282
> [  221.922113]
> [  221.922114] CPU: 1 PID: 11282 Comm: memcg_test_1 Not tainted
> 5.9.0-next-20201013 #1
> [  221.922116] Hardware name: Supermicro SYS-5019S-ML/X11SSH-F, BIOS
> 2.0b 07/27/2017
> [  221.922116] Call Trace:
> [  221.922117]  dump_stack+0xa4/0xd9
> [  221.922118]  print_address_description.constprop.0+0x21/0x210
> [  221.922119]  ? _raw_write_lock_bh+0xe0/0xe0
> [  221.922120]  ? vprintk_store+0x362/0x3d0
> [  221.922121]  kasan_report.cold+0x37/0x7c
> [  221.922122]  ? vprintk_store+0x362/0x3d0
> [  221.922123]  check_memory_region+0x18c/0x1f0
> [  221.922124]  memcpy+0x3c/0x60
> [  221.922125]  vprintk_store+0x362/0x3d0
> [  221.922125]  ? __ia32_sys_syslog+0x50/0x50
> [  221.922126]  ? _raw_spin_lock_irqsave+0x9b/0x100
> [  221.922127]  ? _raw_spin_lock_irq+0xf0/0xf0
> [  221.922128]  ? __kasan_check_write+0x14/0x20
> [  221.922129]  vprintk_emit+0x8d/0x1f0
> [  221.922130]  vprintk_default+0x1d/0x20
> [  221.922131]  vprintk_func+0x5a/0x100
> [  221.922132]  printk+0xb2/0xe3
> [  221.922133]  ? swsusp_write.cold+0x189/0x189
> [  221.922134]  ? kernfs_vfs_xattr_set+0x60/0x60
> [  221.922134]  ? _raw_write_lock_bh+0xe0/0xe0
> [  221.922135]  ? trace_hardirqs_on+0x38/0x100
> [  221.922136]  pr_cont_kernfs_path.cold+0x49/0x4b

A side note,
So this brings the question:


	#define PATH_MAX        4096

	static char kernfs_pr_cont_buf[PATH_MAX];

	void pr_cont_kernfs_path(struct kernfs_node *kn)
	{
	...
		if (sz >= sizeof(kernfs_pr_cont_buf)) {
			pr_cont("(name too long)");
			goto out;
		}
	
		pr_cont("%s", kernfs_pr_cont_buf);
	...
	}

Do we still want to limit printk line to 1024?
There are functions that want longer lines (e.g. kernel boot command
line).

	-ss
