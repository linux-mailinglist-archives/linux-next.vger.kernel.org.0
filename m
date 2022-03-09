Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 079E54D2BA1
	for <lists+linux-next@lfdr.de>; Wed,  9 Mar 2022 10:18:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231472AbiCIJTx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Mar 2022 04:19:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230248AbiCIJTw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Mar 2022 04:19:52 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 924623299F
        for <linux-next@vger.kernel.org>; Wed,  9 Mar 2022 01:18:54 -0800 (PST)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 680CC3F4C2
        for <linux-next@vger.kernel.org>; Wed,  9 Mar 2022 09:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646817533;
        bh=8BjTP/+1yUB9Aiej+vTJ+iAQ4nFO9laQpO6aipSI9Uo=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=mmaQZV1R9nHyKXKVjvd7HBHUGO8/qsu3d7DgPEIHv5zxOnqHF7I5U9dKxZ8hsynV0
         2cBInbF4L5CcxzO3Ad+hR9zPnggQ96qdND5Y/q8rVPduw26vXOG/Oy0ba7ioHN4bJy
         nBp9shWy3rf68VtM71rFSsFr6HR7XBVH+vTfLIJ+Adzhs5PqolY/6yDCA5sFtwFcxb
         mDLUwvQ8np7ylp+fbXNLd1TpypMpfV1nWNZn5KGzDRoM1C0fq1EXHg/f7q7e/YQnEP
         hlFhpphKbpet88uGBLRyNyq6i8xh//LhVZqVXuVvjM0A18jzklwD9xPBtzq/fQkfVI
         jtKz+cFWZAFdA==
Received: by mail-ed1-f72.google.com with SMTP id cm27-20020a0564020c9b00b004137effc24bso952462edb.10
        for <linux-next@vger.kernel.org>; Wed, 09 Mar 2022 01:18:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8BjTP/+1yUB9Aiej+vTJ+iAQ4nFO9laQpO6aipSI9Uo=;
        b=KIf6B+aoNFmu2Im/lRxNaNLSmLfEQDfGd/EtkevNpoq0KaOlRfZQAvZABOp6wGjP2x
         IeN6czNsiSWMR8bcRIi4WmoPQqOoaCdH+NigQLQ/U0enOSslcKWTB05PT3n4WLeJa9ZJ
         ZvveZFUOCLcclKUK5EUVuNCQAkFyX61FZT3MPgLkA3z8IXhETRUkUjgTyJcIF+EfAHo3
         A7UJC10PCx8OesLpWDj/If2hQGdmD0JXXWLIGZb50wCAo/UP7WoxZrX8FZau5id8LHfj
         dnbEzdo/IE6Xt8C8bNC+lCm5l8uhJUpVyehpOGGL+5mHcyX0LBP76oAD34h5lxk/jdZT
         V02A==
X-Gm-Message-State: AOAM530126MYG/JffIhzmsiNJz01ql7VKR+kTLzSs2cutiMS1A7ahL1M
        0YuzqhjqqnOI4PxtpEjuIDnDlRspozctV07hMQZRohuVQKfNI6ZCCSnwhnKmomvFPYgQY5mMrRa
        x8oQ9RI1pFhpb9XdOHQhcs+e/yECbDt6dOOX/aGo=
X-Received: by 2002:a05:6402:42c6:b0:415:fe7d:4963 with SMTP id i6-20020a05640242c600b00415fe7d4963mr20366877edc.317.1646817533106;
        Wed, 09 Mar 2022 01:18:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwKBgYsIlQkmTPZZedYYFZfkqd0y8tOMc44J8WrRfvbA7BIK5mWKSKmpE5UARw9e0KjYHAZ0w==
X-Received: by 2002:a05:6402:42c6:b0:415:fe7d:4963 with SMTP id i6-20020a05640242c600b00415fe7d4963mr20366870edc.317.1646817532959;
        Wed, 09 Mar 2022 01:18:52 -0800 (PST)
Received: from [192.168.0.144] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id m1-20020a056402430100b004167e4606a8sm541596edc.74.2022.03.09.01.18.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Mar 2022 01:18:52 -0800 (PST)
Message-ID: <a177b16a-c55e-8338-f34f-c7b9edcd94c0@canonical.com>
Date:   Wed, 9 Mar 2022 10:18:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: linux-next: manual merge of the mfd tree with the arm-soc tree
Content-Language: en-US
To:     Lee Jones <lee.jones@linaro.org>, Olof Johansson <olof@lixom.net>,
        Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
References: <20220309132952.525b3aa4@canb.auug.org.au>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220309132952.525b3aa4@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


On 09/03/2022 03:29, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the mfd tree got a conflict in:
> 
>   Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> 
> between commit:
> 
>   e465ea5cc05d ("dt-bindings: soc: samsung: usi: refer to dtschema for children")
> 
> from the arm-soc tree and commit:
> 
>   0ff4827ed66f ("spi: dt-bindings: samsung: Convert to dtschema")
> 
> from the mfd tree.
> 
> I fixed it up (I just used the former version) and can carry the fix as
> necessary. 

Hi Arnd, Lee and Olof,

This conflict will pop-up when sending to Linus. I propose to resolve it
slightly different - just remove the conflicting lines. After merge
window I will properly reference the other schema inside properties (not
description). This can look like:
################
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml

+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml

@@ -17,13 +17,6 @@ description: |

   child nodes, each representing a serial sub-node device. The mode setting

   selects which particular function will be used.

 

-  Refer to next bindings documentation for information on protocol subnodes that

-  can exist under USI node:

-

-  [1] Documentation/devicetree/bindings/serial/samsung_uart.yaml

-  [2] Documentation/devicetree/bindings/i2c/i2c-exynos5.txt

-  [3] Documentation/devicetree/bindings/spi/samsung,spi.yaml

-

 properties:

   $nodename:

     pattern: "^usi@[0-9a-f]+$"

################

Best regards,
Krzysztof
