Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F7ECA1F7D
	for <lists+linux-next@lfdr.de>; Thu, 29 Aug 2019 17:44:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726728AbfH2Po1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 29 Aug 2019 11:44:27 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:37148 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726518AbfH2Po1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 29 Aug 2019 11:44:27 -0400
Received: by mail-io1-f68.google.com with SMTP id q12so7864371iog.4
        for <linux-next@vger.kernel.org>; Thu, 29 Aug 2019 08:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=f1lRGiNGnAFYa5XXNIGTiXk0hopkLhl9sxqMWlR9OM8=;
        b=x4Nmbn64+hq2nIrU/XYjpm+rG4twyu8Blfcu+IlpzaB+RCSvvti9s0rDB4rNwnSO/g
         pscK8sz+ZlGHQ32SVq8nXpEkr+wi0AEpp8R5SS/jGGuER7Bg35kdcD89wMznt+l+gMQj
         Cqq8g1+duLsJ6kFQpnncA8lJ6BP1byilELhIgm89abTEAFHwyq+GLqm7SU1w2LzkcRRL
         c1uUtfuOyqjcpVGXM5ogwDAvyrzmeOS3kHv6gArmAvGD2+vLtl3cxAjZnEKJcPOmmUoI
         B0CudP+UUSDMcZvils9x3G9sxawpvVVEbHELbdl06bkK98bSuW0huJ11mp16jJ+40Rbd
         M8FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=f1lRGiNGnAFYa5XXNIGTiXk0hopkLhl9sxqMWlR9OM8=;
        b=OQU8YQM5F3IUt9jDl1xg+pwJZS88qZZpE/Fn0XYumIw9qxF0hW0+Cj+xTcYUOp2OAf
         LOTjyhcu0kOKaqaWFhF4OO3OTEed8y8zTH3l+GNZ0IfyGrpiAuZqktyuiOZy0hy9OPyg
         ZaicXfVGMe3f+TkpxvuwEhXKSaxwdRxThuSsX4ZnWAGr3/eLxOpD+Kz1psas3nOnAJZS
         fr/De+uI/8CFfwEPhfn9cxBTy3b2jgDqEd4yxR82vZP4Wh53AcysaAU06iV4WTrheUzl
         YT7Zm7piJK1ap8W4q65/vWk8DsIcHjTDnEkfSpDVHOGq0JRBbWh7BnKhUerKrr5C3pqa
         20dg==
X-Gm-Message-State: APjAAAWB4tWC+KU9AiRdqhvWhREggRwrdNekF7ZW3UxjXyA3gMaKNbzS
        33PXGAPCfCyek8HKW1v5EyppSg==
X-Google-Smtp-Source: APXvYqyagCG2rTj4wmQ6PRtEAJ+LqcEKmF5YRjVZwMhX2y+RIf651JoqU7qk3QI3G2Egt69TIKoYaw==
X-Received: by 2002:a5d:87c1:: with SMTP id q1mr8567565ios.291.1567093466029;
        Thu, 29 Aug 2019 08:44:26 -0700 (PDT)
Received: from [192.168.1.50] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id 80sm5740197iou.13.2019.08.29.08.44.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Aug 2019 08:44:25 -0700 (PDT)
Subject: Re: linux-next: build warning after merge of the block tree
To:     Tejun Heo <tj@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20190829135150.4f0e533a@canb.auug.org.au>
 <20190829140828.39e05c27@canb.auug.org.au>
 <20190829154150.GS2263813@devbig004.ftw2.facebook.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <cf6b9cc0-1ae3-d10f-b5d5-7221b0e4a482@kernel.dk>
Date:   Thu, 29 Aug 2019 09:44:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190829154150.GS2263813@devbig004.ftw2.facebook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 8/29/19 9:41 AM, Tejun Heo wrote:
> On Thu, Aug 29, 2019 at 02:08:28PM +1000, Stephen Rothwell wrote:
>> From: Stephen Rothwell <sfr@canb.auug.org.au>
>> Date: Thu, 29 Aug 2019 14:03:43 +1000
>> Subject: [PATCH] blkcg: blk-iocost: predeclare used structs
>>
>> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> 
> Acked-by: Tejun Heo <tj@kernel.org>
> 
> Thanks.
> 
>> ---
>>   include/trace/events/iocost.h | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/include/trace/events/iocost.h b/include/trace/events/iocost.h
>> index ec2217dd57ac..7ecaa65b7106 100644
>> --- a/include/trace/events/iocost.h
>> +++ b/include/trace/events/iocost.h
>> @@ -2,6 +2,10 @@
>>   #undef TRACE_SYSTEM
>>   #define TRACE_SYSTEM iocost
>>   
>> +struct ioc;
>> +struct ioc_now;
>> +struct ioc_gq;
>> +
>>   #if !defined(_TRACE_BLK_IOCOST_H) || defined(TRACE_HEADER_MULTI_READ)
>>   #define _TRACE_BLK_IOCOST_H

Added, thanks.

-- 
Jens Axboe

