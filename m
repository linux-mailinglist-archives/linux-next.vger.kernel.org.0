Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99A802323B8
	for <lists+linux-next@lfdr.de>; Wed, 29 Jul 2020 19:50:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726628AbgG2RuQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Jul 2020 13:50:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726336AbgG2RuQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 29 Jul 2020 13:50:16 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3673FC061794;
        Wed, 29 Jul 2020 10:50:16 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id e8so14642319pgc.5;
        Wed, 29 Jul 2020 10:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=53jL1gCIZPJ/fUs+rrvedrXgW51WiC52+XUIhgRgdC4=;
        b=KAP1c9zwOHZJT007ketCdNEM3axHvVyg3WtUW02b7Ff7jujo1BmmQ4wg3RlBUvfcQK
         MFiscEKEDRiPm5cHq3p0rIKUU9WVRytEKAStmrVKTwenh1FM3NvGIJu3pibZmiJUGYN4
         LHcPL6qeAjUG/wMjkyTiAHPbg69vDZhQJIXTGoYbtfXnx0mPyoGzShmee2UPhQYebGGv
         hKbjBDJhXdSPws9eHnQSwsQSkYfB8PJvsBwYoK4Oi/dkjkKqOuixzUx3LC7Uo3G/+juI
         UdbFwrxHgFubtRL70cFPHEYjArtcjT+lQN4fhTxxAHpX1SHTj23iiQv9BVHH/62NqqF7
         Uj1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=53jL1gCIZPJ/fUs+rrvedrXgW51WiC52+XUIhgRgdC4=;
        b=kDCBsaS1jR8EmtwFqPUlCav5oAFUuo7459f8a7l5VRSOaW6OMErMnHCq3K4BKjd38z
         6z/OftvQ6ha4owShoOMk2q7PnQmk3TECqoxuOtzDTI4LlTfRbG4+h33xsypCP8w5nOhj
         zRM+kFwz6lUik5yVZsdRLQ7fVmjfLA4sPTKgzFwyKAq1x2uX0guQrRRjjY4q/2ezIHyQ
         c5qfC9c2DLCcL3JdNe8n8BuG8ARsamlk45gKB5IRM8nyMq03MapVhF4qEN8u98ioXBqT
         y9uNaFOPgf/gJ4HjfG8TuMfjqwOOa3qwXEg7zaBn4pEhp1uXzDN3Ek1BjpHZgghM3C+3
         aiEA==
X-Gm-Message-State: AOAM531oWSeFwCzjdm3dyTKxkwTC4wMu55slzBYI1iYKLI60wsX6RKAA
        kFwMG0hx61g3veyEK0CcUxE=
X-Google-Smtp-Source: ABdhPJxBMJ6Y/cuQz2xzSY6RfEwMgrehyKQdChtrXWsY4fXTK+U9CwOlHGUJeBwQ8ac+/a+CmK7+Gw==
X-Received: by 2002:a62:2e45:: with SMTP id u66mr6559748pfu.121.1596045015723;
        Wed, 29 Jul 2020 10:50:15 -0700 (PDT)
Received: from localhost ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id z4sm3046126pfb.55.2020.07.29.10.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 10:50:14 -0700 (PDT)
Date:   Thu, 30 Jul 2020 02:50:12 +0900
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Herbert Xu <herbert@gondor.apana.org.au>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Petr Mladek <pmladek@suse.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, Waiman Long <longman@redhat.com>
Subject: Re: [PATCH 0/2] locking/qspinlock: Break qspinlock_types.h header
 loop
Message-ID: <20200729175012.GE1160@jagdpanzerIV.localdomain>
References: <20200729210311.425d0e9b@canb.auug.org.au>
 <20200729114757.GA19388@gondor.apana.org.au>
 <20200729122807.GA7047@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200729122807.GA7047@gondor.apana.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On (20/07/29 22:28), Herbert Xu wrote:
> This miniseries breaks a header loop involving qspinlock_types.h.
> The issue is that qspinlock_types.h includes atomic.h, which then
> eventually includes kernel.h which could lead back to the original
> file via spinlock_types.h.
> 
> The first patch moves ATOMIC_INIT into linux/types.h while the second
> patch actuallys breaks the loop by no longer including atomic.h
> in qspinlock_types.h.

Thanks for staying on this.

I pulled locking/header, run some cross-compilation tests locally
(powerpc, arm, arm64, x86) and pushed printk/for-next. Let's see.

	-ss
