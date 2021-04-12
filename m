Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5CB735B7E6
	for <lists+linux-next@lfdr.de>; Mon, 12 Apr 2021 03:12:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235474AbhDLBNM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 11 Apr 2021 21:13:12 -0400
Received: from mail-pl1-f177.google.com ([209.85.214.177]:35391 "EHLO
        mail-pl1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235391AbhDLBNM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 11 Apr 2021 21:13:12 -0400
Received: by mail-pl1-f177.google.com with SMTP id j7so5486232plx.2;
        Sun, 11 Apr 2021 18:12:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cewCN8OgBfmDDiF1Iena2yrqoabvm017S0rVAKMxvU8=;
        b=A5ezZmu7Gyg/pyIhHY8qm/7fajDTpdq6RA91NXqAEtW7TqyMCNv2C3O380pJp1/nmi
         j9xITOwyp0WhBrALKACZEAcZZydL2W9witBw2PjgCIeiFh0r4VjpDb/EwYGFr2L4ju9n
         ETS9FwZ6/Y35xIySG9OBzrwVz9vYlxsh1iaZ873uhYBpUfV4AUZsvulyPlW8JCNqaqHW
         3VYwC/tchh6aPInHX4GrBs5/pZeqGIUCGeQ89plFChduW1w6FsShyxSwjQrZGqYuv6S1
         vieqz0STRtF2G2fJg/Y/2wlF2jFi02qyddBBWHHAfPgqRbS12zOIiiYbzWvb3Sg2AeOK
         G9jQ==
X-Gm-Message-State: AOAM530PJmYLMxpmseKp729RLO9LZhSF9EQeE4rvAS9vmzN42KtLmwQ3
        Pj/YrvQohn7IgXC+3/06rhM=
X-Google-Smtp-Source: ABdhPJxJyhJxxOJkC/p2qwseAye4xug0GTWfp1NE/yXLRkdkBd6OQBwEP1US4FmY9JZv/RU7x+8vig==
X-Received: by 2002:a17:902:8693:b029:eb:53f:1336 with SMTP id g19-20020a1709028693b02900eb053f1336mr1015043plo.52.1618189974713;
        Sun, 11 Apr 2021 18:12:54 -0700 (PDT)
Received: from ?IPv6:2601:647:4000:d7:f6ae:805e:fb4e:14b0? ([2601:647:4000:d7:f6ae:805e:fb4e:14b0])
        by smtp.gmail.com with ESMTPSA id t23sm5245125pju.15.2021.04.11.18.12.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Apr 2021 18:12:54 -0700 (PDT)
Subject: Re: [PATCH] gdrom: fix compilation error
To:     Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
        linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
        lkft-triage@lists.linaro.org, linux-block@vger.kernel.org
Cc:     hch@lst.de, axboe@kernel.dk, Johannes.Thumshirn@wdc.com,
        hare@suse.de, Damien.LeMoal@wdc.com, naresh.kamboju@linaro.org
References: <20210411224330.4983-1-chaitanya.kulkarni@wdc.com>
From:   Bart Van Assche <bvanassche@acm.org>
Message-ID: <0880e158-516f-9d87-ff8c-3835da10d92b@acm.org>
Date:   Sun, 11 Apr 2021 18:12:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210411224330.4983-1-chaitanya.kulkarni@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 4/11/21 3:43 PM, Chaitanya Kulkarni wrote:
> Use the right name for the struct request variable that removes the
> following compilation error :-
> 
> make --silent --keep-going --jobs=8
> O=/home/tuxbuild/.cache/tuxmake/builds/1/tmp ARCH=sh
> CROSS_COMPILE=sh4-linux-gnu- 'CC=sccache sh4-linux-gnu-gcc'
> 'HOSTCC=sccache gcc'
> 
> In file included from /builds/linux/include/linux/scatterlist.h:9,
>                  from /builds/linux/include/linux/dma-mapping.h:10,
>                  from /builds/linux/drivers/cdrom/gdrom.c:16:
> /builds/linux/drivers/cdrom/gdrom.c: In function 'gdrom_readdisk_dma':
> /builds/linux/drivers/cdrom/gdrom.c:586:61: error: 'rq' undeclared
> (first use in this function)
>   586 |  __raw_writel(page_to_phys(bio_page(req->bio)) + bio_offset(rq->bio),
>       |                                                             ^~

How about adding a Fixes: tag?

Thanks,

Bart.
