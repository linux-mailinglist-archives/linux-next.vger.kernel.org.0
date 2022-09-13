Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 452B25B791A
	for <lists+linux-next@lfdr.de>; Tue, 13 Sep 2022 20:06:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232295AbiIMSGR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Sep 2022 14:06:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230048AbiIMSFz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 13 Sep 2022 14:05:55 -0400
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com [IPv6:2001:4860:4864:20::31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CAB872FE7
        for <linux-next@vger.kernel.org>; Tue, 13 Sep 2022 10:08:29 -0700 (PDT)
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-1278a61bd57so33852007fac.7
        for <linux-next@vger.kernel.org>; Tue, 13 Sep 2022 10:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=AOGTh3GKdWU7THGxi9ZhEFRxJH4/0f8P0CcnJCbFnFQ=;
        b=xezzV1+jHEunSwyHWTjYMvGX27FDGUBgvQxpJjrMP4YnbtX8V5uxQCRzhQ7UM63Cjw
         E7KLs++hGZe6NNq27LTAf5bP82xxxCe13sKjR1NV1dxfd+EfEQ+oYM0qjI8qBXDoalVX
         r6L/IwrKJQmN4BD8gXyhqD/dHKCD6xXxPQNrEpQHJD10tW4F6S66dIzU759vKbIYwS5n
         Jm3HEgwl6JcukmgtHIFtq59Tgn/MUMeP8GVD2ga4gmvRGW0PyCtG7LhjOqM7PvjM7LT/
         HUK4/+pmrHQrGT9wgxMQM0fCBGdZwRXJVT12DSdZXNP+l8x2rIRoVvjnrIKP1N3cozCt
         PXZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=AOGTh3GKdWU7THGxi9ZhEFRxJH4/0f8P0CcnJCbFnFQ=;
        b=GJrkwV0n34Hqw3tyhWhW/VDLeIO/LHRsi0hbqHUejjscNfNcnLGjoT8OsktJ3Po6sx
         M5QPmYS64aCFZb8Umi4yB6Gqg33/GBWvPXeBiwxReYTPvsfcJ6gnW7JeS3aWwZJfvXOr
         z9BSf/99viya+3bXHWo6EyFk63QBEXIzxFH7k7RULi0nyhpkMkhFrq/JSnPe05hv+aj2
         rHthOf35n+7FBz/H5S/AleZluVaSuk681GpzRPHx/HePHMMvLsAlyb03ltN5CfLkKZmo
         D8yNnlO3hPVyyKLqDs6+s88gNZno5MoAerEb1UnjcczN4EAkj4Rk9Jo8Ri5B+tmvSGBP
         mkqg==
X-Gm-Message-State: ACgBeo2Q2z/soFJJiV1eKuVTwUYhU4yf7+vtEma6Pppojbju661x4REq
        C1YHY9amVUHlOmbVWeSii9zNCqekj6Ebl0HMbkWtPg==
X-Google-Smtp-Source: AA6agR7i9eei6FD8BfUnoGsGGBZZKBB08GdM+ONY19eFGhFLjSpFF19G6iK1ZJv7tq6Yyc76BOxYFFVTLeA3KFWW1rw=
X-Received: by 2002:a05:6808:1444:b0:344:f010:27d8 with SMTP id
 x4-20020a056808144400b00344f01027d8mr132857oiv.33.1663088908498; Tue, 13 Sep
 2022 10:08:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220913201557.2513488f@canb.auug.org.au>
In-Reply-To: <20220913201557.2513488f@canb.auug.org.au>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Tue, 13 Sep 2022 10:08:16 -0700
Message-ID: <CAJ+vNU2naFP=X1B3HwPCRez7Phft3OGA0sM6TMZUXJ78S5s6Aw@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the imx-mxs tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Sep 13, 2022 at 3:16 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> In commit
>
>   c1f84a75babe ("arm64: dts: imx8mp-venice-gw74xx: fix port/phy validation")
>
> Fixes tag
>
>   Fixes: 7899eb6cb15d ("arm64: dts: imx: Add i.MX8M Plus Gateworks gw7400
>
> has these problem(s):
>
>   - Subject has leading but no trailing parentheses
>   - Subject has leading but no trailing quotes
>
> Please do not split Fixes tags over more than one line.
>

Stephen,

Sorry, that was my fault with my editor's word-wrap getting in the
way. I will be more careful in the future.

Is there anything that I can and should do at this point to result this one?

Best Regards,

Tim
