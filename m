Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B73D27947E
	for <lists+linux-next@lfdr.de>; Sat, 26 Sep 2020 01:06:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729291AbgIYXGG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 25 Sep 2020 19:06:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729093AbgIYXGG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 25 Sep 2020 19:06:06 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B4FCC0613CE
        for <linux-next@vger.kernel.org>; Fri, 25 Sep 2020 16:06:06 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id x14so4460374oic.9
        for <linux-next@vger.kernel.org>; Fri, 25 Sep 2020 16:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=76AVeLPThqJyq9xRW6clpHIRKAOCQwmI85cgL3Cyres=;
        b=c+XpSxQO/nxlyT0ft4XZzdREUsZN6qokIzkZCdfBlxYsfnKoDcsMJJ9R5g4+Qi8D+p
         gSLotVkVSfHXVSAXrZMhoIhhcDe0Lkxo/ye47mROh45ZpOWSOW1FHnGe2RuIUda9iVXy
         W4gjczoxcJKDDxiloVI1ZfzdGNVBkcFaAIUSw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=76AVeLPThqJyq9xRW6clpHIRKAOCQwmI85cgL3Cyres=;
        b=ovvb9vC/iPa7KYkKjXXekEdx82KCxGdLwDoiTH+eSkPN1fWDYz5rB8C3uK6l8U36Sd
         LuhhGlxvUZxnlZphhjm53V+fFKEzRALPYtCoAsX6m1qCiXoYM6Ycs/1LdW/81WI4UWe3
         +UpN4MwsgpM0NrzIMy2JZQczkOfSq1AX+rWD+Q/iXwmL2y6oTal5XrRx/n6RK14roXjx
         ajzECXuvN4vVkhYxrMPwBC/4pQtIznwE2wODdDldBUp1zJOZqqQqtTiVew3L0t9oQoWz
         rLf7F+xyiJ+3YECYi5OkinIfNH93S97F/ZSi3YrZveI2ctwZtSn8YqhksybDrSnU8IW+
         RCBw==
X-Gm-Message-State: AOAM5323OVEPqVfB16yeDHHEOd01BAwPZz3vh4NpH7MgiuPomuO63/3o
        jN2Zp+x3IguOQUduoOYQ4OztxQ==
X-Google-Smtp-Source: ABdhPJyWna6d5P8FvJbM90Pt7OdJcvYVRXH0ouob2XpQcut86to6eu59wT9/3fQh+R4sVTzQdTqGSg==
X-Received: by 2002:a05:6808:996:: with SMTP id a22mr483988oic.109.1601075165095;
        Fri, 25 Sep 2020 16:06:05 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id 74sm996786otc.65.2020.09.25.16.06.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2020 16:06:04 -0700 (PDT)
Subject: Re: [PATCHv5 kselftest next] selftests/run_kselftest.sh: make each
 test individually selectable
To:     Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Hangbin Liu <liuhangbin@gmail.com>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>, Tim.Bird@sony.com,
        lkft-triage@lists.linaro.org,
        Anders Roxell <anders.roxell@linaro.org>,
        Justin Cook <justin.cook@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20200914021758.420874-1-liuhangbin@gmail.com/>
 <20200914022227.437143-1-liuhangbin@gmail.com>
 <CA+G9fYvT6Mw2BamoiVyw=wLUqD-3LB2oaDqcuabOyWfFxEN1qg@mail.gmail.com>
 <202009251414.15274C0@keescook>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <f375a87d-7ba3-f97f-b39a-06b61f80c552@linuxfoundation.org>
Date:   Fri, 25 Sep 2020 17:06:02 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <202009251414.15274C0@keescook>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 9/25/20 3:16 PM, Kees Cook wrote:
> On Fri, Sep 25, 2020 at 01:51:53PM +0530, Naresh Kamboju wrote:
>> On Mon, 14 Sep 2020 at 07:53, Hangbin Liu <liuhangbin@gmail.com> wrote:
>>>
>>> Currently, after generating run_kselftest.sh, there is no way to choose
>>> which test we could run. All the tests are listed together and we have
>>> to run all every time. This patch enhanced the run_kselftest.sh to make
>>> the tests individually selectable. e.g.
>>>
>>>    $ ./run_kselftest.sh -t "bpf size timers"
>>
>> My test run break on linux next
>>
>> ./run_kselftest.sh: line 1331: syntax error near unexpected token `)'
>> ./run_kselftest.sh: line 1331: `-e -s | --summary )
>> logfile=$BASE_DIR/output.log; cat /dev/null > $logfile; shift ;;'
> 
> Yes, please revert this patch. The resulting script is completely
> trashed:
> 

Thank you both. Now reverted.

thanks,
-- Shuah
