Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA5BA3595D2
	for <lists+linux-next@lfdr.de>; Fri,  9 Apr 2021 08:52:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233439AbhDIGwU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Apr 2021 02:52:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233423AbhDIGwS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 9 Apr 2021 02:52:18 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90008C061761
        for <linux-next@vger.kernel.org>; Thu,  8 Apr 2021 23:51:39 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id w18so5314891edc.0
        for <linux-next@vger.kernel.org>; Thu, 08 Apr 2021 23:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iVXwoDR1W9QvRjhucoUC7c/vC9MQIOWHo7DvYHCPOJo=;
        b=jp3edxb/QxA1ggevZiqUpfEhTNzwuTu/Fzj3YxQUTh4uqo999d9sPlwYAnEzGlbngh
         q0RaAWEavXjMLa0TBLUPgkW2QQUZn4tsAq0OF9xGh0RLGxDPSQ/OSPf759uM/8KlW0eW
         jwKxoGPSxdVoitKMl7IdqIO0OJ95VMnHaRQClJsHbSHBJ45LGgHPVpQJWfjmvejA0ady
         7wO8SRe9WKfr+QW/QLb/Ck/B08DqaAy3wEm6bU18zNWPrSl8J4hC7PIAPglYE6eUinbd
         Y/1xWROZxgpxGonT8d9oQdbt+WasxYr+B8Ehe4U3vwECdbUAJ2yPuiRG7mCixEdIeMpC
         z4Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iVXwoDR1W9QvRjhucoUC7c/vC9MQIOWHo7DvYHCPOJo=;
        b=NHEiq2afuGnn2RLl/bPsDAyrDg72RALWcneLzMJFftJ/D/hEgOTpYiFkt6FeN4atmp
         tCgLh+DEn9nCAImBDHyuSvqnsuVCErKsIXd4hOqYVaylk2tbYyntEnVnP7cokIzPULkx
         qSaaUYnEhPVtMN0W63smLeaTXCITMNMF3uTZc+AIGrNR+I5vDcPrwyoCHEbXPHVGC9Ch
         V8QDvgJvuSR4z6uDeS/iMvFJOP6RH9pXWQO+Ohz/uX5xN4XQC0oxLmXumsU71NMxqoW3
         5fIuH59qPcKsQ9WUmirue3+HybHwd7Ahs1k/Sg+UzRvLM+/tR+yJRHAaXcEDJrI/zJnT
         CmLw==
X-Gm-Message-State: AOAM531T8nExdGIqaDE7TWnecpu+rzudfin8oDNskMsHvtplmAhhivbm
        pXgjnJ3dA4eGEBJn2dCv1rJ+QD1vJSBRm/5p1g0yrIrCHH9QsQ==
X-Google-Smtp-Source: ABdhPJyJvtMdjK2KX7gsxXdwAKOJSMBjGpt1UhnyQgrzyqzOqiWv/VvaFEcu7shOuE5aXr1d1z9IsTvLv40e3h/k3UA=
X-Received: by 2002:aa7:d843:: with SMTP id f3mr10419259eds.52.1617951098105;
 Thu, 08 Apr 2021 23:51:38 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYtNAEwCk1WkA_25FVUrR0QJ2vt2Dh_w+m-QOSjb8f5TBQ@mail.gmail.com>
 <BYAPR04MB4965A95A5131664085CDD8B786739@BYAPR04MB4965.namprd04.prod.outlook.com>
 <CA+G9fYt30EZOv2mUOf+xGh3R3A0SMJhvVtHFwZuKyBgB75UTTw@mail.gmail.com> <BYAPR04MB49657BEEB8988BBEF3C4429486739@BYAPR04MB4965.namprd04.prod.outlook.com>
In-Reply-To: <BYAPR04MB49657BEEB8988BBEF3C4429486739@BYAPR04MB4965.namprd04.prod.outlook.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 9 Apr 2021 12:21:27 +0530
Message-ID: <CA+G9fYuZE3ciSrkJdT1byLyKwUV1c6yrk4zT97_-FxDDLK6GvQ@mail.gmail.com>
Subject: Re: [next] drivers/cdrom/gdrom.c:586:61: error: 'rq' undeclared
 (first use in this function)
To:     Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "lkft-triage@lists.linaro.org" <lkft-triage@lists.linaro.org>,
        Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
        linux-block <linux-block@vger.kernel.org>,
        Johannes Thumshirn <Johannes.Thumshirn@wdc.com>,
        Hannes Reinecke <hare@suse.de>,
        Damien Le Moal <Damien.LeMoal@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 9 Apr 2021 at 12:02, Chaitanya Kulkarni
<Chaitanya.Kulkarni@wdc.com> wrote:
>
> On 4/8/21 23:24, Naresh Kamboju wrote:
> >> bio_offset(req->bio),
> >>                         GDROM_DMA_STARTADDR_REG);
> >>         __raw_writel(block_cnt * GDROM_HARD_SECTOR, GDROM_DMA_LENGTH_REG);
> >>         __raw_writel(1, GDROM_DMA_DIRECTION_REG);
> > Thanks for your patch.
> > After applying this typo fix, the build pass now.
> >
> > - Naresh
> >
>
> are you okay if I add your tested by tag to the official patch ?
>
> Or you want to send it as a reply to that patch ?

Please create a patch and add my Reported-by / Tested-by tags.

- Naresh
