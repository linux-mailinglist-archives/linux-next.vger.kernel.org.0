Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D21958BE23
	for <lists+linux-next@lfdr.de>; Mon,  8 Aug 2022 01:01:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbiHGXBb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 7 Aug 2022 19:01:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232059AbiHGXBa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 7 Aug 2022 19:01:30 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1CB8E273C
        for <linux-next@vger.kernel.org>; Sun,  7 Aug 2022 16:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659913287;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=xvZT7bMZ/JRYIKTtsEiVS1HUrcUq37VcQwAyJO4pGV4=;
        b=ZAvX/omRt41w7/6pwTyUqTHqBpquwGnDknD9SAtm+lhhyvUmse4nz5KuxC/vTpQnRGyWyb
        ZuUtcaaBUVrJxm50yVvTdubT3xS3LEwvw3gt3zIdnQYWFccBsB9Ifxbjgj/SXTPfLsQvwx
        VejHq4lQlTZ/5LGjvB9EtRImL65W/7M=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-36-BWXxkT5SPFycTetVrF9egA-1; Sun, 07 Aug 2022 19:01:26 -0400
X-MC-Unique: BWXxkT5SPFycTetVrF9egA-1
Received: by mail-il1-f200.google.com with SMTP id q10-20020a056e020c2a00b002dedb497c7fso5568449ilg.16
        for <linux-next@vger.kernel.org>; Sun, 07 Aug 2022 16:01:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=xvZT7bMZ/JRYIKTtsEiVS1HUrcUq37VcQwAyJO4pGV4=;
        b=Ojd0jHjLx7dR8gb7+f6s2njAxY6Eyn2CKm6Y2Ldky7qfeWgiYWQnr2u462IWJxpgpa
         G6y4D4VfyXoPqtiUZeAS9cW59hEAyjTaob4RFvGrwPyus5ZYN1BTRyqY8mGB+XYUkgLa
         ZuRiRsykQGHS4qPiZdzPp7XB0ExrVTOmWk5jNght5Yawb4Fv5hEIm3YvTXV94nfKGDRy
         GujX/2JAWdU1LGN2ZQrgFYOe/a2C4sxN+059H+/0SohRp2VcHER1dRwL4DcVOxn7exxO
         U//ANdJegbXGy0tx9Hqmd+Ysf5jzqK5G7aCJpsnR/jeeBRL1qBSGTuZgPzL0XcJJgpoW
         BGnQ==
X-Gm-Message-State: ACgBeo2W7R9wEYUbakFYJqMUNQo+AiV+Q4nUg1Do4sfBTQG+QGuT6uYi
        5a39I2MoukSm5anFO8B+9KebxY+WLkaCFwfnxE3At/SO1mHjPG/1M5lKCewwjjeKvUb50jjw4tQ
        fYWrs/xX9anZyh/KexZcwnA==
X-Received: by 2002:a05:6e02:216a:b0:2df:947e:2318 with SMTP id s10-20020a056e02216a00b002df947e2318mr5043557ilv.220.1659913285634;
        Sun, 07 Aug 2022 16:01:25 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4VIpuCDDc3aC4qEKq4bmCIO3PvgOu137Q97CQjWnoc0nraYj4sf5kHB/nOI3Ok1AG39FC6wQ==
X-Received: by 2002:a05:6e02:216a:b0:2df:947e:2318 with SMTP id s10-20020a056e02216a00b002df947e2318mr5043547ilv.220.1659913285385;
        Sun, 07 Aug 2022 16:01:25 -0700 (PDT)
Received: from xz-m1.local (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
        by smtp.gmail.com with ESMTPSA id z4-20020a027a44000000b003415b95c097sm4434995jad.42.2022.08.07.16.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 16:01:24 -0700 (PDT)
Date:   Sun, 7 Aug 2022 19:01:23 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the mm-hotfixes tree
Message-ID: <YvBEQ3PKqW6q/VrO@xz-m1.local>
References: <20220808071941.4e18e748@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220808071941.4e18e748@canb.auug.org.au>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Aug 08, 2022 at 07:19:41AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   b2f4c6e29531 ("mm/smaps: don't access young/dirty bit if pte unpresent")
> 
> Fixes tag
> 
>   Fixes: b1d4d9e0cbd0 ("proc/smaps: carefully handle migration entries", 2012-05-31)
> 
> has these problem(s):
> 
>   - Subject has leading but no trailing quotes
>   - Subject does not match target commit subject
>     Just use
> 	git log -1 --format='Fixes: %h ("%s")'
> 
> Please do not include the date part - it adds nothing.

The date confused the script.  I'd only rely on the 1st column (which
should definitely be the commit ID) normally for Fixes, but will remember
to use the general format in the future..

Thanks.

-- 
Peter Xu

