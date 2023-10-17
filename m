Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FACC7CBA4F
	for <lists+linux-next@lfdr.de>; Tue, 17 Oct 2023 07:45:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230343AbjJQFpj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Oct 2023 01:45:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234555AbjJQFpf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Oct 2023 01:45:35 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32E9B125
        for <linux-next@vger.kernel.org>; Mon, 16 Oct 2023 22:45:24 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-31fa15f4cc6so4724720f8f.2
        for <linux-next@vger.kernel.org>; Mon, 16 Oct 2023 22:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697521521; x=1698126321; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eTPon32JpfuzRNvtltenUlD8VwAiIQ3b0g3UQ/8lPys=;
        b=f1fx4pZYdENQElgLBsTKZ1HEubIu1kxKFKWaZ+Hzsf8Ko5j5Mp4FGlz9dg9Tz3r11/
         IwTsL57pc8CEQQrl+m3i7Q3lsjxotIdKWkf0WroOQVJaaZ2tFcHnI0wbVUuv9Toparzr
         Dsib1qXyTUj5SK3caxmHg6MnpTp8NXwa2V9uejns98t4f+Bw5RwjL6PbAHUwQ26NBQA8
         SX1VrRyAUNP8yiCtQ1oaoF9yLQZhS+6IM+Ei9TgdSEMXjgMdK0ewZwOrq2yQnmmzic6s
         aR7Zqd5kecvkwcrGNoWtMEINDcV/wIeK2sT91+zlldnhlcUxmurPGdE+XfFIf9KFboTI
         oSRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697521521; x=1698126321;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eTPon32JpfuzRNvtltenUlD8VwAiIQ3b0g3UQ/8lPys=;
        b=v6HwJ7t5sy1kq2E8v25q7CRA+FRH48cK++U+i5oMfjY6VGTCv3rLihUj/m+Fn9jh9s
         oJkb/f3f+SfQ9Qe7LE2bvh+Yhx2NG7KDOxvzOgnEF2rPyazcAEbXWqREYU0bFFZLyFAF
         +i5Abb7WDagjan1TqWjzewYM5x70EpFW3tIXVciWuZ8RhHt5uQQNPiSFEWOuOW4Af40A
         rDLj4CHRmIOCdv7zwPN2/BkdGGBoBU0RSfR5G/CTWzEXd6p2p2QsdYbtYWlE+kresrZ1
         /Nw5dcse/accRcIVve4cnoqi0EeZaFi63DCJ376A23UABLJQSTa8JUWz9jHd5Zqdm+Jc
         P2jQ==
X-Gm-Message-State: AOJu0YwC+uCUk9YsoHmEwnmSdtDkvyGqckbdzF8FMOgbUkrBu5Ri1GXE
        TlFlxBGaYxl9uGmXXjLppvRNXw==
X-Google-Smtp-Source: AGHT+IHs3B7noUBTeQn7HYvMJMcEsF3Esl+YvcRhoVp01N9+CZVaf7/PFCNBrx3Rm5TotCf3NsmByA==
X-Received: by 2002:a5d:4c8a:0:b0:32d:a335:e33d with SMTP id z10-20020a5d4c8a000000b0032da335e33dmr973868wrs.58.1697521521578;
        Mon, 16 Oct 2023 22:45:21 -0700 (PDT)
Received: from [192.168.86.24] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id i3-20020a5d4383000000b003232380ffd7sm809226wrq.102.2023.10.16.22.45.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Oct 2023 22:45:20 -0700 (PDT)
Message-ID: <02ce70da-346b-6c24-b7ed-8f5b30f1c99b@linaro.org>
Date:   Tue, 17 Oct 2023 06:45:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: linux-next: duplicate patches in the nvmem tree
Content-Language: en-US
To:     Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20231017150714.41a6c640@canb.auug.org.au>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20231017150714.41a6c640@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Thanks Stephen,

This is now fixed for both nvmem and fastrpc tree.

--srini
On 17/10/2023 05:07, Stephen Rothwell wrote:
> Hi all,
> 
> The following commits are also in the char-misc.current tree as different
> commits (but the same patches):
> 
>    d0b450caca6f ("nvmem: imx: correct nregs for i.MX6ULL")
>    f46cfdaf5c07 ("nvmem: imx: correct nregs for i.MX6UL")
>    e898831a6683 ("nvmem: imx: correct nregs for i.MX6SLL")
> 
> These are commits
> 
>    2382c1b04423 ("nvmem: imx: correct nregs for i.MX6ULL")
>    7d6e10f5d254 ("nvmem: imx: correct nregs for i.MX6UL")
>    414a98abbefd ("nvmem: imx: correct nregs for i.MX6SLL")
> 
> in the char-misc.current tree.
> 
