Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1549464A66E
	for <lists+linux-next@lfdr.de>; Mon, 12 Dec 2022 19:04:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232958AbiLLSD4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Dec 2022 13:03:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232946AbiLLSDz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 12 Dec 2022 13:03:55 -0500
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A115360D0
        for <linux-next@vger.kernel.org>; Mon, 12 Dec 2022 10:03:54 -0800 (PST)
Received: by mail-io1-xd2e.google.com with SMTP id v2so371811ioe.4
        for <linux-next@vger.kernel.org>; Mon, 12 Dec 2022 10:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=La4A62vbRkuGYZxzIcPny4piVcWbLOg5ZbIqSdV7244=;
        b=hAgYJedJf2kWkPvKdcjTvQrvvXlYhGVYOmCIhNvgupKu4WM+w4EJB0b18R0nKvqDxs
         mrB88SViUvs+sQOXoIyR24YkQ9iDUwldb9KIvcP4zwcLyjuhTZe0Y+HBcmF5N4oMP3Zg
         Qf4/G5KqVCLDLcTc5a0Rj8RZlU4INM3xRCjbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=La4A62vbRkuGYZxzIcPny4piVcWbLOg5ZbIqSdV7244=;
        b=r2zPDfn8HbqTMry+qPHlA+fqW3x3eoFQdO1+YYoepSFEtfwsstuG7KfXV334GZ2AYi
         MvKaymu9ITADK/ryKyvjwnaSE+BBd38oWBJRsVN36zLtUcQnTLr3a4z7q/Ja+4spkaqg
         EOocUxojVeM9YOOj/tspMOYGDtkBSzDtW2cqOHAMLFOyjkLXnYyJ+UlbNO6jpG7+jhBX
         PHV5fkP7n1m56AgC5xLU4G/4S8u22vAkzHirhifMx6f+IXoNupYZqwIkjVtvOJogc7up
         gpqck/BTY9jcIdZfIrt6TGJqIqCGc1z2xdNATvkaxzXY7dMbnQLY4ey9LlxNlg1wX8VR
         7m4w==
X-Gm-Message-State: ANoB5pkJX2C0y/FMn9s0Xex+2lMcJ20FIGbF/J9jUxuwxWNel9+KN8Pe
        frYejwlFyKhl098aTmm5koOwHQ==
X-Google-Smtp-Source: AA0mqf6lvz4vHUdDYlHV68BIUaZdsoUH0NaSfp3i8kIYAezjqQVAcyU5hThPjIPzEVi6v9vw1VqYCw==
X-Received: by 2002:a6b:500e:0:b0:6e2:d3f7:3b60 with SMTP id e14-20020a6b500e000000b006e2d3f73b60mr1602780iob.2.1670868233828;
        Mon, 12 Dec 2022 10:03:53 -0800 (PST)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id e47-20020a02212f000000b0038a434685dbsm125951jaa.102.2022.12.12.10.03.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Dec 2022 10:03:53 -0800 (PST)
Message-ID: <0e678eb2-455c-88f5-6732-2e8701ebb6e6@linuxfoundation.org>
Date:   Mon, 12 Dec 2022 11:03:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: linux-next: manual merge of the kunit-next tree with the apparmor
 tree
Content-Language: en-US
To:     John Johansen <john.johansen@canonical.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Brendan Higgins <brendanhiggins@google.com>,
        David Gow <davidgow@google.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Rae Moar <rmoar@google.com>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20221208135327.01364529@canb.auug.org.au>
 <bff89220-df3a-a148-2ba4-6aad3874f322@canonical.com>
 <8e82905f-8bdf-05de-2e6a-d8b896d75910@linuxfoundation.org>
From:   Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <8e82905f-8bdf-05de-2e6a-d8b896d75910@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 12/12/22 10:52, Shuah Khan wrote:
> Hi David,
> 
> On 12/8/22 13:10, John Johansen wrote:
>> On 12/7/22 18:53, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Today's linux-next merge of the kunit-next tree got a conflict in:
>>>
>>>    security/apparmor/policy_unpack.c
>>>
>>> between commits:
>>>
>>>    371e50a0b19f ("apparmor: make unpack_array return a trianary value")
>>>    73c7e91c8bc9 ("apparmor: Remove unnecessary size check when unpacking trans_table")
>>>    217af7e2f4de ("apparmor: refactor profile rules and attachments")
>>> (and probably others)
>>>
>>> from the apparmor tree and commit:
>>>
>>>    2c92044683f5 ("apparmor: test: make static symbols visible during kunit testing")
>>>
>>> from the kunit-next tree.
>>>
>>> This is somewhat of a mess ... pity there is not a shared branch (or
>>> better routing if the patches).
>>>
>> sorry, there was a miscommunication/misunderstanding, probably all on me, I
>> thought the kunit stuff that is conflicting here was going to merge next
>> cycle.
>>
> 

How about I just drop the following for now and handle this in the next cycle?
I think it might be least confusing option. Let me know. I can just do that
and then send pull request in a day or tow once things settle down in next.

2c92044683f5 ("apparmor: test: make static symbols visible during kunit testing")

thanks,
-- Shuah
