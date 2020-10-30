Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4ADB52A0E14
	for <lists+linux-next@lfdr.de>; Fri, 30 Oct 2020 19:54:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727412AbgJ3SyN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 30 Oct 2020 14:54:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727478AbgJ3SyL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 30 Oct 2020 14:54:11 -0400
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA952C0613D2
        for <linux-next@vger.kernel.org>; Fri, 30 Oct 2020 11:54:11 -0700 (PDT)
Received: by mail-il1-x135.google.com with SMTP id q1so7396068ilt.6
        for <linux-next@vger.kernel.org>; Fri, 30 Oct 2020 11:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tMf9AMfk/yExuJKM8/1UQ09FC8NZ7U74R97RQRlMSQk=;
        b=qbs2IpGzLhkpw0uwpAmPgsR/EZMviSXvaO1JC73XPnteDt9+10kEjCiAWbXnMYREqp
         7uGQkGHqh3ltb6ZM0IHKXJKuH9Lb6jh8SG3AaHfnGyr+t+sUt8MQB+vsxyZ1u6+8pRZb
         aCV7u0Z0vqg824GmoM0s5cGIuSlTvCnHGJSjh29uEOeFTaaihtiVpwyfRr4eXnLusqIM
         W49Zj4iefGDGyfzOwpgygg7JB0lFWcViwKotbdYWxg1xcfOFo40Bo7QyeAQgHZUrTfoN
         QfybkZsiFCK3XpVZlcZNXpqrqq8xkhNkqR16NYoIjKhRTjrsQsbioytcth8C+5VWUzCL
         dtNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tMf9AMfk/yExuJKM8/1UQ09FC8NZ7U74R97RQRlMSQk=;
        b=HOffSpGW30v8+y/IGqufgUYZOaSbdX8EKoPgAPXLE6RBkHQrngKaBVNQ5QVM4rWMmT
         9pxGeWc1qQtVDS/5eA251VoEYxCu2BFbVOmJtoRWVh277zqSCsobdb8UaC93IO6yGRhK
         d8oOKSdVR1/TcO5YmKj3eraUKYTVXw7izloayoayYJxF9CzN4EKxv4A3wQUQGFojRFdE
         p37bM7miYt1Sz/YJFQECI0DMMI/0ID1Z3MkNa+66iJew3d/cBgROXccR5DiCdohiMUk+
         v0q7A3hbb/CrdhlRgO656JhYnZSfGMJvSigLluTlHKuWE2ao8bEYctcw/n9ex4P1Iyuh
         q/qQ==
X-Gm-Message-State: AOAM531eVYLIGO2gJ5cajY5Ca26PYoJc+yVvkgncTiBgTM/mcfEYGQu/
        3xqvQ7vZUPhjjDbWIrrtYwZiQQ==
X-Google-Smtp-Source: ABdhPJygEwBCwgS21Sv8OA1FMW1uGttXMamKu8Op1aaIHgTyd6UjfUohmMCrzJlkyGbxChkRrYxRKg==
X-Received: by 2002:a05:6e02:dea:: with SMTP id m10mr3058662ilj.106.1604084050607;
        Fri, 30 Oct 2020 11:54:10 -0700 (PDT)
Received: from [192.168.1.30] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id n15sm5598618ilt.58.2020.10.30.11.54.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2020 11:54:10 -0700 (PDT)
Subject: Re: arc: kernel/entry.S:310: Error: inappropriate arguments for
 opcode 'and'
To:     Vineet Gupta <Vineet.Gupta1@synopsys.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "linux-snps-arc@lists.infradead.org" 
        <linux-snps-arc@lists.infradead.org>,
        "lkft-triage@lists.linaro.org" <lkft-triage@lists.linaro.org>
Cc:     Christian Brauner <christian@brauner.io>,
        Thomas Gleixner <tglx@linutronix.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Ingo Molnar <mingo@kernel.org>
References: <CA+G9fYth+F1TnG6GQNKtrxvChvX9m+nGa8LKFG18WCzsqNJg5w@mail.gmail.com>
 <5273a136-ac9c-94fc-b6e1-d7a0abf2b385@synopsys.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <33ead693-0cf6-adef-c513-fd3ba0c1a6eb@kernel.dk>
Date:   Fri, 30 Oct 2020 12:54:09 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5273a136-ac9c-94fc-b6e1-d7a0abf2b385@synopsys.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/30/20 12:53 PM, Vineet Gupta wrote:
> Hi Naresh,
> 
> On 10/30/20 3:29 AM, Naresh Kamboju wrote:
>> arc defconfig build failed on linux next 20201030 with gcc-8 and gcc-9.
>>
>> make -sk KBUILD_BUILD_USER=TuxBuild -C/linux -j16 ARCH=arc
>> CROSS_COMPILE=arc-elf32- HOSTCC=gcc CC="sccache arc-elf32-gcc" O=build
>> uImage
>> #
>> ../arch/arc/kernel/entry.S: Assembler messages:
>> ../arch/arc/kernel/entry.S:310: Error: inappropriate arguments for opcode 'and'
>> make[3]: *** [../scripts/Makefile.build:364:
>> arch/arc/kernel/entry-arcv2.o] Error 1
>>
>> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> 
> Thx for reporting this.  This is due to the series Add support for 
> TIF_NOTIFY_SIGNAL 
> <https://lore.kernel.org/io-uring/20201026203230.386348-1-axboe@kernel.dk/#r>where 
> ARC patch is broken and I just replied to Jens about it. He will 
> hopefully fix it and push updated series to -next

Done, will push it out now. Sorry about that.

-- 
Jens Axboe

