Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BF52244EDD
	for <lists+linux-next@lfdr.de>; Fri, 14 Aug 2020 21:33:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728282AbgHNTdb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 14 Aug 2020 15:33:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728281AbgHNTda (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 14 Aug 2020 15:33:30 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A776AC061386
        for <linux-next@vger.kernel.org>; Fri, 14 Aug 2020 12:33:30 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id k18so5028466pfp.7
        for <linux-next@vger.kernel.org>; Fri, 14 Aug 2020 12:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ey8/Fm62yA69VDTP+dvWoy3O2dAA0rRRCZubzQVleFo=;
        b=BHZpQ4+tedr5vpu+mpUEcEXgLxqHMn/DvPlK0MlQjiHyCAdgY269/pJVHoQZfMaqu9
         APQ+XNNf5LzUFlTeV+/We1maNBCTfXMDeBH9vurCDUu3HZi9GOdh7ALjhDCTcF+l23nD
         T+wNAfPCb01+zjc10BOhiDqyiU6R3Akw20Uzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ey8/Fm62yA69VDTP+dvWoy3O2dAA0rRRCZubzQVleFo=;
        b=opG3LgLTJfErZKoI7PaVq+UNN4AWDOkQTrCWoXj/v+zYiI/nk6uLjEOfExbVWCfISw
         WIYvZpSUsVcxax061dvHWkao0KmEizJT8Cli2FvIrgzYNNTNp2zH4/KMDNzZxzygdKR6
         smvhg1LOT3QEYUKPbAvML7M0BNimgth6YwG8b+xSGmfsucwXbM30KgjflOFf8UMzGSGw
         imUj+Hfwuo9pTYB3WwOC5Lrc8NhKVIFqEuOQoj4nvp9klOBgoTItC2+uESoZ+5p5YxXE
         tzM9zf1kVgIRIbWgOCuN0R9ry0q4z6pQkXR0UDVj9GEYvq+N4lMBFhIyQpCtYnTiEB7N
         Jghw==
X-Gm-Message-State: AOAM531g6B7qqBpQ7YEIpTEiJmSHQE7L2ILKPa4SIt4JlTfV+dR8cIe2
        MDiXvwKjdqtJypeYTTrw8VDGew==
X-Google-Smtp-Source: ABdhPJzgTMqEKI8jGXe4/NUgxtkgxyGheD4X0dXJofWtyFmaEghjE9ugM6R7W1x5mrbxyJTf+kZtkA==
X-Received: by 2002:aa7:9a88:: with SMTP id w8mr2742321pfi.88.1597433610242;
        Fri, 14 Aug 2020 12:33:30 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a5sm9050420pgb.23.2020.08.14.12.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2020 12:33:29 -0700 (PDT)
Date:   Fri, 14 Aug 2020 12:33:28 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Ingo Molnar <mingo@kernel.org>
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: new build warnings after binutils update
Message-ID: <202008141232.A5A5D8C7@keescook>
References: <20200811143130.0ca95b8d@canb.auug.org.au>
 <CAMj1kXGvfjO_e7AgurJ-81o6e4rBC8HkXi3Kkb+ZZfy-MoKcyQ@mail.gmail.com>
 <20200814102206.GB2367157@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200814102206.GB2367157@gmail.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Aug 14, 2020 at 12:22:06PM +0200, Ingo Molnar wrote:
> > [0] https://lore.kernel.org/lkml/20200731202738.2577854-6-nivedita@alum.mit.edu/
> 
> It all looked good to me but was a bit late for v5.9, will pick up 
> after -rc1.

Excellent! Thank you. I'll base the orphan series on x86/boot now. Once
I send a v6 (there are a few more things to tweak), can you carry that
in -tip as well (it includes arm and arm64 as well, all of which depend
on several asm-generic patches). Or would you prefer I carry the tree
separately?

-- 
Kees Cook
