Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DABD4D3845
	for <lists+linux-next@lfdr.de>; Wed,  9 Mar 2022 19:00:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234620AbiCIRyj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Mar 2022 12:54:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235976AbiCIRyi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Mar 2022 12:54:38 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00AB2E1B56
        for <linux-next@vger.kernel.org>; Wed,  9 Mar 2022 09:53:38 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id z4so2577052pgh.12
        for <linux-next@vger.kernel.org>; Wed, 09 Mar 2022 09:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=qmSmgs55XaXk15bGqog/U8JOQMvKGJQ0ikFM8ua87j4=;
        b=OSKDu/ib+3J2AKmp/olwVlOwOaCZPVW39eJ1BbNAHYCtFuzwmo8AYW9BwMNHgNA1tX
         lcaDZkkAohVeZmWLjkr8x5xnqS/ODlijPMxkfvWzWmWUAXTkdVO3hkPYGFFBS+rjzjlf
         MdRUQO1ELSotENGcSBwi4pS8B7Fhbs/+OfdaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=qmSmgs55XaXk15bGqog/U8JOQMvKGJQ0ikFM8ua87j4=;
        b=aksfQ14cz0X6+lqyenRn7g68+fsERg3k/I/ksO8GwiKrcRfmZ5NDQrKD79MEoXYdKA
         CcUsA3xn2PCg+UbPt4HPNDDIEM3I5okRckDmamnxHjt3ktCAVyZQEYsNRM/ZwMXJh7QP
         YWiKhbMFfPdTjJWR6vrQvRD9yGXStuGiWqPIGvUm49BgOBKu5PQNtyrRN8tbqpjFuGwF
         YfB4BbNVXMgtEXaDlAxu+WJ4nFiV82TllIX+iwHjiMDdvvneW4rkcDT5cxug+qUlGxfb
         MfUrTRFTgId9IMG8Y47luDy3W+A7iiuC9hj9ShE4fKnOtlRdgRwBBQbIWKoCSX2Q+Fvj
         +NSA==
X-Gm-Message-State: AOAM533cTSAp1QbjXc6C1u/iEmihFrwp7E1NZEHqzvWWSgbDiGJkdm2X
        RRcuL3YQx5qroNnS9WohhCNVig==
X-Google-Smtp-Source: ABdhPJyN4DQkJeA+BsHZknL/wPsqjWVAlxLMty4dze+Issnd8d9INcekBICbrX/aLQMKpE5jpH50pQ==
X-Received: by 2002:a63:4e52:0:b0:380:7c35:fc9a with SMTP id o18-20020a634e52000000b003807c35fc9amr726462pgl.376.1646848418509;
        Wed, 09 Mar 2022 09:53:38 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a12-20020a056a000c8c00b004e1a76f0a8asm3893798pfv.51.2022.03.09.09.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Mar 2022 09:53:38 -0800 (PST)
Date:   Wed, 9 Mar 2022 09:53:37 -0800
From:   Kees Cook <keescook@chromium.org>
To:     "kernelci.org bot" <bot@kernelci.org>
Cc:     linux-next@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: next/master build: 224 builds: 30 failed, 194 passed, 97 errors,
 370 warnings (next-20220309)
Message-ID: <202203090952.70BFAA32B@keescook>
References: <6228d80a.1c69fb81.538eb.96f2@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6228d80a.1c69fb81.538eb.96f2@mx.google.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Mar 09, 2022 at 08:38:34AM -0800, kernelci.org bot wrote:
> [...]
> am200epdkit_defconfig (arm, gcc-10) — PASS, 0 errors, 4 warnings, 0 section mismatches
> 
> Warnings:
>     arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is outside array bounds of ‘struct dma_contig_early_reserve[0]’ [-Warray-bounds]
>     arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is outside array bounds of ‘struct dma_contig_early_reserve[0]’ [-Warray-bounds]
>     arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside array bounds of ‘struct dma_contig_early_reserve[0]’ [-Warray-bounds]
>     arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside array bounds of ‘struct dma_contig_early_reserve[0]’ [-Warray-bounds]

This should be fixed by:

https://lore.kernel.org/linux-hardening/20220309175107.195182-1-keescook@chromium.org/

-- 
Kees Cook
