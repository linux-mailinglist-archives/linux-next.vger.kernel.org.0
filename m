Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14E9827DC2D
	for <lists+linux-next@lfdr.de>; Wed, 30 Sep 2020 00:43:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728206AbgI2WnA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 29 Sep 2020 18:43:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728124AbgI2Wm7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 29 Sep 2020 18:42:59 -0400
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com [IPv6:2607:f8b0:4864:20::b42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E6A6C061755;
        Tue, 29 Sep 2020 15:42:58 -0700 (PDT)
Received: by mail-yb1-xb42.google.com with SMTP id x20so4856880ybs.8;
        Tue, 29 Sep 2020 15:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8Uzp0mbaDszk4+DW+KjTjHRU3IuMkydHeAh8AYBMQC4=;
        b=Q1ihDVJGMcmGgokcLCYYkQYPU9KeaYFCXnc+QgKy4eqoziuhyzRkLSvHcpKyK9009p
         PF+gxQ+uoqzwaIcZVBRaKivcKDI01ryz2oykrOGoQZQlDPqxMkZ0Dl19+1YQiKm9VATs
         eoGxRASnHgiDHkXdtJpePVRBU38c96/XAAONMG9mAtVet0lyOjkD8gHYPIG33WImTR3o
         afdrIddQuVkPAJ/JFA5MLUvv19v4lsDhvbL24UBtX5bG+u3bvT9SLt7sB0xp41cnNfNm
         AdRMg6W23+/KI2D2irV8TWc6wC38naQ2c21upraF4JZu6zWG1HxQpvSnfWyr1xtd3Jyq
         gkhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8Uzp0mbaDszk4+DW+KjTjHRU3IuMkydHeAh8AYBMQC4=;
        b=a+1mXeKkFLeD0Hfa1z5REyyORyZeiHk1v3r4OPYMgsCRaIURW3n46P9R8+GXjd7lEo
         yzYtE3TKz+XE91ip6abo121mAAWiCBfObiFeHouWmxs82khVB+49VwqF4MG+KHH1Xl5f
         gqtZrjvGSCvVXlQhbw3sMD/Dq1OxJbsAal4BSLFvN4UTdcCT1tpgPI7jyfC7mCGRKHr2
         gGyFMQtj+braXo5AnCZfED5sT6Bc5pASbKMYSyPcAIQInTTJNz53P9iniV9DEqW2TycW
         JAgKDfNy2Okm8k2PjoW4QelOoSu2cgkeFSB1TTmhGdWw14MbTGIo9SJzgvORqpWfxrH0
         yoGw==
X-Gm-Message-State: AOAM5325wR6BLGODVADUxYc92WdUY/n4AtJ936Wyr5eEjUL10YKojqyQ
        TdCh6cha9fw9MnZmxgZzsO9cUYY+ouNCG0s/fCv7mUbitb0=
X-Google-Smtp-Source: ABdhPJzUbfFoYw22pNhJEoKzH7dhAwYSkX18z6yiPiKX2FigwmnpapCglVbEwnP3QeiMNaqFQeKUpVGiT8RnaBQlekY=
X-Received: by 2002:a25:9c82:: with SMTP id y2mr8603291ybo.364.1601419377394;
 Tue, 29 Sep 2020 15:42:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200930083120.6b969c8c@canb.auug.org.au>
In-Reply-To: <20200930083120.6b969c8c@canb.auug.org.au>
From:   Steve French <smfrench@gmail.com>
Date:   Tue, 29 Sep 2020 17:42:46 -0500
Message-ID: <CAH2r5mu6mSDQ5STUoFKYnDqyyQTY9jfdFiq6J0YwcxOuBd6y_w@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the cifs tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     CIFS <linux-cifs@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

fixed

On Tue, Sep 29, 2020 at 5:31 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Commit
>
>   87505cefd88d ("Convert trailing spaces and periods in path components")
>
> is missing a Signed-off-by from its committer.
>
> --
> Cheers,
> Stephen Rothwell



-- 
Thanks,

Steve
