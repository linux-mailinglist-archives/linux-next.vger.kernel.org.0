Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E2E5429601
	for <lists+linux-next@lfdr.de>; Mon, 11 Oct 2021 19:46:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230102AbhJKRsf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Oct 2021 13:48:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231951AbhJKRse (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 11 Oct 2021 13:48:34 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46276C061570
        for <linux-next@vger.kernel.org>; Mon, 11 Oct 2021 10:46:34 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id a11so11873893plm.0
        for <linux-next@vger.kernel.org>; Mon, 11 Oct 2021 10:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QWj2JXkJyQDHBhfB4agrm/K3KXfWNnFY8j3Hsh+xzv0=;
        b=aB4hreG52B/zYsYowIge7+XqREmGQxHmyq6zfwlKcutYV0fbGt0omMpVJwhTuQqNh7
         WTSfbnfdKXuha28csdTVKlRjxppqZPX/Ic1C7tpB1KKWKGSaWWY5HkKzyML4Fv48KQP5
         f+Y5juq8e3hk54zXfJ+Tswyjb7EGiiCzWp0gc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QWj2JXkJyQDHBhfB4agrm/K3KXfWNnFY8j3Hsh+xzv0=;
        b=pvUt+pYzfBrS2uK1ZKH1XOXycCFmPchfeE4WG3qu3UnyFx6J7mSX8t0fXRZ1Uziqj2
         IKa+oi1HFw/HZ+tHh+cH5a4PU88JP1RSxtQNhi5dw/bo/wVG2pwyqKxWj4635V6m1XoE
         Gby3CFMUeOCyq7Q/1V9SVn1pmt0xHUzioCGg9Cix9sQ3Fd1l3b9WvjUf8QCVGA172RIN
         X175O1pjGsM5Bw1IDkiQC+4mroM1ZOGln7bUb06wIL5JJw0kV/0ns5JquhAKeJkhgczB
         PJp/dybAlYq6FoEqrsNcoRPpU2J4IuD8Ffr2FefL1UFa86/KHvDiwpH79BwPIzHWkq8B
         PdSQ==
X-Gm-Message-State: AOAM533S96GPrB1kPyCD5YLquTlW4JWxeWUw+vRf6OZ7wlIlJ4VlJOYa
        nLwGLGcvB9O70wS+NON+o1AxUg==
X-Google-Smtp-Source: ABdhPJwHd8CuR+2nnKmcjuzFIDoW9HXUiH/zkwOgOsehQuamFxaEnAWAhLoqUk4ZAf6ImVhbRguzEQ==
X-Received: by 2002:a17:902:7804:b0:13e:d4c6:e701 with SMTP id p4-20020a170902780400b0013ed4c6e701mr25958323pll.66.1633974393806;
        Mon, 11 Oct 2021 10:46:33 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id l11sm106279pjg.22.2021.10.11.10.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 10:46:33 -0700 (PDT)
Date:   Mon, 11 Oct 2021 10:46:32 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Daniel Micay <danielmicay@gmail.com>,
        Matthew Wilcox <willy@infradead.org>,
        Joe Perches <joe@perches.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the akpm-current tree
Message-ID: <202110111043.B69F7D419A@keescook>
References: <20211011183145.6ac3bef3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211011183145.6ac3bef3@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Oct 11, 2021 at 06:31:45PM +1100, Stephen Rothwell wrote:
> After merging the akpm-current tree, today's linux-next build (htmldocs)
> produced these warnings:
> 
> include/linux/slab.h:577: warning: Function parameter or member '1' not described in '__alloc_size'
> include/linux/slab.h:577: warning: expecting prototype for kmalloc(). Prototype was for __alloc_size() instead

Yay kerndoc. Thanks for catching this, and I realize Matthew Wilcox
predicted this earlier:
https://lore.kernel.org/lkml/3a0c55a3fabc57ce9771c93499ef19327f3b8621.camel@perches.com/

I will get a fix sent.

-Kees

> include/linux/slab.h:623: warning: Function parameter or member '1' not described in '__alloc_size'
> include/linux/slab.h:623: warning: Function parameter or member '2' not described in '__alloc_size'
> include/linux/slab.h:623: warning: expecting prototype for kmalloc_array(). Prototype was for __alloc_size() instead
> include/linux/slab.h:644: warning: Function parameter or member '2' not described in '__alloc_size'
> include/linux/slab.h:644: warning: Function parameter or member '3' not described in '__alloc_size'
> include/linux/slab.h:644: warning: expecting prototype for krealloc_array(). Prototype was for __alloc_size() instead
> include/linux/slab.h:660: warning: Function parameter or member '1' not described in '__alloc_size'
> include/linux/slab.h:660: warning: Function parameter or member '2' not described in '__alloc_size'
> include/linux/slab.h:660: warning: expecting prototype for kcalloc(). Prototype was for __alloc_size() instead
> include/linux/slab.h:723: warning: Function parameter or member '1' not described in '__alloc_size'
> include/linux/slab.h:723: warning: expecting prototype for kzalloc(). Prototype was for __alloc_size() instead
> include/linux/slab.h:734: warning: Function parameter or member '1' not described in '__alloc_size'
> include/linux/slab.h:734: warning: expecting prototype for kzalloc_node(). Prototype was for __alloc_size() instead
> include/linux/slab.h:1: warning: no structured comments found
> 
> Introduced by commit
> 
>   04ba82afbbf3 ("slab: add __alloc_size attributes for better bounds checking")
> 
> -- 
> Cheers,
> Stephen Rothwell



-- 
Kees Cook
