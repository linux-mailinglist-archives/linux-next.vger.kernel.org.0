Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FE421E282F
	for <lists+linux-next@lfdr.de>; Tue, 26 May 2020 19:14:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730259AbgEZROp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 May 2020 13:14:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388723AbgEZROP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 May 2020 13:14:15 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF090C03E96D;
        Tue, 26 May 2020 10:14:14 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id y18so10427385pfl.9;
        Tue, 26 May 2020 10:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RgMIbtwZA3wzegtW83KbTmQydot3HDdtZNvy+0zgqvU=;
        b=vJsqEeYqfFg4vxxR9HrsbzBKpqLxEHfSsm8eDEdK0aMOJjL6kApIec6+zF2Oq8yl2R
         KtMzUaqctsJV5E4Ow1mzjY81uJI73wYeHCwJp+26Ki45hYT32vff3NR0X3vYRmHQmXj8
         EU+F4FhpaZWnUHrCW8X+B/LFjCnh8csZoVvD+aQYCyh+JxE4N4Na8/mKmAEAbH7VQ48P
         Urlrfr6gxJvJU7oBTIQ3iCkh1u7AOg69AXqWDJW+r82hAwdPbgfZp4/XxCQc1jimr7/T
         7pugOhX3kOLauar7EHIG7h2IawyN3hL1AVCwXA+9AcY1E2pIVmZVTEYsjki+N5uwRhdC
         JgBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=RgMIbtwZA3wzegtW83KbTmQydot3HDdtZNvy+0zgqvU=;
        b=eGCFzADh1vMLaLx8JwAuJ/Np4kIDdqjdPjh8mAxTGPH7wAJ1mPNeSHV5Y6AP3ajWXa
         K+hw1MB1eC/vn5h5842KWm6F87Rvhp+qM7WnoLjok87ldPmuZkPAJOsaiedt9jgtR+wi
         rGgWijo1+WxhY0y2Cr98GWDqY8Kqd/1OcSx/Ornug3mm2tCH1UIMr2XUFsabiATLExzd
         cEWuzXaHXxx8QI0I7XphXVzZay4y42d/8S5cEInTi88SjGdhk03kj6Jw7AcM268adwyd
         sCD0u/R7QdeHieSgHCl8d1Kni1hiD7QP586E/846Nzp4mC+r1oe/fGSDWV01jwg9uRVt
         i8mg==
X-Gm-Message-State: AOAM533bcsMNG751YVe1CiVPo3jqM15R0vXzQWma3yOBC4MB14/Chmb6
        hmn4C0tgwjjOPJjOSDf0dJ18z1ce
X-Google-Smtp-Source: ABdhPJx6v+FN+vk0ToWXFuPj/ytomAuaJ5hgqDK7l1nv2spYkn1suKpxUpt0NpjZ1U+axwE2JB/eDQ==
X-Received: by 2002:a62:780c:: with SMTP id t12mr22606915pfc.235.1590513254186;
        Tue, 26 May 2020 10:14:14 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x191sm135184pfd.37.2020.05.26.10.14.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2020 10:14:13 -0700 (PDT)
Subject: Re: linux-next: Tree for May 26 (hwmon/amd_energy.c)
To:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
References: <20200526203932.732df7c6@canb.auug.org.au>
 <f050c447-18fa-50d0-dbdd-b60820dc7ba1@infradead.org>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <c31504dc-9646-81f9-c262-88890556ece9@roeck-us.net>
Date:   Tue, 26 May 2020 10:14:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <f050c447-18fa-50d0-dbdd-b60820dc7ba1@infradead.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 5/26/20 9:24 AM, Randy Dunlap wrote:
> On 5/26/20 3:39 AM, Stephen Rothwell wrote:
>> Hi all,
>>
>> News: there will be no linux-next release tomorrow.
>>
>> Changes since 20200525:
>>
> 
> Hi,
> 
> All of my drivers/hwmon/amd_energy.c builds are failing (on i386 or x86_64).
> 
I don't see that, neither in my hwmon-next branch (on top of v5.7-rc6)
nor with next-20200526.

Ah yes, you must have NUMA and NEED_MULTIPLE_NODES disabled.
With that (allnoconfig+HWMON+SENSORS_AMD_ENERGY), I see the error as well.
The problem is:

	#define cpumask_of_node(node)       ((void)node, cpu_online_mask)

The caller passes node as "channel - data->nr_cpus", which I would argue
is perfectly valid. This is converted to

	#define cpumask_of_node(node)       ((void)channel - data->nr_cpus, cpu_online_mask)

which doesn't look that good and results in the error. The problem
is the missing ( ) around node, not the amd_energy driver.

Do you want to submit a patch, or do you want me to do it ?

Thanks,
Guenter

> 
> $ gcc --version
> gcc (SUSE Linux) 7.5.0
> 
> 
>   CC      drivers/hwmon/amd_energy.o
> In file included from ../arch/x86/include/asm/cpumask.h:5:0,
>                  from ../arch/x86/include/asm/msr.h:11,
>                  from ../arch/x86/include/asm/processor.h:22,
>                  from ../arch/x86/include/asm/cpu_device_id.h:16,
>                  from ../drivers/hwmon/amd_energy.c:6:
> ../drivers/hwmon/amd_energy.c: In function 'amd_energy_read':
> ../include/asm-generic/topology.h:51:36: error: void value not ignored as it ought to be
>      #define cpumask_of_node(node) ((void)node, cpu_online_mask)
> ../include/linux/cpumask.h:618:72: note: in definition of macro 'cpumask_first_and'
>  #define cpumask_first_and(src1p, src2p) cpumask_next_and(-1, (src1p), (src2p))
>                                                                         ^~~~~
> ../drivers/hwmon/amd_energy.c:194:6: note: in expansion of macro 'cpumask_of_node'
>       cpumask_of_node
>       ^~~~~~~~~~~~~~~
> ../include/asm-generic/topology.h:51:46: warning: left-hand operand of comma expression has no effect [-Wunused-value]
>      #define cpumask_of_node(node) ((void)node, cpu_online_mask)
>                                               ^
> ../include/linux/cpumask.h:618:72: note: in definition of macro 'cpumask_first_and'
>  #define cpumask_first_and(src1p, src2p) cpumask_next_and(-1, (src1p), (src2p))
>                                                                         ^~~~~
> ../drivers/hwmon/amd_energy.c:194:6: note: in expansion of macro 'cpumask_of_node'
>       cpumask_of_node
>       ^~~~~~~~~~~~~~~
> 
> 
> thanks.
> 

