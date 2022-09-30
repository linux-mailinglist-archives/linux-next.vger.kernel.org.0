Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DDFC5F0FEF
	for <lists+linux-next@lfdr.de>; Fri, 30 Sep 2022 18:28:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232103AbiI3Q2W (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 30 Sep 2022 12:28:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231799AbiI3Q2P (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 30 Sep 2022 12:28:15 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2954B15D99B
        for <linux-next@vger.kernel.org>; Fri, 30 Sep 2022 09:28:14 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id bs18so3760428ljb.1
        for <linux-next@vger.kernel.org>; Fri, 30 Sep 2022 09:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=N9stoL3Z4xv/2HiFGwv9P1b77a1ZbeVeGDhCsOfRE9Y=;
        b=LWgWLTY6nJES8ep4CqsjtiHuM8TU8Oe8vxiKqtllp0XMdbckMAw0Ga7+/ebIt++l+0
         1JPyhSF+rD/yHxLg6i8MGLXOobhQjo5E6eq/NIsdGK291GrNRg2VlcLfc5ArSSYr0jEu
         koN8Tddl45RwUapmwGC+Rlg/Yd4oCZPcAf1gr6jxqvs0MHrRkDq4+YjLR4LwQiZ5rFm6
         69cxpGhLTF5aqNuHOEQj3jyRTRDj922lrbasPfAwkTW2FwvnjAMbxt+8WG6DC9pneGMH
         YlzwT6j1/FxdjElh/g/qeLAbI5UQkbzqncBo/NG9f0lpLBkWIcoBrNBhYvmeH8gaqkbv
         DK9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=N9stoL3Z4xv/2HiFGwv9P1b77a1ZbeVeGDhCsOfRE9Y=;
        b=ClOivhLV4FhPo0e98EpsmRpJBUjEUWBHyzoKK/WX6G6bh43hUl+P7mUI5gT/sbdqHA
         nZOnMhRzPhQ4nUpPAaHoWCPVNaDTRCHqzVPDZtFBlzis5Cj83e8dHKhU0BtPRJLZuT5Q
         xhI3FFtfu3AOA2jf53EYRlqNnVCVp0pCug45mKRNFucQ6cvTkfiVwArH1Px/x/2x+vYz
         rf0f2h4LE7bKBeIWyYsru6rBWJtfx0ZvqwVjP+kbANdU15IPG4nV95gBUnj5lHfhRoUM
         j+0fzLoqFw9GIRyy3kATedT6zF7nzLD2R2Yer+a2oHKLNtjPR/8UUVwgO7ad2cQuuUgf
         LKwg==
X-Gm-Message-State: ACrzQf0cyMQRAlI7gueZ87EnBbmIESCIrkLEcMe6fxV6aNpdNsMLxGY+
        uK9yrFzM/+DeHtc/jqLsCcdVX6qBGfZotA==
X-Google-Smtp-Source: AMsMyM7YF7JcFCSG7nRPBiGZtKAPOYdh4i8Zsci9QOiXvjHrtJrV5Zc+iYQc4EXnuPpqkKisPo98ag==
X-Received: by 2002:a2e:9202:0:b0:26b:df14:cd with SMTP id k2-20020a2e9202000000b0026bdf1400cdmr3050555ljg.212.1664555292418;
        Fri, 30 Sep 2022 09:28:12 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id k21-20020a05651210d500b00498ebd60c35sm337724lfg.165.2022.09.30.09.28.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Sep 2022 09:28:12 -0700 (PDT)
Message-ID: <ef71ab54-d337-1c4c-9b90-ca39b1c1ed17@linaro.org>
Date:   Fri, 30 Sep 2022 18:28:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: linux-next: manual merge of the mfd tree with the qcom tree
To:     Lee Jones <lee@kernel.org>
Cc:     broonie@kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20220930115816.128513-1-broonie@kernel.org>
 <1e9a21a3-d6c3-3f76-18dc-ff14e8609846@linaro.org>
 <Yzbk/6SQdpNQTahV@google.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Yzbk/6SQdpNQTahV@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 30/09/2022 14:45, Lee Jones wrote:
> On Fri, 30 Sep 2022, Krzysztof Kozlowski wrote:
> 
>> On 30/09/2022 13:58, broonie@kernel.org wrote:
>>> Hi all,
>>>
>>> Today's linux-next merge of the mfd tree got a conflict in:
>>>
>>>   Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
>>>
>>
>> Thanks Mark.
>>
>>> between commit:
>>>
>>>   4f2e28b2cc2e0 ("dt-bindings: mfd: qcom,tcsr: add several devices")
>>
>> It seems this commit was picked by both Bjorn/qcom and Lee/MFD.
>>
>>>
>>> from the qcom tree and commits:
>>>
>>>   f8c1940165bea ("dt-bindings: mfd: qcom,tcsr: Add several devices")
>>>   a328ae8504dbc ("dt-bindings: mfd: qcom,tcsr: Drop simple-mfd from IPQ6018")
>>
>> This commit depends on the duplicated one (on "Add several devices"), so
>> I think all set can stay in MFD and instead Bjorn could drop his copy of
>> the commit.
> 
> Not sure why Bjorn is picking up MFD patches?
> 
> Was this a mistake Bjorn?


This was a part of big set MFD + ARM64 dts, so I guess it just slipped in:

https://lore.kernel.org/all/20220819083209.50844-1-krzysztof.kozlowski@linaro.org/

Best regards,
Krzysztof

