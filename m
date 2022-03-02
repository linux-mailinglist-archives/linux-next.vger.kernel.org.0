Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49B054CA238
	for <lists+linux-next@lfdr.de>; Wed,  2 Mar 2022 11:32:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240993AbiCBKd1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Mar 2022 05:33:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241000AbiCBKd0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 2 Mar 2022 05:33:26 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 136A51AF31
        for <linux-next@vger.kernel.org>; Wed,  2 Mar 2022 02:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646217161;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kPpPQo0rFTcgUQrPoN9LDSfjjllxDYkn6tRSloMNpvs=;
        b=elxaCj4yQnho9Ikx+U5T/yf4bQ9kYlzdd8qPXTA2jGpW9U4a/0LhwgGEsFsd/Y68pdaX8O
        CHDN8+zu7x2sePE/MRFWo62Aq+zafjoim3MLPsZkrHeslesbY2rAhub755YpMo/kPIDrBV
        x99PDU0IXTbdniPpH7BNBriPTEl7x3w=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-381-5nPDqWZLOQCecmyVJAm2Kw-1; Wed, 02 Mar 2022 05:32:40 -0500
X-MC-Unique: 5nPDqWZLOQCecmyVJAm2Kw-1
Received: by mail-ed1-f69.google.com with SMTP id o5-20020a50c905000000b00410effbf65dso732637edh.17
        for <linux-next@vger.kernel.org>; Wed, 02 Mar 2022 02:32:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=kPpPQo0rFTcgUQrPoN9LDSfjjllxDYkn6tRSloMNpvs=;
        b=2lFCHAyMSUZzyEuzw513U/PT1xAA9Swv0qYGkxxNuUFanAaJWI8HiOhAQ+LyBoBuVL
         v3uZaEYsrN/7thlrnH48/I2ijvdCTK9cpXX0+hkneYODVWTsO6D+Dfj+Fj/dyEGt+7di
         k8xjX90w1fkYI8I4FURyculRz1LMo5qu5n37JdHZ8F8veqgxplAsiQS1TPAaDmPiMo8x
         UC2AQU/mWuDG7Ecns422bshbDR9ftA5PG59thweTwU42oFTLL4dTvIXoMDfr0M86ow+U
         t3sSxK5U30SX9tWyhP/JrGIGOpxc3NRMK/f7sYEQ2DYNoLVe6JrnkUutlZvgeaUU6Ndv
         /IaA==
X-Gm-Message-State: AOAM532IKZgo68uKW/G3Ar5ekaiknE1L4YJcFpXJIopUu1+KSeFcGc0C
        VrHPXu7bJG3Qw8TRjJhO5IWnK96CW5ZIxxIRGoxIoxq+QqfuWtBe9LWhj2i1u3jAoUovbLoEUvK
        WsOwPauZFfu9zilDZT4zYOw==
X-Received: by 2002:a50:8d1a:0:b0:415:a1ce:89a8 with SMTP id s26-20020a508d1a000000b00415a1ce89a8mr4185345eds.146.1646217159197;
        Wed, 02 Mar 2022 02:32:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzgt5fBNpSUSHz6W30noIClOvZSA7o9CWwo8lkYp+IWSlTUeGZLpFqRU4MWM0XGxUgTLVLFbg==
X-Received: by 2002:a50:8d1a:0:b0:415:a1ce:89a8 with SMTP id s26-20020a508d1a000000b00415a1ce89a8mr4185326eds.146.1646217158987;
        Wed, 02 Mar 2022 02:32:38 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id f3-20020a056402068300b0041594aa9eedsm1554151edy.54.2022.03.02.02.32.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Mar 2022 02:32:38 -0800 (PST)
Message-ID: <9925b272-b52d-be3c-bac9-e56cea421199@redhat.com>
Date:   Wed, 2 Mar 2022 11:32:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: linux-next: build warning after merge of the drm tree
Content-Language: en-US
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Rajat Jain <rajatja@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20220202150201.290c7d3d@canb.auug.org.au>
 <20220202150320.3e9bdd62@canb.auug.org.au>
 <f50d5044-7192-bdb3-7ca9-7217ed311787@redhat.com>
 <20220302123417.2c84200b@canb.auug.org.au>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220302123417.2c84200b@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

On 3/2/22 02:34, Stephen Rothwell wrote:
> Hi all,
> 
> On Wed, 2 Feb 2022 09:38:37 +0100 Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> On 2/2/22 05:03, Stephen Rothwell wrote:
>>>
>>> On Wed, 2 Feb 2022 15:02:01 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:  
>>>>
>>>> After merging the drm tree, today's linux-next build (htmldocs) produced
>>>> this warning:
>>>>
>>>> drivers/gpu/drm/drm_privacy_screen.c:X: warning: Function parameter or member 'data' not described in 'drm_privacy_screen_register'  
>>>
>>> Actually:
>>>
>>> drivers/gpu/drm/drm_privacy_screen.c:392: warning: Function parameter or member 'data' not described in 'drm_privacy_screen_register'  
>>
>> Thank you for reporting this, I will prepare a patch fixing this.
> 
> I am still seeing this warning.

Weird, this should be fixed by:

https://cgit.freedesktop.org/drm-misc/commit/?id=ccbeca4ca04302d129602093c8d611065e3f7958

Which was added to the "drm-misc-next-2022-02-23" drm-misc tag/pull-req 7 days ago,
which was merged into drm-next 6 days ago ?

I just reverted that did a make htmldocs and got the warning, then re-applied and
the warning was gone...

Regards,

Hans

