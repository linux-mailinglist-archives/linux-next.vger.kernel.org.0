Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4438529D33E
	for <lists+linux-next@lfdr.de>; Wed, 28 Oct 2020 22:42:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725812AbgJ1VmR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 28 Oct 2020 17:42:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725790AbgJ1VmQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 28 Oct 2020 17:42:16 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6B0AC0613CF
        for <linux-next@vger.kernel.org>; Wed, 28 Oct 2020 14:42:16 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id o3so579140pgr.11
        for <linux-next@vger.kernel.org>; Wed, 28 Oct 2020 14:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=w1/8IrO8sx/YyG3QLb2LPvf5Eh9es6JpHKDrqMRrszo=;
        b=ZBZ5kVEOIS02s7h9dKCzwFiyJFIitPQF7K2Zamgd+7ssGuXsVjhLdUtNZVPWpSyowI
         VGsjGEME7y7+ytVh4AfbkfnJtcShmwhjFW1SGDy2sJyzbj/VuWN9Qn34ULKkw9edimXC
         XBEp3rpuHaVVa6FXMsPR2Oha6jeDppF8SHDPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=w1/8IrO8sx/YyG3QLb2LPvf5Eh9es6JpHKDrqMRrszo=;
        b=OuaylSkp9u/5mdSf1bbj22H0x3KLrWKRAspu1Tb7iTqkXSn2/gUen0qiOn86ZBu6Q0
         U0g5U3UjdVLlrC37OcLEI/CTKYE3TpAER1L88Jge1pm9ovvpqGfO0bRvLHNtkE4M/Y9Y
         QIvLCFplGH643Be9hz166P1M+z4KgiFw0Y2fUt4h4cc3Ahp7wDPsG22XL8vavMfNM9Ws
         YbYdziPg+ZfYMI0+gPP7/6XFU9xFDPsAapHa8lm+jDZdAEmTbbXHZcVgCJS+7kLkJw+n
         DV10wXPro0dc99UxcxUEwC63WP9XMOL73WWw302RYCDIiu3G9uiU/7jZnXNVjTF3xTtX
         1O2Q==
X-Gm-Message-State: AOAM530jAKMhEItq54m/QlcH7DOwogKN/8CjKMizRsTWOqYuIA2ShLbb
        8OcbWKQJDx1DvSF9/iu6EZfDnR5G7Js4Pg==
X-Google-Smtp-Source: ABdhPJxAkhbJrCYboUrSVTzSaLQQA/LDRJyFEr4ekcyxOGjc0AuhcZIRoF7aNuuJRohG6nL5wWP0/Q==
X-Received: by 2002:a5d:9819:: with SMTP id a25mr6472582iol.156.1603895903544;
        Wed, 28 Oct 2020 07:38:23 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id c2sm2531544ioc.29.2020.10.28.07.38.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2020 07:38:22 -0700 (PDT)
Subject: Re: linux-next: build warnings after merge of the counters tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20201028142039.6c7eb38a@canb.auug.org.au>
 <20201028142354.11d42e47@canb.auug.org.au>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <9b2593f6-b160-52d8-521e-3ad9b059d5a4@linuxfoundation.org>
Date:   Wed, 28 Oct 2020 08:38:22 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201028142354.11d42e47@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/27/20 9:23 PM, Stephen Rothwell wrote:
> Hi all,
> 
> On Wed, 28 Oct 2020 14:20:39 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> After merging the counters tree, today's linux-next build (htmldocs)
>> produced these warnings:
>>
>>
>> Documentation/core-api/counters.rst:45: WARNING: undefined label: test counters module (if the link has no caption the label must precede a section header)
>> Documentation/core-api/counters.rst:48: WARNING: undefined label: selftest for counters (if the link has no caption the label must precede a section header)
>> Documentation/core-api/counters.rst:61: WARNING: undefined label: atomic_ops (if the link has no caption the label must precede a section header)
>>
>> Introduced by commit
>>
>>    37a0dbf631f6 ("counters: Introduce counter_atomic* counters")
> 
> Also:
> 
> Documentation/core-api/counters.rst: WARNING: document isn't included in any toctree
> 

Hi Stephen,

This patch series is still is progress. I will drop them from this
topic branch.

thanks,
-- Shuah
