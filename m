Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBC6B4C7DF4
	for <lists+linux-next@lfdr.de>; Tue,  1 Mar 2022 00:02:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229476AbiB1XDa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Feb 2022 18:03:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbiB1XDa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Feb 2022 18:03:30 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 509721D30B
        for <linux-next@vger.kernel.org>; Mon, 28 Feb 2022 15:02:50 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id bd1so11958512plb.13
        for <linux-next@vger.kernel.org>; Mon, 28 Feb 2022 15:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=E18nFr6CZyKutgNHe7ZMWmu1CUH8/xXfpzrd78+lw3g=;
        b=clgIO3f5d/WoMs5kQadArCOE8yK3k1iikSF9YqWeMN7Na5zLFCkPmwHUz4zGYmF2Bn
         I+dLJFdtf/dxyfLzjtY6xm9m5p0Us1nz/Ah+NF0LtqAAdJroJ/MM6nTzxcthnWrQcgWS
         v1duGAc6nfiyyEm71Te9WSdfyzbXe8hZ7Y9QQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=E18nFr6CZyKutgNHe7ZMWmu1CUH8/xXfpzrd78+lw3g=;
        b=0joT1QsorhES+89shvvMOqPn0/rA+/zIaZDGp7l5pzj+33yDI049DyDW044ZjaLHMn
         x9YieUysx8tqyi+bAXhVQsVA9ODJFPtvAKP+o7x+rxbB8Isgan5ouasce0CfE/qjD1G7
         9gH5lG6Ljm+I/GQEf7gopRb1tuaR84JPi5lITpaUMsa34ybf6LZ/HA+uPQOwWjdKtcTq
         yNEvd7blPBu8Iy+C3MFB14ayWb/ukqHD6HXlRsW8W5ezBMYC7cvC2CF+BUp9CJOSienh
         70ngkNx+oZqP64SRiNXwv/pkf3tKL62PRuw60zpSx+vnTIbgwM2p5eHSKjd1bFuJ3vFK
         L/UQ==
X-Gm-Message-State: AOAM532hZl2GFxJGcTFM2JbW4+C9UZMIsiKRtjpVs2wDHTCAPq/SJPju
        MDyn4ek3ZxnKrOMdJzijQKH6UrPpQxkH+A==
X-Google-Smtp-Source: ABdhPJxfQ1nEAcrAyPHpdz9IUSpSVvJ+s1ZvVeZTzteCXVt4ZAkTmBmTv9aj7/vxmk13zoRAUJFh2A==
X-Received: by 2002:a17:903:2c5:b0:14f:4a29:1f64 with SMTP id s5-20020a17090302c500b0014f4a291f64mr23194061plk.90.1646089369195;
        Mon, 28 Feb 2022 15:02:49 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id c34-20020a630d22000000b0034cb89e4695sm11538529pgl.28.2022.02.28.15.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 15:02:48 -0800 (PST)
Date:   Mon, 28 Feb 2022 15:02:48 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the kspp tree
Message-ID: <202202281453.C8B840C7@keescook>
References: <20220301092730.10de23c5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220301092730.10de23c5@canb.auug.org.au>
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Mar 01, 2022 at 09:27:30AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the kspp tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/gpu/drm/drm_dp_helper.c: In function 'drm_dp_pcon_dsc_bpp_incr':
> drivers/gpu/drm/drm_dp_helper.c:3130:28: error: array subscript 12 is outside array bounds of 'const u8[12]' {aka 'const unsigned char[12]'} [-Werror=array-bounds]
>  3130 |         buf = pcon_dsc_dpcd[DP_PCON_DSC_BPP_INCR - DP_PCON_DSC_ENCODER];
>       |               ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/drm_dp_helper.c:3126:39: note: while referencing 'pcon_dsc_dpcd'
>  3126 | int drm_dp_pcon_dsc_bpp_incr(const u8 pcon_dsc_dpcd[DP_PCON_DSC_ENCODER_CAP_SIZE])
>       |                              ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/drm_dp_helper.c: In function 'drm_dp_get_adjust_request_post_cursor':
> drivers/gpu/drm/drm_dp_helper.c:59:27: error: array subscript 10 is outside array bounds of 'const u8[6]' {aka 'const unsigned char[6]'} [-Werror=array-bounds]
>    59 |         return link_status[r - DP_LANE0_1_STATUS];
>       |                ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/drm_dp_helper.c:147:51: note: while referencing 'link_status'
>   147 | u8 drm_dp_get_adjust_request_post_cursor(const u8 link_status[DP_LINK_STATUS_SIZE],
>       |                                          ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> 
> I can't see what in the kspp tree suddenly brought this on, so I have
> used the kspp tree from next-20220228 for today.
> 
> In case it matters: x86_64-linux-gnu-gcc (Debian 11.2.0-9) 11.2.0

This is fixed in drm-misc:

https://cgit.freedesktop.org/drm/drm-misc/log/
https://cgit.freedesktop.org/drm/drm-misc/commit/?id=d4da1f27396fb1dde079447a3612f4f512caed07
https://cgit.freedesktop.org/drm/drm-misc/commit/?id=a2151490cc6c57b368d7974ffd447a8b36ade639

but I had to drop the fix from the for-next/kspp because the patched
file got moved in drm-misc.

I don't know how to best deal with this case, which is: "add new Makefile
flag" and "carry fixes that have been ignored for 2 weeks" followed
by a later "fix got picked up now" change. Currently I've still been
carrying them is a separate tree that is merged with for-next/kspp,
so the warning doesn't appear like above, but that requires that the
tree it applies to doesn't change out from under it. :P

-- 
Kees Cook
