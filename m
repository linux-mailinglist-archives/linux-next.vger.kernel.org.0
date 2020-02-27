Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C253D1728C1
	for <lists+linux-next@lfdr.de>; Thu, 27 Feb 2020 20:37:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730576AbgB0TgM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 27 Feb 2020 14:36:12 -0500
Received: from mail-yw1-f67.google.com ([209.85.161.67]:44070 "EHLO
        mail-yw1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727268AbgB0TgL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 27 Feb 2020 14:36:11 -0500
Received: by mail-yw1-f67.google.com with SMTP id t141so683911ywc.11;
        Thu, 27 Feb 2020 11:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fLGX/xGabWa4DPdGXZZH2fnbI6egAflYqmbRP3wBoRk=;
        b=N6zJ2dbom09soVKZBwSEaOkmzKuE9hdWdmiIjEcYZVzPz9j+3e6d88CVS6nQmZBD8/
         Tml0iIR+Rhx2eY+1tFlqSuWldV448vR4/b6TP8KkK9V4WiJunu9CEWpjHd0c35VCm7Mv
         NkL6ih3S4mLnQfbtdrEEh2CZvgm6q/z37WQUnqEmNjy6MYB7fQvIdf/5YE7Kp1SgrAjP
         QMJFjkEz2X6TWRvUKnzq15JeC+Kt8UiUF4G8S9lucHY5kemnpsDdjz24+MEwC73MyCu+
         zFEjGlQcXw9LcyIG8IUPC9Rqxu9/kmpzpIotofVaY3B79ZvLMpDC+fZPbL9wJY7r4Bwz
         dEJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fLGX/xGabWa4DPdGXZZH2fnbI6egAflYqmbRP3wBoRk=;
        b=XLPkn4SzM2LPqQC9KH7qyQp7xDJ87Z4oWAO4X/8w/HqkoxNd4PhCTM22BJTIs67NKM
         y73XiI7bhTlpbWGhevhjfBnmHbWMUxFpcSWn9tyyM2qkdhbh2NvoDt4DiioOqDwNgJZ3
         l+t9SZy4Rb2856ktkPo8TJMvAwz6AVI3BNK+FgnXXGSUkDtlQ2cqU4LjNqEdVvc2yMiR
         ++c80+Y2ePrrreTVPslPeOEaJWVmQHR0gSbTxTTnaMjyhhqxUuanYQnA4Gr6a8dEMGDx
         V/aqaKfJ841ohnd5gNjPErPELDhh+rZUU6Ayf+PeMT9PBjTQivCFdvmQJBcOIMEaOjga
         Tr1Q==
X-Gm-Message-State: APjAAAWGR6k0ahaiq24ptz5/gh4hw6BDtgDFreHwBq5gurCT6TMbYXaD
        23djf3N9tTOC3pvkminfLL8=
X-Google-Smtp-Source: APXvYqwJHOv7SS5SYnVNGRe2pOs7jGSn+gNuBZYYYSutQkryQ/8Kn0gzUQ+cNHliDnH7nPc6ndJYxg==
X-Received: by 2002:a81:1fc2:: with SMTP id f185mr1016289ywf.241.1582832170706;
        Thu, 27 Feb 2020 11:36:10 -0800 (PST)
Received: from [192.168.1.46] (c-73-88-245-53.hsd1.tn.comcast.net. [73.88.245.53])
        by smtp.gmail.com with ESMTPSA id k8sm2434906ywa.4.2020.02.27.11.36.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Feb 2020 11:36:10 -0800 (PST)
Subject: Re: linux-next: Tree for Feb 27 (drivers/of/unittest.c)
To:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
References: <20200227152223.3d8442f0@canb.auug.org.au>
 <ed57c797-1d40-0786-2cdc-adae7047a86f@infradead.org>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <3b9459af-767a-0d6a-47c2-900e18acaa98@gmail.com>
Date:   Thu, 27 Feb 2020 13:36:08 -0600
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

Thanks for the report!

Will fix.

-Frank
