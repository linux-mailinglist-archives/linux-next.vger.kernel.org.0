Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB4E152DBAA
	for <lists+linux-next@lfdr.de>; Thu, 19 May 2022 19:48:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243046AbiESRr7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 May 2022 13:47:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243171AbiESRr4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 19 May 2022 13:47:56 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4A30DB36DA
        for <linux-next@vger.kernel.org>; Thu, 19 May 2022 10:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1652982474;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7WGBg4os600JmsA+4kWnMZ3sEmRmrnw7u4+rSBOXl/8=;
        b=DL/5ndrG8jAXf56qqE6vVRBNJo6j8NpdouJjnUA1O6I1nu0V5IXbjGUW90f7WP0xi8o/sZ
        hNzVgEdBVStiKqI6jmgJskRvVOyz8+WM4HX2LhaDLC1W7O+nJZVSnIjQuxwrH1MFaRLa5f
        LblfLIlbkRk7vxiehW/BaeDOmwOFCfw=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-P2xhR7-TNOaw8J4tPtNOlQ-1; Thu, 19 May 2022 13:47:53 -0400
X-MC-Unique: P2xhR7-TNOaw8J4tPtNOlQ-1
Received: by mail-ej1-f71.google.com with SMTP id k7-20020a1709062a4700b006fe92440164so2110713eje.23
        for <linux-next@vger.kernel.org>; Thu, 19 May 2022 10:47:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7WGBg4os600JmsA+4kWnMZ3sEmRmrnw7u4+rSBOXl/8=;
        b=CzqlPtRHbm955gU/OWqv7QUEyyO+SX5gCji+b3ylmoovxTQhZwy+5sZwwj7z4yjLGr
         O+vVGXukETr164pY7W3cFzGpS00Y6lFSADy7rZmT/BxytFcZAaWFj7JtJTl7M9e+5dCn
         GAXaIipj7BEfRXmDK28BzVVRxv4Mexi1rfSYq6cZD2NQ/cMSYDGLxgC0NNVqypOHtyWF
         cuims5BPktn+cyxvsM+s3HEvF2jL1DPglUYZt6JDmu7rEyy+lYxRlzbuZWYLD9VToCCK
         /BxTi1SGHbJNlS2ufizhlzQHdssbcD0Ty9cRKfFbzkTwCXs5i3RRgZ3GuUxwoDInn7dg
         uTHQ==
X-Gm-Message-State: AOAM532ENS6xmppwDGpsNl3lc1L9IuDqb6tZFGImMPGVAMVfox0wjzEJ
        1DxLQ9CyJjfb8LYaI2hTiMjSAq5XaHOxtPzkvT631JCgQQ77ZGeL5KNXyCFPbdxeccCCuZKSEsK
        oODQkdhIXU8h0ROwDQnLVdA==
X-Received: by 2002:a05:6402:144a:b0:42a:b141:b220 with SMTP id d10-20020a056402144a00b0042ab141b220mr6832445edx.10.1652982471937;
        Thu, 19 May 2022 10:47:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDpxkbTfYx200QsKUd4pYHQt6C+AYWvQvg83UlimVAH7X0QqHHghxXrnK7KGHn8Zs2R87dmw==
X-Received: by 2002:a05:6402:144a:b0:42a:b141:b220 with SMTP id d10-20020a056402144a00b0042ab141b220mr6832431edx.10.1652982471795;
        Thu, 19 May 2022 10:47:51 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id gx13-20020a1709068a4d00b006f39ffe23fdsm2376068ejc.0.2022.05.19.10.47.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 May 2022 10:47:51 -0700 (PDT)
Message-ID: <dacd535a-eb99-fcf7-5859-639d54f22612@redhat.com>
Date:   Thu, 19 May 2022 19:47:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] platform/x86/intel/ifs: Add CPU_SUP_INTEL dependency
Content-Language: en-US
To:     Borislav Petkov <bp@alien8.de>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        X86 ML <x86@kernel.org>, Tony Luck <tony.luck@intel.com>
References: <20220518202934.730a8aba@canb.auug.org.au>
 <8ead0da9-9545-b10d-e3db-7df1a1f219e4@infradead.org>
 <YoVlwN/IeVXoMaq1@zn.tnic>
 <df5ed1d0-6304-89b8-ad68-0cf6a59d8614@infradead.org>
 <YoVzUxSwhoim9TOX@zn.tnic>
 <65f17e84-83e4-c33a-1718-fbb5841cef46@infradead.org>
 <YoZaZ+HVyjKrwtSQ@zn.tnic> <YoZay8YR0zRGyVu+@zn.tnic>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YoZay8YR0zRGyVu+@zn.tnic>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

On 5/19/22 16:57, Borislav Petkov wrote:
> From: Borislav Petkov <bp@suse.de>
> 
> The driver is using functions from a compilation unit which is enabled
> by CONFIG_CPU_SUP_INTEL. Add that dependency to Kconfig explicitly
> otherwise:
> 
>   drivers/platform/x86/intel/ifs/load.o: in function `ifs_load_firmware':
>   load.c:(.text+0x3b8): undefined reference to `intel_cpu_collect_info'
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Borislav Petkov <bp@suse.de>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans


> ---
>  drivers/platform/x86/intel/ifs/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/ifs/Kconfig b/drivers/platform/x86/intel/ifs/Kconfig
> index d84491cfb0db..7ce896434b8f 100644
> --- a/drivers/platform/x86/intel/ifs/Kconfig
> +++ b/drivers/platform/x86/intel/ifs/Kconfig
> @@ -1,6 +1,6 @@
>  config INTEL_IFS
>  	tristate "Intel In Field Scan"
> -	depends on X86 && 64BIT && SMP
> +	depends on X86 && CPU_SUP_INTEL && 64BIT && SMP
>  	select INTEL_IFS_DEVICE
>  	help
>  	  Enable support for the In Field Scan capability in select

