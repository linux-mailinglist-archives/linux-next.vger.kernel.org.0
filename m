Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE3C06940E0
	for <lists+linux-next@lfdr.de>; Mon, 13 Feb 2023 10:24:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229532AbjBMJY1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Feb 2023 04:24:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbjBMJY0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 13 Feb 2023 04:24:26 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8408355B6
        for <linux-next@vger.kernel.org>; Mon, 13 Feb 2023 01:24:24 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id ml19so30357923ejb.0
        for <linux-next@vger.kernel.org>; Mon, 13 Feb 2023 01:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tessares.net; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N4PTsgVXZVP9nPVr6Vq5IA+KQTGdiE1kOiYXYTx8kgQ=;
        b=T29GxM9lM5ftYpyalPScu4QYm879cGz2cRTeeYiYxhXQwGfYax0Hoa892evr9OkoCC
         p8g122W9RmEPD1ssNGUpyf0g+3RCmQY6MqWLqeTkrJbeIgc6eZF+lRvLx6MKf0WPIJn3
         pZCODO6u0CMBElrFT14crRyACA/i9szYbPOluUZOUSkcjW0UIai1LcKy7L4sORHUKHre
         KiekoO3d3zUs0x8mOTXAKLg+s3vRTGDFU6TsYmqD1/egvvyS0MV1O8xy8jra44HcsNOx
         vtYegKfKsGocxDm98sc3s7JmyzSclupHYwOMMCfj02rld8tuEzwGg9HsavLn+RjYu4/8
         T90w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N4PTsgVXZVP9nPVr6Vq5IA+KQTGdiE1kOiYXYTx8kgQ=;
        b=RDgAOv7YXHY5X+O3QFublA2gVWsGCY2RPfwsGbKT4KxVAyCk3xD7Ir9aV1pD90bNeU
         yqI5nDDGLXnrFh0aFChNrMEUCfohHi3tBOcaCXibtQAA4ZK3mT+r4zrNPMXTo/ZEciOj
         Ny28g2nsZCCVuCEaoEY1eptejdi1upYksEYAcZfmpxSyU29aGt+9OBAV3J/pTjlNjhjS
         ne1TPiqMOi3NlLyQKmxjfFvb9tPk2BlQxVl6HFYSCsM8gihgvKb3hSOqIPydgSwA9UAv
         BkQjZZ26cXThT3GvPAch5SwoSllMD7RJ6LSKwrUQ+pFzNUe3khsUNgiDK0OMcP9k7I7a
         tjzg==
X-Gm-Message-State: AO0yUKXPQ463Wk4CjdyAfHUi/MyT7kq27PJDx8b+WOaKe3kl9ZLj84nb
        1yErpzM3vhBF3y6MWlWgZGdonQ==
X-Google-Smtp-Source: AK7set8PyLO+iZY8MOuOmsmlqMFDI1htp9LHNWIrkbAoeODjk2Ogg8N5+kYcowOV/dSzKKQd70z3NQ==
X-Received: by 2002:a17:906:ca04:b0:880:e6d0:5794 with SMTP id jt4-20020a170906ca0400b00880e6d05794mr22033397ejb.58.1676280263074;
        Mon, 13 Feb 2023 01:24:23 -0800 (PST)
Received: from [10.44.2.5] ([81.246.10.41])
        by smtp.gmail.com with ESMTPSA id r20-20020a170906705400b0087bd4e34eb8sm6476147ejj.203.2023.02.13.01.24.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 01:24:22 -0800 (PST)
Message-ID: <e9bd4de4-5edb-b12a-9f80-e3e0b34d4731@tessares.net>
Date:   Mon, 13 Feb 2023 10:24:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: linux-next: manual merge of the net-next tree with the net tree
Content-Language: en-GB
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        David Miller <davem@davemloft.net>,
        Networking <netdev@vger.kernel.org>
Cc:     Daniel Borkmann <daniel@iogearbox.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Larysa Zaremba <larysa.zaremba@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Maciej Fijalkowski <maciej.fijalkowski@intel.com>
References: <20230213102038.54cc9060@canb.auug.org.au>
From:   Matthieu Baerts <matthieu.baerts@tessares.net>
In-Reply-To: <20230213102038.54cc9060@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On 13/02/2023 00:20, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the net-next tree got a conflict in:
> 
>   drivers/net/ethernet/intel/ice/ice_xsk.c
> 
> between commit:
> 
>   1f090494170e ("ice: xsk: Fix cleaning of XDP_TX frames")
> 
> from the net tree and commit:
> 
>   a24b4c6e9aab ("ice: xsk: Do not convert to buff to frame for XDP_TX")
> 
> from the net-next tree.

Thank you for having shared this patch! We had the same conflict on our
side:

Tested-by: Matthieu Baerts <matthieu.baerts@tessares.net>

Cheers,
Matt
-- 
Tessares | Belgium | Hybrid Access Solutions
www.tessares.net
