Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F3661005E7
	for <lists+linux-next@lfdr.de>; Mon, 18 Nov 2019 13:50:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726646AbfKRMuv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Nov 2019 07:50:51 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33933 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726575AbfKRMuv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 18 Nov 2019 07:50:51 -0500
Received: by mail-wr1-f66.google.com with SMTP id e6so19351554wrw.1;
        Mon, 18 Nov 2019 04:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=hmA7HI+U8iTRtTsVLZIxvRAMHhpRdj8xZH+6A8vTZiA=;
        b=VASIzC6iuSEmOUKog4jfbuqJPxmqH8l+6zqaS6cOUZr36m1Htbz7tELJ/pqQBM9aqY
         PW270XSzbmP5ZYCV/PzVhcBzYOWBamcMvaZOy+gMqJrtu4jebp9Xioibg6jOZpcHUjVi
         bhyp5Ig31mAr4/K96NOD2XuYOstdTDj0P7/iVrvKHR4rfzk8wD8JhG4/cvLKLVXoxe4/
         /Ns6DRRxt3fbkrcVxJybPu/miris8X6YyA7qkf8zzUQbPjSNFvOmXJXk+MH5LikLQU+F
         gByD9rmR8dD45lFqz/VcZY38LpTczUWRFU03190Fxcjr3L4esSj7GMU7Cm1nU84/GDXl
         w+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=hmA7HI+U8iTRtTsVLZIxvRAMHhpRdj8xZH+6A8vTZiA=;
        b=dWLHr6u+XLTM/tshlV+SC0qf3SIn748zcgeC/HqbnT9yFjBKh/xfvasVKoDRqpEFKF
         t+mSjpoA73Y9jrTMG809iKeIfwzx3LaXKW5PhVETfRQXH7ltOOuk0tMl9oLWAiggK3mm
         ykscoohorU2M0hqBrbZ9JVrLNqBKRHuGGXR5nInJpZ4FcAxER0309NPt4PC7LRYHJr1F
         rolkTv+mwGprcohpjssF1WlJR5gxAvDXbjtq/KnXEsVEz+tVahIETd07csg3hISUgeXY
         883/h5Dng5qRf5jpDycjqwzA8U0yi4v/9DhnVZsLm4hVT0ssTk8eLDz+3pN8xMla8TVS
         rUbA==
X-Gm-Message-State: APjAAAWlVPLxeIu3aHxI7H0YyJQijUb11kCLaB6j4q5Vsa5sezLrqS4K
        4kd/VqubX+uJ/v8YBgUJbhM=
X-Google-Smtp-Source: APXvYqxrbf3RSMiN/ezXYlBHDSkKnOuodf2k8SxFdLRW76B6lPXgZNWEYJez2zSXmWaVdmYGb2udEA==
X-Received: by 2002:a5d:5224:: with SMTP id i4mr14768219wra.303.1574081448767;
        Mon, 18 Nov 2019 04:50:48 -0800 (PST)
Received: from gmail.com (54033286.catv.pool.telekom.hu. [84.3.50.134])
        by smtp.gmail.com with ESMTPSA id b15sm22488800wrx.77.2019.11.18.04.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 04:50:48 -0800 (PST)
Date:   Mon, 18 Nov 2019 13:50:46 +0100
From:   Ingo Molnar <mingo@kernel.org>
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>, Tejun Heo <tj@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: linux-next: manual merge of the workqueues tree with the tip tree
Message-ID: <20191118125046.GB74767@gmail.com>
References: <20191118150858.1a436a12@canb.auug.org.au>
 <20191118090000.hpnibmk6xculuwii@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191118090000.hpnibmk6xculuwii@linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


* Sebastian Andrzej Siewior <bigeasy@linutronix.de> wrote:

> On 2019-11-18 15:08:58 [+1100], Stephen Rothwell wrote:
> > Hi all,
> Hi,
> 
> > Today's linux-next merge of the workqueues tree got a conflict in:
> > 
> >   kernel/workqueue.c
> > 
> > between commit:
> > 
> >   5a6446626d7e ("workqueue: Convert for_each_wq to use built-in list check")
> > 
> > from the tip tree and commit:
> > 
> >   49e9d1a9faf2 ("workqueue: Add RCU annotation for pwq list walk")
> > 
> > from the workqueues tree.
> 
> urgh. So the RCU warning is introduced in commit
>    28875945ba98d ("rcu: Add support for consolidated-RCU reader checking")
> 
> which was merged in v5.4-rc1. I enabled it around -rc7 and saw a few
> warnings including in the workqueue code. I asked about this and posted
> later a patch which was applied by Tejun. Now I see that the tip tree
> has a patch for this warning…
> I would vote for the patch in -tip since it also removes the
> assert_rcu_or_wq_mutex() macro.
> It would be nice if this could be part of v5.4 since once the RCU
> warning is enabled it will yell.

So 5a6446626d7e is currently queued up for v5.5 as part of the RCU tree. 

I can cherry pick 5a6446626d7e into tip:core/urgent if Paul and Tejun 
agree.

Thanks,

	Ingo
