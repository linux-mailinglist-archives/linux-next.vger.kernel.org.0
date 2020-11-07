Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09D782AA7D3
	for <lists+linux-next@lfdr.de>; Sat,  7 Nov 2020 21:04:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725846AbgKGUE5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 7 Nov 2020 15:04:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbgKGUE5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 7 Nov 2020 15:04:57 -0500
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F049BC0613CF;
        Sat,  7 Nov 2020 12:04:56 -0800 (PST)
Received: by mail-qv1-xf33.google.com with SMTP id 63so2174192qva.7;
        Sat, 07 Nov 2020 12:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=XvwA6HbetlDd2q4evkVumAAvjXgzZ2Oomp3oDp6nYXE=;
        b=o+BuRSb9DC0brGuYQ8AF1l0qYc5896UgBSNjCRUN6h1K1VrsliopG29NetWSDJ8S9l
         LlKJBoYsQS6XHXIsCpIKqRxp//ta3xnPcC9Dl++sqoS318s8oeoAvo+jxxsrwGR3/BLg
         TFXT2Rfmfckr7f5W9tvQs/t9XAGsOfvlb0fYRWHt//+CxlXyPH408nBDdoGrMszPrYeD
         IysuCSb6rkjoxy6s8Pw/fuT6IkpNlhAwdn5R796KbKvghzZWkarlQ4upZhCQ3+Ge4LoG
         4q1ne1axg90PN/CpPr+C0WNGYuvvZVQJKXsIe/shESa0D28bIXZYOF02ZfABxxUZHsEN
         KY1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=XvwA6HbetlDd2q4evkVumAAvjXgzZ2Oomp3oDp6nYXE=;
        b=eMjD3PX0kv/OQTUqA5Li69gABEHgcPHnp+n//bjQJI7Pw25iJQrSw5hLfEgvvIDEWP
         Oow7vv1dY85oTL8gspqpvRy/vi94/0nYUHyNMCjd0LHr+Iv6BlKTqXeMMQm/z1K17xFS
         eLYtsvqeThEDMrpntE9wzwrKaSbiron0oQrkz5rhI/rh9hjnNFrR84kESNJWHq47Uzli
         0vl4VK6ROUKDqpc5XnkqVT+j6YX2DaoIPMYiavEVGUzwQSzGXrz70vyPfM8tGoE0yZGM
         GMBMUKUoAFb/5n2T+EdIze0ROu5OMVG05rMiugONk1hJXRkkkaRzhobPmtENNfg714vN
         zIzA==
X-Gm-Message-State: AOAM532pKpjMPUg+c8KqbyXfWZlaRZtbkbbbqDik4u9dtuaijGf3VFsU
        liCFF1FL4+Vjpy4clu+UEeE=
X-Google-Smtp-Source: ABdhPJwJ1/ek4sB5yeokoXnAzPsOzuRUpUF7L1rpw5rcxV9dxY5JIG2JXza/UTObEg+RV7NsPrdd+g==
X-Received: by 2002:a05:6214:c2:: with SMTP id f2mr7474799qvs.2.1604779495967;
        Sat, 07 Nov 2020 12:04:55 -0800 (PST)
Received: from ubuntu-m3-large-x86 ([2604:1380:45f1:1d00::1])
        by smtp.gmail.com with ESMTPSA id e14sm2951675qtw.22.2020.11.07.12.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2020 12:04:55 -0800 (PST)
Date:   Sat, 7 Nov 2020 13:04:53 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Valdis =?utf-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-next@vger.kernel.org
Subject: Re: next-20201105 - build issue with KASAN on ARM
Message-ID: <20201107200453.GA92349@ubuntu-m3-large-x86>
References: <7021.1604774000@turing-police>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7021.1604774000@turing-police>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Valdis,

On Sat, Nov 07, 2020 at 01:33:20PM -0500, Valdis Klētnieks wrote:
> commit d6d51a96c7d63b7450860a3037f2d62388286a52
> Author: Linus Walleij <linus.walleij@linaro.org>
> Date:   Sun Oct 25 23:52:08 2020 +0100
> 
>     ARM: 9014/2: Replace string mem* functions for KASan
> 
> I'm trying to figure out why this has 3 Tested-By: tags but blows up for fairly obvious
> reasons on ARM.....

Because it builds fine if you check out Russell's branch. This build
error only happens because of a treewide change in -mm that was applied
after the ARM merge:

https://lore.kernel.org/linux-arm-kernel/20201106094434.GA3268933@ubuntu-m3-large-x86/

https://lore.kernel.org/linux-arm-kernel/20201106180929.GD2959494@ubuntu-m3-large-x86/

Stephen could apply that diff as a fixup for the -mm patch when he
builds -next or I can send it as a formal patch for him to apply.

>   CC      arch/arm/boot/compressed/string.o
> arch/arm/boot/compressed/string.c:24:1: error: attribute 'alias' argument not a string
>  void *__memcpy(void *__dest, __const void *__src, size_t __n) __alias(memcpy);
>  ^~~~
> arch/arm/boot/compressed/string.c:25:1: error: attribute 'alias' argument not a string
>  void *__memmove(void *__dest, __const void *__src, size_t count) __alias(memmove);
>  ^~~~
> arch/arm/boot/compressed/string.c:26:1: error: attribute 'alias' argument not a string
>  void *__memset(void *s, int c, size_t count) __alias(memset);
>  ^~~~
> make[2]: *** [scripts/Makefile.build:283: arch/arm/boot/compressed/string.o] Error 1
> make[1]: *** [arch/arm/boot/Makefile:64: arch/arm/boot/compressed/vmlinux] Error 2
> 

Cheers,
Nathan
