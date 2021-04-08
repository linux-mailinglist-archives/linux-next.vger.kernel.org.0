Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AACBA35894D
	for <lists+linux-next@lfdr.de>; Thu,  8 Apr 2021 18:09:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231904AbhDHQJt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Apr 2021 12:09:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231526AbhDHQJt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Apr 2021 12:09:49 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CE6BC061760;
        Thu,  8 Apr 2021 09:09:37 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id b14so4922679lfv.8;
        Thu, 08 Apr 2021 09:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q2y70uZn9bzb33FU99dlR3SYEgVlIDBNcQtt2y1+RFM=;
        b=VB7uXpQBDBw9TAc+0C1va246dBbHcAG3IlxYYEK+346bf2T/yNBVAQYqcOjJvI/Rz5
         ucCMkthqLQTOn/xJ6m+0gR3X6lvtNxM7IyC6NlDvKbAy1GGM+PCdkU5gzlI9DMRX2ikl
         AP+soFJqGU/fjXI5bon39W/+vbldAvEWWMHWSjsHM6xHTMJupu0mPP7tUHy9BZxlopMo
         9cPRd6maw99ks3eeg905nKJzIn6MfQi2W8MJCx4FYIYomHxoKsmrF71I9fn9rmLFCjVx
         wvqZaZyn2MEMtvZMqWeUjfZRfRQvXlwXIYvHjvInlXksHW5kYnMgmt2FNFE3cHAoqFQP
         iCRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q2y70uZn9bzb33FU99dlR3SYEgVlIDBNcQtt2y1+RFM=;
        b=VxYugw40y7NTEw6U9wMi/JAmBzRLOkXcodVbyEIfzRrwVOa7hUZmbMrbGrFtR5/kpk
         mtqc+CljTH0umJ0YuvXUcZ7Ze28XfHcyup79elAprqxxbi+4hoEr2lmSoyOwQT/LEIzi
         l9Z5+ITJoq4OOQGicjOHv1dLtBnf3w/ApdgOOcKZ+k9YiqFCYRkwJM/KdN4e4cRILyVW
         9ymMTDz+dZ8rH6tUwF46/EboJVwmqM1r86pLBtXEmINI1cALg51B8fLvzj7X+xCE/+/+
         zKeoT2Xkvsu5PzAkG0Ulxj1Br0b2if4lf9do2+WwezcFr9HWHqDR05TINkr3BpYNd+z8
         51Ow==
X-Gm-Message-State: AOAM533u/SLQLTmsyorr8ESdE2QwHBmUWOtf9uoHxVNdlIHJVHE1B6dM
        w11KpJ3ydkGMJt+lm+U1cW68Y3ZfSpzwp7VGeoiJ6Ebc2MA=
X-Google-Smtp-Source: ABdhPJyJbS8fyp2YGyi1GVee1muNET1yBazDtu+lJk2Bae/jYuLjtSv5T7EoJj+9xUv1TE6EmD2SqO4knQdYzZYddgo=
X-Received: by 2002:a19:7515:: with SMTP id y21mr7155456lfe.282.1617898174959;
 Thu, 08 Apr 2021 09:09:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210408220711.5a39d4a0@canb.auug.org.au>
In-Reply-To: <20210408220711.5a39d4a0@canb.auug.org.au>
From:   Steve French <smfrench@gmail.com>
Date:   Thu, 8 Apr 2021 11:09:23 -0500
Message-ID: <CAH2r5mts7HLToeuUgPSp5kpurYw9VYt8L26ruudiZ0vHv3BvUA@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the cifs tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     CIFS <linux-cifs@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

fixed - (a tmp branch was accidentally pushed)

On Thu, Apr 8, 2021 at 7:07 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Commit
>
>   e67fcb31fb0e ("stuff")
>
> is missing a Signed-off-by from its author and comitter.
>
> --
> Cheers,
> Stephen Rothwell



-- 
Thanks,

Steve
