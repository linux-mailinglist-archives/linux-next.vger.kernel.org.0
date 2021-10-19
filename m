Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AA0E4340B0
	for <lists+linux-next@lfdr.de>; Tue, 19 Oct 2021 23:40:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbhJSVnA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 Oct 2021 17:43:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbhJSVnA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 19 Oct 2021 17:43:00 -0400
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB5C1C061746
        for <linux-next@vger.kernel.org>; Tue, 19 Oct 2021 14:40:46 -0700 (PDT)
Received: by mail-il1-x12f.google.com with SMTP id k3so19942045ilu.2
        for <linux-next@vger.kernel.org>; Tue, 19 Oct 2021 14:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LClSOOpg7kPxuR3kD0ycxlchBsf5cxCr8/0lGkihBXg=;
        b=iDZOrxhkzi9KAxSkFnKa7yI2APgyUbWXaQMORM/t46Tt3iRqOnj5O86X4wlPFmQrW3
         Ja4VrQHqVTy84YE8jYWI6ehRERvfJwDqs8u/vCNEsBch5Osd9WyEvCPVhphzAHM8KFxr
         JmVpl2eWz7Kr9yI33HwlV5Hn6Sida0B7qIR4QvzDEZ+oi5Zq2Ux67bt9klL3uYc5dyED
         ZGAFx0BZLk4f6OtcarA2kO7RWN0yUuibyOJgL4bpaolTISG6aVLhczg+tGRwHD1y7DWi
         2dwgnKrt1TwQGFjH73j8plVN+LTxEHZRXkD4l8KU/pbJwTaZxcA2p91w77wed0s+W8Qx
         wUSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LClSOOpg7kPxuR3kD0ycxlchBsf5cxCr8/0lGkihBXg=;
        b=NWsgAGOaZ7baPn1gUZGR57HHDCdhZXF5P1KN8UKdNLsfQ8/j+PChpH43CPM+DZo39p
         DgdiekVCcVIVIi5XTndsq+anvmymL1fqwcFFVea0+v69mxHLhnSjn1LShG6YY3lShOuD
         izbkaj15+7jLC07672zlR3q6KBasRaQNJ0tHshwCpgWH5vrP7EeA0w17HmcJkArQzZx3
         efxuYBn8CaFffJiICl695r7rid/iaJpphd88h7tU+R/CIKbenKrNZs6yFgAByYbAmoDQ
         oeXiFQuBrww6hl9xxW0egL5ed8g59ue3PRO2ewd6IPwSHSo9EKCbH49AeynFtJFhVM1j
         0Rrw==
X-Gm-Message-State: AOAM531727y4nOrj5CUKcsHuVnPALsCcMmSG+C+ZSwsGysomWAwd6jJQ
        pb3/jfdot3Pn/aVq4x0SVgQuMKGtT1blf51I2d03jwf4uv7COQ==
X-Google-Smtp-Source: ABdhPJwKRMTXBrLdex/0NTGSS+fexan0RRUgWuiUTpEp2+ZcRfsPlkR/O3Dfs6YTDtfthu6rsJH1k8+25ug0T+1Ksew=
X-Received: by 2002:a05:6e02:148f:: with SMTP id n15mr19718255ilk.121.1634679645712;
 Tue, 19 Oct 2021 14:40:45 -0700 (PDT)
MIME-Version: 1.0
References: <20211008152930.03787395@canb.auug.org.au> <ba01fb13-e1a1-299e-9a7b-ccdeaeef267a@linuxfoundation.org>
 <009188fd-a744-fb50-a9d2-ca1ce9b7905f@linuxfoundation.org>
In-Reply-To: <009188fd-a744-fb50-a9d2-ca1ce9b7905f@linuxfoundation.org>
From:   Daniel Latypov <dlatypov@google.com>
Date:   Tue, 19 Oct 2021 14:40:34 -0700
Message-ID: <CAGS_qxqeFfrqptjgbX9D2boCxm-5fUfc_1u15v=YQS6-9duRRw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the kunit-next tree with the
 kunit-fixes tree
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Oct 19, 2021 at 2:26 PM Shuah Khan <skhan@linuxfoundation.org> wrote:
>
> On 10/8/21 10:31 AM, Shuah Khan wrote:
> > On 10/7/21 10:29 PM, Stephen Rothwell wrote:
> >> Hi all,
> >>
> >> Today's linux-next merge of the kunit-next tree got a conflict in:
> >>
> >>    tools/testing/kunit/kunit.py
> >>
> >> between commit:
> >>
> >>    d8c23ead708b ("kunit: tool: better handling of quasi-bool args (--json, --raw_output)")
> >>
> >> from the kunit-fixes tree and commit:
> >>
> >>    6710951ee039 ("kunit: tool: support running each suite/test separately")
> >>
> >> from the kunit-next tree.
> >>
> >> I fixed it up (see below) and can carry the fix as necessary. This
> >> is now fixed as far as linux-next is concerned, but any non trivial
> >> conflicts should be mentioned to your upstream maintainer when your tree
> >> is submitted for merging.  You may also want to consider cooperating
> >> with the maintainer of the conflicting tree to minimise any particularly
> >> complex conflicts.
> >>
> >
> > Thank you for the fixing it up. I will fix this up in the kunit-next once
> > the kunit-fixes pull request goes out.
> >
>
> I fixed the merge conflict in kunit-next tree after rebase to Linux 5.15-rc6.
> There is no need to carry this fix.
>
> Daniel! Please review to see if it looks good. It was very minor fix-up.

ff9e09a3762fbd7aba83cfd1530972b57ae52b3b looks good to me.
Thanks, Shuah!

To be extra safe, I checked

Test that test-level filtering and hermetic testing work as expected
$ ./tools/testing/kunit/kunit.py run --run_isolated=suite '*ex*.*skipped*'
$ ./tools/testing/kunit/kunit.py run --run_isolated=suite '*ex*.*s[iu]*'

kunit.py's unit test:
$ ./tools/testing/kunit/kunit_tool_test.py

Type-checkers:
$ pytype ./tools/testing/kunit/*.py
$ mypy ./tools/testing/kunit/*.py  # this had the expected errors

>
> - from typing import Iterable, Sequence
>   -from typing import Iterable, List
> ++from typing import Iterable, Sequence, List
>
> thanks,
> -- Shuah
>
