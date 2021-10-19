Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 250AC434095
	for <lists+linux-next@lfdr.de>; Tue, 19 Oct 2021 23:26:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbhJSV24 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 Oct 2021 17:28:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbhJSV2z (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 19 Oct 2021 17:28:55 -0400
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83294C061746
        for <linux-next@vger.kernel.org>; Tue, 19 Oct 2021 14:26:42 -0700 (PDT)
Received: by mail-io1-xd32.google.com with SMTP id r134so22066883iod.11
        for <linux-next@vger.kernel.org>; Tue, 19 Oct 2021 14:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=++6FR6NVy552fhzW7IB6OlTKBAy+T8Ablf5Y27zBN2w=;
        b=MrHiRdl0NP1+jalTFF2fAJrtOa+O3WaPqK0eNX/sdcUEZINAWXXiwrpd5cuaXmkX0d
         WmAUxaA1wA+zB7Izs9kpu+ByaTS7ZGdy5rTb03IdOpttRUMPTReLwHUoXSOAPw8FPcSZ
         /lceomHWOL78f89LBkRcMkea0GT4FQyXrLtBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=++6FR6NVy552fhzW7IB6OlTKBAy+T8Ablf5Y27zBN2w=;
        b=CDSzlAFWfRWvujR6aB/I3TF4nl2WG3QKRH5rNOX+LoWHe1SPkq7iLjlkWycpw1Se9t
         8jyIxiIy5whxJ1bcNKZyh432F6+6ZnzwyCNn2er9S4/TPZR46lTU17NwtDVkYuwC1xUB
         d2b+uGvqtZzCj6bqjiggOkRBqNrv3JdR6p9GFh5rcKleizzhN2Xq1NVeJrZMynxtXBtI
         oofAYiitw48UM9icqIwY+mQ8up9Xqslq6irR2JAFOd3vdtlsF0zvUd8QeQT49gl2JlZK
         UJJXt8D0aS+2T7Auw+B6Iw6anYcpEGQ5XaqJ5kNfN85yAcDVCY74AaETj3AiHQ7V2Mk8
         N9fw==
X-Gm-Message-State: AOAM531m4rKY8N8NI73J6Peh/v9TnYE5FYj4DmZKk+tQZ7mWL1fZUDVX
        I0Vh25T9Jea/ip3BLAn5voRrk7ojveVwyg==
X-Google-Smtp-Source: ABdhPJyR8JpPAwqFzDNibrVsf05VMUYcYU3M5WC5vGgq3o+saOS8b4CGNCLX7d6MMWBEJgasn1dw5Q==
X-Received: by 2002:a05:6638:4115:: with SMTP id ay21mr6133127jab.90.1634678801880;
        Tue, 19 Oct 2021 14:26:41 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id q7sm114341ilv.48.2021.10.19.14.26.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Oct 2021 14:26:41 -0700 (PDT)
Subject: Re: linux-next: manual merge of the kunit-next tree with the
 kunit-fixes tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Daniel Latypov <dlatypov@google.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20211008152930.03787395@canb.auug.org.au>
 <ba01fb13-e1a1-299e-9a7b-ccdeaeef267a@linuxfoundation.org>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <009188fd-a744-fb50-a9d2-ca1ce9b7905f@linuxfoundation.org>
Date:   Tue, 19 Oct 2021 15:26:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <ba01fb13-e1a1-299e-9a7b-ccdeaeef267a@linuxfoundation.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/8/21 10:31 AM, Shuah Khan wrote:
> On 10/7/21 10:29 PM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Today's linux-next merge of the kunit-next tree got a conflict in:
>>
>>    tools/testing/kunit/kunit.py
>>
>> between commit:
>>
>>    d8c23ead708b ("kunit: tool: better handling of quasi-bool args (--json, --raw_output)")
>>
>> from the kunit-fixes tree and commit:
>>
>>    6710951ee039 ("kunit: tool: support running each suite/test separately")
>>
>> from the kunit-next tree.
>>
>> I fixed it up (see below) and can carry the fix as necessary. This
>> is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your tree
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particularly
>> complex conflicts.
>>
> 
> Thank you for the fixing it up. I will fix this up in the kunit-next once
> the kunit-fixes pull request goes out.
> 

I fixed the merge conflict in kunit-next tree after rebase to Linux 5.15-rc6.
There is no need to carry this fix.

Daniel! Please review to see if it looks good. It was very minor fix-up.

- from typing import Iterable, Sequence
  -from typing import Iterable, List
++from typing import Iterable, Sequence, List

thanks,
-- Shuah

