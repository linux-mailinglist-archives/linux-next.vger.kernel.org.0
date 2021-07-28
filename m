Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25F703D94B2
	for <lists+linux-next@lfdr.de>; Wed, 28 Jul 2021 19:56:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbhG1R4A (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 28 Jul 2021 13:56:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22190 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229690AbhG1R4A (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 28 Jul 2021 13:56:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1627494958;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GxisACX8174uMvFvlppclC4EQL5bs36jiETLuSiddmQ=;
        b=OXlS0yfgTSxc5e+GWf0PPg/hovinvhi59WfNbjD34t6cNcP/SoHGwbSLM1HAcnnkMfCw5R
        VHGCOdN85jb8mZf6t15N8s0WkMuh3hJNknulijoFb+O8kWYp5W0w2RIJEyxEUqrsGyE21T
        2zIoWmnQzJ+p6C6JSEIGyoraz0I43o8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-k_vjcBPeObCOTphFd9xvjw-1; Wed, 28 Jul 2021 13:55:56 -0400
X-MC-Unique: k_vjcBPeObCOTphFd9xvjw-1
Received: by mail-ed1-f72.google.com with SMTP id c1-20020aa7df010000b02903bb5c6f746eso1621477edy.10
        for <linux-next@vger.kernel.org>; Wed, 28 Jul 2021 10:55:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GxisACX8174uMvFvlppclC4EQL5bs36jiETLuSiddmQ=;
        b=EwgNwCeqiRnvziJjycSySKzDqyYwhtAk38tdLO4XfPZSo2sgT97JIUtiNzY2ZIjcsn
         0b+yRaLEG02NoaDjHGgv4MjThM29nXro0XUg1BHxfHumCxyxe2Dx3Y0QNovieYbT44rg
         gApmocWzEPNHUKHb3tikfLt5vAnu/+TX6z3qXHexY9gAA6HSyUppehtOik/AvBC9Co0x
         CDS+mQ8BP8KBT8lL5fRTCWtlILtkF+8S6StRBsyOtjQX5gqreZAQ6NcnUHPkxqw5HDrU
         VIaFPoSURJofYCKai47MNtvX16S8H1p66jwXj21yGeT0DkcrzcJnWW6p80927XRYT7lt
         CZRw==
X-Gm-Message-State: AOAM531/AtOvlpHMHenN/qIYfHyevyClvqVKoHGcvshm+I4P8abno8w1
        Mq+Sa3h0qNi6m9QELNlLHPw5N9uTqDvaIrXtXl/NObGhyZJwAAlmJhmG7lwf8L5yrMchGsfcsF3
        YYvQZsWUtcArFLazgWTgwNA==
X-Received: by 2002:a05:6402:6cb:: with SMTP id n11mr1262884edy.112.1627494955575;
        Wed, 28 Jul 2021 10:55:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNWLqvC1eNWQ14TfqA0JTSWLbjWeSN7zy4ZcbOLmr0SzaT8OOnqJeoK5N3U+5DYVcl7pmWfQ==
X-Received: by 2002:a05:6402:6cb:: with SMTP id n11mr1262876edy.112.1627494955459;
        Wed, 28 Jul 2021 10:55:55 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id jg9sm150431ejc.6.2021.07.28.10.55.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jul 2021 10:55:55 -0700 (PDT)
Subject: Re: linux-next: build failure after merge of the drivers-x86 tree
To:     "Kammela, Gayatri" <gayatri.kammela@intel.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     "Gross, Mark" <mark.gross@intel.com>,
        Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
References: <20210728164847.46855-1-broonie@kernel.org>
 <CAHp75VcP2V2j_ZHtc9y9Jw527E8PZaoFngsXD3oA0Yvmm=L4SA@mail.gmail.com>
 <MW3PR11MB45238F497A4960B3D8FE60A7F2EA9@MW3PR11MB4523.namprd11.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <cd335478-7882-ade8-58e5-c5ab42902b8c@redhat.com>
Date:   Wed, 28 Jul 2021 19:55:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <MW3PR11MB45238F497A4960B3D8FE60A7F2EA9@MW3PR11MB4523.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

On 7/28/21 7:27 PM, Kammela, Gayatri wrote:
>> -----Original Message-----
>> From: Andy Shevchenko <andy.shevchenko@gmail.com>
>> Sent: Wednesday, July 28, 2021 10:02 AM
>> To: Mark Brown <broonie@kernel.org>
>> Cc: Hans de Goede <hdegoede@redhat.com>; Gross, Mark
>> <mark.gross@intel.com>; Kammela, Gayatri <gayatri.kammela@intel.com>;
>> Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>; Linux Kernel Mailing List
>> <linux-kernel@vger.kernel.org>; Linux Next Mailing List <linux-
>> next@vger.kernel.org>; Platform Driver <platform-driver-
>> x86@vger.kernel.org>
>> Subject: Re: linux-next: build failure after merge of the drivers-x86 tree
>>
>> On Wed, Jul 28, 2021 at 7:49 PM Mark Brown <broonie@kernel.org> wrote:
>>>
>>> Hi all,
>>>
>>> After merging the drivers-x86 tree, today's linux-next build
>>> (x86 allmodconfig) failed like this:
>>>
>>> error: the following would cause module name conflict:
>>>   drivers/misc/c2port/core.ko
>>>   drivers/platform/x86/intel/pmc/core.ko
>>>
>>> Caused by commit
>>>
>>>   29036fcc92b22d ("platform/x86/intel: intel_pmc_core: Move
>>> intel_pmc_core* files to pmc subfolder")
>>>
>>> Since there was nothing in the branch yesterday I've just dropped the
>>> tree entirely.
>>
>> Yeah, PMC Makefile should keep the object name the same, something like
>>
>> obj-$(..._PMC_...) += intel_pmc_....o
>> intel-pmc_...-y := core.o ...

Right, I will drop the patches from pdx86/for-next and do a forced push.

> Hi Andy and Mark,
> We've found the issue on our side as well and planning to push the fix soon. Would you prefer to have the whole patch series redone or just the fix ?

I've just dropped the current version of the patches,
please send the whole patch series redone.

Thanks & Regards,

Hans

