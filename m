Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F21141A5D7
	for <lists+linux-next@lfdr.de>; Tue, 28 Sep 2021 05:02:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238710AbhI1DEV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Sep 2021 23:04:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238781AbhI1DEP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 27 Sep 2021 23:04:15 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9399C061575
        for <linux-next@vger.kernel.org>; Mon, 27 Sep 2021 20:02:36 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id c26-20020a056830349a00b0054d96d25c1eso683254otu.9
        for <linux-next@vger.kernel.org>; Mon, 27 Sep 2021 20:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CwQ0UfiMphl7UCupbZZAVfzMUncFhrOEd9zZGds8Kbw=;
        b=Gs16D0xiZeUMFi79L/U+okQVmp5Q+nFLVf+DFcwPNUndE280ILn7ENCHXGd90v3LCQ
         v8SjbMG8GS7tsO8kb2zQSjEfNcnsY7R+3/BexzFiX4IFtkS1dyFN4UHRVg+psoNWP9iB
         SpwNaPeJ9fqDohZQbTdq1ID/e0Pf/vYvVONanz8xhBpWxl1Bkg7vtcudwGkdwQbPl72d
         USbTbDzieG/qSJGrHzLB3jyOVBownWws0Qa6MwKp0qw73HMbWEFLtgYrZ/tCaJA5YEig
         2dYtwC99n4xmV+ptzHDvdRqUTyv2cqLTE60W1DPEiIyJ6SzCE7cs1WoS0AxtZCoJ48dK
         XnLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CwQ0UfiMphl7UCupbZZAVfzMUncFhrOEd9zZGds8Kbw=;
        b=y3TrlzIiYwfZQZI2wAjOGa4kf3SwUMQ5CnG4lo5t2DkTwNjPc6umqqYLJUpyXoYbkO
         OsD7yNJmlPf5Oes4qA7kQ5Pq3IXJIBK5aa7xBcKNxnb2UmRC8VpG6YV/35Id7l/gXQbn
         2k5j3nyRY7nGRbU55nCkJRcbswGWNddx2Ax0YV5LtI7WrkfkT9R0kjOz4KXP42XGblzj
         GbaQBj9VMlkC/dFfOFCI2bXP+FfvBrQVGBLDIJiVCL8E61Qz0llJ0LJBV5vwqWXCwX25
         NIseFIPxmvwz4aCP20+4bmF46FrubFHYVVSdhD9iCYrpJVMVUe3ildUrPGF9DhW6Zx6N
         FryA==
X-Gm-Message-State: AOAM531JEXy8xS25ZyL35uK9QpQ/LmVWG4Q974rNmWLcKK3D8VV16/2v
        UoqttAyfK07/8MLfcokRjrZAf9i9xw62WA==
X-Google-Smtp-Source: ABdhPJwNvtHLkCCuN5Mmeww6TemgodBFbOvZSbD+GmIHb4CCsiKRO+wYsRHyND0Razrke67rEtg3FA==
X-Received: by 2002:a9d:7053:: with SMTP id x19mr3066995otj.229.1632798156178;
        Mon, 27 Sep 2021 20:02:36 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a8sm4624788oos.46.2021.09.27.20.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 20:02:35 -0700 (PDT)
Date:   Mon, 27 Sep 2021 20:03:10 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commits in the rpmsg tree
Message-ID: <YVKF7skeRjacpLhk@ripper>
References: <20210928084011.3f2318fc@canb.auug.org.au>
 <YVJXpBwfdMYKaE0R@ripper>
 <20210928104341.31521fb0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210928104341.31521fb0@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon 27 Sep 17:43 PDT 2021, Stephen Rothwell wrote:

> Hi Bjorn,
> 
> On Mon, 27 Sep 2021 16:45:40 -0700 Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
> >
> > On Mon 27 Sep 15:40 PDT 2021, Stephen Rothwell wrote:
> > May I ask what tool you use to detect this? Given that checkpatch
> > doesn't care about the committer (afaict)...
> 
> After I fetch each tree, I give the new commit range to the attached
> script (check_commits) which calls the other script as well
> (check_fixes).

Thanks for sharing those Stephen, I'll try to incorporate them into my
checks.

Regards,
Bjorn
