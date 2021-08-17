Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D38DB3EF078
	for <lists+linux-next@lfdr.de>; Tue, 17 Aug 2021 18:52:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229991AbhHQQww (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Aug 2021 12:52:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229700AbhHQQws (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Aug 2021 12:52:48 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40668C061764;
        Tue, 17 Aug 2021 09:52:15 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id bo18so118515pjb.0;
        Tue, 17 Aug 2021 09:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VuDVWeaacBi4+S4E/LejbeI0CDzECNWHqSgpMOyPIpg=;
        b=YTkuegwEbZ31QHY4ZA+2agQjkeGepaWco+GHBI+EnFWRjMcmdQEtblSU/haFgvcx2M
         cboSKfHdoRUP0UEsCrn8Fg2iBdvrWvzNBY06cF9POnBAETEmKjISX45YG1IXfUK+rECG
         QMKbg5lXlVnAgnHPsHz4DvgpzYAlD3go+FiffzNS27M3vpN/GBE54i8ZNrMlHruFyjNz
         nCEbp1IpTUoxA6KoXRGQsTHAJyUqnasdgTjLyZENoqj+VbKB1810V4ZNfL7ffjmelrCj
         Bxi89Ya8EtU0WgijQWfC3gsXMqrLWqAWOKJ1BWLFwnXRQuGarUF/kuH7nxU72OWb362Z
         3AMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=VuDVWeaacBi4+S4E/LejbeI0CDzECNWHqSgpMOyPIpg=;
        b=d9/i3XfHoR5JS1y6kz6kH6V08AggEycYV+vEp8JOYIPYJryi9V9GhnT9GH4yPNPULw
         ffgNWVp9zWnYR54DKwOU7dKLEvwnK/d3JANlWou7hSihBXlHnlws/wVDFeQ1j8PYymk/
         UHymxhoWbNvCImkfUieFRMnW+HbVBZum68Be4eqwCkw3RPKdWfU1aoT7ZIiL1ocRtUnv
         gwJqCcUzw82+VjniG5ok/GYxxDxyD4GodJxGF+Ih5V15kPSy1rvhhqY3zeqphhaku8d3
         wBRiwcBEx+HlJeYStcR0zqAw+uHwzuibSKBXGoHJGJ3Oeu8gfwfITEtvESHjcVtjvPF0
         3b/Q==
X-Gm-Message-State: AOAM530mkLo9kQm8ckvL4fEQSXL0hWaa6nz76TRalZraoI8g+nMKkOTr
        l5gHdZtycZQ5Ef21FMcyFu8=
X-Google-Smtp-Source: ABdhPJzOd/zAD0NcJwpD8LXFYtET18icT1DbEiSv/DK02//D72xmr6ha62x4uXhueGSYCoQvFRiW/g==
X-Received: by 2002:a17:90b:3ec3:: with SMTP id rm3mr4327987pjb.7.1629219134617;
        Tue, 17 Aug 2021 09:52:14 -0700 (PDT)
Received: from localhost (2603-800c-1a02-1bae-e24f-43ff-fee6-449f.res6.spectrum.com. [2603:800c:1a02:1bae:e24f:43ff:fee6:449f])
        by smtp.gmail.com with ESMTPSA id w18sm2915748pjg.50.2021.08.17.09.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 09:52:13 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date:   Tue, 17 Aug 2021 06:52:11 -1000
From:   Tejun Heo <tj@kernel.org>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Jens Axboe <axboe@kernel.dk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the block tree with Linus' tree
Message-ID: <YRvpO8Cuk0nAfuVd@slm.duckdns.org>
References: <20210817152547.70af4cfe@canb.auug.org.au>
 <YRvmZ77w6zeG4BrU@slm.duckdns.org>
 <20210817165020.GA18069@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210817165020.GA18069@lst.de>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Aug 17, 2021 at 06:50:20PM +0200, Christoph Hellwig wrote:
> On Tue, Aug 17, 2021 at 06:40:07AM -1000, Tejun Heo wrote:
> > Ah, that probably isn't the right resolution. The seq_get_buf change needs
> > to be applied to the original mq-deadline.c file. Jens, how do you wanna
> > proceed?
> 
> Unless I'm missing something the pd_stat_fn that is affected was purely
> in the cgroup addition, so this resolution looks fine to me.

Ah, you're right.

Thank you.

-- 
tejun
