Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C710E197781
	for <lists+linux-next@lfdr.de>; Mon, 30 Mar 2020 11:11:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726887AbgC3JLl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Mar 2020 05:11:41 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40474 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726127AbgC3JLl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 30 Mar 2020 05:11:41 -0400
Received: by mail-wr1-f68.google.com with SMTP id u10so20616012wro.7;
        Mon, 30 Mar 2020 02:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=0LeJgAAnqX5pXOrfef4xQXrRSfLT4+sg2yao8l8UpUo=;
        b=oqSDgBmM5x17cFwzxmQ4aKtBKKTo3bCW+JdPMF4cGEbuLpL36HpfPPnhS+5EVme0lu
         fDDoy3D0J2JgONLIoJV/zdCGmEliuTMPtSV4RDbi+YgixFtXbWz0NMA5CdbTh+XjHNKM
         JN7dgbYWfyXFTS1v+/83Ecp7x5g8uhtq8Nv5BRUHhQSiwOUcQGe/KPK6pWb4wqCGTsGR
         4lDNIA+N9dEo5/zu4GtDSwVmonvMFCfZnJ9XUmrzoECm8ZH/Hm+MmHNjfcczFkMFZ7XA
         Nkn6DS2wmFhrRuadEsjIMbv9LGt3p3Wfz4R33XVzDnFf8Aa4GZZEOpQxTOZMaqeBJmAK
         uodA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
         :message-id:mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=0LeJgAAnqX5pXOrfef4xQXrRSfLT4+sg2yao8l8UpUo=;
        b=QpR93H0G0Xodh8euyQj1MDbTPDeG9tBGLrDAhRHucjB5JruX+L3IPBkW6eXK/vIafj
         l2LihzgtLxVzSYDQadyp/QfbsbZhKSMtDCd1LvAUA1m9vgdkRgkWnNVAgzmKHca3mFkb
         3wmuwCGWm8lHWwByvYM/y4EhmsSFuBoobLCcSi2FEfbBuo67nqt3IEvnklbyhRrxdhU9
         5SOoWSFGnWatatoxz0z2oFuq4vnA2gxS0i+Ur9245ve6gtpdoAvnyFbEaxCB9LQ9ZKqK
         T8Zxkh7mjF/LpuMKWILV5ZAN7DqT8Qly7fg/rx4nwwL1m+AH9AhzmtOlGX2ubqYz+xTi
         79fA==
X-Gm-Message-State: ANhLgQ1O8E3zuPjpBDxOv8XS3BOGtS3W/NYj5pSpea73vHqWRp98wMoU
        /0sMCl0wRFJC4MGZsZc5NkGI3AZTeE8diQ==
X-Google-Smtp-Source: ADFU+vt80BhEaT/0s1wFJRln1sRKF1TzwFGfKfiumPqP9pMb6+RbT2Vuuc3pqtdCItqkKlovRaxp/Q==
X-Received: by 2002:a5d:460e:: with SMTP id t14mr13819799wrq.421.1585559498062;
        Mon, 30 Mar 2020 02:11:38 -0700 (PDT)
Received: from AnsuelXPS ([2001:470:b467:1:d1ad:50bb:f012:e16])
        by smtp.gmail.com with ESMTPSA id l185sm10880289wml.44.2020.03.30.02.11.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Mar 2020 02:11:36 -0700 (PDT)
From:   <ansuelsmth@gmail.com>
To:     "'Stephen Rothwell'" <sfr@canb.auug.org.au>,
        "'Linus Walleij'" <linus.walleij@linaro.org>
Cc:     "'Linux Next Mailing List'" <linux-next@vger.kernel.org>,
        "'Linux Kernel Mailing List'" <linux-kernel@vger.kernel.org>,
        "'Ajay Kishore'" <akisho@codeaurora.org>,
        "'Bjorn Andersson'" <bjorn.andersson@linaro.org>
References: <20200330171946.4e48fbd9@canb.auug.org.au>
In-Reply-To: <20200330171946.4e48fbd9@canb.auug.org.au>
Subject: R: linux-next: build failure after merge of the pinctrl tree
Date:   Mon, 30 Mar 2020 11:11:34 +0200
Message-ID: <00ff01d60673$37177c20$a5467460$@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: it
Thread-Index: AQHOQtNMcV7el3iWp8zcu7kRQ8Bdo6hwYFzQ
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

> Hi all,
> 
> After merging the pinctrl tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> drivers/pinctrl/qcom/pinctrl-msm.c:909:4: error: expected identifier or
'('
> before 'else'
>   909 |  } else {
>       |    ^~~~
> drivers/pinctrl/qcom/pinctrl-msm.c:921:2: warning: data definition has no
> type or storage class
>   921 |  val = msm_readl_intr_cfg(pctrl, g);
>       |  ^~~
> drivers/pinctrl/qcom/pinctrl-msm.c:921:2: error: type defaults to 'int' in
> declaration of 'val' [-Werror=implicit-int]
> drivers/pinctrl/qcom/pinctrl-msm.c:921:27: error: 'pctrl' undeclared here
> (not in a function); did you mean 'pinctrl'?
>   921 |  val = msm_readl_intr_cfg(pctrl, g);
>       |                           ^~~~~
>       |                           pinctrl
> drivers/pinctrl/qcom/pinctrl-msm.c:921:34: error: 'g' undeclared here (not
> in a function)
>   921 |  val = msm_readl_intr_cfg(pctrl, g);
>       |                                  ^
> drivers/pinctrl/qcom/pinctrl-msm.c:922:6: error: expected '=', ',', ';',
'asm'
> or '__attribute__' before '|=' token
>   922 |  val |= BIT(g->intr_raw_status_bit);
>       |      ^~
> drivers/pinctrl/qcom/pinctrl-msm.c:923:2: error: expected identifier or
'('
> before 'if'
>   923 |  if (g->intr_detection_width == 2) {
>       |  ^~
> drivers/pinctrl/qcom/pinctrl-msm.c:945:4: error: expected identifier or
'('
> before 'else'
>   945 |  } else if (g->intr_detection_width == 1) {
>       |    ^~~~
> drivers/pinctrl/qcom/pinctrl-msm.c:966:4: error: expected identifier or
'('
> before 'else'
>   966 |  } else {
>       |    ^~~~
> drivers/pinctrl/qcom/pinctrl-msm.c:969:2: warning: data definition has no
> type or storage class
>   969 |  msm_writel_intr_cfg(val, pctrl, g);
>       |  ^~~~~~~~~~~~~~~~~~~
> drivers/pinctrl/qcom/pinctrl-msm.c:969:2: error: type defaults to 'int' in
> declaration of 'msm_writel_intr_cfg' [-Werror=implicit-int]
> drivers/pinctrl/qcom/pinctrl-msm.c:969:2: warning: parameter names
> (without types) in function declaration
> drivers/pinctrl/qcom/pinctrl-msm.c:969:2: error: conflicting types for
> 'msm_writel_intr_cfg'
> drivers/pinctrl/qcom/pinctrl-msm.c:84:13: note: previous definition of
> 'msm_writel_intr_cfg' was here
>    84 | static void msm_writel_##name(u32 val, struct msm_pinctrl *pctrl,
> \
>       |             ^~~~~~~~~~~
> drivers/pinctrl/qcom/pinctrl-msm.c:92:1: note: in expansion of macro
> 'MSM_ACCESSOR'
>    92 | MSM_ACCESSOR(intr_cfg)
>       | ^~~~~~~~~~~~
> drivers/pinctrl/qcom/pinctrl-msm.c:971:2: error: expected identifier or
'('
> before 'if'
>   971 |  if (test_bit(d->hwirq, pctrl->dual_edge_irqs))
>       |  ^~
> In file included from include/linux/vmalloc.h:5,
>                  from include/asm-generic/io.h:887,
>                  from arch/arm/include/asm/io.h:438,
>                  from include/linux/io.h:13,
>                  from drivers/pinctrl/qcom/pinctrl-msm.c:9:
> include/linux/spinlock.h:287:2: error: expected identifier or '(' before
'do'
>   287 |  do {       \
>       |  ^~
> drivers/pinctrl/qcom/pinctrl-msm.c:974:2: note: in expansion of macro
> 'raw_spin_unlock_irqrestore'
>   974 |  raw_spin_unlock_irqrestore(&pctrl->lock, flags);
>       |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
> include/linux/spinlock.h:290:4: error: expected identifier or '(' before
'while'
>   290 |  } while (0)
>       |    ^~~~~
> drivers/pinctrl/qcom/pinctrl-msm.c:974:2: note: in expansion of macro
> 'raw_spin_unlock_irqrestore'
>   974 |  raw_spin_unlock_irqrestore(&pctrl->lock, flags);
>       |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/pinctrl/qcom/pinctrl-msm.c:976:2: error: expected identifier or
'('
> before 'if'
>   976 |  if (type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_LEVEL_HIGH))
>       |  ^~
> drivers/pinctrl/qcom/pinctrl-msm.c:978:2: error: expected identifier or
'('
> before 'else'
>   978 |  else if (type & (IRQ_TYPE_EDGE_FALLING |
> IRQ_TYPE_EDGE_RISING))
>       |  ^~~~
> drivers/pinctrl/qcom/pinctrl-msm.c:981:2: error: expected identifier or
'('
> before 'return'
>   981 |  return 0;
>       |  ^~~~~~
> drivers/pinctrl/qcom/pinctrl-msm.c:982:1: error: expected identifier or
'('
> before '}' token
>   982 | }
>       | ^
> drivers/pinctrl/qcom/pinctrl-msm.c: In function 'msm_gpio_irq_set_type':
> drivers/pinctrl/qcom/pinctrl-msm.c:909:2: warning: control reaches end of
> non-void function [-Wreturn-type]
>   909 |  } else {
>       |  ^
> At top level:
> drivers/pinctrl/qcom/pinctrl-msm.c:84:13: warning:
> 'msm_writel_intr_target' defined but not used [-Wunused-function]
>    84 | static void msm_writel_##name(u32 val, struct msm_pinctrl *pctrl,
> \
>       |             ^~~~~~~~~~~
> drivers/pinctrl/qcom/pinctrl-msm.c:94:1: note: in expansion of macro
> 'MSM_ACCESSOR'
>    94 | MSM_ACCESSOR(intr_target)
>       | ^~~~~~~~~~~~
> drivers/pinctrl/qcom/pinctrl-msm.c:79:12: warning:
> 'msm_readl_intr_target' defined but not used [-Wunused-function]
>    79 | static u32 msm_readl_##name(struct msm_pinctrl *pctrl, \
>       |            ^~~~~~~~~~
> drivers/pinctrl/qcom/pinctrl-msm.c:94:1: note: in expansion of macro
> 'MSM_ACCESSOR'
>    94 | MSM_ACCESSOR(intr_target)
>       | ^~~~~~~~~~~~
> 
> Caused by commit
> 
>   13bec8d49bdf ("pinctrl: qcom: use scm_call to route GPIO irq to Apps")
> 
> I have reverted that commit for today.
> 
> --
> Cheers,
> Stephen Rothwell

Hello I sent a v4 of the broken patch. I'm really sorry for the mess... If I
should fix 
this in a different way pls tell me how and I will do ASAP.

