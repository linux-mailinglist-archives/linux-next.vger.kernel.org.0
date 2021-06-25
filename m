Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94B043B48F2
	for <lists+linux-next@lfdr.de>; Fri, 25 Jun 2021 20:47:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229816AbhFYStU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 25 Jun 2021 14:49:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbhFYStT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 25 Jun 2021 14:49:19 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4B1DC061574
        for <linux-next@vger.kernel.org>; Fri, 25 Jun 2021 11:46:58 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id v7so8625536pgl.2
        for <linux-next@vger.kernel.org>; Fri, 25 Jun 2021 11:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KgcXfUUuQCs0/iO26PCYoAGLqCAbhUEbyDxWxRQoxww=;
        b=PADYuEfVwFxDfjYMKOWL1f03SzIWUwC8XYvJ4X2L6FhEYqnzrvIECBZocVesj0SNuc
         446bFwK0ugtbTnbIhfwMj2W8E9yx5WHQZ3sLY7oXUl777eH7bPvcw5M6BiwDv/zCqEPo
         2q3BUsQ+dKtattDJh3XuSsZseXFQTPQjvd2WJe2Va68xjwxtqDLA+r7GHegAIO5fqXTy
         Bwh7NNSBT4Splsi4QB01sRWrDnv49gmLvVmVj4VXI7N020rmvwaKOZ9tS4fm4E8oRzsm
         NO1CLSqtONeXaE3v92X2FW/0SqK8gnZDL5D3CbisbXDYSX0mtekBXya48oDdqC1WJahR
         188g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KgcXfUUuQCs0/iO26PCYoAGLqCAbhUEbyDxWxRQoxww=;
        b=OCLaN/+Atgh3ShUz9WkmDx21Lg9xCqBmz7mI/2HZVjsSAHKcg8VznQQeZ5+ofirWFC
         cdQSKwV9AySw2CSpMFQW9qg8bjRMrs903XHhdSyUVLSeWxa4D5a8N2N2tJOQdSgx+Eq8
         yJkNCO2MRXqcGng0xLHvNIjPvOI+fZXZIDSYFepSbUhvqPrv62DX2KR2BCKnuvBlfUMX
         /hPWRQfwsEtqXrV4e/ZXjBxquGp7y+QDY+/MsSUDx5Mas1yCiwXCUboqmyDIO7Kb9Yf2
         rWUpBMN3XyW0HgZ2FGYJ9kokm0wG/MYPo2EyVprituU6/EPF+tbB9LYLvGiyCmaWKC0B
         hIOA==
X-Gm-Message-State: AOAM530rJ3YDKvzG+o0CIpihlTyVkaKkFQDHU+DH+BgUvazc9OTQZyc7
        hXWBiVUxVHfxlaPH1fZVdSnosPip45ih28xAM5j4BQ==
X-Google-Smtp-Source: ABdhPJxdEtEgzbqyiiIFrQrsnrWINaKaD3LnJ9eJXirP6xsYK8Bx2LwuHLSsY0ArMGJ1NtvLvN/v3ft5powYch+MsrM=
X-Received: by 2002:aa7:8e18:0:b029:2ec:a754:570e with SMTP id
 c24-20020aa78e180000b02902eca754570emr11850613pfr.38.1624646817919; Fri, 25
 Jun 2021 11:46:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210625195232.3a307e53@canb.auug.org.au> <CAGS_qxq4_G7dbefETo57hUZgD+A3QK7rxiY=Nk=m0xZGt35zGw@mail.gmail.com>
 <4f1fc11b-64a6-984f-ede3-d4ce5c0ac3e3@linuxfoundation.org>
In-Reply-To: <4f1fc11b-64a6-984f-ede3-d4ce5c0ac3e3@linuxfoundation.org>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Fri, 25 Jun 2021 11:46:46 -0700
Message-ID: <CAFd5g46jjCzRjRWL3oYSb9Xhe6VY8U=0-MfgG-Y=NxQNoK++vA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the kunit-fixes tree
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Daniel Latypov <dlatypov@google.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        David Gow <davidgow@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jun 25, 2021 at 11:12 AM Shuah Khan <skhan@linuxfoundation.org> wrote:
>
> On 6/25/21 11:53 AM, Daniel Latypov wrote:
> > On Fri, Jun 25, 2021 at 2:52 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >>
> >> Hi all,
> >>
> >> After merging the kunit-fixes tree, today's linux-next build (powerpc
> >> allyesconfig) failed like this:
> >>
> >> lib/kunit/executor.c:26:1: error: expected identifier or '(' before '+' token
> >>     26 | +kunit_filter_subsuite(struct kunit_suite * const * const subsuite,
> >>        | ^
> >> lib/kunit/executor.c: At top level:
> >> lib/kunit/executor.c:140:10: fatal error: executor_test.c: No such file or directory
> >>    140 | #include "executor_test.c"
> >>        |          ^~~~~~~~~~~~~~~~~
> >>
> >> Caused by commit
> >>
> >>    c9d80ffc5a0a ("kunit: add unit test for filtering suites by names")
> >
> > For posterity, David sent out a patch addressing this here:
> > https://lore.kernel.org/linux-kselftest/20210625111603.358518-1-davidgow@google.com/
> >
>
> It is all fixed now. When I applied this patch yesterday, I needed to
> fix merge conflicts. When I did that the newly added file was left
> behind.
>
> Build didn't find it since the file was in the repo. Oh well. So much
> for trying to save you a rebase.
>
> Sorry for the trouble. It should all be squared away now. Build and
> exec tested it for sanity.
>
> https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git/commit/?h=kunit-fixes&id=1d71307a6f94df3750f8f884545a769e227172fe

I just pulled and tested and can confirm it is working for me now.

Thanks!
