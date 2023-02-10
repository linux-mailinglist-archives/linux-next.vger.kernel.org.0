Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E49316919F9
	for <lists+linux-next@lfdr.de>; Fri, 10 Feb 2023 09:28:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231285AbjBJI2M (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 10 Feb 2023 03:28:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231139AbjBJI2M (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 10 Feb 2023 03:28:12 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A16C237B4D
        for <linux-next@vger.kernel.org>; Fri, 10 Feb 2023 00:28:10 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id n28-20020a05600c3b9c00b003ddca7a2bcbso3457829wms.3
        for <linux-next@vger.kernel.org>; Fri, 10 Feb 2023 00:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mc1lkI8HVLi1LD6fbpOfNak43HgV1Nz79fRpnYmjeD0=;
        b=E6SCG+WWdS6zBkPn+zTdoAbK9Y0+ytPGh//lNmg0weGIOYh5wDBDUM+8QToWSsqZ7t
         Mgefqf146/yv2z/Uv1LRhU70vD0ipCjK3mogdz1E1fReOG95ZyoI43LFwNiHeuWhg2Eg
         1fA6sLaqDxdEurv3Aoodqaaxx0ZlJ6XkZIwN57daaNvPvuRTvDkEqC6XMntHDLiuZoGl
         cTfBoSy8UdZsKt+Ug/ky834Afgj0WXUWuV0KBD1rgN4T9TFEfc2hzxIa2Cr5jAvzXbUT
         jDQG/Lujvyz+3SkKuZRT2QxSJcAs0Ak/kEi2DKExzhRtOfUsvo1PQShPbTSTZHKRHZac
         p+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mc1lkI8HVLi1LD6fbpOfNak43HgV1Nz79fRpnYmjeD0=;
        b=SNMHdEMT63o8kabYjz0iAWjixPaweFKXyaR7aFy5YYZTJQF1T6B8XXvSKb/1HYmPIO
         S2AsEHYRcRjTCrXMN/MJcf4vc5m6bbRBscvD4FZ7zcddCFBMAdc6ceeprTB/bUdSTqVJ
         2tQ/BoN8c20gmbuvq17vD6UqT5iYGhJ+Femifz6wRkJYYgKS2adv1xBvdmhTHwTrEHfY
         FQOzsKDdxl/q1uxFymGCZDGkabBNwoAaar0Jsg2XAoqm9ur1jYBWmHa5od+dPxo3TMvA
         dXpq3PD8MiT5+UyKmKA1baV4JgBk33MWBbdwTEGMo0pk16yTgIQgneNV4Zd5niIOp7Gk
         A5Tg==
X-Gm-Message-State: AO0yUKWqzbP6DY7pP/ZCAG3df36/SjNBxhdkQl9/hRNY3V+8+xNzk0He
        cc1UcLz7WlOy5ow2oRevzkFcNg==
X-Google-Smtp-Source: AK7set/7rmvsHBlRj8cE7uBwpObaXiGVUoW8C+5xfpQ+oakwcxEhgznskVXQTVxNZRqk6jDlg5FDKQ==
X-Received: by 2002:a05:600c:807:b0:3e0:47:66cc with SMTP id k7-20020a05600c080700b003e0004766ccmr12364416wmp.23.1676017689224;
        Fri, 10 Feb 2023 00:28:09 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id p21-20020a05600c359500b003db06224953sm4610349wmq.41.2023.02.10.00.28.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 00:28:08 -0800 (PST)
Message-ID: <52c60c59-7582-7132-f9e1-c54070d96996@linaro.org>
Date:   Fri, 10 Feb 2023 09:28:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: linux-next: duplicate patch in the drivers-memory tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Cong Dang <cong.dang.xn@renesas.com>,
        Hai Pham <hai.pham.ud@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20230210111401.7b22765c@canb.auug.org.au>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230210111401.7b22765c@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/02/2023 01:14, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in the arm-soc tree as a different commit
> (but the same patch):
> 
>   cb1ed99d9520 ("memory: renesas-rpc-if: Remove redundant division of dummy")
> 
> This is commit
> 
>   637581ce6040 ("memory: renesas-rpc-if: Remove redundant division of dummy")
> 

Thanks, that's expected. I'll drop the commit for next next.

Best regards,
Krzysztof

