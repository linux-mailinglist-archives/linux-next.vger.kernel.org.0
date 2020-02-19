Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BBD9164116
	for <lists+linux-next@lfdr.de>; Wed, 19 Feb 2020 11:00:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbgBSKAv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 19 Feb 2020 05:00:51 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:57684 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726548AbgBSKAv (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 19 Feb 2020 05:00:51 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 01J9wZjc011866;
        Wed, 19 Feb 2020 11:00:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=z1m2XzYdCC2EaIAOcE3eSxjEb3D78KxFwI9M6TVol+c=;
 b=Sn+9XhitQzasfJTKQ0SbQjEp9IuAz8JOhnhQvKQj6ZUMg4bGFllAXN5CuYaMooooQ/dt
 8d4R9Hf2qrASI3VJ2wpdd3ZxYB9qsB4gS2fAGeqp4JQKEtO7FLn0ftSgyg2FpEpFF7Hx
 IicR5Uv+IXa1YLWhbl6P6X7NVJ/73tkDAiIBa/qGaOKSg6FlhK/zzv8enr4kvVs1vWwo
 yHcmcWqmqFHZDmQ9clL89WDoI6RmdcYXJppthNBOJp7cv7dO/YpBokspmtbDoQ5aY8Ae
 qXH7oHyqP5tTX30uu4a9uEP0mLSTFhlv542gg0X6POMzDVmaBZzc4GHVx3nJjPfG6N1l OA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2y8uafj8rw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 19 Feb 2020 11:00:37 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3846D100038;
        Wed, 19 Feb 2020 11:00:35 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B22C621F697;
        Wed, 19 Feb 2020 11:00:34 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.47) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 19 Feb
 2020 11:00:33 +0100
Subject: Re: msm_hsusb 78d9000.usb: failed to create device link to
 ci_hdrc.0.ulpi
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jack Pham <jackp@codeaurora.org>
CC:     Peter Chen <peter.chen@nxp.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "lkft-triage@lists.linaro.org" <lkft-triage@lists.linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
References: <CA+G9fYtnwFVPQxgHOU2Bi9y5+q4sSsww47yxK+_3ZAQ9=kyhUg@mail.gmail.com>
 <20200219013824.GB8602@b29397-desktop>
 <20200219024534.GB10078@jackp-linux.qualcomm.com>
 <CAHp75VfY1Y-jNr=YTfAO+eUOy3xUy9+AgtyJuhEk2ngrxMg5JA@mail.gmail.com>
From:   Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <c39584b0-302e-d1bb-2e97-ffc017755bf2@st.com>
Date:   Wed, 19 Feb 2020 11:00:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAHp75VfY1Y-jNr=YTfAO+eUOy3xUy9+AgtyJuhEk2ngrxMg5JA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-02-19_02:2020-02-19,2020-02-19 signatures=0
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Andy

On 2/19/20 10:23 AM, Andy Shevchenko wrote:
> On Wed, Feb 19, 2020 at 4:46 AM Jack Pham <jackp@codeaurora.org> wrote:
>>
>> On Wed, Feb 19, 2020 at 01:38:22AM +0000, Peter Chen wrote:
>>> On 20-02-17 14:02:57, Naresh Kamboju wrote:
>>>> arm64 APQ 8016 SBC ( Dragonboard 410c)  device running Linux next boot
>>>> failed due to below error.
>>>>
>>>> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd030]
>>>> [    0.000000] Linux version 5.6.0-rc2-next-20200217 (oe-user@oe-host)
>>>> (gcc version 7.3.0 (GCC)) #1 SMP PREEMPT Mon Feb 17 04:27:31 UTC 2020
>>>> [    0.000000] Machine model: Qualcomm Technologies, Inc. APQ 8016 SBC
>>>> <>
>>>> [    4.439291] msm_hsusb 78d9000.usb: failed to create device link to
>>>> ci_hdrc.0.ulpi
>>>> [    4.448891] msm_hsusb 78d9000.usb: failed to create device link to
>>>> ci_hdrc.0.ulpi
>>>> [    4.457879] msm_hsusb 78d9000.usb: failed to create device link to
>>>> ci_hdrc.0.ulpi
>>>> [    4.467331] msm_hsusb 78d9000.usb: failed to create device link to
>>>> ci_hdrc.0.ulpi
>>>> [    4.475636] mmc0: new HS200 MMC card at address 0001
>>>> [    4.478895] mmcblk0: mmc0:0001 DS2008 7.28 GiB
>>>> [    4.480629] mmcblk0boot0: mmc0:0001 DS2008 partition 1 4.00 MiB
>>>> [    4.484719] mmcblk0boot1: mmc0:0001 DS2008 partition 2 4.00 MiB
>>>> [    4.492247] msm_hsusb 78d9000.usb: failed to create device link to
>>>> ci_hdrc.0.ulpi
>>>> [    4.502611] mmcblk0rpmb: mmc0:0001 DS2008 partition 3 4.00 MiB,
>>>> chardev (234:0)
>>>> [    4.506949] msm_hsusb 78d9000.usb: failed to create device link to
>>>> ci_hdrc.0.ulpi
>>>> [    4.517901] random: fast init done
>>>> [    4.521420] mmc1: new ultra high speed SDR104 SDHC card at address aaaa
>>>> [    4.523400] mmcblk1: mmc1:aaaa SL16G 14.8 GiB
>>>> [    4.532843] msm_hsusb 78d9000.usb: failed to create device link to
>>>> ci_hdrc.0.ulpi
>>>> [    4.539131]  mmcblk0: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14
>>>> [    4.542309]  mmcblk1: p1
>>>> [    4.561843] msm_hsusb 78d9000.usb: failed to create device link to
>>>> ci_hdrc.0.ulpi
>>>> [    4.573481] msm_hsusb 78d9000.usb: failed to create device link to
>>>> ci_hdrc.0.ulpi
>>>> [    4.585283] msm_hsusb 78d9000.usb: failed to create device link to
>>>> ci_hdrc.0.ulpi
>>>> [    4.592622] msm_hsusb 78d9000.usb: failed to create device link to
>>>> ci_hdrc.0.ulpi
>>>> [    4.600074] msm_hsusb 78d9000.usb: failed to create device link to
>>>> ci_hdrc.0.ulpi
>>>> [    4.607204] msm_hsusb 78d9000.usb: failed to create device link to
>>>> ci_hdrc.0.ulpi
>>>> [    4.614679] msm_hsusb 78d9000.usb: failed to create device link to
>>>> ci_hdrc.0.ulpi
>>>
>>> The chipidea USB code hasn't changed recently. Would you please bisect
>>> which commit affect it?
>>
>> Probably same cause as for this:
>> https://bugzilla.kernel.org/show_bug.cgi?id=206435
> 
> Yes, it's the same. I dunno why no fix yet available.
> 

Kishon has posted a patch yesterday for device link issue in phy core. 
Please see:

https://lkml.org/lkml/2020/2/18/272

regards
Alex


