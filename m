Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8576627AA1
	for <lists+linux-next@lfdr.de>; Mon, 14 Nov 2022 11:37:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235843AbiKNKg7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Nov 2022 05:36:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235779AbiKNKg5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 14 Nov 2022 05:36:57 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2C751D64E
        for <linux-next@vger.kernel.org>; Mon, 14 Nov 2022 02:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668422161;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=24zRJBMMX5r7D0TfP9H8IpSMNGkPGaDlufPYAnb9o3c=;
        b=I8O2Ni5fm5YhkBFZyMitiZmoyGg10HLrXJXSI8Tx28JMkOoc/JzGIB3TKLk/0UdisINQsn
        V2OBBMJsgQ12XsV9ZueiVKniYSbGRgwx6bBSG+lV5FQF+2kI+vni0sBE5WdOi7lTERnmaZ
        rXHWq3CrqgGySvqiP/We7Y5K8rZXCpA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-119-5ppghlO9Ph2n2KvN3Expjg-1; Mon, 14 Nov 2022 05:35:59 -0500
X-MC-Unique: 5ppghlO9Ph2n2KvN3Expjg-1
Received: by mail-ej1-f72.google.com with SMTP id nc4-20020a1709071c0400b0078a5ceb571bso5166348ejc.4
        for <linux-next@vger.kernel.org>; Mon, 14 Nov 2022 02:35:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=24zRJBMMX5r7D0TfP9H8IpSMNGkPGaDlufPYAnb9o3c=;
        b=BesGQTGHUbO700uKbRQx12IcoJ2yvRsAQIL6BK/wF1WWjNd4zmG4BLsOH0lV7illEZ
         chIGvDxyckvIkBCeSXgnpnVwl3KyJ1Mt+XcbEb6ZSS0i6lvv25sQg8YoUC8DhABhj9yw
         tUqJyiWwM8XKYWv+R/ArnUJlysf37XJ/tQ9OJkEcSmwe44+bPH5IIiVeP+9ZH66Q3CCS
         wCuoihtOPFlvlz9hLMtJdGXTJ0hF0N4E5bNVUvgEY0RCI/l4l41YG6NJIKH+WkbmGibW
         Vaq/z4FB8JeTRFbuENKNRZS21G2WDL1QEH/BgPlQA7qnSYGe0bVb3eD6e6DXGz9SesyA
         O38w==
X-Gm-Message-State: ANoB5pmSBYol/jiMWmk5XldivUR7ArvsRn5uxD3+L02qERg51HFHzC78
        ARZoFunT3SjsZKsiCCftxRgiPytu+NRDZnMCjKS+cuivZWpm43SpdPicoXUOGBiYTQkFsHR6ifn
        zDGi3gxySv+Tzbr9W7K+8UA==
X-Received: by 2002:a05:6402:519:b0:467:6847:1ea7 with SMTP id m25-20020a056402051900b0046768471ea7mr9673843edv.237.1668422158681;
        Mon, 14 Nov 2022 02:35:58 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6ICCUSIbjUZ6xW1wwVWfNHWXpBEQHv6D03VDE1/OpgXEDSGOrXtsDchrX5iVx343T8ZpJuMQ==
X-Received: by 2002:a05:6402:519:b0:467:6847:1ea7 with SMTP id m25-20020a056402051900b0046768471ea7mr9673827edv.237.1668422158530;
        Mon, 14 Nov 2022 02:35:58 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id eg25-20020a056402289900b00457b5ba968csm4581792edb.27.2022.11.14.02.35.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 02:35:57 -0800 (PST)
Message-ID: <57f57c29-cf48-67c1-b6b3-0e50e7105031@redhat.com>
Date:   Mon, 14 Nov 2022 11:35:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: linux-next: manual merge of the drm-intel tree with Linus' tree
Content-Language: en-US
To:     Jani Nikula <jani.nikula@linux.intel.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc:     Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20221114102327.6d53341e@canb.auug.org.au>
 <33ef1207-aad7-b7cd-61ac-327e9afb0699@redhat.com> <87cz9p4zj6.fsf@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <87cz9p4zj6.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

On 11/14/22 11:10, Jani Nikula wrote:
> On Mon, 14 Nov 2022, Hans de Goede <hdegoede@redhat.com> wrote:
>> Hi,
>>
>> On 11/14/22 00:23, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Today's linux-next merge of the drm-intel tree got a conflict in:
>>>
>>>   drivers/gpu/drm/i915/display/intel_backlight.c
>>>
>>> between commit:
>>>
>>>   b1d36e73cc1c ("drm/i915: Don't register backlight when another backlight should be used (v2)")
>>>
>>> from Linus' tree and commit:
>>>
>>>   801543b2593b ("drm/i915: stop including i915_irq.h from i915_trace.h")
>>>
>>> from the drm-intel tree.
>>
>> This is weird, because the:
>>
>>    b1d36e73cc1c ("drm/i915: Don't register backlight when another backlight should be used (v2)")
>>
>> commit is in 6.1-rc1, so there can only be a conflict it 6.1-rc1 has not
>> been back-merged into drm-intel yet ?
> 
> That's the reason it *is* a conflict, right?

Right what I was trying to say is that I am surprised that 6.1-rc1 has not
been back-merged into drm-intel yet even though it has been released
4 weeks ago.

I thought it was more or less standard process to backmerge rc1 soon after
it is released ?

Regards,

Hans

