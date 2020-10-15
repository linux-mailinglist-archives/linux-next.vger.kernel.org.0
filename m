Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1BEC28F80C
	for <lists+linux-next@lfdr.de>; Thu, 15 Oct 2020 20:01:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730103AbgJOSBe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Oct 2020 14:01:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728009AbgJOSB3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 15 Oct 2020 14:01:29 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77B87C0613D2
        for <linux-next@vger.kernel.org>; Thu, 15 Oct 2020 11:01:29 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id e20so3700638otj.11
        for <linux-next@vger.kernel.org>; Thu, 15 Oct 2020 11:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FAglLW2wBpEzHjMtiXzBklSvY/GxHkePOLyeT8viwgw=;
        b=KbCIbV86V0q6MPGXnuSbSDwhEIhEisoJmuPeyaSGapr4dBGdPJ6+8cPNg+2rdYBZB0
         02QIgyAbj0XaqHKkxv4rm29sXy6PMavbw1XzGi+Qb9k0LHw4X4absBRbJgpy7Iyd66SO
         gXjpeUE5slOsRsLr5lmFZlo6KiJlY9Sul2N48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FAglLW2wBpEzHjMtiXzBklSvY/GxHkePOLyeT8viwgw=;
        b=oXuajFB21giRfwxn6jpavG5pqC1wY+2K55Hp42H6co347Pwjj9/9xfPvTkPgmv92ep
         wd1ryUfaGlTj47H3OH/x2oWvQNNh9sJ9bBWMOm6IagG9fZg37A/G2Jrn+n389lBEKzAQ
         b6Cx9iK2OJfjjL/z0WcqsPuLDgn79hqK10dIuWkYKVW/k2+ofWfYe/CsJryA8rljjHEI
         /rqkckQR0tFu24L4PwV8h40UjpCMfZWFSr7trUyTjj2ucsDyMO1fwIZNeGkEDP/tZ3iO
         clGGsCEVLhvARzsLRWTAoP+FRNurho3j+q3N0eyfUrFKqPa+OTUusJOzGTDzWd5WjzeM
         ORXQ==
X-Gm-Message-State: AOAM532E5T46XRrBVneFXr1xklptldB5BzV6JED9J6GZRtIf0Irv8Nx8
        fMG3pZBbiwNZDjp38GFM6Fdbcw==
X-Google-Smtp-Source: ABdhPJwb63JYpnFg3xZRGWXuRuNmKUIHcbMrcMMtcv7eDW153uhSV/uUS/yLHSNjMxwF+fN7T8qfxw==
X-Received: by 2002:a9d:4e86:: with SMTP id v6mr3612743otk.98.1602784888839;
        Thu, 15 Oct 2020 11:01:28 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id e3sm1744843ooq.0.2020.10.15.11.01.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2020 11:01:28 -0700 (PDT)
Subject: Re: linux-next: build warnings after merge of the kunit-next tree
To:     Vitor Massaru Iha <vitor@massaru.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Brendan Higgins <brendanhiggins@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20201015163056.56fcc835@canb.auug.org.au>
 <CADQ6JjX0tg51M0FsD+DmAaDcnWB0wrihj4WCq_z6En=tzL=wcg@mail.gmail.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <2759fa81-630e-6395-b8e1-c743fb533700@linuxfoundation.org>
Date:   Thu, 15 Oct 2020 12:01:27 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CADQ6JjX0tg51M0FsD+DmAaDcnWB0wrihj4WCq_z6En=tzL=wcg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/15/20 4:43 AM, Vitor Massaru Iha wrote:
> Hi Stephen,
> 
> On Thu, Oct 15, 2020 at 2:31 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Hi all,
>>
>> After merging the kunit-next tree, today's linux-next build (x86_64
>> allmodconfig) produced this warning:
>>
>> lib/bitfield_kunit.c: In function 'test_bitfields_compile':
>> lib/bitfield_kunit.c:136:21: warning: unsigned conversion from 'int' to 'u16' {aka 'short unsigned int'} changes value from '393216' to '0' [-Woverflow]
>>    136 |  u16_encode_bits(0, 0x60000);
>>        |                     ^~~~~~~
>> At top level:
>> lib/bitfield_kunit.c:129:20: warning: 'test_bitfields_compile' defined but not used [-Wunused-function]
>>    129 | static void __init test_bitfields_compile(struct kunit *context)
>>        |                    ^~~~~~~~~~~~~~~~~~~~~~
>>
>> Introduced by commit
>>
>>    d2585f5164c2 ("lib: kunit: add bitfield test conversion to KUnit")
> 
> I saw the problem, I will send the patch.
> 

Please send the fix in as soon as possible. I will go ahead and send the
pull request and will apply the fix in rc2.

thanks,
-- Shuah

