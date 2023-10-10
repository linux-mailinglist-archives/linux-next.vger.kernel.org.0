Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9573D7BFEB1
	for <lists+linux-next@lfdr.de>; Tue, 10 Oct 2023 16:04:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231987AbjJJOEP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Oct 2023 10:04:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232545AbjJJOEO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Oct 2023 10:04:14 -0400
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 298CBAF
        for <linux-next@vger.kernel.org>; Tue, 10 Oct 2023 07:04:12 -0700 (PDT)
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-79fc0068cb5so23479939f.1
        for <linux-next@vger.kernel.org>; Tue, 10 Oct 2023 07:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1696946651; x=1697551451; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7IzdtVda5p6uZw0sv3lF6L0PV8Is8yYsfl2erGY9rmY=;
        b=ggDkuI/ZdiTmkTQAU928IZzs/kpc9bkI0nhQjNKtQnwEWNC5IxYF6/CqivS4VFxO8z
         83xtheKI5apvfS6PTIeU61z8h4tiVWPXo3aQqV7jbEgaLwE+6GG305bcpt0GyFnTkMw1
         J1iUDbAQ9ZkwS6di59n3HI5VCHOArFeyjngOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696946651; x=1697551451;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7IzdtVda5p6uZw0sv3lF6L0PV8Is8yYsfl2erGY9rmY=;
        b=saKpuk3fOnkE2vKAXDfYMUSK0filu+DX0rO5j4hWAVY1nzaUQLl49Q/YXDSq86pmoV
         Que+umE354VIzPNiDJM8n+dBEZsX1hFvpwDcB5J26Sy5qvOsTNcYhi62ntzpvwut+sg+
         hY5EMLYuadCmPt0bbST/JXnPoXFzvcnM8iyN0A9zWJZgXFvTKmR2rsjkyQal+PI+7chi
         Ab/FFtaqUMwKgQw4NBeH0kagusBMThPH7Hx4h95ouVAERJHAsbXqFtx8vP6SgW2x02DB
         y3xOPBO9ECCt74/pR/1TXj0gbn9RaoaZyqJ/JZkbZI12MEpI5Um8mG9UhuMI3a9cNEyE
         Z39w==
X-Gm-Message-State: AOJu0YxP146kiaxoHdOg8tLUESNtfiEVcN7U0kEjW8otH/zGH8m8FPYY
        gy42NHGg1TOWZgGHXizcD6Hcnw==
X-Google-Smtp-Source: AGHT+IG2AhVE6CgiRlVtHUh6DOO7yr2NmYgAY4+FTDjU41s456pchXmBPPQLSzWoiaw/n7tk+WAc/w==
X-Received: by 2002:a05:6602:2e84:b0:79f:8cd3:fd0e with SMTP id m4-20020a0566022e8400b0079f8cd3fd0emr23041244iow.1.1696946651485;
        Tue, 10 Oct 2023 07:04:11 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id r18-20020a056638101200b0042319c38763sm2779337jab.15.2023.10.10.07.04.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Oct 2023 07:04:10 -0700 (PDT)
Message-ID: <e9f887d3-1fa7-42f1-8d84-bff26150cfad@linuxfoundation.org>
Date:   Tue, 10 Oct 2023 08:04:09 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: duplicate patches in the nolibc tree
To:     =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
        "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>, Willy Tarreau <w@1wt.eu>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20231010153354.2357ee1c@canb.auug.org.au>
 <0e0f5e19-c962-458a-b52d-0aa540301c34@paulmck-laptop>
 <92d99a63-876e-4d9c-be59-703b7f298c24@t-8ch.de>
Content-Language: en-US
From:   Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <92d99a63-876e-4d9c-be59-703b7f298c24@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/10/23 07:46, Thomas Weißschuh wrote:
> On 2023-10-10 06:44:00-0700, Paul E. McKenney wrote:
>> On Tue, Oct 10, 2023 at 03:33:54PM +1100, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> The following commits are also in the rcu tree as different commits
>>> (but the same patches):
>>>
>>>    1b831eb43176 ("tools/nolibc: string: Remove the `_nolibc_memcpy_down()` function")
>>>    3a7296c94dfa ("tools/nolibc: x86-64: Use `rep stosb` for `memset()`")
>>>    3f79a57865b3 ("selftests/nolibc: libc-test: avoid -Wstringop-overflow warnings")
>>>    9e9dcee894f8 ("selftests/nolibc: use -nostdinc for nolibc-test")
>>>    a04fd4052251 ("tools/nolibc: add stdarg.h header")
>>>    ab663cc32912 ("tools/nolibc: automatically detect necessity to use pselect6")
>>>    bd216cb8d814 ("tools/nolibc: don't define new syscall number")
>>>    c6a15707d1c3 ("tools/nolibc: string: Remove the `_nolibc_memcpy_up()` function")
>>>    d09e2b033a9f ("tools/nolibc: avoid unused parameter warnings for ENOSYS fallbacks")
>>>    d7f2a69857ce ("MAINTAINERS: nolibc: update tree location")
>>>    dbb6448b4263 ("selftests/nolibc: allow building i386 with multiarch compiler")
>>>    e6401064e32b ("tools/nolibc: x86-64: Use `rep movsb` for `memcpy()` and `memmove()`")
>>
>> Apologies for the hassle, but which is the non-rcu tree?
> 
> Should be this one:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git/log/?h=nolibc
> 
> Sorry for the breakage.

Sorry - I will update the tree.

thanks,
-- Shuah

