Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA41C40E2D7
	for <lists+linux-next@lfdr.de>; Thu, 16 Sep 2021 19:17:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240690AbhIPQmO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Sep 2021 12:42:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245224AbhIPQkO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 16 Sep 2021 12:40:14 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1811BC05BD0C
        for <linux-next@vger.kernel.org>; Thu, 16 Sep 2021 09:12:47 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id v2so4176337plp.8
        for <linux-next@vger.kernel.org>; Thu, 16 Sep 2021 09:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=6Vf9yNd8D3PRokI4zc/PzCfhjtTs2xF1JD+HdFkgNJw=;
        b=nrKGtggRYTID7fKxuqzJrwo6tLj4KSMR43H7LyzTaLSZ45BLwwu+OkFI1s/Edyv8R6
         htxD391LORs89GY/tYwrbB9bMExyzLd6HvBYlIr95N/XJlXYuCfkLJhbDi4Pn4PF9hAe
         UI405YlDhqtW0pkaCdCp8Jma4C5Lb9EgGVXeo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=6Vf9yNd8D3PRokI4zc/PzCfhjtTs2xF1JD+HdFkgNJw=;
        b=yAAw2Mijnq29D9lgome8ipAgmFokcDFb1oFPBVhTlepzLcbQpIgCeGYjanHx1fdjxB
         4ypsBuJK9TY4br46CBBY1VJF6BiG13TIOFD6NYqDaRi7ICZguarjZXZMuE+ms1sc06a0
         +DcFOIBzxqBdiEy7en6fF1UWa7v8F4RQK53kQBAfqOBzHzcdF8LJDVyP8s/zhD99v+a+
         ArG0jLDMHCZ1xe1efbAlAELbRRv4shWbgx6XuK8J5iAMie8T5mR207Cj32f6BuPOOupl
         bKhkT56gsqQE5NDv2kesZCJstPFs+et3LPcCe7+lhicNNo0AGnpNe5LvHmNhLOx44RvE
         B/dw==
X-Gm-Message-State: AOAM532ittwYEHwNGf/zoXENJloPqOFb6y+3kQeC5EUsAEA9esBpaY9s
        SjOB4VWTCTQeiGJpbsP2wgrV5T6DMP5C0A==
X-Google-Smtp-Source: ABdhPJxBuPg56folFskewz+fdP7QFbncMgXxvCriYrGmNI7xYknt9pWWX7pEw1D+GEWNYssr/dl0JQ==
X-Received: by 2002:a17:90a:5583:: with SMTP id c3mr6832988pji.133.1631808766631;
        Thu, 16 Sep 2021 09:12:46 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id h7sm3210333pjj.42.2021.09.16.09.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 09:12:46 -0700 (PDT)
Date:   Thu, 16 Sep 2021 09:12:45 -0700
From:   Kees Cook <keescook@chromium.org>
To:     "kernelci.org bot" <bot@kernelci.org>,
        Bixuan Cui <cuibixuan@huawei.com>
Cc:     linux-next@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>, tglx@linutronix.de
Subject: Re: next/master build: 210 builds: 7 failed, 203 passed, 7 errors,
 1669 warnings (next-20210914)
Message-ID: <202109160900.0E416B0E9@keescook>
References: <61405e17.1c69fb81.67290.bb2c@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <61405e17.1c69fb81.67290.bb2c@mx.google.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Sep 14, 2021 at 01:32:23AM -0700, kernelci.org bot wrote:
> Errors summary:
> 
>     2    include/linux/slab.h:618:9: error: argument 1 value ‘18446744073709551615’ exceeds maximum object size 9223372036854775807 [-Werror=alloc-size-larger-than=]
>     1    include/linux/slab.h:461:9: error: argument 1 value ‘4294967295’ exceeds maximum object size 2147483647 [-Werror=alloc-size-larger-than=]
>     1    drivers/staging/greybus/audio_topology.c:977:12: error: stack frame size of 3312 bytes in function 'gbaudio_tplg_create_widget' [-Werror,-Wframe-larger-than=]
>     1    drivers/media/common/v4l2-tpg/v4l2-tpg-core.c:138:4: error: argument 1 value ‘4294967295’ exceeds maximum object size 2147483647 [-Werror=alloc-size-larger-than=]

These (the same root cause as [1]) are fixed by:
https://lore.kernel.org/lkml/20210910201132.3809437-1-keescook@chromium.org/

which is in mmots (soon to be mmotm, soon to be in -next):
https://www.ozlabs.org/~akpm/mmots/broken-out/compiler-attributes-add-__alloc_size-for-better-bounds-checking-fix.patch

-Kees

[1] https://lore.kernel.org/lkml/20210908014623.61357-1-cuibixuan@huawei.com/

-- 
Kees Cook
