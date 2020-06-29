Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E281F20E409
	for <lists+linux-next@lfdr.de>; Tue, 30 Jun 2020 00:04:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730476AbgF2VUU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 29 Jun 2020 17:20:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729779AbgF2Sws (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 29 Jun 2020 14:52:48 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07539C030F16
        for <linux-next@vger.kernel.org>; Mon, 29 Jun 2020 09:25:04 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id d10so7291255pls.5
        for <linux-next@vger.kernel.org>; Mon, 29 Jun 2020 09:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6u7fsXOnpntiVLfxhPmOks2Cw5x4MKBv8gUIWlulmZQ=;
        b=eupvc9s7oTUWLWpef4QipcnGJua7jXAWsjt7JWwV+gxzv4gQvuOPABkzbJGCpMX50M
         7VDeXpYwQcWLIN68hFKi8495Lt2hq++eSMC1HOfPA6BUcZVKNQF+H4xJ6jCh+IW8CeN+
         4CwNQUXtRuVU8dez4qk1ww+if1571lMT89enUcZs2tPLFV3e/mhS8MOytKxOKQuK9SVl
         aIeYvgHRCgpLzJWvq8THmowVyVy/j8A81XaQJ3ee62M3KBOCO1NjsRJhYZs45Tj9Xkfq
         mBk2ULY8qHLgKoDJikvetY1Ir/z/EC/porLZF97jSoXEMMIyP/USaoF6yQvRrEtYzCbs
         ZBpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6u7fsXOnpntiVLfxhPmOks2Cw5x4MKBv8gUIWlulmZQ=;
        b=JNk+GD1Eh58c62dLjF/TNoRqENVyRNBtKHiRn5RduybmPtpz4nhXM1W+F/wF+g1mfS
         4p6nc4L8lOZGI0KorJwtqqgnj/duzdJNVcGCdrWCMne/EnioPrXePtMF2A6bVTpIm4ph
         2q5v00cCvXUD6M60xgeOa/zn1W/sKmmf0wAeZ0xx6R8TjSce5iA06bPAojL5mi+qCFvA
         5DkWW3Z9GKRQp6bJVSOwCJsv+5nIS6l+mL6u4ySJgTrbYTL/Z3xiuNXZuvCjCdSpJWia
         EASVuZqer12HdQoCEReocU2u1cTiOHVoMb0c0WJxlAqrPTQneuVx5iAdx68QbiD4nTRe
         ZXNw==
X-Gm-Message-State: AOAM530abJ9DNeqWqwgbHfpg178XLZNaKA7fQZ4sR28WpH8TMDBRxMEW
        X+TwzCZ5Dp62SP2RCqnUAWJCuA==
X-Google-Smtp-Source: ABdhPJwoJE3KK2/ckFz3jcZ/3sSQF+7WycuVQNd3KJFtZYhYYhEPn0QeeddqpPWDR/3UlOahPZTYeA==
X-Received: by 2002:a17:902:b78a:: with SMTP id e10mr14216607pls.34.1593447903575;
        Mon, 29 Jun 2020 09:25:03 -0700 (PDT)
Received: from [192.168.86.197] (cpe-75-85-219-51.dc.res.rr.com. [75.85.219.51])
        by smtp.gmail.com with ESMTPSA id z25sm194632pfg.140.2020.06.29.09.25.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2020 09:25:03 -0700 (PDT)
Subject: Re: linux-next: Fixes tag needs some work in the block tree
To:     Pavel Begunkov <asml.silence@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200629080533.5f44d445@canb.auug.org.au>
 <3949fc27-da62-6e26-cf07-59d3c78e2b64@gmail.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <fa5b0279-32a6-f9c6-f325-cedc2786b74a@kernel.dk>
Date:   Mon, 29 Jun 2020 10:25:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <3949fc27-da62-6e26-cf07-59d3c78e2b64@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 6/29/20 10:21 AM, Pavel Begunkov wrote:
> On 29/06/2020 01:05, Stephen Rothwell wrote:
>> Hi all,
>>
>> In commit
>>
>>   8c9cb6cd9a46 ("io_uring: fix refs underflow in io_iopoll_queue()")
>>
>> Fixes tag
>>
>>   Fixes: a1d7c393c47 ("io_uring: enable READ/WRITE to use deferred completions")
> 
> Jens, could you please fix this up after me?
> full hash: a1d7c393c4711a9ce6c239c3ab053a50dc96505a

I don't think that's a grave enough concern to rebase, it's just "missing" a
single digit of the sha.

-- 
Jens Axboe

