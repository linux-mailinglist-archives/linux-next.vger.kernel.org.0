Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2DEC22C023
	for <lists+linux-next@lfdr.de>; Fri, 24 Jul 2020 09:47:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726643AbgGXHrK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 24 Jul 2020 03:47:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbgGXHrK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 24 Jul 2020 03:47:10 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F07F5C0619D3;
        Fri, 24 Jul 2020 00:47:09 -0700 (PDT)
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1595576828;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=FWXzCGiB+6w7bin5af8nfmtk9CLXKa68COVfjfing6o=;
        b=VRmIniZQg37vYwELwNuDFHkbyu0XfUkeBc5nCdGKaiEqTViQ7TX864WY4BP4URYtXBLEc9
        QA+iYdoVZkmeLnJWt20TK6EI4srOug7m00sO9dBUV9cAZPDTIzfgvX1EQg7opPXGABTucY
        oYXYKdhqRp5SSw12dQEomh1XKirEHVlV9GIaNUCOhr7qSqKOfh252sjzQ/EvK0/zwgxl2w
        Scp0TgYUIWUDLZr8jjisgUhfWeIQhJ6N9sCtlGNPMbJBn5yhxcvhxUhYQu7u5RKLzvyFm1
        r6ZIRdpdbaa9u5mafzvHomShi7jd07YNh6ucCY1hcJbKp4/P/1Fuufw1yRYx8g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1595576828;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=FWXzCGiB+6w7bin5af8nfmtk9CLXKa68COVfjfing6o=;
        b=hWKYclINMXT+gdDfZm0t8FY9MgtW8eRxZcVJ9W9CNe34dTnQoWnuZffaeIi/WOIc7YIQgf
        R7qYcBptaLh6JeBQ==
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Uladzislau Rezki <urezki@gmail.com>, Qian Cai <cai@lca.pw>,
        bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org, luto@kernel.org,
        mingo@redhat.com, peterz@infradead.org,
        syzkaller-bugs@googlegroups.com, x86@kernel.org,
        linux-next@vger.kernel.org, lpf.vector@gmail.com,
        Shakeel Butt <shakeelb@google.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Michal Hocko <mhocko@kernel.org>,
        Yafang Shao <laoar.shao@gmail.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Matthew Wilcox <willy@infradead.org>,
        Oleksiy Avramchenko <oleksiy.avramchenko@sonymobile.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Joerg Roedel <jroedel@suse.de>, Roman Gushchin <guro@fb.com>,
        Dennis Zhou <dennis@kernel.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: Re: kernel BUG at mm/vmalloc.c:LINE! (2)
In-Reply-To: <20200724142801.49d5e7a3@canb.auug.org.au>
References: <000000000000588c2c05aa156b2b@google.com> <0000000000003cdc6c05aae24652@google.com> <20200720200618.GA9501@pc636> <20200722142759.GB4041@lca.pw> <20200722144650.GA19628@pc636> <20200723195029.60933e30f5d3dd64d6a861b3@linux-foundation.org> <20200724142801.49d5e7a3@canb.auug.org.au>
Date:   Fri, 24 Jul 2020 09:47:07 +0200
Message-ID: <87a6zpuzgk.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:
>> All a bit mysterious.  I think it's best that we revert this from
>> linux-next until we hear from Ingo.  I queued a patch - I expect
>> Stephen will see and grab it, thanks.
>
> In the end I actually did the revert (of the revert) in the merge of
> the tip tree (so that -next will bisect better if necessary).  So you
> will not need the revert in your quilt series after today.

Sigh. I have no idea why this was in tip auto-latest. I just
reintegrated that branch and the annoyance should be gone now.

Sorry for not paying attention.

Thanks,

        tglx
