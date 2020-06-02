Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80BFC1EC24F
	for <lists+linux-next@lfdr.de>; Tue,  2 Jun 2020 21:02:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726580AbgFBTC7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Jun 2020 15:02:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726420AbgFBTC6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 Jun 2020 15:02:58 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8F82C08C5C0
        for <linux-next@vger.kernel.org>; Tue,  2 Jun 2020 12:02:57 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id e9so4353624pgo.9
        for <linux-next@vger.kernel.org>; Tue, 02 Jun 2020 12:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fFO/ZFBoAs0VTOftof+nkagqVWT9PkOIpFZl0Bg1K5w=;
        b=lpAsyLCfUvO6w24tM0qNV3o7cer+7Ex1wYieVx5Ns0l8YnXXeB4P2kkP3u/LwPcjEF
         JRCrOBYiyVcAlEzAO6fAso1LRjrCRplmegkq9doL4wgPnjb6vcYQ0pQ0szE42oi2ORwB
         Xk0S1ymPbOaTqPDlHBTMxJMFfmc+Xz3h7m4aAqlCS54KUqeJ7uMHXgHR4Vgi6pOeI/sw
         PTD8CcDIleNQW/EMpL3Tizg1Rzf92f8CfW9ertULfU0WceWc+03cH//WNtCHnnoIN2kb
         lzgKTQnrMJTfe+fUN6Jt0rsqfLh+nptoKj2LlzJs1lvKPuAc4Y/etttmaz/G6vZCYqx5
         uSoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fFO/ZFBoAs0VTOftof+nkagqVWT9PkOIpFZl0Bg1K5w=;
        b=HIk0XeX8OuaXuK6ZX3trGfzNAgxh3K7k1jzawntEpTQqmJ/cyd6tfQ0svWriPWym4z
         Og/a9EXPa2aJn0p4nISdNGzJcwygpqCO8mFlnlU7eTxgG1IAXvFHjSmDnBMJalgFVT0P
         yk4UQp4whW4oImr3wjIdPMWGHzT90VXAhzrcT8KMDC80xHikPbz0kySy77h+PGxKhVnG
         YuRY2ZmbuxeFWoxb+vdbDHC/VjznJnvtVqGcK95afccdirkHNWPXT3lEdb3GYobQjevr
         m7imyth+WDu48y6KaUCqE6qqbzf1Pr9wt6h40nJBZHKXMCF+RcFqiFfBwjDm8N1/SmPm
         9NmQ==
X-Gm-Message-State: AOAM533cc03GeXaeHICbF3vqiyhsDGiXfGhxsQ3H0Uxmo0pYjtt6W8Ms
        t8XBiZKr4F+PYsAUKz6vBtgnrA==
X-Google-Smtp-Source: ABdhPJwwBoZrtGPt9GKT5PdKY49dkxy6VViIk6/IFRTshxoda2s9p9+kPZWZ53X9iK8IdLCEftcwbg==
X-Received: by 2002:aa7:96ef:: with SMTP id i15mr24202428pfq.312.1591124577392;
        Tue, 02 Jun 2020 12:02:57 -0700 (PDT)
Received: from [192.168.1.188] ([66.219.217.173])
        by smtp.gmail.com with ESMTPSA id q16sm2917805pfg.49.2020.06.02.12.02.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2020 12:02:56 -0700 (PDT)
Subject: Re: linux-next: manual merge of the block tree with the rdma tree
To:     Jason Gunthorpe <jgg@mellanox.com>,
        Max Gurtovoy <maxg@mellanox.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Doug Ledford <dledford@redhat.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Yamin Friedman <yaminf@mellanox.com>,
        Israel Rukshin <israelr@mellanox.com>,
        Christoph Hellwig <hch@lst.de>
References: <20200602125647.5f5ed151@canb.auug.org.au>
 <3717aca8-9d75-33f1-ea8c-044af767ab5c@mellanox.com>
 <20200602190153.GA65026@mellanox.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <8be03d71-9c72-bf88-7fd7-76ec7700474a@kernel.dk>
Date:   Tue, 2 Jun 2020 13:02:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200602190153.GA65026@mellanox.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 6/2/20 1:01 PM, Jason Gunthorpe wrote:
> On Tue, Jun 02, 2020 at 11:37:26AM +0300, Max Gurtovoy wrote:
>>
>> On 6/2/2020 5:56 AM, Stephen Rothwell wrote:
>>> Hi all,
>>
>> Hi,
>>
>> This looks good to me.
>>
>> Can you share a pointer to the tree so we'll test it in our labs ?
>>
>> need to re-test:
>>
>> 1. srq per core
>>
>> 2. srq per core + T10-PI
>>
>> And both will run with shared CQ.
> 
> Max, this is too much conflict to send to Linus between your own
> patches. I am going to drop the nvme part of this from RDMA.
> 
> Normally I don't like applying partial series, but due to this tree
> split, you can send the rebased nvme part through the nvme/block tree
> at rc1 in two weeks..

Was going to comment that this is probably how it should have been
done to begin with. If we have multiple conflicts like that between
two trees, someone is doing something wrong...

-- 
Jens Axboe

