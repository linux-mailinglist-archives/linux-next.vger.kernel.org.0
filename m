Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22C10742022
	for <lists+linux-next@lfdr.de>; Thu, 29 Jun 2023 07:59:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230222AbjF2F7A (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 29 Jun 2023 01:59:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231286AbjF2F6z (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 29 Jun 2023 01:58:55 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0F9010B
        for <linux-next@vger.kernel.org>; Wed, 28 Jun 2023 22:58:54 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-54fb23ff7d3so186185a12.0
        for <linux-next@vger.kernel.org>; Wed, 28 Jun 2023 22:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688018334; x=1690610334;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b+w/+XUzFde638vXlgROkXuKaEwpU3Rqly43W4sUrfQ=;
        b=c8HCrFrzyR6kAvj7BAlMhIhllWO/AmUeNBm9ElSuL0AhqoPufVjXW8zph2vPXLxfRB
         szobyGYO2yADJFWV9ubtxy5oTmxT2UCyEXzxSlXFve/dRmVG+cJkXS9lA0kWWQwOvyW/
         De9BCr4yzWoONW5lz9x2WyvpYmsfUrIP4T96o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688018334; x=1690610334;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b+w/+XUzFde638vXlgROkXuKaEwpU3Rqly43W4sUrfQ=;
        b=ewgGDRCvCw3O4NqzQ7H7U/hYMSSd3VOdGLsZ1di04aO/XedbVqdNaWbkiZjDg06Edj
         LOlpQr74lnTfLSXvFOYVc+yDtL/MWVXYeIJmyVFN5/liInWrhwEg/Sgby6MLlNsD4eNC
         d+mUC2v5MsfL9kL5tBRUiiXK+XNpQK4WXFbo/o7EMhwXlMWKQkH8u1En4D269PtrnUg5
         C6AlLZUpsYVdBWOQMwsxbh0j26p03ht/3gpbIVYWu68b4J743Ajqm4YaLRZR4dke6IVH
         ccZmNbdorQTqiOaNxTDF9BzYuWWmbhJ3syicGACSbdzwhQKNO8h5/lLKdwxyn7BAQ0L6
         V1TQ==
X-Gm-Message-State: AC+VfDzry6n3cT7pGiGepfH/amuljfoJOFxB9Nb65uB/19M7E1CZOluf
        feMWGVW7aTH2GR70+xuKwFaUQA==
X-Google-Smtp-Source: ACHHUZ4rDS7tekSRoJ1jo+McQvFqinp3GaKs7mJZ6S4LIbc+Ojv+5PaJ5NEXEUUlxPckRuw2hY/8uQ==
X-Received: by 2002:a05:6a20:8e0c:b0:122:ff52:7331 with SMTP id y12-20020a056a208e0c00b00122ff527331mr23099788pzj.52.1688018334197;
        Wed, 28 Jun 2023 22:58:54 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id y8-20020a1709029b8800b001b23eb0b4bbsm8505458plp.147.2023.06.28.22.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 22:58:53 -0700 (PDT)
Date:   Wed, 28 Jun 2023 22:58:52 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Andrei Vagin <avagin@gmail.com>
Cc:     Andrei Vagin <avagin@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the seccomp tree
Message-ID: <202306282258.219B185B@keescook>
References: <20230629124055.7edf4493@canb.auug.org.au>
 <CANaxB-z0gLxOU-EVnag=pi3cC164stbOVOMmaGMwNs_g43z9_w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANaxB-z0gLxOU-EVnag=pi3cC164stbOVOMmaGMwNs_g43z9_w@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jun 28, 2023 at 10:27:09PM -0700, Andrei Vagin wrote:
> Probably something went wrong when the patch was applied. I've checked
> that the patch contains this file:
> 
> https://patchew.org/linux/20230308073201.3102738-1-avagin@google.com/20230308073201.3102738-7-avagin@google.com/
> 
> Kees, could you take a look at this?

Hmm, it seems something else went wrong too, due to:
616b14b47a86 ("perf build: Conditionally define NDEBUG")

I've added "#undef NDEBUG" to the file too.

-- 
Kees Cook
