Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 406193F6D3D
	for <lists+linux-next@lfdr.de>; Wed, 25 Aug 2021 03:59:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235667AbhHYCAR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 24 Aug 2021 22:00:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234840AbhHYCAR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 24 Aug 2021 22:00:17 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66E67C061764
        for <linux-next@vger.kernel.org>; Tue, 24 Aug 2021 18:59:32 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id q68so4487120pga.9
        for <linux-next@vger.kernel.org>; Tue, 24 Aug 2021 18:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XsgT98Ef1PFv4QYUD3OhXp4FkD4LKke0u8lQs/ffn8Q=;
        b=DcDV8C8M3T2uUhg8nOJpVsUxw+cJcIjseorOM1zBj41KvGzri0N2++qgnw6tDho5F2
         m7+ij+2L1gJCgnBm5mi44PjcJkNlq0OWott45dddW5hL9WVyZfaVxSowcxlEYqvxk2qn
         wa4IwawFk2HIAUZW5ELhDCIzPMp6Z3mG9cXbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XsgT98Ef1PFv4QYUD3OhXp4FkD4LKke0u8lQs/ffn8Q=;
        b=WzFCFv+oHB4eh8DXcehfln/T2kTyh7wVWpS4MR6jcQBsEYbZzWJGBhVU4xuk6zU6se
         8iKwLb2vwPjo9ifYWjJUSJdrhQq1rI+V1yTthoFnXwHzm3q7rdwJyGDNTXMrpEnGOmKH
         3y1IrbGNhZMjKz2jfilZcQMOczNkyVxLNbmBlPP9IKDzuJswfX1A+T1cW8OkHD6j41Cn
         gm4dOt5CpCClMUWukMqpCcPDXO0ALLJLyeGUxDB/dtQ/Bl7vnitwWDL7d5rkzewRQTj9
         cxV1DBITBsBFBv4P6Tp/2cpLPYP7Jb07gM75bFurJ6ZoO8Ue9XtfY0zLpo7Aek5TXgfN
         kulQ==
X-Gm-Message-State: AOAM530M5W9KRjlPG1g76EPimWLIY6oB6yGwR5zB4BU/1YH5YImVAcnk
        U78J5EEm3y4FFZcawpRUpEBhIQ==
X-Google-Smtp-Source: ABdhPJxOeAVwClgTWACcAF9l0rUSeBXNU4Dxyecx84D2J9hQuBfaO7kafkVhde3oIo4ITr5kHqGg2w==
X-Received: by 2002:a65:690c:: with SMTP id s12mr39938967pgq.401.1629856771855;
        Tue, 24 Aug 2021 18:59:31 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 20sm20893700pfi.170.2021.08.24.18.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 18:59:31 -0700 (PDT)
Date:   Tue, 24 Aug 2021 18:59:30 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nathan Chancellor <nathan@kernel.org>
Subject: Re: linux-next: Tree for Aug 20 (Wno-alloc-size-larger-than)
Message-ID: <202108241858.63C1FBC1@keescook>
References: <20210820192615.23e2e617@canb.auug.org.au>
 <2706a406-9f72-7df1-03f6-f8e852897eb2@infradead.org>
 <202108202248.921E8C66@keescook>
 <8b9cb816-9d8a-2633-1afa-f5c4597a8314@infradead.org>
 <20210823203742.5169ad54@canb.auug.org.au>
 <66615de5-4acb-8d85-6d69-ddd0b9609348@infradead.org>
 <20210824115859.187f272f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210824115859.187f272f@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Aug 24, 2021 at 11:58:59AM +1000, Stephen Rothwell wrote:
> Hi Randy,
> 
> On Mon, 23 Aug 2021 18:24:44 -0700 Randy Dunlap <rdunlap@infradead.org> wrote:
> >
> > This is just weird. What I am seeing is that for every source file
> > where gcc emits a warning: it then follows that up with this
> > >> cc1: warning: unrecognized command line option '-Wno-alloc-size-larger-than'  
> 
> I see the same, as well as:
> 
> <stdin>:1515:2: warning: #warning syscall clone3 not implemented [-Wcpp]
> cc1: warning: unrecognized command line option '-Wno-alloc-size-larger-than'
> 
> But only on my gcc 7.3.1 builds (the rest are gcc 10).
> 
> > Smells like a gcc bug to me.
> 
> Yes
> 
> Also noted here: https://github.com/DynamoRIO/drmemory/issues/2099 (second comment)

Wow, this is really weird. Okay, thanks for the pointers. I'll keep
investigating. I may need to version-limit the use of __alloc_size,
though I'd rather not. We've been able to depend on has_builtin() nicely
for a while now. :P

-- 
Kees Cook
