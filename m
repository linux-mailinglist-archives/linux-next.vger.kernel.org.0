Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B15B6DFB71
	for <lists+linux-next@lfdr.de>; Wed, 12 Apr 2023 18:35:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229513AbjDLQfJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 12 Apr 2023 12:35:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbjDLQfI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 12 Apr 2023 12:35:08 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F8333C39
        for <linux-next@vger.kernel.org>; Wed, 12 Apr 2023 09:35:06 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-75d1e0ff8ecso12221239f.0
        for <linux-next@vger.kernel.org>; Wed, 12 Apr 2023 09:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112; t=1681317306; x=1683909306;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mXwhsD3DtY19stQnmRdkzEChlbwq/Oy5nvoP70fEbRM=;
        b=dT5k+LL00Kd0kv8/3t2kAlG7Vb0P3docgHfR1Q6O7MtSbF10Fl/ju6IoRA2AK5s0hT
         kgVEVTQfLe8h+mEqt8A6vSRx2NcE2qrWkCtMaN7LWch36xD7OBj8JbDPXHHjycrcDQIC
         j6dSVwtwPNUR7FEgXe90bhr0P5X0xgEezSwuaQUaj4t/rp0GGS/sZHq2Q5ulROAlnPqd
         8TEjyU7Hl+OHC7sU8fw5dOJvq4Bq/mLR3KRR406UqZIZp2R/nO5GWDwZ9wyGAbKaDAST
         HBDcjh/UtKnriNX6OFM7a+nCb+cnuqAyHIVNMQjT9RvXoddpdh6SmBH/peTVNaSrLHIP
         H3UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681317306; x=1683909306;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mXwhsD3DtY19stQnmRdkzEChlbwq/Oy5nvoP70fEbRM=;
        b=DXJGWHHACQoWIfN1XqLR82GftmLS8RTBpWwa9Xq/u12RJRlc9be/8r/r/T+pIqLuNg
         dFT3zmP11fo0UhIofm7rnYG4IakGWLB52dMyJA26ROwHchePBZygwwdKR6Z+m+TR7tMp
         kaO/mTHVa828VnGVHH+dcY716OalqFgjJDf1w33c3DXd/D573smBVcnG+VJDwaCIOa+e
         6qWzOGO3qgsqF340zET2a+z83yWAsASjQAnvfikgfCDPyP1EeBKbxyK+c9PBFUUr12x/
         yKoH5sIXf5Fw9lpv0lvIwGJ3mF4/TWZb9uIfHR+3nKIN8m86PJPsMu9etA1qns5E6Q81
         MYGg==
X-Gm-Message-State: AAQBX9d51stIfR/6nYmqGTprSSGnn8B22VffNskvc0YKYRnYPieW9yDf
        PHshonxSGgIkwwWd6eSPFrLWCucZ8HM2KW1BFXU=
X-Google-Smtp-Source: AKy350ZZJeFrHJsDqkYhTM15DhD8kwjqKws5cUUDsRUmeuRe6CUFA7BHzmDDtmy25anysX7qcuoLsg==
X-Received: by 2002:a6b:cd03:0:b0:760:a66f:430f with SMTP id d3-20020a6bcd03000000b00760a66f430fmr1258813iog.1.1681317305933;
        Wed, 12 Apr 2023 09:35:05 -0700 (PDT)
Received: from [192.168.1.94] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id d184-20020a0262c1000000b0040ba6cc16absm3786367jac.168.2023.04.12.09.35.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 09:35:05 -0700 (PDT)
Message-ID: <6527c6fa-8908-1d8d-2f9e-bb7636a27874@kernel.dk>
Date:   Wed, 12 Apr 2023 10:35:04 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: linux-next: build warnings after merge of the block tree
Content-Language: en-US
To:     Josh Poimboeuf <jpoimboe@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20230327120017.6bb826d7@canb.auug.org.au>
 <20230327162630.wmxpycxhllt4clpt@treble>
 <20230328104719.65133586@canb.auug.org.au>
 <20230412073416.73a8ea1a@canb.auug.org.au>
 <20230411215518.u2fgi7napfcwyuce@treble>
 <4959d0b8-96fe-7fe5-8b36-7e0a266d1d17@kernel.dk>
 <20230412001400.yraku5fwsjdchxvk@treble>
 <20230412114400.GB628377@hirez.programming.kicks-ass.net>
 <20230412162517.gji52t34zlvcu5bh@treble>
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20230412162517.gji52t34zlvcu5bh@treble>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 4/12/23 10:25?AM, Josh Poimboeuf wrote:
> On Wed, Apr 12, 2023 at 01:44:00PM +0200, Peter Zijlstra wrote:
>> On Tue, Apr 11, 2023 at 05:14:00PM -0700, Josh Poimboeuf wrote:
>>
>>> Peter, what do you think, should we make track uaccess state across
>>> function boundaries?
>>
>> So IIRC the goal was to explicitly dis-allow that. You want minimal code
>> executed with STAC and hence disallow calling stuff.
> 
> I guess I was wondering if we could make an exception for calls to
> static IPA-optimized functions, so we wouldn't have to scramble to "fix"
> compiler optimizations.
> 
> But for now, yeah let's just keep it simple.
> 
> Jens, can you confirm this works?  I added __noclone instead of removing
> static.

Yep, works for me.

-- 
Jens Axboe

