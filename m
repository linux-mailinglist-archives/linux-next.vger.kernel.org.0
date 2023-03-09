Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3C2C6B1E99
	for <lists+linux-next@lfdr.de>; Thu,  9 Mar 2023 09:50:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230161AbjCIIuJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 9 Mar 2023 03:50:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbjCIIuE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 9 Mar 2023 03:50:04 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44CB9B0B96
        for <linux-next@vger.kernel.org>; Thu,  9 Mar 2023 00:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678351753;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EC6Y5lbtkWTNJ12e9OJkDOPxU0LJq7Kyd+/8uJWMvYQ=;
        b=M71wWiIt5adxActbT0+AnWrWBrJqytvETEzeWqsSoS2ldsdhAh+XmRfSP1YjBnTAoFOclP
        HwhQ+OfZsjo/xLFrITsApUW2/JhYXHatwOqGoZrCOdh5wraFyrLd+uCK22Lpk8G0SrzsUo
        mK+hjeRdpoOpBVBtGqH5toRF/sVYB0c=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-4V3lPMldOiuabrlaajpYdw-1; Thu, 09 Mar 2023 03:49:01 -0500
X-MC-Unique: 4V3lPMldOiuabrlaajpYdw-1
Received: by mail-ed1-f72.google.com with SMTP id z14-20020a05640235ce00b004e07ddbc2f8so1908150edc.7
        for <linux-next@vger.kernel.org>; Thu, 09 Mar 2023 00:49:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678351740;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EC6Y5lbtkWTNJ12e9OJkDOPxU0LJq7Kyd+/8uJWMvYQ=;
        b=bGA7CkBJwmccE5l4xeregRfSYwkaAImsRbvIyGtcEs5XaiECh5gBuKKGIG8i0Qtvqg
         35bNGEs87+GXaKV/D2CllzbJYxB39qsQOJ4BcpERH/YCEv9VnKNdlEWCeuj/GL6/8MCr
         qIKnBPbM45WxTfJ8ncgHO1tMxsoKYI5IJfO4OitFMw6pJYwqOGVlKRqaOzlLUiOGFLr3
         T5qz8ddU/J4fygh5gdbEakV5sl5JH/+ocgBXo0BuTXu+1kwxXPAT+Ii8spo4C9lGAa/P
         i8QazcxuMHCMq0lQ7lq81joV75nd9uXwsIOiY9kmQ1WhzoFC5z4QbGTGjaSr2jphzoch
         b9Jw==
X-Gm-Message-State: AO0yUKWYLzukaMoGzgl3Z/yGaAzRnoVpOzxxVh1Mg24dZx5LlfFaDpI6
        ZlGBUJOsvfkshNSyvnoEd7tKkUfR8bWUABNIflr5ypgkBWM/++/XxB8d16J5ydQKJ+DxPy3JsE4
        P6XrrXrNzGSqn0qcEE73EWZ9CIYqhxA==
X-Received: by 2002:a50:fc17:0:b0:4c2:3592:4a77 with SMTP id i23-20020a50fc17000000b004c235924a77mr18027798edr.30.1678351740180;
        Thu, 09 Mar 2023 00:49:00 -0800 (PST)
X-Google-Smtp-Source: AK7set/n5Tm2xYdLkq9+15iUOlHNsCULx+dgycuz0kJ0kFCsAFKhxz58+7OGfMn7Y5avPrYqY/A95w==
X-Received: by 2002:a50:fc17:0:b0:4c2:3592:4a77 with SMTP id i23-20020a50fc17000000b004c235924a77mr18027791edr.30.1678351739911;
        Thu, 09 Mar 2023 00:48:59 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id f21-20020a50d555000000b004c059535b43sm9378310edj.31.2023.03.09.00.48.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 00:48:59 -0800 (PST)
Message-ID: <4c63d660-1105-9a8a-1010-cc05125d06d3@redhat.com>
Date:   Thu, 9 Mar 2023 09:48:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: linux-next: build warnings after merge of the drivers-x86 tree
Content-Language: en-US, nl
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Mark Gross <markgross@kernel.org>
Cc:     Orlando Chamberlain <orlandoch.dev@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20230309122822.77435e33@canb.auug.org.au>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230309122822.77435e33@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi all,

On 3/9/23 02:28, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the drivers-x86 tree, today's linux-next build
> (htmldocs) produced these warning:
> 
> include/linux/apple-gmux.h:99: warning: Function parameter or member 'type_ret' not described in 'apple_gmux_detect'
> include/linux/apple-gmux.h:99: warning: Excess function parameter 'indexed_ret' description in 'apple_gmux_detect'
> 
> Introduced by commit
> 
>   fc83fbc80e1a ("platform/x86: apple-gmux: refactor gmux types")

Stephen, thank you for reporting this.

Orlando, can you do a follow-up patch on top of your
latest series fixing this ?

Regards,

Hans

