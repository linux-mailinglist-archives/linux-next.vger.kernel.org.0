Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8277D6807D4
	for <lists+linux-next@lfdr.de>; Mon, 30 Jan 2023 09:49:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235407AbjA3ItW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Jan 2023 03:49:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236153AbjA3ItO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 30 Jan 2023 03:49:14 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B0DC15C9B
        for <linux-next@vger.kernel.org>; Mon, 30 Jan 2023 00:48:56 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id l8so7425822wms.3
        for <linux-next@vger.kernel.org>; Mon, 30 Jan 2023 00:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=02QtUO4oofOwk3xQjSzcxt8vCLywP7Mf8DVOkUe+3zM=;
        b=EHolVUkViuMX3r87BuwnA/G94xiPM2uDz4CPF8MvsFtmCcUTGF68w4PGaYsqqGHlu5
         XtnWNF92djC/Cwqm7Xoi1xURDHwQQl5c8HFkcVD56hFcXxrZHx3A/K+FD2eSRAyTOYox
         Nz2y/p5TDEorV09Dh60DWbPSIhWG03vOycX2uM9WLbPNA734PwesnkrJ5G2r6q19zMO7
         7nhmFvKaYLdbLAeG8hJzHQN4SFvVBWMMJLBJ/pvcjIspCFOL3i/3/YD8TznqD6+7JD74
         UZ5u+aYqhX0SztGegSHO+f1grY7OmsyB+NFw21cMk2QdJQzdkDVhBH2AblbSLzVYvVRY
         GjAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=02QtUO4oofOwk3xQjSzcxt8vCLywP7Mf8DVOkUe+3zM=;
        b=wQWDhU4Aq3aqDaBRMUfWl4fyESH1IoVrkFGTt4onPT+TvmXt/IkazSkv/2jNnqI5SX
         5OxvLSikFeXQxoGgaCTSaIGPjzt7P/5uFv81t0Og42DeDuutTGEix6LUYWvKaXhPdCam
         gtUSG8q6taeRKhkDqQk9KiOcuAQNRjf6Xm4rB7Ff3h5ZmncWiCx3gGQsVSKqXS73J212
         iJHTY34s3HkCqdfzfKHigO/CoVGupXDJjwfsN/fzezL1GIrGyUtvJm+aMHVQdpIxJwDG
         h10QgiP4j5gBtLwWp3BvezSYLupCLiOS13U8wEXlJ8++SG3S70flXTGi/khj8Zzzwg1q
         Z5lQ==
X-Gm-Message-State: AFqh2kpvTZIj4OpP3abB41fi6YMFW7MQe8BHGF544lYbFsy3mAhJIrlK
        4h50UB8heMFs8BW5J79be7boPw==
X-Google-Smtp-Source: AMrXdXvCsRYlHMaxECbV6c31CcKaBk7FzHpWPiGzwtHcQ2bVD3v0qqrwErm1M9nPtBdRX9jDUKUpXQ==
X-Received: by 2002:a1c:ed1a:0:b0:3da:c07:c5fe with SMTP id l26-20020a1ced1a000000b003da0c07c5femr45773289wmh.5.1675068528077;
        Mon, 30 Jan 2023 00:48:48 -0800 (PST)
Received: from [192.168.7.111] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id j5-20020a05600c1c0500b003dc4aae4739sm8207188wms.27.2023.01.30.00.48.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 00:48:47 -0800 (PST)
Message-ID: <211d54bc-6e68-c9ee-b62b-ca974f84e738@linaro.org>
Date:   Mon, 30 Jan 2023 09:48:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: linux-next: Signed-off-by missing for commit in the amlogic tree
Content-Language: en-US
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Kevin Hilman <khilman@baylibre.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20230130085958.4ada9cd9@canb.auug.org.au>
Organization: Linaro Developer Services
In-Reply-To: <20230130085958.4ada9cd9@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 29/01/2023 22:59, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>    43b0fcdef2e3 ("TEST: arm64: dts: amlogic: Make mmc host controller interrupts level-sensitive")
> 
> is missing a Signed-off-by from its committer.
> 

Thanks for the notification, will fix this.

Thanks.
Neil
