Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBFD51729F6
	for <lists+linux-next@lfdr.de>; Thu, 27 Feb 2020 22:12:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729685AbgB0VMZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 27 Feb 2020 16:12:25 -0500
Received: from mail-yw1-f68.google.com ([209.85.161.68]:38024 "EHLO
        mail-yw1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726758AbgB0VMZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 27 Feb 2020 16:12:25 -0500
Received: by mail-yw1-f68.google.com with SMTP id 10so1036441ywv.5;
        Thu, 27 Feb 2020 13:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tsMhk98GzPgpcErAxRpJjxVe9/TO3Gwgz+pYvXXSyds=;
        b=fDKEw6TOTnfDJTZ+XYkXKPvUW3h8IbJfS9HdA9cubhD+9s307B8p/b5CBK2BzTJPo8
         +iuRdZJ7qrkHhWQql9HclIBzL8VNZN5ByV2an66CeWTEAcjzT7sWLSeJuMcwUnUz8UaY
         4kny427QNBfPL/9hNq5AJJArd5JXz4kWX9GVe4lZmLzAS/4ZZZDC0fCWNX+vmbiqytOa
         qJVC1PROqJ8hPUTP2/W1ZjmImBOMRQWfWWJ0Z+JB3Pj+Ngu3A/GQJcHoMje92Lb0zd1N
         lm0RPHHYufH37yySJCs65NP87A3nkmy/fFjPMAzh/ppYfbekYc/kV9EZa7bplswQN8HH
         d8fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tsMhk98GzPgpcErAxRpJjxVe9/TO3Gwgz+pYvXXSyds=;
        b=PaVWnwg+iMpWPzn6NhLIseUUYOwWVwUxwCPN0djAGDKf4ZDtGEcb7fPmJs/iDCdELs
         nNBDV664MB803Chufp19m9kk3hII8MTg2Lv6myYCSaRg4OkjM6bc6+6FltKu1HCaJLOX
         RE6WiFFdijpleY/rr8qJRwA7OND4Uzsw/7Q6Hdgl6GONfqd3m4QqfumG+Om5S+dHHn2Q
         0dPoDLF1V4Mk9qI9BDi1ryGz0cEbtTWgm/LPB4D0c7ZSpp/YQ2HosfYAyjO1GCXhYS4w
         kdq2SfmuQ9dlzbhzQrbX6QHAYXoDYgk3lfpargiEwDbBLCgLXNLL9ZiJAurb+047/CAp
         kMOg==
X-Gm-Message-State: APjAAAVd/uhAeX8BtU5X6KVDO9xIRSo0Ies9xSeK5dlcLF9YnRlVQC0C
        Ll+K9hp1z5cPidy//PBsc3ZboMjs
X-Google-Smtp-Source: APXvYqxbOPF4d1PWj+9QXa5jghXS/+e5SEzFkoJU/d7A8wINmDIWlmCIjPZmvpgNfwxnWeXg+H3vaQ==
X-Received: by 2002:a0d:f086:: with SMTP id z128mr1301805ywe.450.1582837943818;
        Thu, 27 Feb 2020 13:12:23 -0800 (PST)
Received: from [192.168.1.46] (c-73-88-245-53.hsd1.tn.comcast.net. [73.88.245.53])
        by smtp.gmail.com with ESMTPSA id x84sm3028467ywg.47.2020.02.27.13.12.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Feb 2020 13:12:23 -0800 (PST)
Subject: Re: linux-next: Tree for Feb 27 (drivers/of/unittest.c)
To:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
References: <20200227152223.3d8442f0@canb.auug.org.au>
 <ed57c797-1d40-0786-2cdc-adae7047a86f@infradead.org>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <0bd9179f-c448-c40d-f520-d568547bc810@gmail.com>
Date:   Thu, 27 Feb 2020 15:12:22 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <ed57c797-1d40-0786-2cdc-adae7047a86f@infradead.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Randy,

On 2/27/20 10:23 AM, Randy Dunlap wrote:
> On 2/26/20 8:22 PM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20200226:
>>
> 
> on x86_64:
> 
> # CONFIG_GPIOLIB is not set
> 
> ../drivers/of/unittest.c: In function ‘unittest_gpio_probe’:
> ../drivers/of/unittest.c:94:14: error: ‘struct gpio_chip’ has no member named ‘of_node’
>   devptr->chip.of_node = pdev->dev.of_node;
>               ^
> In file included from ../include/linux/kernel.h:15:0,
>                  from ../include/asm-generic/bug.h:19,
>                  from ../arch/x86/include/asm/bug.h:83,
>                  from ../include/linux/bug.h:5,
>                  from ../include/linux/mmdebug.h:5,
>                  from ../include/linux/mm.h:9,
>                  from ../include/linux/memblock.h:13,
>                  from ../drivers/of/unittest.c:8:
> ../drivers/of/unittest.c:103:73: error: ‘struct gpio_chip’ has no member named ‘of_node’
>     "gpiochip_add_data() for node @%pOF failed, ret = %d\n", devptr->chip.of_node, ret);
>                                                                          ^
> 
> Full randconfig file is attached.
> 

I am trying to build a kernel with the randconfig you provided.

I am trying to figure out how to build with the exact configuration,
but every way I've tried to build modifies the .config file.

Do you have any pointers to info on how to get the build system
to use exactly the .config without modification?

(Just in case it is pertinent, I am using Linux 5.6-rc1 instead
of -next.)

-Frank
