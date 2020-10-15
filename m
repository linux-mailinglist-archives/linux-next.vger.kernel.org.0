Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DFD928F9D0
	for <lists+linux-next@lfdr.de>; Thu, 15 Oct 2020 21:58:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392030AbgJOT6w (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Oct 2020 15:58:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:35614 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392022AbgJOT6w (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 15 Oct 2020 15:58:52 -0400
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 39D46206DD;
        Thu, 15 Oct 2020 19:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602791931;
        bh=2GblqwhkPAkE0TtieY26EFCAPXf3227FX1JmTZGYNnI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=XYfnpBcpyXx7zbOdzpxmxARFYf6LEuMwNeQhFznzqXISUOClvAW+YS298L/pb9Vl0
         Wsr9chYIILNU2NVUFCf01DIBICAzSdUSzSEhMEnBNgc0858QOpnnW01lkjK0xEOjeo
         DyKNNoWQZfJ8YOXUpu7cxa6AMbp7JTy5QKB6rXaA=
Received: by mail-ej1-f48.google.com with SMTP id p5so5409463ejj.2;
        Thu, 15 Oct 2020 12:58:51 -0700 (PDT)
X-Gm-Message-State: AOAM532V02dL9KTpgEixMPG8VvkwT+gQImBmz9atAaW650zKc/wCgqyl
        4L38i9jI/juisJaDdGOewxeCVD6m9Okb2dra8Yg=
X-Google-Smtp-Source: ABdhPJxkkJvixPoc0B4sIIS51XrG3mX1copKltHAJdzHHi0Oa9u3vkZKJAkpTi3TwucBewdkY/8Zr3IvJLtfpdPf3d0=
X-Received: by 2002:a17:906:6a07:: with SMTP id o7mr6275959ejr.454.1602791929686;
 Thu, 15 Oct 2020 12:58:49 -0700 (PDT)
MIME-Version: 1.0
References: <yt9d1ri3nakg.fsf@linux.ibm.com> <8a4c7324-4637-7f25-82b6-2fd30aacb73e@de.ibm.com>
 <20201014071547.GA2459@kozik-lap> <202010151226.7382E03@keescook>
In-Reply-To: <202010151226.7382E03@keescook>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Thu, 15 Oct 2020 21:58:37 +0200
X-Gmail-Original-Message-ID: <CAJKOXPd6nDi6x+iZ8jke-7qFb=DDjnStkQS9=0PfTZExA7i6jQ@mail.gmail.com>
Message-ID: <CAJKOXPd6nDi6x+iZ8jke-7qFb=DDjnStkQS9=0PfTZExA7i6jQ@mail.gmail.com>
Subject: Re: autofs crash with latest linux-next
To:     Kees Cook <keescook@chromium.org>
Cc:     Christian Borntraeger <borntraeger@de.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Christoph Hellwig <hch@infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 15 Oct 2020 at 21:28, Kees Cook <keescook@chromium.org> wrote:
>
> On Wed, Oct 14, 2020 at 09:15:47AM +0200, Krzysztof Kozlowski wrote:
> > I hit this since few days as well. Although the bisect points to the
> > merge, the issue looks like a result of mentioned commit 4d03e3cc5982
> > ("fs: don't allow kernel reads and writes without iter ops").
> >
> > The __kernel_read() last argument 'pos' can be NULL and it is
> > dereferenced here (added by the commit):
> >
> >  525 ssize_t __kernel_write(struct file *file, const void *buf, size_t count, loff_t *pos)
> > ...
> >  547         kiocb.ki_pos = *pos;
> >  548         iov_iter_kvec(&iter, WRITE, &iov, 1, iov.iov_len);
> >
> >
> > The __kernel_read() is called with NULL in fs/autofs/waitq.c:
> >
> >  45 static int autofs_write(struct autofs_sb_info *sbi,
> >  46                         struct file *file, const void *addr, int bytes)
> >
> > ...
> >  54         mutex_lock(&sbi->pipe_mutex);
> >  55         while (bytes) {
> >  56                 wr = __kernel_write(file, data, bytes, NULL);
>
> I think the thread here is the same thing, but you've found it in
> autofs...
> https://lore.kernel.org/lkml/CAHk-=wgj=mKeN-EfV5tKwJNeHPLG0dybq+R5ZyGuc4WeUnqcmA@mail.gmail.com/

Indeed it looks the same. Thanks for the pointer.

Best regards,
Krzysztof
