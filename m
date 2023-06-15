Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E26A731CB9
	for <lists+linux-next@lfdr.de>; Thu, 15 Jun 2023 17:31:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345021AbjFOPbZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Jun 2023 11:31:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345197AbjFOPbM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 15 Jun 2023 11:31:12 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09AE3271E
        for <linux-next@vger.kernel.org>; Thu, 15 Jun 2023 08:30:53 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-30c4c1fd511so7541637f8f.1
        for <linux-next@vger.kernel.org>; Thu, 15 Jun 2023 08:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tessares.net; s=google; t=1686843051; x=1689435051;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SyGMF8+HtCyfqjkf2xIkvXLskCg/yArd1BF3qc60+kw=;
        b=zgv0INE8Z2tpPOlMo7VO2DZ6OVKRxYKr2xH4H3oc41nqbMqPStrL3xPv7tGYXs3rto
         t5NrHtjD2EC4UxnZgJfomD2LZQtaDh7L8Hhmk5woFZD9MNd1x3yI/NQzZcBMlK5hhV62
         3N9dI0I8iuv2U69EAhXo8YYduk1ZfqhEQFscXHOk9o5sLlr1yi9kHJiWDnxQgzNXVdvF
         wBNZe9AMS5v9lPTt2sSIvz4PFOdENKviwVCJb9e4yslTalrE/04WfGrEaPCKwLzbt3c0
         bmvqLjoB9xWhyj9FTmVlHzxj/zK/7SmGQCVWjDNjBmvE2g/uVd6wL/1oyJFnbtFfAiJd
         M5JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686843051; x=1689435051;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SyGMF8+HtCyfqjkf2xIkvXLskCg/yArd1BF3qc60+kw=;
        b=R1OO/gToS+6VJECxrUTy4kDaQmyrqnM+JZg+Ltj0bZjvZsJll2zdxueOE57+/07DuZ
         zamFVVtZmMteXvPSlb7LJThIImLWW1ZM5R0FylLAaJIueZP6wboMUl1L15WypHCZZv8/
         Wz3eu9T56ylC4SfkfY1KsrnUNVCvx17wbnJ/SibX+jtadxg4qDXmbpmzcDGFkeWLv0+x
         EbOsrmMH6zAXKulomPvZ6Fn44aFIJX5k6lXuBoIiXoNUkSXdIEliHRbcYUl760DIpeNu
         h5mG+ym7/l+vWslYi+f6LvkPVu0K1H3+cdV4JbY0zouJIcCXGpHEXLjVi3CF3ITrQbXY
         4/+g==
X-Gm-Message-State: AC+VfDwFkI9XKPMirzO4gRapLvnoVShYv5N+VGnsf0fxjiT882M3p7xQ
        Q3sJgR1/wyQulZbA+9OaXK1W7g==
X-Google-Smtp-Source: ACHHUZ6ISyzehiFWYn6cl4rypJE5rlQnvkY5cKgTooLnDoXIIUL/pXCC6YO6Gubc2pA/v0/wEckMKw==
X-Received: by 2002:a5d:42c7:0:b0:30f:ca58:cb10 with SMTP id t7-20020a5d42c7000000b0030fca58cb10mr7356789wrr.22.1686843051177;
        Thu, 15 Jun 2023 08:30:51 -0700 (PDT)
Received: from [10.124.6.73] ([195.181.172.155])
        by smtp.gmail.com with ESMTPSA id b14-20020a056000054e00b0030c2e3c7fb3sm21102095wrf.101.2023.06.15.08.30.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 08:30:50 -0700 (PDT)
Message-ID: <964937b8-a7a1-71ad-5e12-8d4a854504a1@tessares.net>
Date:   Thu, 15 Jun 2023 17:30:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: linux-next: manual merge of the net-next tree with the net tree
Content-Language: en-GB
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        David Miller <davem@davemloft.net>,
        Networking <netdev@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mat Martineau <martineau@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
References: <20230614111752.74207e28@canb.auug.org.au>
 <c473ffea-49c3-1c9c-b35c-cd3978369d0f@tessares.net>
 <20230614104133.55c93a32@kernel.org>
From:   Matthieu Baerts <matthieu.baerts@tessares.net>
In-Reply-To: <20230614104133.55c93a32@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Jakub,

On 14/06/2023 19:41, Jakub Kicinski wrote:
> On Wed, 14 Jun 2023 10:51:16 +0200 Matthieu Baerts wrote:
>> I added a note about the conflicts on the cover-letter:
>>
>> https://lore.kernel.org/netdev/20230609-upstream-net-20230610-mptcp-selftests-support-old-kernels-part-3-v1-0-2896fe2ee8a3@tessares.net/
>>
>> Maybe it was not a good place? I didn't know where to put it as there
>> were multiple patches that were conflicting with each others even if the
>> major conflicts were between 47867f0a7e83 ("selftests: mptcp: join: skip
>> check if MIB counter not supported") and 0639fa230a21 ("selftests:
>> mptcp: add explicit check for new mibs"). I guess next time I should add
>> a comment referring to the cover-letter in the patches creating conflicts.
> 
> Hm, yeah, I think the cover letter may not be the best way.
> Looks like Stephen didn't use it, anyway, and it confused patchwork.
> No better idea where to put it tho :(
> 
> Maybe a link to a git rerere resolution uploaded somewhere we can wget
> from easily?

Good idea, I didn't think about git rerere! I will try to remember about
that next time :)

Cheers,
Matt
-- 
Tessares | Belgium | Hybrid Access Solutions
www.tessares.net
