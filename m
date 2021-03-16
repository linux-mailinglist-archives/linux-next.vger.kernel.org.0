Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 967E833E06D
	for <lists+linux-next@lfdr.de>; Tue, 16 Mar 2021 22:22:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230002AbhCPVWL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 16 Mar 2021 17:22:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231828AbhCPVVn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 16 Mar 2021 17:21:43 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37BEFC06174A
        for <linux-next@vger.kernel.org>; Tue, 16 Mar 2021 14:21:43 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id t18so16881328lfl.3
        for <linux-next@vger.kernel.org>; Tue, 16 Mar 2021 14:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cBFrPvHsHaVesORBBS03+Xx5sKwRfyo3GHP/viD1Z7o=;
        b=b5gLOnHD1pmyOhi0nG7xNDh8t3a7HF8gzYuZhwQYWKKtHf+AFCS7i596PsdcqDOKeb
         fZRID0cBYMxoQGxrLhvM2kS0/uEXB7mQe2RCmnZ2Z/PrnnGKzlEjx0Ur/6+kAJLlWhwW
         UgVkf6oX4iMY6dg1h5EnHLxovVE2kXv5lwknFRM/031wBMBeNHiJ/uZJZfcNlihzedX5
         ToQu+lZkD/dL4HWMhWvfaDmbAFVnmQ3IS8ovsbYVqV/sW9QxnZmcJDQA5u+m4zjfneS3
         pGPVcdLhSCAOgen/46NtKwNAZLJBtP45jGuracU344sjcBbWOXZ1QsZMLVs0r8dIyrY7
         y59Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cBFrPvHsHaVesORBBS03+Xx5sKwRfyo3GHP/viD1Z7o=;
        b=A//frO07BzfxIHJ/3er9Y+C5Xxwn3GekzRg9XcJOBf/p7nK+kyAg/lZ/BYpAX2Xk1n
         HOZRcFwsmyGiM18Vbw1gLgODGNv+eFzC0sLrcvfZrt8UsF/mOFI/YNtoIKiUYHXvpi+E
         OlqgLn76bqNYAOT39H1vEszfI2TfqQLQjDAAAxVH6mRrTBtD187NPBsAZ8LbDUZv4WsU
         2ikQiNqKMkpQhIP7iKnR16K5PwhFHaVs+7oJEdAH7/VnSYDr1equ69AA0TaEQ3LKxWH8
         Vafl+1dAl+A3pWUmxaPdJhJ3ueE6XVcqim5n4nlXPQN47I9UrARXKm9dSPxgFWrK7AKd
         bu4Q==
X-Gm-Message-State: AOAM531vfoXcVRxs2y1pBBJf19zX2k+Z5wN3pMBxrLGJZVDS0h8Mn9kI
        eeA8N/6culprB70KpgPyf0pI82pvpZQp8K7ZwmwGiA==
X-Google-Smtp-Source: ABdhPJzjMLnSKAFFZhoWIc1uvOae5WUm4lvTIGBKN/uSlni/uHFlNJftH4yWCjbeBxVmSNg6wJGF/JNRCVNqFFFzya8=
X-Received: by 2002:a19:ee19:: with SMTP id g25mr383769lfb.83.1615929701470;
 Tue, 16 Mar 2021 14:21:41 -0700 (PDT)
MIME-Version: 1.0
References: <YFEeWD7LMPYngtbA@osiris>
In-Reply-To: <YFEeWD7LMPYngtbA@osiris>
From:   Shakeel Butt <shakeelb@google.com>
Date:   Tue, 16 Mar 2021 14:21:29 -0700
Message-ID: <CALvZod5ju+rWRNtVTjka0PgOPTrWnQ0mStaVEi2wEYEZEprBiA@mail.gmail.com>
Subject: Re: [BUG -next] "memcg: charge before adding to swapcache on swapin" broken
To:     Heiko Carstens <hca@linux.ibm.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Roman Gushchin <guro@fb.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Hugh Dickins <hughd@google.com>,
        Juergen Christ <jchrist@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Linux MM <linux-mm@kvack.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Heiko,

On Tue, Mar 16, 2021 at 2:08 PM Heiko Carstens <hca@linux.ibm.com> wrote:
>
> Hi Shakeel,
>
> your commit 3a9ca1b0ac0f ("memcg: charge before adding to swapcache on
> swapin") in linux-next 20210316 appears to cause user process faults /
> crashes on s390 like:
>
> User process fault: interruption code 003b ilc:3 in sshd[2aa15280000+df000]
> Failing address: 0000000000000000 TEID: 0000000000000800
> Fault in primary space mode while using user ASCE.
> AS:00000000966b41c7 R3:0000000000000024
> CPU: 0 PID: 401 Comm: sshd Not tainted 5.12.0-rc3-00048-geba7667a8534 #10
> Hardware name: IBM 8561 T01 703 (z/VM 7.2.0)
> User PSW : 0705000180000000 0000000000000000
>            R:0 T:1 IO:1 EX:1 Key:0 M:1 W:0 P:1 AS:0 CC:0 PM:0 RI:0 EA:3
> User GPRS: 0000000000000000 fffffffffffff000 0000000000000001 000002aa157b88f0
>            000002aa157c43c0 0000000000000000 0000000000000000 0000000000000000
>            0000000000000000 0000000000000000 0000000000000000 0000000000000000
>            0000000000000000 0000000000000000 0000000000000000 0000000000000000
> User Code: Bad PSW.
>

Thanks for the report. Can you please explain a bit what the above report tells?

I will try the following on the machines I have with that patch.

> This was bisected using elfutils selftests:
>
> autoreconf -fi
> ./configure --enable-maintainer-mode --disable-debuginfod
> make -j $(nproc)
> cd tests
> make -j $(nproc) check
