Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE4CF5476AF
	for <lists+linux-next@lfdr.de>; Sat, 11 Jun 2022 18:57:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237379AbiFKQ5S (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 11 Jun 2022 12:57:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230515AbiFKQ5R (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 11 Jun 2022 12:57:17 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 318BB197
        for <linux-next@vger.kernel.org>; Sat, 11 Jun 2022 09:57:16 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id b8so2400327edj.11
        for <linux-next@vger.kernel.org>; Sat, 11 Jun 2022 09:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W83l/pLxbVmfdY4Bh3kAV9FBhPiwp545eDF2N1BjQ/0=;
        b=QZFxcEKrwiT/RpVaiTi05b84+BOEJXjGP0UMn3IqGzce/BDk93ukoGPtqbDYlqaeML
         WwwEbRGvqg0gN2HFDwZCwSPNECNvzPHHpYwbsRW/PpLrRQpmpYITmQ292c5X/16X6nAB
         XC3OXxSNmfDTBC0Q369g5kF7e+6gGX27oEtkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W83l/pLxbVmfdY4Bh3kAV9FBhPiwp545eDF2N1BjQ/0=;
        b=JbyOh6liorMLF3X/c8EgKHlj8vw4FmbAJHNWGLl7Oq/D/T8eiLL47MPMIbQCqPN389
         ZoKxe465qU77B5hDxt2LIVQ5XQ72QJpABkag6Jn/Vi0nSet9+xEFIKsfCa3EYyHYkzRx
         gRPiEySPr5PEDCZANEr1YbGZ/pd5YtnRQ2RLFtpWSBco4xvkPj7Vdd2GZYDg/f9wUdKk
         vV0Kc6vWiQNDCnTXgNiYiDMPEhttWwG2V/CsSFWuw1gSqqHRIroXhSNvIZlU+dMBYOqj
         6iI0fBOfyLa2mD7cmjiWbBaEiLEMWaFu+DCAJhhqijnnF4UA9P0MW4Z0bH1KKMRuOU9Y
         88xg==
X-Gm-Message-State: AOAM531H8n036uvosAA/okFlv5jkzglxwCaEMPwEZwsyxHgQJiQEVH0z
        DyglsU5/rX3G96ooWTxM5QFarUWBV28ffo96J8U=
X-Google-Smtp-Source: ABdhPJxZZ0288TwIRhAWuerUYfFQCwjZ2xV6jG9CqYJuRxgB9deKkwAJ/51sg1Xnrwz5Kf7it5s08A==
X-Received: by 2002:aa7:d456:0:b0:42d:d7d9:34c1 with SMTP id q22-20020aa7d456000000b0042dd7d934c1mr57337043edr.21.1654966634351;
        Sat, 11 Jun 2022 09:57:14 -0700 (PDT)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com. [209.85.128.43])
        by smtp.gmail.com with ESMTPSA id m23-20020a170906161700b0071216de7710sm1235819ejd.153.2022.06.11.09.57.13
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Jun 2022 09:57:13 -0700 (PDT)
Received: by mail-wm1-f43.google.com with SMTP id i64-20020a1c3b43000000b0039c6fd897b4so249687wma.4
        for <linux-next@vger.kernel.org>; Sat, 11 Jun 2022 09:57:13 -0700 (PDT)
X-Received: by 2002:a05:600c:591:b0:39c:4544:b814 with SMTP id
 o17-20020a05600c059100b0039c4544b814mr5603093wmd.118.1654966633270; Sat, 11
 Jun 2022 09:57:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220611182119.4e115fba@canb.auug.org.au>
In-Reply-To: <20220611182119.4e115fba@canb.auug.org.au>
From:   Doug Anderson <dianders@chromium.org>
Date:   Sat, 11 Jun 2022 09:57:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X2cwr_s3bQJk0hOb88-zPrZR-2fKxP8yKSAy9vuKFtzQ@mail.gmail.com>
Message-ID: <CAD=FV=X2cwr_s3bQJk0hOb88-zPrZR-2fKxP8yKSAy9vuKFtzQ@mail.gmail.com>
Subject: Re: linux-next: build warnings after merge of the drm-misc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

On Sat, Jun 11, 2022 at 1:21 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the drm-misc tree, today's linux-next build (htmldocs)
> produced these warnings:
>
> Documentation/gpu/drm-kms-helpers:241: include/drm/display/drm_dp_helper.h:377: WARNING: Unexpected indentation.
> Documentation/gpu/drm-kms-helpers:241: include/drm/display/drm_dp_helper.h:378: WARNING: Block quote ends without a blank line; unexpected unindent.
>
> Introduced by commit
>
>   69ef4a192bba ("drm: Document the power requirements for DP AUX transfers")

Thanks for the report. Fixed by:

https://lore.kernel.org/r/20220611095445.1.I534072d346b1ebbf0db565b714de9b65cbb24651@changeid

I'll plan to land it as soon as I see a Reviewed-by.

-Doug
