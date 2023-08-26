Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F09607895D0
	for <lists+linux-next@lfdr.de>; Sat, 26 Aug 2023 12:10:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230491AbjHZKKT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 26 Aug 2023 06:10:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232242AbjHZKKI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 26 Aug 2023 06:10:08 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73E7E1FC7
        for <linux-next@vger.kernel.org>; Sat, 26 Aug 2023 03:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1693044561;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dAkaA+AncOVwhdekXkUnuSCht94d3FshWqsBj1ltMo8=;
        b=VsEnQr1G3hWbV+nNuTfJa8EZLr/EHskmhT0UiC7GlRchWzvsCPvCPTFsmveW5q8WIfcWIz
        MexsMa14mNjabaICrTg50KUVblsfCnyC7Y711lzYhRzZFkz979THSoAq9zm0zvCYynqClJ
        6nua8/dN6kfvWlKrP62ABxQEgbzzrM4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-353-Zvm56RzuO8Sg_Oxd7qViag-1; Sat, 26 Aug 2023 06:09:19 -0400
X-MC-Unique: Zvm56RzuO8Sg_Oxd7qViag-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-52a0f5f74d7so1479220a12.3
        for <linux-next@vger.kernel.org>; Sat, 26 Aug 2023 03:09:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693044558; x=1693649358;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dAkaA+AncOVwhdekXkUnuSCht94d3FshWqsBj1ltMo8=;
        b=VK+wcwHkw1BFDsMueTjrmYZbO8FvWXVeWc3I8JkebzKOvdPDeQtXA870H9QfcCwnVV
         thA466WAb6xxXhNszfoooFg10na/jAOj6w2w6Lmg1wqXqMaCPpIrXo429UyXeEmG5ccO
         7G0radhqFf4xcem6Ls/2fXqBPM3a87xbDgRcXHMmi5kAOnRLNB/b+20kjSe3phv1khLI
         KgtnnDgEMV6AbdDEA5VvgnQP1pzd0SDY3wNuvq7+A+fgFqb0gPmzBgUq3tUg0D0vrQn8
         cxvWifQiXLysPEemX9EfOp5hDe8Efstdj32onNkIsR50q80zCgJtVce2gLX9ZKmsioqJ
         DtCw==
X-Gm-Message-State: AOJu0Yw+tht9pzxGOuOkX6TeW9+mklNTz+ipB/F41x/AjlQ00PnUZMYQ
        RNwmcwMUPCrjIn4dz1yXJK6F/fCKSjhBT7kSxQ4xuTrR3IiMVevPTajfAeKuCQAUcN9nd821183
        tpMClRDjBr8p5vE+uVTv7BQ==
X-Received: by 2002:aa7:cd50:0:b0:525:4471:6b5d with SMTP id v16-20020aa7cd50000000b0052544716b5dmr15539026edw.19.1693044558776;
        Sat, 26 Aug 2023 03:09:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQtWqiv0wW4XL2klN5mZTWrqxxMPryC+Bn5krbgv30YaqVSV1tJrUGUUIiJAYfpVeGFnijFw==
X-Received: by 2002:aa7:cd50:0:b0:525:4471:6b5d with SMTP id v16-20020aa7cd50000000b0052544716b5dmr15539015edw.19.1693044558491;
        Sat, 26 Aug 2023 03:09:18 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id l5-20020a056402124500b005222c6fb512sm1990989edw.1.2023.08.26.03.09.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Aug 2023 03:09:17 -0700 (PDT)
Message-ID: <613570c6-7f5d-778c-183a-4aeb967c69d8@redhat.com>
Date:   Sat, 26 Aug 2023 12:09:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: linux-next: Tree for Aug 23 (drivers/platform/x86/amd/pmc.c)
Content-Language: en-US, nl
To:     Randy Dunlap <rdunlap@infradead.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20230823161428.3af51dee@canb.auug.org.au>
 <5181685c-29d8-22a4-a2d7-682f26e2e031@infradead.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <5181685c-29d8-22a4-a2d7-682f26e2e031@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi All,

On 8/24/23 04:06, Randy Dunlap wrote:
> 
> 
> On 8/22/23 23:14, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20230822:
>>
>> New tree: drm-ci
>>
> 
> on x86_64:
> # CONFIG_SUSPEND is not set
> # CONFIG_PM is not set
> 
> 
> ../drivers/platform/x86/amd/pmc.c:878:15: error: variable ‘amd_pmc_s2idle_dev_ops’ has initializer but incomplete type
>   878 | static struct acpi_s2idle_dev_ops amd_pmc_s2idle_dev_ops = {
>       |               ^~~~~~~~~~~~~~~~~~~
> ../drivers/platform/x86/amd/pmc.c:879:10: error: ‘struct acpi_s2idle_dev_ops’ has no member named ‘prepare’
>   879 |         .prepare = amd_pmc_s2idle_prepare,
>       |          ^~~~~~~
> ../drivers/platform/x86/amd/pmc.c:879:20: warning: excess elements in struct initializer
>   879 |         .prepare = amd_pmc_s2idle_prepare,
>       |                    ^~~~~~~~~~~~~~~~~~~~~~
> ../drivers/platform/x86/amd/pmc.c:879:20: note: (near initialization for ‘amd_pmc_s2idle_dev_ops’)
> ../drivers/platform/x86/amd/pmc.c:880:10: error: ‘struct acpi_s2idle_dev_ops’ has no member named ‘check’
>   880 |         .check = amd_pmc_s2idle_check,
>       |          ^~~~~
> ../drivers/platform/x86/amd/pmc.c:880:18: warning: excess elements in struct initializer
>   880 |         .check = amd_pmc_s2idle_check,
>       |                  ^~~~~~~~~~~~~~~~~~~~
> ../drivers/platform/x86/amd/pmc.c:880:18: note: (near initialization for ‘amd_pmc_s2idle_dev_ops’)
> ../drivers/platform/x86/amd/pmc.c:881:10: error: ‘struct acpi_s2idle_dev_ops’ has no member named ‘restore’
>   881 |         .restore = amd_pmc_s2idle_restore,
>       |          ^~~~~~~
> ../drivers/platform/x86/amd/pmc.c:881:20: warning: excess elements in struct initializer
>   881 |         .restore = amd_pmc_s2idle_restore,
>       |                    ^~~~~~~~~~~~~~~~~~~~~~
> ../drivers/platform/x86/amd/pmc.c:881:20: note: (near initialization for ‘amd_pmc_s2idle_dev_ops’)
>   CC [M]  drivers/staging/iio/impedance-analyzer/ad5933.o
> ../drivers/platform/x86/amd/pmc.c: In function ‘amd_pmc_probe’:
> ../drivers/platform/x86/amd/pmc.c:1070:23: error: implicit declaration of function ‘acpi_register_lps0_dev’; did you mean ‘acpi_register_gsi’? [-Werror=implicit-function-declaration]
>  1070 |                 err = acpi_register_lps0_dev(&amd_pmc_s2idle_dev_ops);
>       |                       ^~~~~~~~~~~~~~~~~~~~~~
>       |                       acpi_register_gsi
>   CC [M]  drivers/staging/rts5208/rtsx_scsi.o
> ../drivers/platform/x86/amd/pmc.c: In function ‘amd_pmc_remove’:
> ../drivers/platform/x86/amd/pmc.c:1091:17: error: implicit declaration of function ‘acpi_unregister_lps0_dev’; did you mean ‘acpi_unregister_gsi’? [-Werror=implicit-function-declaration]
>  1091 |                 acpi_unregister_lps0_dev(&amd_pmc_s2idle_dev_ops);
>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~
>       |                 acpi_unregister_gsi
> ../drivers/platform/x86/amd/pmc.c: At top level:
> ../drivers/platform/x86/amd/pmc.c:878:35: error: storage size of ‘amd_pmc_s2idle_dev_ops’ isn’t known
>   878 | static struct acpi_s2idle_dev_ops amd_pmc_s2idle_dev_ops = {
>       |                                   ^~~~~~~~~~~~~~~~~~~~~~
> 
> 
> Full randconfig file is attached.

Shyam, can you look into fixing this please?

Regards,

Hans

