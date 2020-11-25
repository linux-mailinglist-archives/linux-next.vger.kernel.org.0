Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04C422C3F00
	for <lists+linux-next@lfdr.de>; Wed, 25 Nov 2020 12:23:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbgKYLXG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 25 Nov 2020 06:23:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbgKYLXF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 25 Nov 2020 06:23:05 -0500
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0F0FC0613D4;
        Wed, 25 Nov 2020 03:23:05 -0800 (PST)
Date:   Wed, 25 Nov 2020 12:23:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1606303383;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=zddgu1xg92Bn0MiOfefrMFIbOQ+hQRLk2ZCm304FhdM=;
        b=acGIuGJbU7UREvLEeYq30k4lzUJv9UeKuL6qFGncJg4C/V0RZp2uVBBRmIcK+bKofALZv1
        E/i+KY42+zjgGgWIhugsxh4pK0+KzhaSx7krPIqWVaI4tBzuG1b0YjzcTWivmnnVgWxTbx
        su45/uFa1s4kTrwltU9qXYpO2UxbVEVDVku3b9N93c58X1QU5q3xnxSKl++4RbkNi2h2wv
        2AzDyIO6MIXYLHTI5ThxytVN4lNv+CMzJeBA55R781I0K/LFybudsUFdcO7SCJ1/O6VI+w
        wA3laoEwlfSFF4yg44bDycmmLFdclEUeYbHB58QerS0Zt2srzq/8EL336DEcbw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1606303383;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=zddgu1xg92Bn0MiOfefrMFIbOQ+hQRLk2ZCm304FhdM=;
        b=DLTtjNS3WiGZoyYE4Mj9Ou1emwbzJ/YRBd8P5jF9pfr7kPbZotaSxP0mB8Yozgu/iZNwBs
        fq/R9KQKzyCNkKAw==
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>, lkft-triage@lists.linaro.org,
        LTP List <ltp@lists.linux.it>,
        Andrew Morton <akpm@linux-foundation.org>,
        torvalds@linuxfoundation.org, Yang Shi <shy828301@gmail.com>,
        Jan Kara <jack@suse.cz>, Michal Hocko <mhocko@suse.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mel Gorman <mgorman@suse.de>, Song Liu <songliubraving@fb.com>,
        Zi Yan <ziy@nvidia.com>, vtolkm@googlemail.com,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: kernel BUG at mm/highmem.c:417! invalid opcode: 0000 EIP:
 zero_user_segments
Message-ID: <20201125112302.zh6x3hq7wyzqoz66@linutronix.de>
References: <CA+G9fYuKZGaHVvAv=ZwOL_p6UM3YhOHy0DcJRRM_DOLGYXg1Dw@mail.gmail.com>
 <20201124171628.dk6tle5lh3sx2jxg@linutronix.de>
 <20201125004632.GG4327@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201125004632.GG4327@casper.infradead.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2020-11-25 00:46:32 [+0000], Matthew Wilcox wrote:
> 
> Thanks for debugging this!  I didn't realise start1 was allowed to be
> less than start2.  Try this ... (systemd is sabotaging my efforts to
> test an i386 kernel)

You are welcome.

Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Sebastian
