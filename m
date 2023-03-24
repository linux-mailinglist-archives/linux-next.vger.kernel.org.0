Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 811356C7BA9
	for <lists+linux-next@lfdr.de>; Fri, 24 Mar 2023 10:39:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231460AbjCXJj5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 24 Mar 2023 05:39:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231984AbjCXJjl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 24 Mar 2023 05:39:41 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF75710AA3
        for <linux-next@vger.kernel.org>; Fri, 24 Mar 2023 02:39:06 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id j18-20020a05600c1c1200b003ee5157346cso2749283wms.1
        for <linux-next@vger.kernel.org>; Fri, 24 Mar 2023 02:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679650742;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gTdGQunWMWAfTUpFFAww9Qpt8A+r87Pjbc2J9+4OTOA=;
        b=hSDKQ2YToikfwZbtN6FjBmFWULn3whB1TOlMW3mpHFeerY7SQdrNxt8vCM2rlCvorb
         ri3Xpq7ROqEovFWHZBx0AF89N4BzH+bk3pFd9dteDq5Yxhd2rzr6gcXocJ7UzeWLjxoA
         yDsFIkCpUuOPw/wrBpYm5QKZYS0DvSNPw0692v0i3YvxS2XaqRxILrTKIgnqOW2E0+M3
         oCtWh0LK6BHBFf+zq6kgGkP8ZTBLCqbH9ZqCyQUTkOGld83qsikWL+GikEOTJc22Ehia
         Lod93UUyNmu9dXo1NPyBcAD20BB6VfH0f7gYINeDAb8zN7ac3uRS3Cy3Ky0lxKfIuk9v
         Goew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679650742;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gTdGQunWMWAfTUpFFAww9Qpt8A+r87Pjbc2J9+4OTOA=;
        b=vheEZadrib/Xg6aXQSyt9ftzjeW+Wm318MBST/+2Lnd/dZTcRyD9nxkhWVTLOVR6d+
         YI8ALPVpodbVBLQwIk4FsuSu2lejtNm5JXtz/XfsqIQKRg2Gh9p0gfbg3bcBHpu5JbXP
         HUXDgfWm0EbfwXr2xx4Cii9WZV9yUuPQMVTo5dZM6A4AayJ99ADf9mu54s4+DUBl2Em8
         qBj8SUvlaKCWVUBmh4iSZrOhFbeJegXzJTDTSP1bpT0SNfIxAgEtLoZdq0nviw41fJwK
         3dQ1dANUzquS2rbDWKk9jMScK/F2nquxhOQpp6FNaLjfhZUaIjr27/DU19ynIwP0hVjG
         B/OQ==
X-Gm-Message-State: AO0yUKUVBydBL17CWUrZTDZ+gMs4DuxCxOHhZkEHOSCSBywArPmqZyQh
        vPq6EUEZXXVaRfcb9veCDT0atg==
X-Google-Smtp-Source: AK7set+upZpG1ZiUCKzXqgCY8G5QLN4QgUzePy4YhiOQU7hbZWyyDXfp3QoWshtEYdx7l5k9e6RlDg==
X-Received: by 2002:a05:600c:2182:b0:3ee:3b7b:73c1 with SMTP id e2-20020a05600c218200b003ee3b7b73c1mr1858487wme.28.1679650742591;
        Fri, 24 Mar 2023 02:39:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:213f:a579:70af:e4a0? ([2a01:e0a:982:cbb0:213f:a579:70af:e4a0])
        by smtp.gmail.com with ESMTPSA id n20-20020a7bc5d4000000b003ee10fb56ebsm4392055wmk.9.2023.03.24.02.39.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Mar 2023 02:39:02 -0700 (PDT)
Message-ID: <08d4e24d-86c4-5bbd-8d8d-dc115d1b4518@linaro.org>
Date:   Fri, 24 Mar 2023 10:39:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: linux-next: build warnings after merge of the qcom tree
Content-Language: en-US
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andy Gross <agross@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20230324154929.32d232c4@canb.auug.org.au>
Organization: Linaro Developer Services
In-Reply-To: <20230324154929.32d232c4@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

On 24/03/2023 05:49, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the qcom tree, today's linux-next build (arm64 defconfig)
> produced these warnings:
> 
> arch/arm64/configs/defconfig:989:warning: override: reassigning to symbol TYPEC_UCSI
> arch/arm64/configs/defconfig:1232:warning: override: reassigning to symbol QCOM_PMIC_GLINK
> 
> Introduced by commit
> 
>    4ffd0b001956 ("arm64: defconfig: add PMIC GLINK modules")
> 

A fix was sent at https://lore.kernel.org/all/20230324-topic-sm8450-upstream-defconfig-fixup-v1-1-2d75cc9b3c3d@linaro.org/

Sorry for the noise,

Neil
