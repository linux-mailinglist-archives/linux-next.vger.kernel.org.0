Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81E384D3943
	for <lists+linux-next@lfdr.de>; Wed,  9 Mar 2022 19:52:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233094AbiCISxs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Mar 2022 13:53:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236975AbiCISxp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Mar 2022 13:53:45 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7D7613F4F
        for <linux-next@vger.kernel.org>; Wed,  9 Mar 2022 10:52:45 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id s11so3051337pfu.13
        for <linux-next@vger.kernel.org>; Wed, 09 Mar 2022 10:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Aba08NgFRdM25Wn4JAHLUroveOq11kJv80e7A0tLZYU=;
        b=Vv4QNG8UlLJYIZCQGTY7bUejFM1yeCm646IeAhIMxkrQIP9zZNlyPwN4QJ0dx9lERM
         SkVE5MUnIaxFfNvtEMywy5Rj3juXX6cigQtGHzeDpOmEKYqvOfziZmsb7qIhM/gdsZRP
         xCTqvcOd6ZAqVZy8KlPUHt7pylfh2mk/v2Ke4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Aba08NgFRdM25Wn4JAHLUroveOq11kJv80e7A0tLZYU=;
        b=YZ45OVhGIXh/Blcb54EnXAVgFUrmbXhPi7c+fTpcKH4xGMzhn9us2cgT2RMbgbfBJg
         9X1lfQmTkEPhzPSf/fFjZCIvMhC2kzpNsB7wfErC54rSDwH/j/5fZoM0YbudRr4nTTvl
         qwY12p6J8kgmePdLpeDSeS83DUjTisZ589DyqOQba+NP59GjqXgLPqvXBbncTxrivspt
         zruTmWX4kv9bI5UXshomqzCwmQeJShzZwtS6aMzK1n3i3XO9qrHebfqSS93PN4c4Hcmg
         zj9R9kephtyuhRa9gdC/0419o3P0kC5QIOUzcnrj0ErwYjCXFvIWlReSqdzSROk8cQgm
         Li/Q==
X-Gm-Message-State: AOAM5321Pj0JPfS41g2BIzzUZf4p/PzfFM/4Qw76h6v5FkvbRF9opVBR
        N8RQwEO6UQyoAYIwCJ/CbOfxr0XvzrWH2g==
X-Google-Smtp-Source: ABdhPJwrCLGxutg2Kstb5SpJAxMczxCItoAV1Z5X+QwxY1tqXaKehtumcGCzIFDeqPjm7Zf0t98t5Q==
X-Received: by 2002:a05:6a00:198b:b0:4f4:22f3:2fbb with SMTP id d11-20020a056a00198b00b004f422f32fbbmr841656pfl.20.1646851965208;
        Wed, 09 Mar 2022 10:52:45 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id g6-20020a056a001a0600b004f2a4316a0asm3768042pfv.60.2022.03.09.10.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Mar 2022 10:52:44 -0800 (PST)
Date:   Wed, 9 Mar 2022 10:52:44 -0800
From:   Kees Cook <keescook@chromium.org>
To:     "kernelci.org bot" <bot@kernelci.org>
Cc:     linux-next@vger.kernel.org
Subject: Re: next/master build: 224 builds: 30 failed, 194 passed, 97 errors,
 370 warnings (next-20220309)
Message-ID: <202203091050.7F173BAD4@keescook>
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
> gcw0_defconfig (mips, gcc-10) — PASS, 0 errors, 1 warning, 0 section mismatches
> 
> Warnings:
>     include/asm-generic/unaligned.h:14:8: warning: array subscript -1 is outside array bounds of ‘unsigned char[1]’ [-Warray-bounds]

This is fixed by:

https://lore.kernel.org/linux-hardening/20220309185032.229123-1-keescook@chromium.org/

-- 
Kees Cook
