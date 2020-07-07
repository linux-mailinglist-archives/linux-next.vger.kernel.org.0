Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9995421760F
	for <lists+linux-next@lfdr.de>; Tue,  7 Jul 2020 20:12:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728225AbgGGSMH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 7 Jul 2020 14:12:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728029AbgGGSMH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 7 Jul 2020 14:12:07 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C318FC08C5DC
        for <linux-next@vger.kernel.org>; Tue,  7 Jul 2020 11:12:06 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id a6so2264241wmm.0
        for <linux-next@vger.kernel.org>; Tue, 07 Jul 2020 11:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=dkBGZFFrCFaqqtw2dRtcsDkg6EDJqwN1Ag4JpnmvXE0=;
        b=NLyyVFbfJQcGzxnQAhzuP9IWH4cBGwOkHvRTVHy7EmlYu877w37ArkMeHogVl2ySlm
         YeADM9JYuwx9Ps6Aa9mRTMui4YBBm5XJXfOpsS+OWtvDusfwButaxMJ8F+pMTB58fTdw
         cP16lfPTR7nSBCfpR5nmCeHVQseIlH5qg8gTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=dkBGZFFrCFaqqtw2dRtcsDkg6EDJqwN1Ag4JpnmvXE0=;
        b=dSbAPtsn/h1lqKaJujDbiBo1CDpI1fhZi+5Ml5bSsKjvXE0WQsTmkvWVS8LDqRAtUb
         0Y0dpjjTTr8N67KlAZNzWDcZi98ZU0bigC5HBoVk9hhVPwHn6qJTiJTIDky7F2ARE3K4
         SIpe76ROG4NbkWXRC3CmRmrJBsqM9HFUonLPCZ1DtXyM6KJNz+KQqxxTGhWQSfScGPIW
         qbgtWYwE4m0Nu2/hny1Bn1FQY2Ow88PJUvar/PjAtEOS/vGumziwpA192uoAo+eWWt09
         Rb3awQOmNwx7POA9mE72/HPB7cBBXUhHG0OIfZYG4HirC1OqjAy5ir9B67P4Jt1kEFuW
         2z0g==
X-Gm-Message-State: AOAM531GMweNI0lxqPMOPr6qplEThWx++FEfrAd4ZqR0l0y6PitjKon7
        4RtiPYGuVv/o9GsZcHioaBqWsw==
X-Google-Smtp-Source: ABdhPJx80fTYHbVtP4tLN7pHRKrDlRSW1jaNL//yM4e+PTmPZAQS/FYK//pDzT11nfP43EpwYlgB+g==
X-Received: by 2002:a7b:cd10:: with SMTP id f16mr5505804wmj.86.1594145525392;
        Tue, 07 Jul 2020 11:12:05 -0700 (PDT)
Received: from [192.168.1.237] (ip68-5-85-189.oc.oc.cox.net. [68.5.85.189])
        by smtp.gmail.com with ESMTPSA id k11sm2247410wrd.23.2020.07.07.11.12.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2020 11:12:04 -0700 (PDT)
Subject: Re: linux-next: Tree for Jul 7 (scsi/lpfc/lpfc_init.c)
To:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-scsi <linux-scsi@vger.kernel.org>,
        dick kennedy <dick.kennedy@broadcom.com>
References: <20200707180800.549b561b@canb.auug.org.au>
 <2f85f3c4-a58b-f225-a533-86e209a4651c@infradead.org>
From:   James Smart <james.smart@broadcom.com>
Message-ID: <7ae1c7e3-ce8d-836b-1ae7-d4d00bd8f95c@broadcom.com>
Date:   Tue, 7 Jul 2020 11:12:00 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2f85f3c4-a58b-f225-a533-86e209a4651c@infradead.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 7/7/2020 10:09 AM, Randy Dunlap wrote:
> On 7/7/20 1:08 AM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20200706:
>>
> on i386:
>
> when CONFIG_ACPI is not set/enabled:
>
>
> ../drivers/scsi/lpfc/lpfc_init.c:1265:15: error: implicit declaration of function 'get_cpu_idle_time'; did you mean 'get_cpu_device'? [-Werror=implicit-function-declaration]
>
>
> The cpufreq people want justification for using
> get_cpu_idle_time().  Please see
> https://lore.kernel.org/linux-scsi/20200707030943.xkocccy6qy2c3hrx@vireshk-i7/
>
>
>

The driver is using cpu utilization in order to choose between softirq 
or work queues in handling an interrupt. Less-utilized, softirq is used. 
higher utilized, work queue is used.  The utilization is checked 
periodically via a heartbeat.

-- james

