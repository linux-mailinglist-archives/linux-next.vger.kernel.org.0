Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E1B4386FA9
	for <lists+linux-next@lfdr.de>; Tue, 18 May 2021 03:53:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238817AbhERBzH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 17 May 2021 21:55:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237984AbhERBzG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 17 May 2021 21:55:06 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AD80C061573;
        Mon, 17 May 2021 18:53:49 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id k5so4670945pjj.1;
        Mon, 17 May 2021 18:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WMZUpa9Z0BMcmL5mgX90Fhx+k+V88TdK0ER3AFCI+UM=;
        b=QHqj6UarJ5K4zPbsjdLabFCFPxC0LUTdUej6wmQmpvW3eOpiSG41nDwXrm4pDGlhAi
         lm+r816X2wkL3rttt5zhmL1VMNSlC+g7tbufzcWQ3/HPGkOeynG8GCezBZ3NHnf1YXPT
         DNVKSO8kgY3fV/NPfwyJ/7Bvx0sI++Q2Yk9Q4RBw/KZGtl7T3Pe+eKkRPjxigv4Hqtji
         UplcFXf6mN+5gjySbfyFtmNoa5oqdgV5rn7d5p1jQB84qrFOllY8KwbHQFOqK2+A0l5g
         3ta1sNKps6+uVfjq5giBNUmYu9f08S8svVc1Nv+3ayf8a1UQ36iD4fyDtMKREETQ+IYQ
         fbJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WMZUpa9Z0BMcmL5mgX90Fhx+k+V88TdK0ER3AFCI+UM=;
        b=sA5qYvSPiXT2Ry178Nt+Awncm+LjNkodlJkTMUTdAEHmflS22RwuoiYsaFUIOcHBtZ
         LnOKLY6ij2r0lXQBZB9pAzdm5Sr0c/HxgfRb1EZqtS5c0UHudAK8VRglwZNkhiw/Czpk
         FODhn+ftqZ3NkXFw5iKjSGTDAd2OBI8NvrpsWfBn8M2VYMNwDuc9IfU1F230JiPRnANz
         KkkB8mLn7dwso+JTplK5lk9yiMGMsn2YyKsa7X7vLJi4CZEJOl/SlfOxbYxIP6b4oqg1
         4jMkFP0+hZD5BIbLOKZVE3YIxUMgxVZhPfFGgefpm2NAntHdE49JcNwJLYKL5/y3vQj2
         pv8w==
X-Gm-Message-State: AOAM531oBHGDbCz27C7jYXDdsshjsT80poVB/Wpf6eKSQIndoeciHD1P
        wgz95ioRmLS3Q430WWG9Hjk=
X-Google-Smtp-Source: ABdhPJzkinv+447YJDcWy06M/L4qaHzK2r5pFhCP3z7cw7xUO9ibpVRqfJoQSYV5bOqn/RZFJAN7nw==
X-Received: by 2002:a17:90b:4b0d:: with SMTP id lx13mr2623048pjb.152.1621302828982;
        Mon, 17 May 2021 18:53:48 -0700 (PDT)
Received: from hyeyoo ([183.99.11.150])
        by smtp.gmail.com with ESMTPSA id u22sm11245367pfl.118.2021.05.17.18.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 18:53:48 -0700 (PDT)
Date:   Tue, 18 May 2021 10:53:41 +0900
From:   Hyeonggon Yoo <42.hyeyoo@gmail.com>
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Vlastimil Babka <vbabka@suse.cz>, akpm@linux-foundation.org,
        iamjoonsoo.kim@lge.com, rientjes@google.com, penberg@kernel.org,
        cl@linux.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        naresh.kamboju@linaro.org, clang-built-linux@googlegroups.com,
        linux-next@vger.kernel.org, ndesaulniers@google.com,
        lkft-triage@lists.linaro.org, sfr@canb.auug.org.au, arnd@arndb.de,
        Marco Elver <elver@google.com>
Subject: Re: [PATCH v3] mm, slub: change run-time assertion in
 kmalloc_index() to compile-time
Message-ID: <20210518015341.GB84628@hyeyoo>
References: <20210511173448.GA54466@hyeyoo>
 <20210515210950.GA52841@hyeyoo>
 <41c65455-a35b-3ad3-54f9-49ca7105bfa9@suse.cz>
 <YKC9CeAfw3aBmHTU@archlinux-ax161>
 <20210518003859.GC80297@hyeyoo>
 <a1287a21-bcbb-77ed-c88d-f5890b785213@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1287a21-bcbb-77ed-c88d-f5890b785213@kernel.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, May 17, 2021 at 05:43:22PM -0700, Nathan Chancellor wrote:
> Ah sorry, that should definitely be >= :(
>
> That is what I get for writing an email that late... in reality, it probably
> won't matter due to the availability of 11.0.1 and 11.1.0 but it should
> absolutely be changed.

> I have not given Nick's patch a go yet but would something like this be
> acceptable? If so, did you want me to send a formal fixup patch or did you
> want to send a v4? I have no personal preference.

I think fixup patch patch will be better as we can undo it later.
I don't think Nick's patch is needed because that code is not related with
clang version, and we don't need that code even in clang 10.

then is there something I can help for now?

thanks,
Hyeonggon


