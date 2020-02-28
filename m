Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52101173046
	for <lists+linux-next@lfdr.de>; Fri, 28 Feb 2020 06:23:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726077AbgB1FXn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 28 Feb 2020 00:23:43 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39330 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbgB1FXn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 28 Feb 2020 00:23:43 -0500
Received: by mail-wr1-f66.google.com with SMTP id y17so1520825wrn.6
        for <linux-next@vger.kernel.org>; Thu, 27 Feb 2020 21:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2bzBaMImUUqw0L+J8P9rtSZngszN+fBGxhpIiKPJlto=;
        b=X+LQq/5dc1+WU7IMxHldrauMIk+LSaWcqEIzBnnvOGwtu4AX/Jo3G+X6SAqG2ohP+U
         qDue0EpDgQyxFA9Y+D15Tnbat/jxDMYUDj05V+b0NvlizGE+9e4sq/xwjzZDMO+JK/aP
         VdqS2/Di9VaYTjQjzfPeQ5+Rvr+zWnH/bYmJ+8dlQwJlISNKXjWXHTem7aTaU3NhKFY4
         Q11HFyXbV1D312U9lLyZUQB/Mc5/x5Bwnc+SsjaZTyPDcEvkKw5TY+qlYbED68s6TQqp
         9KD0mzO9o0Knmpuv28m/3/EGYG9tIfBUvvcwIKYtMaAvqnRrgjF34woBECr6wIlcYmxI
         MMpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2bzBaMImUUqw0L+J8P9rtSZngszN+fBGxhpIiKPJlto=;
        b=RDSCGdBP9nPGdmazNJ4F9A1id5aFPxjJQSNdoNH9O/pLkSPM5UDAePRf2QtC9F1wxT
         gSzz/xpru4XvNQ9SfwH9rJhnbhX9T/3OEscwBkIn2D1rnwBMxOlssEWGzbpHnXR9Z16s
         C8RzUsNchkZ/DerSGH/6wYeTIuOfLgyycGhnZhMlQ5PgJ/9j/Utu+js1yKyIsGGYyBtB
         Yt9UjHdWcjRovHdWKWzfJdcOPQafYyHIhEv6OTqVJU6ZCLS7nO8o7DxEL8/Dx+6vYZu2
         OD0KYtppjOB5a7euHAue+VE4w38q+6mUR72MhXA6oMHp5o0ECwa9Y7qqXTEafLQQtI08
         /ItQ==
X-Gm-Message-State: APjAAAU8pAxC//sam4OZP4G4EzHo01kP35v8D2m6FTpGpagtksmQTAZ7
        IUvT9UQi7DcStxnTj2mWQB3iXv15HoWTL5iAIfiJsA==
X-Google-Smtp-Source: APXvYqxtQywJ4Y9F6fMaFbR3Xwl/fYlSdJqjBEoT/9MknfP15UA5SIvrBQxjM1D5Jtq9JHmvNLdKKI2nE+J57dZxzMw=
X-Received: by 2002:adf:dfcc:: with SMTP id q12mr2820380wrn.171.1582867420797;
 Thu, 27 Feb 2020 21:23:40 -0800 (PST)
MIME-Version: 1.0
References: <20200228153532.1c0fa33f@canb.auug.org.au>
In-Reply-To: <20200228153532.1c0fa33f@canb.auug.org.au>
From:   Arjun Roy <arjunroy@google.com>
Date:   Thu, 27 Feb 2020 21:23:29 -0800
Message-ID: <CAOFY-A1C_VLqnjr3j6YUTvq_UM+6D8SvoYHJTJ7OYPdgoHTsWQ@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the akpm tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Feb 27, 2020 at 8:35 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the akpm tree, today's linux-next build (sparc defconfig)
> produced this warning:
>
> mm/memory.c:1463:12: warning: 'insert_page_in_batch_locked' defined but not used [-Wunused-function]
>  static int insert_page_in_batch_locked(struct mm_struct *mm, pmd_t *pmd,
>             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>
Well, that's certainly a step in the right direction if it compiles :)

I guess having this function be within the ifdef is the way to make
this warning go away.

I'll, er, make a v3 patch.

-Arjun

> Introduced by commit
>
>   4a879e02dd49 ("mm/memory.c: add vm_insert_pages()")
>
> --
> Cheers,
> Stephen Rothwell
