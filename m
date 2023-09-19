Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D89997A6CDB
	for <lists+linux-next@lfdr.de>; Tue, 19 Sep 2023 23:18:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233351AbjISVSw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 Sep 2023 17:18:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233340AbjISVSv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 19 Sep 2023 17:18:51 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 560EABD
        for <linux-next@vger.kernel.org>; Tue, 19 Sep 2023 14:18:42 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-690d8c05784so257807b3a.2
        for <linux-next@vger.kernel.org>; Tue, 19 Sep 2023 14:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695158322; x=1695763122; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zUuiZDmU5EMTeO4CdiXdV5Ryvju9HaBb50QeYalbm10=;
        b=wxweP94UYNsZlK643NtkYjV06czrJcly9ovWgm26XY1Owjh4ZlHVQrQ3x9+H5fBb8Q
         4vId9NIPyr2cmlbgd/+RCs617WPWAcMiDbFXQM9JoSaa+iNvrAJow5baImXVLDYaaU7P
         OusljRMXdlNv6v1+iBVoUAImRa1UaGJjaf2CJfzqoxwIRborvqZZO0dqOcrLD3CMMG0+
         Y5LXzde8DOYEjSFCL8klD5vhEjk2Dv36Ovy65QUDkBB4ytP+0KcA87U1dUJXweQENIFi
         bU+wQi1u+kKWnh7EvPqO7OFL4joxUc8QTtPf1wMax/nSVv7tYw/aHNDa53xeLiLGCyVu
         xH5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695158322; x=1695763122;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zUuiZDmU5EMTeO4CdiXdV5Ryvju9HaBb50QeYalbm10=;
        b=OrclmvImdDaHYYHGF/3D0I+CYMr3A/55LwV9IABf2WUnhlJIaKq3WNacSDZLvWf9Kt
         xuuWENqfXx1s/jRariFKVdDGyMeAhM71F4SIiOisOtf3ZMw3JagmxeRCHudXxV+aqHhu
         3HRMDcl314KjqhH+UAgqKJdQhTa/ZE0ufmJHjJ9eLh29B/59HB3hCtAYl4gAl8kE+yEh
         d5ZHyzmcIx5gcvjPMv1FXjb7YJcaF22hZFoRys2Yg+96LqYW99IdWo1EPxBHLUzE71D2
         UXfipKRkYhZyGo2XkgrLC2Q+SzeaL4VfE34LX/0zQMPNu50gqbchjm5S1IeFHGQy3tOf
         SRLA==
X-Gm-Message-State: AOJu0YxAyxed5RBgt6PEV2Qw0n5rSr1JcZe00vR8JzrODOHNaX/b/Kd6
        I7rOhWI86ugAUP8vUUZC25jr6w==
X-Google-Smtp-Source: AGHT+IH6dUDZ77/DJvfNaKnqCuhMLQbO7XX7jFgJOsx/GKqMs+XRvae/XJkRkp1vo0dCwYMw5veKww==
X-Received: by 2002:a05:6a00:4783:b0:690:cd33:a582 with SMTP id dh3-20020a056a00478300b00690cd33a582mr641768pfb.7.1695158321630;
        Tue, 19 Sep 2023 14:18:41 -0700 (PDT)
Received: from google.com ([2620:15c:2d1:203:118e:eaf2:1433:f9fe])
        by smtp.gmail.com with ESMTPSA id v3-20020a62a503000000b00682bec0b680sm9002891pfm.89.2023.09.19.14.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 14:18:40 -0700 (PDT)
Date:   Tue, 19 Sep 2023 14:18:36 -0700
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-um <linux-um@lists.infradead.org>,
        Mike Rapoport <rppt@kernel.org>, llvm@lists.linux.dev
Subject: Re: linux-next: Tree for Sep 19 (UML)
Message-ID: <ZQoQLJnGFxjA8p5E@google.com>
References: <20230919163728.78432283@canb.auug.org.au>
 <04b8a6de-2b20-4488-b20f-c8a8f6001fd2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04b8a6de-2b20-4488-b20f-c8a8f6001fd2@infradead.org>
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Sep 19, 2023 at 08:42:07AM -0700, Randy Dunlap wrote:
> 
> 
> On 9/18/23 23:37, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20230918:
> > 
> > New tree: kvm-ppc
> > 
> > The mm tree gained a boot warning for which I reverted 5 commits.
> > 
> > Non-merge commits (relative to Linus' tree): 5750
> >  3717 files changed, 446028 insertions(+), 107378 deletions(-)
> > 
> > ----------------------------------------------------------------------------
> > 
> 
> on i386 or x86_64:
> 
> ../arch/x86/um/../kernel/module.c: In function 'execmem_arch_params':
> ../arch/x86/um/../kernel/module.c:54:50: error: implicit declaration of function 'kaslr_enabled'; did you mean 'kasan_enabled'? [-Werror=implicit-function-declaration]
>    54 |         if (IS_ENABLED(CONFIG_RANDOMIZE_BASE) && kaslr_enabled())
>       |                                                  ^~~~~~~~~~~~~
>       |                                                  kasan_enabled
> 
> 
> 
> git blames this on:
> 
> commit 12633d679796
> Author: Stephen Rothwell <sfr@canb.auug.org.au>
> Date:   Tue Sep 19 15:14:03 2023 +1000
> 
>     Revert "arch: make execmem setup available regardless of CONFIG_MODULES"
>     
>     This reverts commit 3300c3af20090ff5e03e5c4bf2ef2cfaa03d4e9b.

Thanks for the report, FWIW, our CI is hitting this, too.

Was 12633d679796 a pure revert, or was it manually modified?

Oh 3300c3 was patch 10/13; maybe a clean revert is not possible without
other reverts in addition?
https://lore.kernel.org/lkml/20230918072955.2507221-11-rppt@kernel.org/

Seems like there's more info in this thread:
https://lore.kernel.org/lkml/20230919152031.GF3303@kernel.org/
