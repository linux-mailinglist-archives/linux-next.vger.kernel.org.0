Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1293232128
	for <lists+linux-next@lfdr.de>; Wed, 29 Jul 2020 17:05:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbgG2PFO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Jul 2020 11:05:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726054AbgG2PFO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 29 Jul 2020 11:05:14 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5642BC061794;
        Wed, 29 Jul 2020 08:05:14 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id j19so14379133pgm.11;
        Wed, 29 Jul 2020 08:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q8s238+wm9F1IJhTkTAY/ZokRIu+GY6YpE2anz77tJk=;
        b=bSoGmoEwHbHmE48riCiV6QggXgEnim/DiTVwmarNrYZTxCW/FmiMvypqSmLZF67CPv
         vAOusOOzzK12PzJIvEmEASlYDe3gu3bKf4Ua1XqnSuUu2HbTIUG3XYMEK7FyHgtcAEam
         8cikxlqeM8HHEfFC3FfVZr2bPzl2noCq9knpICVpNlzEtWHaZIlp4zofK3NrCmWPCJU/
         /8FXJWRggNaazS/1saZlyyUWZDa6Jc7JVmfYSrRqKkBfPIVq4KpnFIwIghNFqaX8WqGU
         rSlOlSzoMxKhJiX3VWeTSTm7NCABukRQHxkP4njYT9LG0alFmlcK+T4tfN3dmj8LSa/e
         /r3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q8s238+wm9F1IJhTkTAY/ZokRIu+GY6YpE2anz77tJk=;
        b=AOrrWvCdT0s6q0nYOqSoZtgH15lOWuywlnBFi32Mc2V5i9unUxMqfXYX3WW4rHN7s8
         3cxUA90pjcSNWz/XPOS53AG6aFyT2BPWdlSo5O3djy3UJKkEXuWJ3DyiAKyDX2+HZnPn
         tVtEnhOCaalCM2P5MN7/ZS4cOwLrObINh5z7tWnEJaa+hV9EmP6bla2GrttvOSYaDvQt
         hFNJEfl3ICw1Y+xC1nSax4j0SKdjdEgu9HGzhl1XFsVrzrsneZ6Di1xdc/TKTx3+0aIl
         v2dYvIQz6ak1YMdJbK3RxCXy3x/1hqua7tMMKTtM/zdfLIgPTX3UDDFeataEMQblmAO8
         dCHQ==
X-Gm-Message-State: AOAM532HsrJ3DZOvJ9wGcTWShZmNftYQXFNuzUBgCQ661kBXdYfR+48L
        VWkjFvPyhgmBeYKUBtnWfyrhXrFAc4YlI7avIt0=
X-Google-Smtp-Source: ABdhPJxzA3WCJcSNjIELiqutAzLN4MeMrJkvVwva6ZP9uUfAPtMI6KwIhG8+fSzawAmQAbLAcl6Mh/bENZ95JSl8Xc4=
X-Received: by 2002:a63:a05f:: with SMTP id u31mr29096846pgn.4.1596035113790;
 Wed, 29 Jul 2020 08:05:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200729210311.425d0e9b@canb.auug.org.au> <20200729114757.GA19388@gondor.apana.org.au>
 <20200729122807.GA7047@gondor.apana.org.au> <ed62ba67-0e1d-3fee-8c09-7750d5690be5@redhat.com>
In-Reply-To: <ed62ba67-0e1d-3fee-8c09-7750d5690be5@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 29 Jul 2020 18:04:57 +0300
Message-ID: <CAHp75VdbZu008RcxNhMysoqBs2FSPXWv+au_ROJ7FPVd0uOhtg@mail.gmail.com>
Subject: Re: [PATCH 0/2] locking/qspinlock: Break qspinlock_types.h header loop
To:     Waiman Long <longman@redhat.com>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Petr Mladek <pmladek@suse.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jul 29, 2020 at 4:35 PM Waiman Long <longman@redhat.com> wrote:
> On 7/29/20 8:28 AM, Herbert Xu wrote:

...

> This patch series looks good to me. I just wonder if we should also move
> ATOMIC64_INIT() to types.h for symmetry purpose. Anyway,

Same question here.

-- 
With Best Regards,
Andy Shevchenko
