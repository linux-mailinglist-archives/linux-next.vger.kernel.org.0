Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95BDA3EF04A
	for <lists+linux-next@lfdr.de>; Tue, 17 Aug 2021 18:40:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229477AbhHQQkn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Aug 2021 12:40:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230354AbhHQQkm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Aug 2021 12:40:42 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9A99C061764;
        Tue, 17 Aug 2021 09:40:09 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id n13-20020a17090a4e0d00b0017946980d8dso6149258pjh.5;
        Tue, 17 Aug 2021 09:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qh+tD9yIz5GvazBkAIDWQmgUmN8+zaWmGrylZFw0zi8=;
        b=FV6OLVHJzMYvbEyb0EwlZ1XgyC6sd4vIvt1Ef1M9/dUQng6+gt/d7LoWMjdS6eRPlu
         jLh2t9zZAKbc614YkyxTFRvt3CyVeqSPy1cqOgvTGjMPdhwVDcfRatwVNVdh+Zhkq6pu
         BUv7OeQo11AZ3sKxdWROHDkSCPNamNhLgNuubuuTrw71C0U2a+TZat8qVvgYJOQgI/HS
         5lGVjXVUWCeLxRBdKlgaM2UL4ZEs12481ROKpUlEurMD6z6GdNHXyXda0TRZ18TUJzAu
         Fz+6Ej3Kbfft4sZ6ImPqXbxDOnSE6twjr8c8C72MK/wRtgyh1R4knKaasHestWqAoRyw
         TpzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=qh+tD9yIz5GvazBkAIDWQmgUmN8+zaWmGrylZFw0zi8=;
        b=HtnRSHhRAjVvgHVcg1e1P5pV6+IlmR+0zhfK9mQHc9R8J1X5eL9I6arXCgmOqkyalG
         2/pYNVyI88PzfyuE8AZcVEZJDbQyl5WMbSY+5w1yptbIGhMKzNibL6MIquvOMB/n/fjW
         +lQlbHZLIxLP/9CJfNY1n3n4WhQ20WfNgW7gfCZny7kSsm7R/O+es/ZtA4h0s6GCv343
         nM1D9C+nGozYU2m9nFx3X5ubznPxarkB2zulEdgLcsXnntxQxxecf3fosUmx0KU2ZmYT
         bkwuSn9cjGPxb/7xYTw6rxfk+SHSAtrNZ78nlOtukivbNLqj1k/FNRIdG3iJeSxxhYjm
         kSAA==
X-Gm-Message-State: AOAM533/XQL7lVBlvq6Gi3sg9CXIL8F2dnBNR7K/ifW+7N27IFZMjxa6
        vpxFAV+k5btQ9MdapEP8tsyVOrg+taotpw==
X-Google-Smtp-Source: ABdhPJyUhC1kQ2hDjV71PYbkuFAMuqLbwnb6GEmlGnMrrSpWZ0/TZl4gs4Ox+QetT8cG4kkW0KdeQg==
X-Received: by 2002:a05:6a00:1904:b029:3b9:e4ea:1f22 with SMTP id y4-20020a056a001904b02903b9e4ea1f22mr4577424pfi.79.1629218409214;
        Tue, 17 Aug 2021 09:40:09 -0700 (PDT)
Received: from localhost (2603-800c-1a02-1bae-e24f-43ff-fee6-449f.res6.spectrum.com. [2603:800c:1a02:1bae:e24f:43ff:fee6:449f])
        by smtp.gmail.com with ESMTPSA id q5sm2596611pjo.7.2021.08.17.09.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 09:40:08 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date:   Tue, 17 Aug 2021 06:40:07 -1000
From:   Tejun Heo <tj@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the block tree with Linus' tree
Message-ID: <YRvmZ77w6zeG4BrU@slm.duckdns.org>
References: <20210817152547.70af4cfe@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210817152547.70af4cfe@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Aug 17, 2021 at 03:25:47PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the block tree got a conflict in:
> 
>   block/mq-deadline-cgroup.c
> 
> between commit:
> 
>   0f7839955114 ("Revert "block/mq-deadline: Add cgroup support"")
> 
> from Linus' tree and commit:
> 
>   252c651a4c85 ("blk-cgroup: stop using seq_get_buf")
> 
> from the block tree.
> 
> I fixed it up (I just removed the file) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

Ah, that probably isn't the right resolution. The seq_get_buf change needs
to be applied to the original mq-deadline.c file. Jens, how do you wanna
proceed?

Thanks.

-- 
tejun
