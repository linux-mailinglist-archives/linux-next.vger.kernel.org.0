Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF17C355A6F
	for <lists+linux-next@lfdr.de>; Tue,  6 Apr 2021 19:32:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240280AbhDFRdC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Apr 2021 13:33:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbhDFRdC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Apr 2021 13:33:02 -0400
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3539C061756
        for <linux-next@vger.kernel.org>; Tue,  6 Apr 2021 10:32:52 -0700 (PDT)
Received: by mail-io1-xd2e.google.com with SMTP id x16so16444956iob.1
        for <linux-next@vger.kernel.org>; Tue, 06 Apr 2021 10:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Sn7eNVjhwGVeUQHooMwpCkybSStg97YRL/7YW6+8S5g=;
        b=d8tLbxn3hpAhshTUubDh+pFOZIC5ByibaqvqSp+367kP2VTYmgf1HfQhjW+k66Phu2
         qfnuUmliqKLe1e3LDhaE6LZKq1n1ZU/kidNCvAINzOw+QmZ+6FpGza3+lu5cxCrLwYac
         yA2gwgl2UdQFEuOcYOeI7JILyAmPBXO1V6MQzfV+nMsmj0mdQ0DVvy1PyJK2tyYSZCgv
         kOj0eLqwNE50CghcD2bJ+hGfUosR92XWM5qMMTvkT4vBF32TLEvBhPEln3hFkqCioV+f
         q2UFyiq0boEGVWOg5yQoKTAlGwHs3tDZPQWxkijyZiXnohNE11aueoExmLvidfIoDl77
         YO1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Sn7eNVjhwGVeUQHooMwpCkybSStg97YRL/7YW6+8S5g=;
        b=GJGolQFzKiYtAzeHBobqLJOynTR3maFv7MefezGQlYYw0KGXP6LQDWjSv72y1UmunU
         wpLCw8Ytbj5WYnr09MvIpnOd7ijScsKHjViyMyRhJXFkAdlgqql9nU4G2AykNQkTruMI
         d5gOSz7l48xdJftC3xCyIDhIz0jeZbafKhWzoJOLZ9851TsMkwMMArkW5AP0JFH9qoQW
         PQSAW/ivswppiisxYes/Iu6X0a0q9546qFf4Pk49FU4ITZKJBfvbPiTCNSo/zHrdf9yb
         jLwxDgeuDTGZh4BOoN3w/I2KEPnR0zfJ1Z5VXzEx849AhhBIj0ETXm5yTfkCuDnF9Wed
         BkeA==
X-Gm-Message-State: AOAM531i/dWKWNoed17/2bWkNg92UCCU+QaCFtraZa5hqRwkEs2pWKql
        OQK79F9IplPzpNQlsCgp2tf12U5jFttm5YH5TdwHjg==
X-Google-Smtp-Source: ABdhPJy32AglK1hAaezC+y+WwRlu+kiKw5qV9ZjDk/G7wriqcq0j1vmY1/VHAYSsA/acnM8BDrgMpDo4VBV6mnxb3R4=
X-Received: by 2002:a05:6602:2432:: with SMTP id g18mr25105828iob.86.1617730372258;
 Tue, 06 Apr 2021 10:32:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210406202357.6e4bfeac@canb.auug.org.au>
In-Reply-To: <20210406202357.6e4bfeac@canb.auug.org.au>
From:   Daniel Latypov <dlatypov@google.com>
Date:   Tue, 6 Apr 2021 10:32:41 -0700
Message-ID: <CAGS_qxpLOMKCS8QwOQN3ZFY-XO6MvXQOdND0pd6wYXw21CTEYA@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the kunit-next tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        Uriel Guajardo <urielguajardo@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Thanks for the catch.
Should be addressed by
https://lore.kernel.org/linux-kselftest/20210406172901.1729216-1-dlatypov@google.com/

When I was testing the CONFIG_KUNIT=n case, I added it to a file that
wasn't being compiled (CONFIG_UBSAN=y is not sufficient for
lib/ubsan.c to be compiled...).

On Tue, Apr 6, 2021 at 3:24 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the kunit-next tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>
> In file included from lib/kunit/test.c:10:
> include/kunit/test-bug.h:22:28: warning: '__kunit_fail_current_test' defined but not used [-Wunused-function]
>    22 | static __printf(3, 4) void __kunit_fail_current_test(const char *file, int line,
>       |                            ^~~~~~~~~~~~~~~~~~~~~~~~~
>
> Introduced by commit
>
>   359a376081d4 ("kunit: support failure from dynamic analysis tools")
>
> --
> Cheers,
> Stephen Rothwell
