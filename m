Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DAFD6B8462
	for <lists+linux-next@lfdr.de>; Mon, 13 Mar 2023 23:00:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbjCMWAt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Mar 2023 18:00:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjCMWAs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 13 Mar 2023 18:00:48 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAF6F8EA26
        for <linux-next@vger.kernel.org>; Mon, 13 Mar 2023 15:00:03 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id h12-20020a17090aea8c00b0023d1311fab3so3610211pjz.1
        for <linux-next@vger.kernel.org>; Mon, 13 Mar 2023 15:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112; t=1678744790;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BGGPAUzSIdvt5yUBCr9JjruRsWUaP8IK4hLIEPJ1BEI=;
        b=3H7ByH5DwcrEGPels98DU99i5ducimDAuCPRq5PLW49OyNuxi13tdXOX4ci+cLNOmg
         1UO3BocfQJLDKsj6PJqTml7twvABrgepdCUNm/nThJOcaNBv0nN/rGB83YLzrqi1Lkly
         03g/l1gY2HIbqrMxLfIZ2VnH/5EHqVWbVUkwmPZ2eR4xpsBtw12hNM8V3+67cj5p2N3j
         Dnjzsu7jWsBwV99xnIQ/reEuwjkI62et+t2NHnk6Xk2WqqGSRVvB+SgHoN4BdfyqIfUJ
         LyTgWL6Apt4deKEJhiMlWn22kdqeaaZYU/K+UvMuA5bC1od8sGGuWhvCyNB2uEd6uebl
         hdSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678744790;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BGGPAUzSIdvt5yUBCr9JjruRsWUaP8IK4hLIEPJ1BEI=;
        b=qA89JykS0ubomdDp1IZzYQ+Eg8CxQmSyRxZXdkNuKpWyfrkjLqNGFUr0ebUDnEnI8V
         Wmv+jGiNZgOyRM3spnfV3Z0D7W9THYnX1ZHi+/yFk2yAififgbKURLb3cXXADa2t0v0s
         iG1wQDyo1I4PuzHMe4KYGKm7J+nz1tXkt70JI8syuYZ6pPGmlIsKh+EtJ2stRFpHWbvx
         DU3GBOtwnXWlH/oT4vD5aZZTBcK5qjrIxxr+AbTL+g1692zrk2kFmZVZpnl6AM3C1YP5
         TKIjGTuVIs+HUv/IyEPI++0u/EfSL+olypNes0FkdYdw/fdPSOZB48Q3kH1LcyabEPQB
         O+6A==
X-Gm-Message-State: AO0yUKVd3cbNsoYw35mzQOd4Ae8h/8EYo9kkqd9d5IdzQWv7pESkJMpX
        NjFbCFF8bwFzUfNCjLjk/t2gew==
X-Google-Smtp-Source: AK7set/duow7nBBTrQI+8mZNwxqsYtCrL/jxIbWlW6VMScKdvhg2hT5E+ZH9WyfDDwtPs6yCmwxDRQ==
X-Received: by 2002:a05:6a20:3ca7:b0:d5:58df:fb93 with SMTP id b39-20020a056a203ca700b000d558dffb93mr300503pzj.1.1678744790152;
        Mon, 13 Mar 2023 14:59:50 -0700 (PDT)
Received: from [192.168.1.136] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id e6-20020aa78c46000000b005d62cd8a3c9sm195750pfd.71.2023.03.13.14.59.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 14:59:49 -0700 (PDT)
Message-ID: <9cd66e6e-6223-2fac-961e-f030c4424410@kernel.dk>
Date:   Mon, 13 Mar 2023 15:59:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: linux-next: duplicate patch in the block tree
Content-Language: en-US
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20230314084625.3530839b@canb.auug.org.au>
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20230314084625.3530839b@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 3/13/23 3:46 PM, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in Linus Torvalds' tree as a different commit
> (but the same patch):
> 
>   6d114e22385b ("io_uring: silence variable ‘prev’ set but not used warning")
> 
> This is commit
> 
>   fa780334a8c3 ("io_uring: silence variable ‘prev’ set but not used warning")
> 
> in Linus' tree.

That's fine, it's just an older stale merge as I added the reviewed-by
tag before it went upstream. I'll rebase my for-next.

-- 
Jens Axboe


