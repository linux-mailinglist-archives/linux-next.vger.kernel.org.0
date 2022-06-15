Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5505D54D27B
	for <lists+linux-next@lfdr.de>; Wed, 15 Jun 2022 22:25:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231317AbiFOUZe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Jun 2022 16:25:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233573AbiFOUZd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 15 Jun 2022 16:25:33 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D41D850E0D
        for <linux-next@vger.kernel.org>; Wed, 15 Jun 2022 13:25:31 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id r5so5675816pgr.3
        for <linux-next@vger.kernel.org>; Wed, 15 Jun 2022 13:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fSbaUdWMc4ZCN4x6T7HO7Oazr6+FjS4D1nOKI+4v+qI=;
        b=eoBnV1ab6mcOB4xykNYFQaZW+Qi3dcgSQdsqak3tENQPcuOUClkzPwbUWUNWFP+QVK
         bQwrpLsOSl1k9EqZEIsTmvr6JEEssRSqiHDlJNMXVJ30VXU0dndaTEks0xtZFx1PwQpi
         jGw5dC7e0N7xdUVRy+kS0fs6FXid54A1kOOiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fSbaUdWMc4ZCN4x6T7HO7Oazr6+FjS4D1nOKI+4v+qI=;
        b=ai1jbXxzaHFDK7WbWHkd99Iuyk1ulTlGh2htwWkrkKK8UAjmr+kbrsdOwG2djKUxI4
         344s3dGfvfrlQItbleuTd4kKH8mMlhkfEnEALVsSgiU8WTu9DmJbqx6lPrL6RaXfZ13o
         Lyh8xFsNo4Cn6Opal+E9olvNIvawHdaUUX95UNpgwaSsbIaWnE38LrOXDotseIuQ+7se
         2WIoXgRWNDoyj4IxqdWwf5p0tmuT+8qR7gmqealUdkWGvXweqsbbxhPuQ3dO44pZsw/D
         9pmBt1YRbFOdIVElkhUKbBiNNHRz/pwBfzeq+Np0FA1MJsqYKWYmDiEN4abhkNa7Ge16
         XQDA==
X-Gm-Message-State: AJIora+aLH/8K4YkeEwnzdM2CThMp8hDXEaxhpb+hq99P2BOFA76y3K+
        14cvbzqGHXHyUKsV5skB/Kx9pA==
X-Google-Smtp-Source: AGRyM1tESwgbtAytnIPSYcv5RqPofftOKrovVEa2JmH58Vpoe8CgFFE/Ium5XvKSgg8sm3hMrzT/lg==
X-Received: by 2002:a63:135b:0:b0:3fd:876c:975a with SMTP id 27-20020a63135b000000b003fd876c975amr1347239pgt.538.1655324731197;
        Wed, 15 Jun 2022 13:25:31 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id b13-20020a1709027e0d00b00163aba9a2a5sm40235plm.106.2022.06.15.13.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 13:25:30 -0700 (PDT)
Date:   Wed, 15 Jun 2022 13:25:30 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Frederic Weisbecker <frederic@kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>, llvm@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Contextual conflict between kspp and rcu trees
Message-ID: <202206151323.4D78044D8@keescook>
References: <Yqo5SequJuC2qX6S@dev-arch.thelio-3990X>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yqo5SequJuC2qX6S@dev-arch.thelio-3990X>
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jun 15, 2022 at 12:55:53PM -0700, Nathan Chancellor wrote:
> Hi Stephen et al.,
> 
> There is a contextual conflict between commit e1d337335207 ("cfi: Fix
> __cfi_slowpath_diag RCU usage with cpuidle") in the kspp tree and commit
> dcc0c11aa87b ("rcu/context-tracking: Remove rcu_irq_enter/exit()") in
> the rcu tree, which is visible when building ARCH=arm64 defconfig +
> CONFIG_LTO_CLANG_THIN=y + CONFIG_CFI_CLANG=y with clang:
> 
>   kernel/cfi.c:298:3: error: call to undeclared function 'rcu_irq_enter'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>                   rcu_irq_enter();
>                   ^
>   kernel/cfi.c:298:3: note: did you mean 'ct_irq_enter'?
>   ./include/linux/context_tracking_irq.h:6:6: note: 'ct_irq_enter' declared here
>   void ct_irq_enter(void);
>        ^
>   kernel/cfi.c:307:3: error: call to undeclared function 'rcu_irq_exit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>                   rcu_irq_exit();
>                   ^
>   kernel/cfi.c:307:3: note: did you mean 'ct_irq_exit'?
>   ./include/linux/context_tracking_irq.h:7:6: note: 'ct_irq_exit' declared here
>   void ct_irq_exit(void);
>        ^
>   2 errors generated.
> 
> 
> Per the above RCU commit and commit 6c5218715286 ("context_tracking:
> Take IRQ eqs entrypoints over RCU"), it appears that the following diff
> is the proper fix up. Would you mind applying it to the merge of
> whichever tree comes second if possible? I did build and boot test it
> but it would not be a bad idea for Sami and Frederic to verify that it
> is correct so that Kees/Paul can mention it to Linus :)

Ah! Thanks for tracking this down! Maybe dcc0c11aa87b should be updated
to leave an alias until the next merge window?

-- 
Kees Cook
