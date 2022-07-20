Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CCB457B6A7
	for <lists+linux-next@lfdr.de>; Wed, 20 Jul 2022 14:43:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234317AbiGTMnM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 Jul 2022 08:43:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231751AbiGTMnL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 20 Jul 2022 08:43:11 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 291D96A9EC
        for <linux-next@vger.kernel.org>; Wed, 20 Jul 2022 05:43:10 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id j1-20020a17090aeb0100b001ef777a7befso3622939pjz.0
        for <linux-next@vger.kernel.org>; Wed, 20 Jul 2022 05:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=15tbLcWJnTFOdjiV+YtbGdPmkJye0XDVtTNZb1Sk+vw=;
        b=sNqhFCOSw4ltM2hYbkLQRiwkH1r6tf31fy4ZmdZfxTf4ifpMZpIK/y1O40mgQ3jKne
         AtjX+V8oEI9Cn+LMjfuwNicV4MHEhMzce8so+25sze9vd6UVgMu8iwUhZhPqwSL3pxRT
         qmBpLC9uPJF6H1OHGd5PIIbMyZNO/v45ofQ0ANv44OoPIxU2MTMvRcWzQ6nJ6R5oWeIR
         5lVUWrTT95PoVGTZzSV4mdCYrfkZFT1TdiKBVC7SsIPjovVwvejNkQm+3dwNrSf+si/F
         VGPteaZnyhwByYePSzROH0DxxgPIpe9LZy5q2bRLneBsmI7iD/e7W39isspEfw0HDDpU
         I/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=15tbLcWJnTFOdjiV+YtbGdPmkJye0XDVtTNZb1Sk+vw=;
        b=MJkChkUckHi9TLcNLI5vZBWlD+FxIQ0iaYzPJ685ckSDBhr4uW8KsUCT1IJw8BzCnV
         VfIzWGLUO1lza2cMneAZiZv1eS42Oh/NDWvAYJSJ3DfIkYJOXVdR5JCCedaTsi/0we6i
         ra1J/LXaxZTTmWbdzMoKOdn3mrw1u3mhCAbBxngrKD8l0eEN5dp+IUpBUbgseq89ztF4
         6VYc+93T3ET0Cxu9KfDSm/gMRl74BiFcLMFarYPdUUYgochmvtNJXVtMpdb1S7gAoH4E
         Use4Ox0JD/cnDzGyJ8RXa9D2+HNWtdvHHR3qz5RrOn36T8MkU9JxWY0wXx6/7zYzZTKR
         HwkQ==
X-Gm-Message-State: AJIora9/PDoRm/jsUW+OdoGQobaJGMmcqjiEoQnCLC6jgFdt6KNvoSHk
        J+7TDO+qDfYuWfqwSl8EE8BdPQ==
X-Google-Smtp-Source: AGRyM1va+N2XDOi9hafud9V55/wZygh14bVfU4jI1urqtChNNbRXL3V7qDMBcyVC3SAmSIJk7N/u0w==
X-Received: by 2002:a17:902:ea09:b0:16c:3f7a:adf7 with SMTP id s9-20020a170902ea0900b0016c3f7aadf7mr38898267plg.103.1658320989548;
        Wed, 20 Jul 2022 05:43:09 -0700 (PDT)
Received: from [192.168.1.100] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id g9-20020a625209000000b0051bc5f4df1csm13398704pfb.154.2022.07.20.05.43.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jul 2022 05:43:08 -0700 (PDT)
Message-ID: <e0d6b3a4-4127-e282-ede0-1ca4e1485ece@kernel.dk>
Date:   Wed, 20 Jul 2022 06:43:07 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: linux-next: build warning after merge of the block tree
Content-Language: en-US
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Pavel Begunkov <asml.silence@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20220720133306.5f708750@canb.auug.org.au>
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20220720133306.5f708750@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_SBL_CSS,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 7/19/22 9:33 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the block tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
> 
> io_uring/net.c: In function 'io_sendzc':
> io_uring/net.c:980:41: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
>   980 |                                         (u64)zc->buf, zc->len);
>       |                                         ^
> 
> Introduced by commit
> 
>   bb4019de9ea1 ("io_uring: sendzc with fixed buffers")

I pushed a fix for this, thanks Stephen.

-- 
Jens Axboe

