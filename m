Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B20D93A0B49
	for <lists+linux-next@lfdr.de>; Wed,  9 Jun 2021 06:29:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231516AbhFIEbZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Jun 2021 00:31:25 -0400
Received: from mail-pf1-f173.google.com ([209.85.210.173]:36444 "EHLO
        mail-pf1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231511AbhFIEbZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Jun 2021 00:31:25 -0400
Received: by mail-pf1-f173.google.com with SMTP id c12so17468780pfl.3
        for <linux-next@vger.kernel.org>; Tue, 08 Jun 2021 21:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=466GkKYajJKZZ8o449pbsZdtpv8lFssIM+BWMw8ocbc=;
        b=KtkLh+yzYPo/Hy3dD5Bh0G2chrU6J9xzOFbDHK+rZvotMK0hnsssHwFb+FBZX+cuQR
         CRfnxQYW8YO3s9J7PZ/7rJZ0XFiXVl+0pBoZsHkYSfWCQhI4e897se29QTvVVlD/6j/Q
         foeKQ9AcskFmhaAZz6gyQUOI+qAXZ+UKHjZb8KZrUgTt64UcUP48RvOF79KJWxYYVxFK
         JUs0IuTulQBDBLbNTxeWd5LnKBUE/Y5tyC2JCBLGLstGvjuGTgs/YcN/Rz6yeO6fbz22
         LaH+9xAqoSoFNrHhmBEivYylm1VIF6mfE8dWp6FlqPuFmGx2YHwkHrY9A09kKv2CtOLY
         3MLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=466GkKYajJKZZ8o449pbsZdtpv8lFssIM+BWMw8ocbc=;
        b=Prkm6HHu1JOwsEs07uXUafCmcv6nBle23DjCYUSkbfzRZo8t4X3I60EaSusgEbMGvK
         O168f2E43USPWQx8pOhh1n5mdnafr56mtGE+hiR6RpCiR/qpYCUlYfvROohrbrYwXwMJ
         WJllpPxI2pyr+tDcXctZyR8gcWFCClETOAN4qNQ7rVphZbqF3FHV+y9qwD9ZN6XkB8uY
         TWJE+0NLKx/0LGTv38fz05A5ohBn6/uNKB5gE3iX4fSTlxfNqllmbrHOvjCjkD8Dmwna
         SX42aUNYidL6TmKvjk5P322boOTksoFK+8jGWnaQmSJ+pzITWXCu0yzG9XC2bLVK7WVA
         MjQA==
X-Gm-Message-State: AOAM530lpASvz0kLOOKZXKz19e9OImdCnfkHgNc3zdmU5NpLwOtp0Is3
        P6hrVJr3CTQ9uqmi8cBxrNHZaeO17IBZs+d/gwZBvQ==
X-Google-Smtp-Source: ABdhPJy7sycljRIcbt0LIUJlmjby8WgEapGKwnO8xUzbihnwucMVt6qQXRNQcZiFKraeUhWwUBe0yaKe2B6quIssEDY=
X-Received: by 2002:aa7:952b:0:b029:2e9:eef1:8e17 with SMTP id
 c11-20020aa7952b0000b02902e9eef18e17mr3379605pfp.70.1623212911484; Tue, 08
 Jun 2021 21:28:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210609135237.22bde319@canb.auug.org.au>
In-Reply-To: <20210609135237.22bde319@canb.auug.org.au>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Tue, 8 Jun 2021 21:28:20 -0700
Message-ID: <CAPcyv4j946hkhZVrP=eOav52VpCDj5whwwSyQ7cRgBGvoSXjJw@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the block tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Jens Axboe <axboe@kernel.dk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jun 8, 2021 at 8:52 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the block tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
>
> drivers/nvdimm/pmem.c: In function 'pmem_pagemap_cleanup':
> drivers/nvdimm/pmem.c:338:24: warning: unused variable 'q' [-Wunused-variable]
>   338 |  struct request_queue *q =
>       |                        ^
>

Ugh, I should have caught this... fix incoming.

> Introduced by commit
>
>   80b58f4e9f4a ("libnvdimm/pmem: Fix blk_cleanup_disk() usage")
>
> --
> Cheers,
> Stephen Rothwell
