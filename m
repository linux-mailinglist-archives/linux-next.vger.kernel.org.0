Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0588134F299
	for <lists+linux-next@lfdr.de>; Tue, 30 Mar 2021 22:56:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232649AbhC3Uzu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 30 Mar 2021 16:55:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231874AbhC3Uzg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 30 Mar 2021 16:55:36 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 844A2C061574;
        Tue, 30 Mar 2021 13:55:35 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id m13so17800033oiw.13;
        Tue, 30 Mar 2021 13:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=c3/2YeCmtkYECJCwBAUdO5JKD5i1PmJFWMw+VAnCEHs=;
        b=tg6zVPbmcDlVRJ574RAoH+hiRCfqVSVbk/YzvtZfXG1EStM5nPll6THeMkTr2CdHoE
         HvnbpRQXkaEbHzyWAEwf/q9L74WtDVSudBz2xNvoSkZyQN4+kfaEH2QEy49mkD4GyXoB
         /iUkehJGithxSPhq0AXVXz8Yx7R3B0M/wTVzOEP2Uaw39QDMLVS5u7Sj4ydglXI70V2c
         mlSvARq5SJDZgrVe6y1dWBzcd5LEG4TCrpLhOflpma+WFMGI5fPWkk7fhfA80Xhhmp9q
         xK1OSlH68JGF8NUO7R+S2YDhIxsUSMMXCPjHsWngwmLpshof3zyWckR0Xnk6O4EH84cZ
         R1tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=c3/2YeCmtkYECJCwBAUdO5JKD5i1PmJFWMw+VAnCEHs=;
        b=IxEY3I7qItZC3k/W8wY+g+CkJaVOJiS3eJdiUPzoxuK53FvCP1ECcqaWAc/2BL+2YR
         i64CrYP5vrSgmaW/MoE24u1XFEqwusSXv/mpy2r9T9Fu63Q1QoAlMmuSaLRkXA/7jyl/
         5S4/k5n7NWYoLjv+ySlVe9aFUtEB7aNvBFi8VO/RnYKWdycGo0xXIFZf6ItrXH01SRBy
         1JoexzPHtqAP8QND+0sV8p806a/lqAAQoN8Y7sWW79VqL3gf8ZScUm0peuerRXzJrvfc
         rs+6t8EgJ0WLb5G3ic4O+jnDsbpcV8muQZJoBOWDWfvqduhFwfwIS22zABZzbV6dFjY0
         ACsg==
X-Gm-Message-State: AOAM530rmOTPI8uAa/pfIKQn9C/fdjRTS4GbsX61IhSUUzZXupau6yLq
        cPlYC9f3ywRw1862ydGB6Hl72NcIeXY=
X-Google-Smtp-Source: ABdhPJxBM2g55VZ5tzFe7eSE1+itdLB8AJ63suoBbUTdEKaMakrskEkcrX+7vw5DsZbrAVJ1T8IyKg==
X-Received: by 2002:aca:5fc2:: with SMTP id t185mr4845821oib.64.1617137734632;
        Tue, 30 Mar 2021 13:55:34 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e34sm5368109ote.70.2021.03.30.13.55.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Mar 2021 13:55:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: linux-next: build warning after merge of the hwmon-staging tree
To:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210330182758.3a28068f@canb.auug.org.au>
 <b11339e2-cfc4-2f23-7161-3fae7750f4d3@alliedtelesis.co.nz>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <6292da50-8ded-1127-2a64-136f2d61ce5a@roeck-us.net>
Date:   Tue, 30 Mar 2021 13:55:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b11339e2-cfc4-2f23-7161-3fae7750f4d3@alliedtelesis.co.nz>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 3/30/21 1:25 PM, Chris Packham wrote:
> My bad. I'll send a patch shortly
> 

No need. I patched it up already.

Thanks,
Guenter

> On 30/03/21 8:27 pm, Stephen Rothwell wrote:
>> Hi all,
>>
>> After merging the hwmon-staging tree, today's linux-next build (htmldocs)
>> produced this warning:
>>
>> Documentation/hwmon/bpa-rs600.rst: WARNING: document isn't included in any toctree
>>
>> Introduced by commit
>>
>>    9a8210575cde ("hwmon: (pmbus) Add driver for BluTek BPA-RS600")
>>
> 

