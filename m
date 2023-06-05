Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6491F72339E
	for <lists+linux-next@lfdr.de>; Tue,  6 Jun 2023 01:21:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231817AbjFEXVZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 5 Jun 2023 19:21:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbjFEXVY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 5 Jun 2023 19:21:24 -0400
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76DC2EA
        for <linux-next@vger.kernel.org>; Mon,  5 Jun 2023 16:21:23 -0700 (PDT)
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-760dff4b701so33240439f.0
        for <linux-next@vger.kernel.org>; Mon, 05 Jun 2023 16:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1686007283; x=1688599283;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ns90En3R1m3gcQd2QfTPzP8O2oKizg1bDEC4L7QPGmc=;
        b=h87lzPx+eobEm2lDs1rAZBjzsC4XnnsXBGy8ZeOR4ZgrP10Ya3u1wJlyQuerRuI6/y
         pyUVigyxguSkbCmUzoniSDixdXIc46NDFV0gfyUj0f+imlCkhwtYPBNFV9SlGagIPJIS
         DvlDiGd+lx1LGf5us1Aj8oidZvxyGXvVfziss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686007283; x=1688599283;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ns90En3R1m3gcQd2QfTPzP8O2oKizg1bDEC4L7QPGmc=;
        b=WB8lHby/Cb2lmrds//lUAO9dz6Ab0QNE9aAwG2T6qjljMyGpcgYT64VJqhXTS1vIS9
         +HdAFEBKxMJIGZ/3JaZ4Hj4Ou+kDFqN0RJ56klpe40vCNVMjyYXN8n9E7QNCJ5iJG/E7
         BYitWS4ha8oMg93pK/vXKJ8vJ6sfvjkohgdk3CkNnTE7s5Rhqfaf12UbVF8fn48d3FZB
         Un8M3KhbXPsevfRCE39x9efnJDy2ZZwvp7KWqEool7izJnijcBQrEa8GqpbVdD+mo1wo
         H+MVMCGJh2lmwuYHj1UdX16OANGozuk+JCNVTspPVXbdp+gAy3barJa4mfCz2u+BnBcy
         1+og==
X-Gm-Message-State: AC+VfDwj7F+D34cnqOFSJtTdqFug9fZnCJS50QhnujzdjZyBq8ZMBQkW
        GrkcBRMr2y0LzMPtvM90YrShhQ==
X-Google-Smtp-Source: ACHHUZ42F9PJUfuW6xvzNSCBwzV9l33tzKp1JyZjBWXTjiGTfIbPD++dBqvQNsSiqZom+FQC2g3UsA==
X-Received: by 2002:a05:6602:370a:b0:777:a94d:a362 with SMTP id bh10-20020a056602370a00b00777a94da362mr523088iob.2.1686007282800;
        Mon, 05 Jun 2023 16:21:22 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id v6-20020a02cba6000000b0041f5f4c5f95sm850768jap.164.2023.06.05.16.21.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 16:21:22 -0700 (PDT)
Message-ID: <dceb9437-096d-850e-77c0-5a2bf0b9ff57@linuxfoundation.org>
Date:   Mon, 5 Jun 2023 17:21:21 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: linux-next: duplicate patch in the kselftest tree
Content-Language: en-US
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Shuah Khan <shuah@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20230606090216.731ca640@canb.auug.org.au>
From:   Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20230606090216.731ca640@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 6/5/23 17:02, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in Linus Torvalds' tree as a different commit
> (but the same patch):
> 
>    54f389ba0efb ("tracing/selftests: Update synthetic event selftest to use common_stacktrace")
> 
> This is commit
> 
>    f1aab363438c ("tracing/selftests: Update synthetic event selftest to use common_stacktrace")
> 
> in Linus' tree.
> 

Thanks - I will drop this one.

thanks,
-- Shuah
