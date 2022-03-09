Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C10D4D36BB
	for <lists+linux-next@lfdr.de>; Wed,  9 Mar 2022 18:43:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236333AbiCIRJv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Mar 2022 12:09:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237718AbiCIRIn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Mar 2022 12:08:43 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A8DE4120F63
        for <linux-next@vger.kernel.org>; Wed,  9 Mar 2022 08:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646845140;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qb1iDD9O8GakHXVHRPxQppvhosdQztyNQTb+YOxevjU=;
        b=ErpzaAGFnxmNePdq84ylUhPWB6Mx5fOps10/C8LVYtuFnzT/EjpimLWhcnmqGDcMUItkN6
        KHXo/lE+YGktafMGC0QcprzCtL8GqnJRzPGRXjWUXlJB6I9gqkvvXsmaNsMRSFLH+P2zTu
        X+fKY7KjokT5WYocTu1r9P5U3qDo40U=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-PO8XRTYRNYa61hz46Df9uA-1; Wed, 09 Mar 2022 11:58:59 -0500
X-MC-Unique: PO8XRTYRNYa61hz46Df9uA-1
Received: by mail-ed1-f69.google.com with SMTP id s7-20020a508dc7000000b0040f29ccd65aso1624905edh.1
        for <linux-next@vger.kernel.org>; Wed, 09 Mar 2022 08:58:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=qb1iDD9O8GakHXVHRPxQppvhosdQztyNQTb+YOxevjU=;
        b=PoWiPJKsECSsDPAkqKbNIYktBKnkHxFvVY47CNhu0vuIg3d+2osDNXAnnUF49vZng2
         cq02agqZ82tpS8kIHUuhY5iBYTyBTO/T5e+yRiYo5qeELl2blDkMm3JskffAL/PCWbzr
         wdiSSRSJPxbVuFgogkOBIgJjCimQtpXap/o972yhJ2nw0S0W5QUJkTCmy/jM2lNE5csU
         Ta6VZGUmEZVwHOCAUGqG7wvlHlGXwfvqNmrS+6OfOww2xcQH0LJ0vZaxBx9z1JUm1435
         Lc9T4Bl+Luui0nx/1wpRiN8esE/ZlSR3ikIQU3G8pq3sGg2ZNo7Bo6WuTLIbWR35AOGy
         srEA==
X-Gm-Message-State: AOAM531KS2vCrcaVOc4W3oK3RVabIwrJ+zsh0n7KdYJ32Fi3AjoMUJwd
        qsks/TEwEM/9hYULOZ/1vwixB3cV0bfk9ewfSETeQIl/8BqCN+rXA+R/floLRkBkrWuvQjAWwiY
        5qLJt/fYfNZryeTJnEHSDOg==
X-Received: by 2002:a17:906:3ad1:b0:6ce:a880:7745 with SMTP id z17-20020a1709063ad100b006cea8807745mr677335ejd.46.1646845137825;
        Wed, 09 Mar 2022 08:58:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxYMTYVMUjRo+NSdRia5ez2xyId2oubQ9K+g2W7NICPyo05bYmdoMaHKAZcsV1AE6fuWkD3BA==
X-Received: by 2002:a17:906:3ad1:b0:6ce:a880:7745 with SMTP id z17-20020a1709063ad100b006cea8807745mr677322ejd.46.1646845137600;
        Wed, 09 Mar 2022 08:58:57 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:cdb2:2781:c55:5db0? (2001-1c00-0c1e-bf00-cdb2-2781-0c55-5db0.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:cdb2:2781:c55:5db0])
        by smtp.gmail.com with ESMTPSA id a9-20020a1709066d4900b006da888c3ef0sm945780ejt.108.2022.03.09.08.58.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Mar 2022 08:58:57 -0800 (PST)
Message-ID: <0d4cdbbb-993b-55f3-355a-e0826ab45f46@redhat.com>
Date:   Wed, 9 Mar 2022 17:58:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: linux-next: build failure after merge of the kspp tree
Content-Language: en-US
To:     Kees Cook <keescook@chromium.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Mark Gross <markgross@kernel.org>,
        Mark Pearson <markpearson@lenovo.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20220309211029.0c766cac@canb.auug.org.au>
 <202203090847.81E8862@keescook>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <202203090847.81E8862@keescook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

On 3/9/22 17:52, Kees Cook wrote:
> On Wed, Mar 09, 2022 at 09:10:29PM +1100, Stephen Rothwell wrote:
>> Hi all,
>>
>> After merging the kspp tree, today's linux-next build (x86_64
>> allmodconfig) failed like this:
>>
>> In file included from include/linux/bitops.h:33,
>>                  from include/linux/kernel.h:22,
>>                  from drivers/platform/x86/thinkpad_acpi.c:37:
>> drivers/platform/x86/thinkpad_acpi.c: In function 'tpacpi_dytc_profile_init':
>> arch/x86/include/asm/bitops.h:207:22: error: array subscript 'long unsigned int[0]' is partly outside array bounds of 'int[1]' [-Werror=array-bounds]
>>   207 |                 (addr[nr >> _BITOPS_LONG_SHIFT])) != 0;
>>       |                 ~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/platform/x86/thinkpad_acpi.c:10385:18: note: while referencing 'output'
>> 10385 |         int err, output;
>>       |                  ^~~~~~
>>
>> Actually the test_bit() in line 10409.
>>
>> Caused by commit
>>
>>   e1c21608e3cf ("platform/x86: thinkpad_acpi: Add PSC mode support")
>>
>> from the drivers-x86 tree interacting with the enablement of
>> -Werror=array-bounds.
>>
>> I have reverted that commit for today.

Thank you.

> Looking at https://lore.kernel.org/all/20220225182505.7234-1-markpearson@lenovo.com/
> 
> The problem is with the cast of "int output" to "unsigned long". Past
> fixes have either made the variable unsigned long, or adding a new
> variable and removal of casts. e.g. this pseudo-patch:
> 
> +	unsigned long bits;
> 
> 	...
> +	bits = output;
> -	if (test_bit(DYTC_FC_MMC, (void *)&output)) { /* MMC MODE */
> +	if (test_bit(DYTC_FC_MMC, &bits)) { /* MMC MODE */
> 
> ...
> 
> -	} else if (test_bit(DYTC_FC_PSC, (void *)&output)) { /*PSC MODE */
> +	} else if (test_bit(DYTC_FC_PSC, &bits)) { /*PSC MODE */

Right I was just preparing a patch for this, I've gone with:

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 7016c7fc3440..c476a78599d6 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -10399,7 +10399,7 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
 	if (err)
 		return err;
 
-	if (test_bit(DYTC_FC_MMC, (void *)&output)) { /* MMC MODE */
+	if (output & BIT(DYTC_FC_MMC)) { /* MMC MODE */
 		dytc_profile_available = DYTC_FUNCMODE_MMC;
 
 		/*
@@ -10412,7 +10412,7 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
 			if (!err && ((output & DYTC_ERR_MASK) == DYTC_ERR_SUCCESS))
 				dytc_mmc_get_available = true;
 		}
-	} else if (test_bit(DYTC_FC_PSC, (void *)&output)) { /*PSC MODE */
+	} else if (output & BIT(DYTC_FC_PSC)) { /* PSC MODE */
 		dytc_profile_available = DYTC_FUNCMODE_PSC;
 	} else {
 		dbg_printk(TPACPI_DBG_INIT, "No DYTC support available\n");

I'll push this to the drivers-x86 tree for-next branch.

Regards,

Hans


