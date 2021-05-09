Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62B783774DE
	for <lists+linux-next@lfdr.de>; Sun,  9 May 2021 03:49:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229679AbhEIBuZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 8 May 2021 21:50:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbhEIBuY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 8 May 2021 21:50:24 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97425C061573;
        Sat,  8 May 2021 18:49:22 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id n32-20020a9d1ea30000b02902a53d6ad4bdso11353640otn.3;
        Sat, 08 May 2021 18:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9HoOH+epaWDFISeM9NKpwA90y2D3nGBc5UaaEncRJH8=;
        b=j6ao7YthentZIs5u4fvo5y9mByS4gly9rYrOf71ATKsnO4VAoxPiZZn/RAoqVQRmEG
         RL0mrrNi9h9mU7NBcB33QkKXRLtdWueEYevHXKRKAWYcceiGaEXc9B3WtgeTEKX26pyt
         ui/fiNqaM18ZWod8SsaVFthfBgvJRbFe9G1r0GF2vPnocA/4KOhOTn0JXNNKlkMkrPiN
         mwNft9dlF2dmHrZs5sfd55/o9tAmvz1DmOuceexFGjeiPe/l99E2p4wlu7wtdbVpgTaz
         7JDoN9Li9LH3cCBVDEiOHE1YN4v8g3/fXrqJrLt+S+bTXSPbC2KM2FRIjJXpkeAfnT29
         bH7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9HoOH+epaWDFISeM9NKpwA90y2D3nGBc5UaaEncRJH8=;
        b=UY/VTdjatmOJS3b3ntCR1QMbr/jnYkYPC+TbP6VNY75SVmwsn5pTQVQaH8cBSLgigw
         cX1I28lWAZ4etJsYmAlMB94N0VdSKclySxf8TXEVCqviBtEMQpfOPSHaT15sxaFNkDP8
         z6o6mT5em8WS80Z9TTkq1A0kiBTrT6qez1r/7kS1jWSynZRhd0bIZHEnZ46gbgakel92
         QZLiF4Y4ptEEdcC7J/dXkxoTc0Iiftf9M9tnuVLZ0LkYY6LWgt1JIiiqqGDjHYdQ3XXy
         G65YK7EASYqzJRh31thfRlSouj1R7yJ9ydVPh11N6tr7z6Ge+pZW4QSABrpx0hqCiFFe
         GMxg==
X-Gm-Message-State: AOAM533H4AcURotcxVxExZumhwZDpbu05SDRnvjfFmz9yrWv5VaANruV
        Vc/CZl42G5pItIVDwqMO4sumvxYO2u9DU9WyS6IpMmLk
X-Google-Smtp-Source: ABdhPJzbg9/BWud9Ec1IQPSIRhjqA20jeObpcj2xl4e0dOF8gbyISfmvf9nALZQUl2SE2lhKqI97IWHBa+p6xUmgKSQ=
X-Received: by 2002:a9d:66da:: with SMTP id t26mr15399039otm.370.1620524962002;
 Sat, 08 May 2021 18:49:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210506082344.4f7af4af@canb.auug.org.au>
In-Reply-To: <20210506082344.4f7af4af@canb.auug.org.au>
From:   Minwoo Im <minwoo.im.dev@gmail.com>
Date:   Sun, 9 May 2021 10:49:11 +0900
Message-ID: <CAA7jztcK8N1hV-4wzpert79E8++mbzQ=AT_yjS7MwJbPAN1MGw@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the block tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello,

Sorry for the late reply, and appreciate pointing that out :)
I will keep that in mind.

Thanks!

On Thu, May 6, 2021 at 7:23 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> In commit
>
>   48145b62563a ("nvme: fix controller ioctl through ns_head")
>
> Fixes tag
>
>   Fixes: 3557a4409701 ("nvme: don't bother to look up a namespace for
>
> has these problem(s):
>
>   - Subject has leading but no trailing parentheses
>   - Subject has leading but no trailing quotes
>
> Please do not split Fixes tags over more than one line.
>
> --
> Cheers,
> Stephen Rothwell
