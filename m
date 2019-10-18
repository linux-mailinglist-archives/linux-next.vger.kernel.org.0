Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 903AFDBB25
	for <lists+linux-next@lfdr.de>; Fri, 18 Oct 2019 02:59:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439239AbfJRA7j (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Oct 2019 20:59:39 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:38036 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726259AbfJRA7i (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Oct 2019 20:59:38 -0400
Received: by mail-pg1-f194.google.com with SMTP id w3so2347825pgt.5
        for <linux-next@vger.kernel.org>; Thu, 17 Oct 2019 17:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jyoE4KVkMv5Wgl4RjrS4sWj56ltH5kNIoDRtIAtTAIQ=;
        b=NyID+tj/Aq4Ln2vNbwK6HI4ebzmtdQlfIjHFHZ1ct/uwHsOtHWBsYetkMuJJE+FyL5
         iRcCB2TaBBLeRiuG+PabIeXZI/+y8H7GkfaSiUCwLGwTcF3snG2JH7qQ85r94YVYzADF
         D/Ijj/oa7APSC/bKl6VkTi4TaZYtI9HGhz2BdPPJi0ezOnQPWmtRtfoRH8TpT1h3b8aB
         qlfDjrTuucGQOcYq3E4WBm+26OPSc0ikw9zf0Sxg+D+7eQgxFCb1vQxYcdaVmQkyxxqB
         vDuRlti2io7S1cz+z7fE3S/D0S9Vdb/wIdPlggxhpHN5ZXP4DSYc8Q0Fr6bbNREkuhTS
         FI3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jyoE4KVkMv5Wgl4RjrS4sWj56ltH5kNIoDRtIAtTAIQ=;
        b=TkI5IBhh/UQIsPezy0I/U3o7MIQJdQWuDunKtpQ491XW4ccEQJqE/dn+riwaLNMWH2
         KkZv1jCawdu6/c+Y9GLf4pBpKo5v81mx84rYRjyveTDZYaJY+oF0P7RIYtUuJX70eJwS
         aR3WXrOLXqTo4BnIyW5lT4ezQ1B00Qbr85cIiB8HhC3Pt8ruRdG0pBZ2pujMUJiwy60R
         XQBi6BsJY9DQn9EtrslrK2YMmWhIucLuOznxvdzSAPcIxAOYzeDldwoKqjYhSfsZj/Cr
         Tgs9hQkMDrNT4YD0yIlIj5zdgDV0haSMNp+c7fL3qWbQ5z4BdjweSSAdpuRhQHNNF/tf
         7NAg==
X-Gm-Message-State: APjAAAV0AmsgL0ENQ3taEAubwnJ+5wHViNV5cwdTGHbwvFX4r+utmy/V
        rEyLFYk7JP8YEwyh/Io/aMRQFkGo/N3kdQ==
X-Google-Smtp-Source: APXvYqzgkj4XfSgBfXBRzo5q3sDWxYZIHC5aZ8pyT6z46BQiLRcrNu3Td6IirlRlUf/aFY4DfidGLA==
X-Received: by 2002:a62:b616:: with SMTP id j22mr3257841pff.201.1571360378152;
        Thu, 17 Oct 2019 17:59:38 -0700 (PDT)
Received: from [192.168.1.188] ([66.219.217.79])
        by smtp.gmail.com with ESMTPSA id z13sm4719956pfq.121.2019.10.17.17.59.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Oct 2019 17:59:37 -0700 (PDT)
Subject: Re: linux-next: build warning after merge of the block tree
From:   Jens Axboe <axboe@kernel.dk>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20191018115126.6263a3e3@canb.auug.org.au>
 <5a9bf632-2466-bc73-45d3-104c4bb0245a@kernel.dk>
Message-ID: <4b23ff4f-9692-6bfb-c904-772b3c5e0907@kernel.dk>
Date:   Thu, 17 Oct 2019 18:59:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <5a9bf632-2466-bc73-45d3-104c4bb0245a@kernel.dk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/17/19 6:56 PM, Jens Axboe wrote:
> On 10/17/19 6:51 PM, Stephen Rothwell wrote:
>> Hi all,
>>
>> After merging the block tree, today's linux-next build (arm
>> multi_v7_defconfig) produced this warning:
>>
>> fs/io_uring.c: In function 'io_accept':
>> fs/io_uring.c:1729:9: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
>>    1729 |  addr = (struct sockaddr __user *) READ_ONCE(sqe->addr);
>>         |         ^
>> fs/io_uring.c:1730:13: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
>>    1730 |  addr_len = (int __user *) READ_ONCE(sqe->addr2);
>>         |             ^
>>
>> Introduced by commit
>>
>>     d674c2b9335f ("io_uring: add support for IORING_OP_ACCEPT")
>>
>> addr and addr2 are __u64 ...
> 
> I'll fix these warnings up, guessing it's 32-bit?

Should be fixed up and pushed out now.

-- 
Jens Axboe

