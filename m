Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 851633898F4
	for <lists+linux-next@lfdr.de>; Wed, 19 May 2021 23:58:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229932AbhESV4s (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 19 May 2021 17:56:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229790AbhESV4r (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 19 May 2021 17:56:47 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B29D5C061574
        for <linux-next@vger.kernel.org>; Wed, 19 May 2021 14:55:27 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id o17-20020a17090a9f91b029015cef5b3c50so4273547pjp.4
        for <linux-next@vger.kernel.org>; Wed, 19 May 2021 14:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/ivKuA8eA0E4VB/FOYglu30M5yoHYAjJwhMfE0IGotA=;
        b=Jw+5Py0TWikm6pW8u3N3gqhTxuFjTZYf7ifc4I+8o+ndKLET3H9EMmAc7sBw9y6W9o
         2+il5d/YC4FWuVpNl7FRZjfmCByzMLJNFaeAChSYLJFXTEwCRDQy94bYlvIgDZjms3LN
         aKRqgISJKW+haoxFwnBWGDMYGYOb01dUotzdw7DKRkHVPpotS/9QuW8KCqkWyXdFZ3fN
         onq2nUqcTNPd6nd3b70iO6mUjoJDthIu8FBfPLI5IGfY4L04LJKPN4XlSRT0A6AAblia
         vuqa9yUUDIqQI1sI5b4DPSFcthbNP66zDCUZJT2N2kd/H+0lLkYnSTcpoE4jCu9azJi9
         8Ugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/ivKuA8eA0E4VB/FOYglu30M5yoHYAjJwhMfE0IGotA=;
        b=sBO+ij64O9WmpRLxEpGHhkHZlJNtHUcY8t2aGooPn14JzoTIZtFgpoK7/MGno7y3Kq
         h50j3a4T7iK16k5DUC8gti2V8ZR1A5RhYiMFGOG+1JzBDne8O87V2UJ6ZQKRras1/Xhx
         3cNZBrG2acmQcRym8+xzV+dZPLenXF9PkHAKYMF6qb6lCZA5xykyRAZUMJc3HApmbqVE
         jvbpz0KiNVXsnLDgJqMMkji6EBFR57y7ZIw+IZaNPbQBnWuxNBacofQZC5n8UmRbDzDi
         M7B3Z5QvWr+lKCWuDwUlTzlmqSV6g81DQBDWeCkQwBLHg6WhAOv6eLz80j7ssWjxmkPI
         63bw==
X-Gm-Message-State: AOAM5325LIq69pfSnWcJDHhNCutMIwyWbDt77LRpYs7uBuDGkGBHXcs/
        jCWcgcv0DaOHEr1DAzeJ22HDv1nO4P/fhQ==
X-Google-Smtp-Source: ABdhPJyiPZaaRiS7d68AG3+9tPqf1YZAp6bLaqxJGmxQaCX62iwcFyXDUPiKqUS9EGTE+u+NeFFm5Q==
X-Received: by 2002:a17:90a:66cb:: with SMTP id z11mr1177565pjl.15.1621461326778;
        Wed, 19 May 2021 14:55:26 -0700 (PDT)
Received: from [192.168.1.134] ([66.219.217.173])
        by smtp.gmail.com with ESMTPSA id x13sm340531pjl.22.2021.05.19.14.55.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 May 2021 14:55:26 -0700 (PDT)
Subject: Re: linux-next: Fixes tag needs some work in the block tree
To:     Sergey Shtylyov <s.shtylyov@omp.ru>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210519080143.583d415d@canb.auug.org.au>
 <3c2c877d-aa02-5202-e8e8-53b8470b0154@omp.ru>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <d51b1a64-e6a1-68e9-5a1d-da4f9b88d019@kernel.dk>
Date:   Wed, 19 May 2021 15:55:24 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3c2c877d-aa02-5202-e8e8-53b8470b0154@omp.ru>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 5/19/21 1:25 PM, Sergey Shtylyov wrote:
> Hello!
> 
> On 5/19/21 1:01 AM, Stephen Rothwell wrote:
> 
> [...]
>> In commit
>>
>>   1437568b56f8 ("pata_octeon_cf: avoid WARN_ON() in ata_host_activate()")
>>
>> Fixes tag
>>
>>   Fixes: 3c929c6f5aa7 ("MIPS/OCTEON/ata: Convert pata_octeon_cf.c to use device tree.")
>>
>> has these problem(s):
>>
>>   - Subject does not match target commit subject
>>     Just use
>> 	git log -1 --format='Fixes: %h ("%s")'
>>
>> Maybe you meant
>>
>> Fixes: 43f01da0f279 ("MIPS/OCTEON/ata: Convert pata_octeon_cf.c to use device tree.")
> 
>    This one!
> 
>> or
>>
>> Fixes: 3c929c6f5aa7 ("libata: New driver for OCTEON SOC Compact Flash interface (v7).")
> 
>    Perhaps this could be fixed still, Jens?

Yep, I fixed it up, thanks.

-- 
Jens Axboe

