Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D07B70FAA1
	for <lists+linux-next@lfdr.de>; Wed, 24 May 2023 17:42:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237199AbjEXPmu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 May 2023 11:42:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237472AbjEXPm2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 24 May 2023 11:42:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D12210C2
        for <linux-next@vger.kernel.org>; Wed, 24 May 2023 08:41:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6F40D6348F
        for <linux-next@vger.kernel.org>; Wed, 24 May 2023 15:39:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45569C433D2;
        Wed, 24 May 2023 15:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684942760;
        bh=BpCAurSKPwob11gneAgJ8P2mOu9iuo4b658ZEi08zv8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NGWYVZq2A9TMs7NNmp6g9pD/Y0Xd+SJzWwkYWMZHq+GIqf6WokGzg/+ZlC3OPJ5j2
         0vYBHuouJDtNWXPNfD/6UHFk2aaVUTWd5opuyjsrXcyxnIEB2wazErIwXwBsy4Fk2j
         fKRBk02FTaOed5Or5jpd0Nm8T+X1W3Etu3jZmSi0c7y73kc2zIucDDdtNctfoLz158
         AEooe/2s9Fw2MWbogFANbQKK3j1xhm2TPQE1QQxH9obQwncAKQLS7HLWQg0UkvQkdi
         NyUG5PjiHe3VVd/XVVdn7LGdhjijXq5aHP3Ja+VQyaC0TKfCF3rwklkbCIHWO+2nth
         5jndca+onEC1g==
Date:   Wed, 24 May 2023 08:39:18 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        clang-built-linux <llvm@lists.linux.dev>,
        dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        lkft-triage@lists.linaro.org, Arnd Bergmann <arnd@arndb.de>,
        arun.r.murthy@intel.com, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>
Subject: Re: next: clang: x86_64: /intel_display.c:6012:3: error: unannotated
 fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
Message-ID: <20230524153918.GA869320@dev-arch.thelio-3990X>
References: <CA+G9fYv68V3ewK0Qj-syQj7qX-hQr0H1MFL=QFNuDoE_J2Zu-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYv68V3ewK0Qj-syQj7qX-hQr0H1MFL=QFNuDoE_J2Zu-g@mail.gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Naresh,

On Wed, May 24, 2023 at 12:32:24PM +0530, Naresh Kamboju wrote:
> Linux next-20230523 and next-20230524 the x86_64 and i386 builds failed
> with clang.
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> make --silent --keep-going \
>   --jobs=8 O=/home/tuxbuild/.cache/tuxmake/builds/1/build ARCH=x86_64 \
>   SRCARCH=x86 CROSS_COMPILE=x86_64-linux-gnu- \
>   'HOSTCC=sccache clang' 'CC=sccache clang' \
>    LLVM=1 LLVM_IAS=1
> 
> drivers/gpu/drm/i915/display/intel_display.c:6012:3: error:
> unannotated fall-through between switch labels
> [-Werror,-Wimplicit-fallthrough]
>                 case I915_FORMAT_MOD_X_TILED:
>                 ^
> drivers/gpu/drm/i915/display/intel_display.c:6012:3: note: insert
> 'break;' to avoid fall-through
>                 case I915_FORMAT_MOD_X_TILED:
>                 ^
>                 break;
> 1 error generated.

Thanks for the report, I have sent
https://lore.kernel.org/20230524-intel_async_flip_check_hw-implicit-fallthrough-v1-1-83de89e376a1@kernel.org/
for this.

Cheers,
Nathan
