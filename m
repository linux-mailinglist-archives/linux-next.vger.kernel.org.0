Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F35FD86A85
	for <lists+linux-next@lfdr.de>; Thu,  8 Aug 2019 21:22:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404244AbfHHTWx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Aug 2019 15:22:53 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:41781 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404857AbfHHTUz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Aug 2019 15:20:55 -0400
Received: by mail-pf1-f194.google.com with SMTP id m30so44649355pff.8
        for <linux-next@vger.kernel.org>; Thu, 08 Aug 2019 12:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WofIjniXiwNzxEUaGFVhZ+h83Wcut+hzdIT3wo6e7YM=;
        b=KQljckW9Gh7h2hSk+gLggObASU2CPWRIxV7VyUuCJvL2RUAx4WqtitmD7N7cnp6dtx
         1bSKBO7I2OZorVgWYzMkpzO3B6BIsB42z6GOkLb2mpjCUwtjti3t8QKP5k7He1Tig9zq
         jOrsP1LmiRh9m+6/QM88HoXQXRZChQKxEYeIqxzFY4CjN+0DkRbI9FFENeF/VtQ91ibj
         wjycfbIZ18hEDhEpzFP+koh8U+KaZGz/YRV29a9TWvOBJkhP59Scv9Pq8Z9GeAaM2uo2
         /VeEZDsaWHSxcNBQfDgNTCOxY5hj5P58fSPg4jLgLEhbYwyCybIq1fc4MMvmXkj1JekE
         WURg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WofIjniXiwNzxEUaGFVhZ+h83Wcut+hzdIT3wo6e7YM=;
        b=j905dlwmM6NAn3oyxkou0iPfBzKeqeJffzmRXT8AbcOoiBVusEF7+xpfW3jTfzPD9g
         cRjY+eR1B99v0zkM7b3pJX3276aKeg4Bq2c+uQixR+SYmy8rt0hjGd7VmoZugVH/bi/O
         vPno7bXq9XUYZz0CWtAsPLLE+CDRBl+cW+hnstK8o7feOfU9a0+FSCMFnADj6coKNEjA
         YmnM1JxFZvryE5i4wiLqf2HoOWZj9AXDImbjwDIolZjsAUYMOqzndMwlKNSF71AXISj3
         2upHFTt7bZCj3REdR5+YT2Vlx90iVDmJQfEJkYE+zxGuB4MyVv7Lkh+1l2133KEzA83B
         044Q==
X-Gm-Message-State: APjAAAV8rYV1HBBjlbEo+6GUeh9Uvd3l+x2xfoHhGk2J5L8lZKkRBslZ
        2+J9cmuvMxb2uwRJvcchuE0=
X-Google-Smtp-Source: APXvYqy1nAMROP2tNRjP90YcDjSjfw5g7Jxmg/KRzY27RLDmMUbzlnugppsGaJIAUrvztZ+VMG7E7A==
X-Received: by 2002:a62:16:: with SMTP id 22mr17745874pfa.151.1565292055001;
        Thu, 08 Aug 2019 12:20:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e189sm83108353pgc.15.2019.08.08.12.20.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Aug 2019 12:20:54 -0700 (PDT)
Subject: Re: next/master build: 230 builds: 5 failed, 225 passed, 6 errors,
 1344 warnings (next-20190805)
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Mark Brown <broonie@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        David Zhou <David1.Zhou@amd.com>,
        kernel-build-reports@lists.linaro.org,
        David Airlie <airlied@linux.ie>, Tao Zhou <tao.zhou1@amd.com>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Dennis Li <dennis.li@amd.com>
References: <5d47f990.1c69fb81.a5d88.ee1f@mx.google.com>
 <20190805111205.GB6432@sirena.org.uk> <20190808184149.GA441@roeck-us.net>
 <CADnq5_NL6+AohC-3HJa+84k50ewqYLMy_VuFmgY=aw872JFf-A@mail.gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <768ee31a-c870-4237-f38a-b176378072b6@roeck-us.net>
Date:   Thu, 8 Aug 2019 12:20:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CADnq5_NL6+AohC-3HJa+84k50ewqYLMy_VuFmgY=aw872JFf-A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 8/8/19 11:53 AM, Alex Deucher wrote:
> On Thu, Aug 8, 2019 at 2:53 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On Mon, Aug 05, 2019 at 12:12:05PM +0100, Mark Brown wrote:
>>> On Mon, Aug 05, 2019 at 02:40:32AM -0700, kernelci.org bot wrote:
>>>
>>> Today's -next fails to build an arm allmodconfig due to:
>>>
>>>> allmodconfig (arm, gcc-8) — FAIL, 2 errors, 16 warnings, 0 section mismatches
>>>>
>>>> Errors:
>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:279:9: error: implicit declaration of function 'readq'; did you mean 'readb'? [-Werror=implicit-function-declaration]
>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:298:3: error: implicit declaration of function 'writeq'; did you mean 'writeb'? [-Werror=implicit-function-declaration]
>>>
>>> due to 4fa1c6a679bb0 (drm/amdgpu: add RREG64/WREG64(_PCIE) operations)
>>> which introduces use of readq() and writeq().
>>
>> AFAICS this problem affects all 32-bit builds, including i386.
>> Is it in the process of being fixed, or should we submit a
>> patch limiting DRM_AMDGPU to 64-bit builds ?
> 
> Yes, the fix is being discussed here:
> https://patchwork.freedesktop.org/patch/322213/
> 

Please note that this does fail for i386 (32-bit x86) builds, contrary to the information
in that discussion. Also, from looking into the kernel, I only see readq/writeq defined
for arch/x86 in 64-bit mode; see arch/x86/include/asm/io.h.

Guenter
