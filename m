Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1F22519DE9
	for <lists+linux-next@lfdr.de>; Wed,  4 May 2022 13:25:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345970AbiEDL3a (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 4 May 2022 07:29:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243785AbiEDL33 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 4 May 2022 07:29:29 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E87E91DA4C
        for <linux-next@vger.kernel.org>; Wed,  4 May 2022 04:25:53 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id gj17-20020a17090b109100b001d8b390f77bso4927174pjb.1
        for <linux-next@vger.kernel.org>; Wed, 04 May 2022 04:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=5mO6F1EOrQXM0niTfrnYByiFhvGDeihM4EKAM1KLnBE=;
        b=qd/tf+lgyDOp6PwSYhwcCPZg/ueUtY5F6beEU8PGWzlKMUyyqWdDN4WlCy7UXmxOO0
         zhxNXbjXsHsShD+r7OjaNob9/d4ikbBnB+QatUmSmRI/yPgTZNEQQsRHYMyCcfcV6dbD
         ESKy6b3a1lbd1AhEAEAvHbB9pP91pVGwRXiCAZEqdMvtgbehdvOcj8D2tQMxPKMXNG0d
         6bVCQQCYwlxEh9n30XhR1Lis+RzLSpFaZRzKGAM+JARolal1HzSbVBCHDfkyeMy38I1T
         GIEeuxjQai51T2mtz5pBczpa5quGZycMKAUr8cABRWK+iU8k9gVCbd9VMBZAilVNcWT7
         P/tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=5mO6F1EOrQXM0niTfrnYByiFhvGDeihM4EKAM1KLnBE=;
        b=7cXGu/aFqfD8KyNptOP3xyj/y/ZPiUBBFwybPKrWTjLLYnljN7dWMfE1BUZBki8IAb
         N2SgrR6h6lYaRP0zNdRhoy0IIax9DT176QaCR4PfdTEhqnJbsc4P2AkcPkt73e5r/yB1
         u7jIwv7cw21f+tlcJgUCoBtrCxk4Iko7DxgAdzGQ7FUsqKr6Ena+/bZU7IyyZhMsn3pe
         VSt5xMD6uzOxzqyU/6/km744jaCUaLTWe1Y+x3XAvxriRqkL7t0Ss3xb3a2LqKAl4bDB
         Ff+XnkgUg6vcJpz3QaPLn3Pq8PSLRK8gkWDfWWkVObAr8MedmqaTLa9SVQz0YBvgCed9
         6N+A==
X-Gm-Message-State: AOAM531JWFHycphLtQMDXTmxbHFjfn57R6+hXU/XI6ypB0896OgXl5rp
        C/Y26f1NO0ui2CDdbrbMDwiBww==
X-Google-Smtp-Source: ABdhPJxqqqrvzTPqgyL2pdh/okD59AmwKigCkPQUbGkQFASydql8esLb16vUQyp7oCaCmJJy6DxtJw==
X-Received: by 2002:a17:902:d505:b0:15e:8b5c:bbe3 with SMTP id b5-20020a170902d50500b0015e8b5cbbe3mr20725950plg.38.1651663553340;
        Wed, 04 May 2022 04:25:53 -0700 (PDT)
Received: from [192.168.4.166] (cpe-72-132-29-68.dc.res.rr.com. [72.132.29.68])
        by smtp.gmail.com with ESMTPSA id v21-20020a631515000000b003c14af50603sm14807220pgl.27.2022.05.04.04.25.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 May 2022 04:25:52 -0700 (PDT)
Message-ID: <a4844963-3887-ffe6-d219-efee3e859356@kernel.dk>
Date:   Wed, 4 May 2022 05:25:51 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: linux-next: build failure after merge of the block tree
Content-Language: en-US
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20220504114031.40747e03@canb.auug.org.au>
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20220504114031.40747e03@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 5/3/22 7:40 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the block tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/block/xen-blkback/xenbus.c: In function 'xen_blkbk_discard':
> drivers/block/xen-blkback/xenbus.c:578:31: error: unused variable 'q' [-Werror=unused-variable]
>   578 |         struct request_queue *q = bdev_get_queue(bdev);
>       |                               ^
> cc1: all warnings being treated as errors
> 
> Caused by commit
> 
>   c899b2353386 ("xen-blkback: use bdev_discard_alignment")

Thanks, folded in the fix.

-- 
Jens Axboe

