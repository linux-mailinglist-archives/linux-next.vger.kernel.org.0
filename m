Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EA1D139EC1
	for <lists+linux-next@lfdr.de>; Tue, 14 Jan 2020 02:10:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729238AbgANBKQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Jan 2020 20:10:16 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:37262 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729163AbgANBKP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 13 Jan 2020 20:10:15 -0500
Received: by mail-pg1-f194.google.com with SMTP id q127so5570608pga.4
        for <linux-next@vger.kernel.org>; Mon, 13 Jan 2020 17:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MuIq//wCZduhaibSe5/7hJSdzVgRZqtQMOj1BjJPoMI=;
        b=SQvzCTBn4LLS8Q9CzT8sA1qDOJ8VkKjMfUwbVDNSUA0tX3hZrm0WkpV/WhqdmjAHPD
         brbBybX4G9nflXxIIEAeoUxh5cWc5hbsn7sPNyXTeTgGiibchfrwdufAZRtYC5VFFUZ6
         cQbhcCGEZyeGCEKBK6hnZZxW5ngpun0A8PvTgqCgArxzzgDhEjkIWSzwnVSKnSYBW5Uo
         pba2KL34YtVeP783g46fUUVCefzyytk+Xq0/rRz2AukRa04uGt/tOXd59NqRh6esJsnK
         +q5+guqlvIgYo/J20T8aqnyQF8xGgSXuQEk5vDN1q+taj0OApxeRz8a6uBShVF2KtM8Z
         ezqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MuIq//wCZduhaibSe5/7hJSdzVgRZqtQMOj1BjJPoMI=;
        b=sU/0zcU95rKZ9AnToRAYuuSfu7+jM5jfxr4wlZGiT+tdY4cTUgS/bEzv0q5SwOeoKl
         1fVzRf2sqRuPOI4jmDZbZeSGJfoMHMZWadXR1JjtMMtT4xPukknoYZRIMbsvDPRKJ4uo
         M3yI2ixx/VGLTi8pRoV9ZrjChiX64WCbgjLFUHfxrvgVomiDWRRcHqN7iZBVY5QUqu8S
         Wrwfj9NIwgX09Cp+JkdK4fjBHfuq+DfwBSYMnHSQPC7TueKr0u6i3/121e8yAVBbSKLH
         RJEsr7xLInvB6cf9V5XxwbQRHblo3f3p3SQ7wJVw04xkDDmC7YxG9mSM9ZdxJWrp6r6u
         gEhw==
X-Gm-Message-State: APjAAAUwBb2sQQdgmYEU6AeVvtp1bHd7eFEQ25nCjX4KxrBfqosz+j9N
        X7NrDBgESPnlB4CcZoydS0GgRf71MFVI3UX/izkecA==
X-Google-Smtp-Source: APXvYqxTzPsgCrp/FhpOnGVwtu5xXbBt+F5nJ89uUP7Tfv62ZdI+z61Ccr6Na7E1+73rp1o09IfvgjZk9cycnSFTC44=
X-Received: by 2002:a63:597:: with SMTP id 145mr23090242pgf.384.1578964214716;
 Mon, 13 Jan 2020 17:10:14 -0800 (PST)
MIME-Version: 1.0
References: <20200113181457.209ab4a5@canb.auug.org.au> <eddaa93c-3bde-a9ed-5ee7-766f3cd51a43@infradead.org>
 <20200114104049.5244f612@canb.auug.org.au>
In-Reply-To: <20200114104049.5244f612@canb.auug.org.au>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Mon, 13 Jan 2020 17:10:03 -0800
Message-ID: <CAFd5g454Xgb-tnG-rBQ3fkCe2bsO7M8_dauOTpG3bxDjnxOX9A@mail.gmail.com>
Subject: Re: linux-next: Tree for Jan 13 (drivers/base/test/property-entry-test.o)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        KUnit Development <kunit-dev@googlegroups.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Alan Maguire <alan.maguire@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

+KUnit Development
+open list:KERNEL SELFTEST FRAMEWORK

On Mon, Jan 13, 2020 at 3:40 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Randy,
>
> On Mon, 13 Jan 2020 14:59:54 -0800 Randy Dunlap <rdunlap@infradead.org> wrote:
> >
> > on i386:
> >
> > WARNING: modpost: missing MODULE_LICENSE() in drivers/base/test/property-entry-test.o
> > see include/linux/module.h for more information
>
> Sorry, I missed that yesterday.
>
> Caused by commit
>
>   c032ace71c29 ("software node: add basic tests for property entries")
>
> from the pm tree interacting with commit
>
>   9fe124bf1b77 ("kunit: allow kunit to be loaded as a module")
>
> from the kunit-next tree.

Yes, the problem seems to be that the property-entry-test is turned on
when CONFIG_KUNIT is y or m.

From drivers/base/test/Makefile:
...
obj-$(CONFIG_KUNIT) += property-entry-test.o

It seems we can fix it just by adding the missing MODULE_LICENSE, but
I think there is a bigger question of whether we should let people do
this. Do we want to just let people have their tests run whenever
CONFIG_KUNIT is enabled? I am inclined to think no. It should be
possible for people to run their test and their test only.
