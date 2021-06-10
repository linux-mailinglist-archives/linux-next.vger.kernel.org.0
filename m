Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3495F3A2BB5
	for <lists+linux-next@lfdr.de>; Thu, 10 Jun 2021 14:35:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230230AbhFJMh1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Jun 2021 08:37:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41086 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230001AbhFJMh0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 10 Jun 2021 08:37:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623328529;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0EePEBe0J7x4XGzeKViGuhBAvu3PhM1WpY8j8Rkd77s=;
        b=A7oK6AVI1u5bjJRY5lNiRMYTMGfhY8pL3Z6YwNKQ5PSe/aD27ahVgNS5dHXOM3kY2Kmv6I
        21W4UXdXKeN/cmSI0bVAacs3YR7IWfCsP9c4yha14EKxQVXLnp5uTdCwzz8XHEgChIX+2J
        CNdNEwr5/kGvB4OEut83hyopNeHxu1M=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-seu98mh7OHaNm34z6BbLyg-1; Thu, 10 Jun 2021 08:35:27 -0400
X-MC-Unique: seu98mh7OHaNm34z6BbLyg-1
Received: by mail-wm1-f69.google.com with SMTP id 128-20020a1c04860000b0290196f3c0a927so3808901wme.3
        for <linux-next@vger.kernel.org>; Thu, 10 Jun 2021 05:35:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0EePEBe0J7x4XGzeKViGuhBAvu3PhM1WpY8j8Rkd77s=;
        b=Fl7klff6HtbCjw1Wq7x7WToK3ceCWU+cIQEUIaMbhvV8Qo33JURCPMcsK5XnerKO4t
         Y10WrZoYzSZrAWn+JZtc+msz+fyuSkGbCosqZRD2h6iqY+bFIb2Od/Ws3jUx8tuI2/6T
         4HuPUbTw6PgHbFQBJF2/SDvM32e6KK1NNa+uKbcJA88XcAzi8VP/XLpaSSfOMDEDJKA3
         S6O1VAJVCBnK1Or2yCh9H+w/YcPxPMq3RILhXGXpu5rbO0/DQXYsun6/kijmPtiqS2NP
         fyG737+if2HHLdOHO0vzw0SAImhp/DdegFCWu/6i/Dy5L3M6k/ges6JzmvX0+7UFvgDg
         tTFw==
X-Gm-Message-State: AOAM530M6i3D8Gc0rUZOjfTf+8c/45/YScTXRd/5Ya2lw5vJCRB3H/p5
        FfQEKAf9xN4FY5yx8wS8kJDIxVg+/1HTwIrc3L5bFtEa3mS+U4UCaKdhyvZphYGM8Q57p2tpUGs
        PNHF+GB7ErMIsrseLWcDQ53HTeTmO8bg4xJJAIw==
X-Received: by 2002:adf:fb92:: with SMTP id a18mr2096807wrr.182.1623328526530;
        Thu, 10 Jun 2021 05:35:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxk79cdEnN+HNQ14JBR884eFY8g4LPsuyRY4eWVEaflAO1UbCjo7GdVjSUVhHywO+MOTDo9Bo6HgZMRkI4aRMU=
X-Received: by 2002:adf:fb92:: with SMTP id a18mr2096799wrr.182.1623328526404;
 Thu, 10 Jun 2021 05:35:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210609130751.38a409a8@canb.auug.org.au>
In-Reply-To: <20210609130751.38a409a8@canb.auug.org.au>
From:   Andreas Gruenbacher <agruenba@redhat.com>
Date:   Thu, 10 Jun 2021 14:35:15 +0200
Message-ID: <CAHc6FU6cV3R6Atatf8K6=j9hwgUE2MvXDLsw7ctBtneCFrREgA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the gfs2 tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Steven Whitehouse <swhiteho@redhat.com>,
        Bob Peterson <rpeterso@redhat.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Wed, Jun 9, 2021 at 5:08 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> After merging the gfs2 tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>
> Caused by commit
>
>   f8524fce6a88 ("iov_iter: Add iov_iter_fault_in_writeable()")
>
> interacting with commits
>
>   e59c7577f5d6 ("iov_iter: separate direction from flavour")
>   30da2b24a3ed ("iov_iter: make the amount already copied available to iterator callbacks")
>
> from the vfs tree.
>
> I have applied the following fix up patch (I think it is mostly right?)

yes, that looks correct. I've updated the gfs2 for-next branch with a
version that merges in the vfs bits, so the conflict should be gone
now.

Thanks,
Andreas

