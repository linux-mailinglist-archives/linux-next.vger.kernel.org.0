Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A9B712003B
	for <lists+linux-next@lfdr.de>; Mon, 16 Dec 2019 09:50:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726926AbfLPItj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Dec 2019 03:49:39 -0500
Received: from mail-wr1-f53.google.com ([209.85.221.53]:38704 "EHLO
        mail-wr1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726772AbfLPItj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 16 Dec 2019 03:49:39 -0500
Received: by mail-wr1-f53.google.com with SMTP id y17so6186392wrh.5;
        Mon, 16 Dec 2019 00:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nk5RB9MHnWUtibrgUGdRjcIBI8GFWEkbYG/7hhbiY24=;
        b=KyC/nVID96hVSM3nFFoXZE3Mr/W0s5taO80yHpoqiS4OL85lcB29/Nf/5BZ6pvQHwH
         UbnBVJaiYdhDanfrbGrdAtLxFmKZP1nv+CJCxXl8mpl45+e6Uqv593IUqr9bL4zHxjOw
         4Z2oPBal44A73zcdt+4T5GU5ACjVjx81jazdVpwAfpG+SlxQQdw5oHQoOef6iBzo8Q23
         rWta2uvlJSVwkpYXHE0Hs8fNXpq9RLJSmZYuc7QTgsY2eqYjfQhAnVLaAeLT9T0Gx0h8
         phfGcYxJlVPtCTeUSbI4gr6ljHCu5cvKhmjG9Y8I3iyXEpY/RheXE2/GrpaPnzq5QK1d
         7o3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=nk5RB9MHnWUtibrgUGdRjcIBI8GFWEkbYG/7hhbiY24=;
        b=hOfABWcvxU07vu6OGrIZM/HLd8permQgpnm33D3LYgDELd8E4f4++3EoERyaCaDBMP
         tHfOGG14ShaE9KkJpJ7GmPRnruTxY9/foKBZs85pwW6UpU4jjkBmdWrXPjaI99Ztpq3R
         f7KT6VpXMFJS08TeCEkK51e+7aJVF0v68CA1jnL28MzhiZYL5qg1eX0Y2io9sPObUmZx
         oXekRqSD+mYD1kznhgR/e/740xusA4mun2LoDP86tuXoW2E9QzuFz7jXNlyXiaPZnHCJ
         fSm1c2Y0Q5/HIsjFPq54Ux0V78brboPxV9W/x+Cv93j4Rn3SYFF/iahjVeIeFFH74xL/
         DGkQ==
X-Gm-Message-State: APjAAAWGLlXJtk7AKyhmmBPqfOIYRIAIDYoxYKLNke1xj5El2Yoy6JZC
        5a5XdRaP7tWh59l7lNAtbsk=
X-Google-Smtp-Source: APXvYqydi5bzU5CF4eThWT1KcBsi3mSp1l7mIoNh1CV5dLzOJMqYj5NBjCwiTvP6Fw+fS5NrhKpeyg==
X-Received: by 2002:adf:f2c1:: with SMTP id d1mr28140521wrp.111.1576486175357;
        Mon, 16 Dec 2019 00:49:35 -0800 (PST)
Received: from ziggy.stardust ([37.223.145.31])
        by smtp.gmail.com with ESMTPSA id h2sm20683008wrv.66.2019.12.16.00.49.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2019 00:49:34 -0800 (PST)
Subject: Re: linux-next: build failure after merge of the mediatek tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mars Cheng <mars.cheng@mediatek.com>,
        Owen Chen <owen.chen@mediatek.com>,
        Macpaul Lin <macpaul.lin@mediatek.com>
References: <20191216090337.4b4cfb42@canb.auug.org.au>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <a2518673-f77f-806c-0bd0-dfb2f6f64da2@gmail.com>
Date:   Mon, 16 Dec 2019 09:49:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191216090337.4b4cfb42@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On 15/12/2019 23:03, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the mediatek tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> drivers/soc/mediatek/mtk-scpsys.c:773:4: error: 'const struct scp_domain_data' has no member named 'subsys_clk_prefix'
>   773 |   .subsys_clk_prefix = "isp",
>       |    ^~~~~~~~~~~~~~~~~
> drivers/soc/mediatek/mtk-scpsys.c:773:24: warning: initialization of 'unsigned int' from 'char *' makes integer from pointer without a cast [-Wint-conversion]
>   773 |   .subsys_clk_prefix = "isp",
>       |                        ^~~~~
> drivers/soc/mediatek/mtk-scpsys.c:773:24: note: (near initialization for 'scp_domain_data_mt6765[3].bus_prot_mask')
> drivers/soc/mediatek/mtk-scpsys.c:774:4: error: 'const struct scp_domain_data' has no member named 'bp_table'
>   774 |   .bp_table = {
>       |    ^~~~~~~~
> drivers/soc/mediatek/mtk-scpsys.c:775:4: error: implicit declaration of function 'BUS_PROT' [-Werror=implicit-function-declaration]
>   775 |    BUS_PROT(IFR_TYPE, 0x2A8, 0x2AC, 0, 0x258,
>       |    ^~~~~~~~
> drivers/soc/mediatek/mtk-scpsys.c:775:13: error: 'IFR_TYPE' undeclared here (not in a function)
>   775 |    BUS_PROT(IFR_TYPE, 0x2A8, 0x2AC, 0, 0x258,
>       |             ^~~~~~~~
> drivers/soc/mediatek/mtk-scpsys.c:777:13: error: 'SMI_TYPE' undeclared here (not in a function)
>   777 |    BUS_PROT(SMI_TYPE, 0x3C4, 0x3C8, 0, 0x3C0,
>       |             ^~~~~~~~
> drivers/soc/mediatek/mtk-scpsys.c:787:4: error: 'const struct scp_domain_data' has no member named 'basic_clk_id'
>   787 |   .basic_clk_id = {"mm"},
>       |    ^~~~~~~~~~~~
> drivers/soc/mediatek/mtk-scpsys.c:787:3: warning: braces around scalar initializer
>   787 |   .basic_clk_id = {"mm"},
>       |   ^
> drivers/soc/mediatek/mtk-scpsys.c:787:3: note: (near initialization for 'scp_domain_data_mt6765[1].bus_prot_mask')
> drivers/soc/mediatek/mtk-scpsys.c:787:20: warning: initialization of 'u32' {aka 'unsigned int'} from 'char *' makes integer from pointer without a cast [-Wint-conversion]
>   787 |   .basic_clk_id = {"mm"},
>       |                    ^~~~
> drivers/soc/mediatek/mtk-scpsys.c:787:20: note: (near initialization for 'scp_domain_data_mt6765[1].bus_prot_mask')
> drivers/soc/mediatek/mtk-scpsys.c:788:4: error: 'const struct scp_domain_data' has no member named 'subsys_clk_prefix'
>   788 |   .subsys_clk_prefix = "mm",
>       |    ^~~~~~~~~~~~~~~~~
> drivers/soc/mediatek/mtk-scpsys.c:788:24: error: cannot initialize array of 'enum clk_id' from a string literal with type array of 'char'
>   788 |   .subsys_clk_prefix = "mm",
>       |                        ^~~~
> drivers/soc/mediatek/mtk-scpsys.c:788:24: note: (near initialization for 'scp_domain_data_mt6765[1].clk_id')
> drivers/soc/mediatek/mtk-scpsys.c:789:4: error: 'const struct scp_domain_data' has no member named 'bp_table'
>   789 |   .bp_table = {
>       |    ^~~~~~~~
> drivers/soc/mediatek/mtk-scpsys.c:789:3: warning: braces around scalar initializer
>   789 |   .bp_table = {
>       |   ^
> drivers/soc/mediatek/mtk-scpsys.c:789:3: note: (near initialization for 'scp_domain_data_mt6765[1].caps')
> drivers/soc/mediatek/mtk-scpsys.c:792:4: warning: excess elements in scalar initializer
>   792 |    BUS_PROT(IFR_TYPE, 0x2A0, 0x2A4, 0, 0x228,
>       |    ^~~~~~~~
> drivers/soc/mediatek/mtk-scpsys.c:792:4: note: (near initialization for 'scp_domain_data_mt6765[1].caps')
> drivers/soc/mediatek/mtk-scpsys.c:794:4: warning: excess elements in scalar initializer
>   794 |    BUS_PROT(IFR_TYPE, 0x2A0, 0x2A4, 0, 0x228,
>       |    ^~~~~~~~
> drivers/soc/mediatek/mtk-scpsys.c:794:4: note: (near initialization for 'scp_domain_data_mt6765[1].caps')
> drivers/soc/mediatek/mtk-scpsys.c:804:4: error: 'const struct scp_domain_data' has no member named 'bp_table'
>   804 |   .bp_table = {
>       |    ^~~~~~~~
> drivers/soc/mediatek/mtk-scpsys.c:804:3: warning: braces around scalar initializer
>   804 |   .bp_table = {
>       |   ^
> drivers/soc/mediatek/mtk-scpsys.c:804:3: note: (near initialization for 'scp_domain_data_mt6765[0].bus_prot_mask')
> drivers/soc/mediatek/mtk-scpsys.c:807:4: warning: excess elements in scalar initializer
>   807 |    BUS_PROT(IFR_TYPE, 0x2A8, 0x2AC, 0, 0x258,
>       |    ^~~~~~~~
> drivers/soc/mediatek/mtk-scpsys.c:807:4: note: (near initialization for 'scp_domain_data_mt6765[0].bus_prot_mask')
> drivers/soc/mediatek/mtk-scpsys.c:809:4: warning: excess elements in scalar initializer
>   809 |    BUS_PROT(IFR_TYPE, 0x2A0, 0x2A4, 0, 0x228,
>       |    ^~~~~~~~
> drivers/soc/mediatek/mtk-scpsys.c:809:4: note: (near initialization for 'scp_domain_data_mt6765[0].bus_prot_mask')
> drivers/soc/mediatek/mtk-scpsys.c:819:4: error: 'const struct scp_domain_data' has no member named 'basic_clk_id'
>   819 |   .basic_clk_id = {"mfg"},
>       |    ^~~~~~~~~~~~
> drivers/soc/mediatek/mtk-scpsys.c:819:3: warning: braces around scalar initializer
>   819 |   .basic_clk_id = {"mfg"},
>       |   ^
> drivers/soc/mediatek/mtk-scpsys.c:819:3: note: (near initialization for 'scp_domain_data_mt6765[2].bus_prot_mask')
> drivers/soc/mediatek/mtk-scpsys.c:819:20: warning: initialization of 'u32' {aka 'unsigned int'} from 'char *' makes integer from pointer without a cast [-Wint-conversion]
>   819 |   .basic_clk_id = {"mfg"},
>       |                    ^~~~~
> drivers/soc/mediatek/mtk-scpsys.c:819:20: note: (near initialization for 'scp_domain_data_mt6765[2].bus_prot_mask')
> drivers/soc/mediatek/mtk-scpsys.c:827:4: error: 'const struct scp_domain_data' has no member named 'bp_table'
>   827 |   .bp_table = {
>       |    ^~~~~~~~
> drivers/soc/mediatek/mtk-scpsys.c:827:3: warning: braces around scalar initializer
>   827 |   .bp_table = {
>       |   ^
> drivers/soc/mediatek/mtk-scpsys.c:827:3: note: (near initialization for 'scp_domain_data_mt6765[4].bus_prot_mask')
> drivers/soc/mediatek/mtk-scpsys.c:830:4: warning: excess elements in scalar initializer
>   830 |    BUS_PROT(IFR_TYPE, 0x2A0, 0x2A4, 0, 0x228,
>       |    ^~~~~~~~
> drivers/soc/mediatek/mtk-scpsys.c:830:4: note: (near initialization for 'scp_domain_data_mt6765[4].bus_prot_mask')
> drivers/soc/mediatek/mtk-scpsys.c:840:4: error: 'const struct scp_domain_data' has no member named 'subsys_clk_prefix'
>   840 |   .subsys_clk_prefix = "cam",
>       |    ^~~~~~~~~~~~~~~~~
> drivers/soc/mediatek/mtk-scpsys.c:840:24: warning: initialization of 'unsigned int' from 'char *' makes integer from pointer without a cast [-Wint-conversion]
>   840 |   .subsys_clk_prefix = "cam",
>       |                        ^~~~~
> drivers/soc/mediatek/mtk-scpsys.c:840:24: note: (near initialization for 'scp_domain_data_mt6765[6].bus_prot_mask')
> drivers/soc/mediatek/mtk-scpsys.c:841:4: error: 'const struct scp_domain_data' has no member named 'bp_table'
>   841 |   .bp_table = {
>       |    ^~~~~~~~
> 
> Caused by commit
> 
>   3742fd77013f ("soc: mediatek: add MT6765 scpsys and subdomain support")
> 
> I have used the mediatek tree from next-20191213 for today.
> 

Thanks for the heads-up. I dropped the patch for now until it's dependencies are
all merged. Sorry for the oversight.

Regards
Matthias
