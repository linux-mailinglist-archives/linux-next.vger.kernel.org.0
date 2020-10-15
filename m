Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7CA028F964
	for <lists+linux-next@lfdr.de>; Thu, 15 Oct 2020 21:28:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391533AbgJOT2R (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Oct 2020 15:28:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391528AbgJOT2R (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 15 Oct 2020 15:28:17 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44F37C061755
        for <linux-next@vger.kernel.org>; Thu, 15 Oct 2020 12:28:17 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id 144so21824pfb.4
        for <linux-next@vger.kernel.org>; Thu, 15 Oct 2020 12:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AMxq/RwNaZWayup8hauJHp0xGa8b+I81wo5Pu2yR8ac=;
        b=PNOK+7k9nLNbWKtO0/Q6Zen9VFo9LNa+pJYVLC0Jf8ef6FxXEhsSLYZyFQuSrsvxk5
         jUlpnsOLnpMkzbx3QNT5fE1NRIBfNXTzugrGGsEYjfA8iwZPvn8UReFVVRaswDdQwavb
         ZupPllA4+dqX1oP8BHrM+GbWIuPYvufcWHEqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AMxq/RwNaZWayup8hauJHp0xGa8b+I81wo5Pu2yR8ac=;
        b=GzpNUbmKAZlF/kaHWjsUxnWUAk/XmkPikCO7Ur1mwTLMZ5x77cTsRewXImzrCGsDfW
         L/ZJcREet+/P5qOJdggpzkxf/OuH0VxFJ/0Tmmww2aY+JH0aJWUpu48U8n2Xz2D1hvSA
         AEJQoCh7373CyTzP7vxAVF6mvNQMTwYrq5KEIk7hfqOjz2zvTTmKcMx/Th0QeDfMeNVk
         wc4xfU7DwFGqBqNv1CtLOKVHmsnhlBjSa5o30rtfxqfkvw5hVWhamP9dbonSRhOmSkcF
         PIopy2wPUJUIFtPzzw4ffMB87R2PfMoudbJ/syj9qZqOwK7oe2L6MCjqDJ5M89eYRhdJ
         LHgg==
X-Gm-Message-State: AOAM533cVJrFHGPD+Ldjg+YOXBuyejvW5BEnok7mlpxZ+70NYm39lEIv
        C4l1DBJZ2EQxm9g39gvTx6LWaA==
X-Google-Smtp-Source: ABdhPJxAb2dbhIWseZL7XHHx/FXpMP60Lig41n9UonyGLj8JxrAaRG+bSwetn/MdvvctxmkU0h+PHg==
X-Received: by 2002:a65:5a0d:: with SMTP id y13mr94996pgs.436.1602790096823;
        Thu, 15 Oct 2020 12:28:16 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id b4sm54688pjz.51.2020.10.15.12.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2020 12:28:15 -0700 (PDT)
Date:   Thu, 15 Oct 2020 12:28:14 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Christian Borntraeger <borntraeger@de.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Christoph Hellwig <hch@infradead.org>,
        linux-kernel@vger.kernel.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>
Subject: Re: autofs crash with latest linux-next
Message-ID: <202010151226.7382E03@keescook>
References: <yt9d1ri3nakg.fsf@linux.ibm.com>
 <8a4c7324-4637-7f25-82b6-2fd30aacb73e@de.ibm.com>
 <20201014071547.GA2459@kozik-lap>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014071547.GA2459@kozik-lap>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Oct 14, 2020 at 09:15:47AM +0200, Krzysztof Kozlowski wrote:
> I hit this since few days as well. Although the bisect points to the
> merge, the issue looks like a result of mentioned commit 4d03e3cc5982
> ("fs: don't allow kernel reads and writes without iter ops").
> 
> The __kernel_read() last argument 'pos' can be NULL and it is
> dereferenced here (added by the commit):
> 
>  525 ssize_t __kernel_write(struct file *file, const void *buf, size_t count, loff_t *pos)
> ...
>  547         kiocb.ki_pos = *pos;
>  548         iov_iter_kvec(&iter, WRITE, &iov, 1, iov.iov_len);
> 
> 
> The __kernel_read() is called with NULL in fs/autofs/waitq.c:
> 
>  45 static int autofs_write(struct autofs_sb_info *sbi,
>  46                         struct file *file, const void *addr, int bytes)
> 
> ...
>  54         mutex_lock(&sbi->pipe_mutex);
>  55         while (bytes) {
>  56                 wr = __kernel_write(file, data, bytes, NULL);

I think the thread here is the same thing, but you've found it in
autofs...
https://lore.kernel.org/lkml/CAHk-=wgj=mKeN-EfV5tKwJNeHPLG0dybq+R5ZyGuc4WeUnqcmA@mail.gmail.com/

-- 
Kees Cook
