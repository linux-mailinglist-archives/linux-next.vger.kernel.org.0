Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B2505313F6
	for <lists+linux-next@lfdr.de>; Mon, 23 May 2022 18:24:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237261AbiEWOdv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 May 2022 10:33:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237237AbiEWOdu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 23 May 2022 10:33:50 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 599AA59B8B
        for <linux-next@vger.kernel.org>; Mon, 23 May 2022 07:33:48 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id br17so13620509lfb.2
        for <linux-next@vger.kernel.org>; Mon, 23 May 2022 07:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=uUMcN1Naz+8bPbUO3zkbfyCIqXOlQxgTqAtcvdgC5g0=;
        b=GLf/114ZqdjOpVRYY/G+WRuiDTzpUgz3BG5RZ8Fn9QfWICFRI9o4EmCKjpnuKOp1f2
         DARMi45DW6HTwEG0HiFlQNu/OT3Fhrs4U7MEZ/P/tJwN+INV9qMuhKj03feQoV99v+sn
         se5khYtPeYER3HQVPRul8yeBtKIW58fxQse8zrJE5r2DhxCF0ZqPrR8eDNwCLpT5BR35
         XgvOeyhY/e5wzAxXCzLuQfVar3IvKMbJeJFX4pP4Yj1D0GO9ur5k5P+Ovt0lNQ71yLpL
         zLBgIlHtwk7XyK6fqmxA3vm+wangurZtocguMiioDj54eAdiR7dzSboW+SIf2V/5gPly
         kXMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=uUMcN1Naz+8bPbUO3zkbfyCIqXOlQxgTqAtcvdgC5g0=;
        b=kiJIZBqS+IDT1YroBdhrSO1MAnRRMq2q8gAHE/nOcg74TygWFFaoYrIpj5McgoABZP
         CTIidSt85yQADEgUs9XGvFR0LkA6dAwyhVeKSFj0c4qt3ZbpYa4gZV1T4z/JEotIHURe
         IV6+L4KLYRHTIJ2IzSFON7uvMJY34xhqVh/7k1jZXepq7fO+bzUQm1AUDJG7n+AOqgnn
         oEsJHwz/K0DndijRwEVWLoPs2zkoxBtBsh+q/E9DIwYZ1qNUm6UqZSf/WMhH1UQUt6Kd
         IpZs0PCsIgbBj92Zi3h0lytvpTDoxDzjoZOIilD2pWJHHIbjNBCBWamQuA0fhGVGqrcY
         gogQ==
X-Gm-Message-State: AOAM530TqgY3cII3Ef+MXSk1u539oEJuczdAL2wPOwm8BdGolXyhxo2k
        CjoMz1laU1GTVvgJFuqMk7fxUQ==
X-Google-Smtp-Source: ABdhPJyp+IMxGBLJlhaj+1AEgvLPT68Y7g/Y7re6YfIt9wPVrgW10diIx+A5l0ZeGr5OftK9CXj57A==
X-Received: by 2002:a05:6512:b96:b0:478:5d7b:2e21 with SMTP id b22-20020a0565120b9600b004785d7b2e21mr8631733lfv.305.1653316426651;
        Mon, 23 May 2022 07:33:46 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u26-20020ac248ba000000b0047255d21188sm2003834lfg.183.2022.05.23.07.33.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 May 2022 07:33:46 -0700 (PDT)
Message-ID: <4d5c0dee-b32a-158c-e243-de2c4af7e103@linaro.org>
Date:   Mon, 23 May 2022 16:33:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: linux-next: manual merge of the mailbox tree with the devicetree
 tree
Content-Language: en-US
To:     Jassi Brar <jaswinder.singh@linaro.org>,
        Rob Herring <robherring2@gmail.com>
Cc:     David Heidelberg <david@ixit.cz>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Rob Herring <robh@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
References: <20220523140525.4ad591d0@canb.auug.org.au>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220523140525.4ad591d0@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 23/05/2022 06:05, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the mailbox tree got a conflict in:
> 
>   Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> 
> between commit:
> 
>   b20eee62ee89 ("dt-bindings: mailbox: qcom-ipcc: add missing properties into example")

This commit should be rather dropped, because it duplicated my work
which entirely removed the example.

Rob,
Can you drop that commit from your tree?


Best regards,
Krzysztof
