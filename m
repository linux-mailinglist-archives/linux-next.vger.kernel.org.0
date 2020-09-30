Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C548627EEC6
	for <lists+linux-next@lfdr.de>; Wed, 30 Sep 2020 18:18:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731036AbgI3QSD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 30 Sep 2020 12:18:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725800AbgI3QSD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 30 Sep 2020 12:18:03 -0400
Received: from mail-oo1-xc43.google.com (mail-oo1-xc43.google.com [IPv6:2607:f8b0:4864:20::c43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E0D5C061755
        for <linux-next@vger.kernel.org>; Wed, 30 Sep 2020 09:18:01 -0700 (PDT)
Received: by mail-oo1-xc43.google.com with SMTP id c4so638170oou.6
        for <linux-next@vger.kernel.org>; Wed, 30 Sep 2020 09:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QY2l/Yt+N6Qm5zwEsafOSNC/Vn5PVtgIOgVEBv2bpzc=;
        b=enqjfInlrBuTD//8bd1nIYeKHK/pBJcmYVk1pRtxQAJfynhwLhsAbwJu/a8NGRTBng
         EPXUmFjbMGVH3UDVYZRS2LyQi7OmXp+RLZbpPOzDU6pdcLQRnsiOtS+sh9A93BUBwh3N
         zkVrB6Q0VSXEBP2FcH4Spiaq8QDmQpIMgkK/VoyLy6G7J4xw3Z8my9GrNyUo6OtP0ouE
         GnIXWKIDIW8mY4gIJqZOW4d7ko3aarGG32xxla4i7ivAhHS3jmDA18ZzjMzvT4K3K4rg
         Eq/XE+0/52E4tDpTOxwoVFRMD0P3+qaSZHWxqD5ivAXZa9gZ9u/syditveIyoiT/pg8j
         J4Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QY2l/Yt+N6Qm5zwEsafOSNC/Vn5PVtgIOgVEBv2bpzc=;
        b=tJPXRTa+IVdYuMR0gOBFSBdJIgfyHGMy58uz9+efsU5ZDJxFaklpD1/KM168V+WDnA
         LJeAe0CBJQYx2BcCrvj32OVhcVMWL9K7A/Bj3sYw8qRFFR6verU5UTIUZ/R2GW7TLJ0w
         zNvMl6QtKquuQ+BIsQdEk/2v9r0PgaWDvhidhXxMjJK9tHe0zaEhh8k6jZipGePVrecP
         J2eXzWfYOJlMQkeviIZBnEDxBk9U+VnnGW372iaHZsAWPNuBxPTw863f0B7SkZ9I04it
         a2f3z93US/hp10zpJ2/CvlmSktC6sThKk5G1gfqnnf4002nG+xb3Frsz9fdtq+c0zRcS
         u+bw==
X-Gm-Message-State: AOAM531OfD56juUCMw4D4K8UkXRBA5NUSpNMiWWSLqUTTLTPL8P9mLXu
        hCmkYRyMfGuvBkmJILWDLLSLS809fBgB6ct7LWWiSQ==
X-Google-Smtp-Source: ABdhPJwwfh1/zkpRwXrKHRDJQHq/uW5ADaFJO6+Jcorf/fVowmls8HVvF/f/Gsmv2V+j+VYAEwZTs/wmqYcI/M6B+BM=
X-Received: by 2002:a4a:95f1:: with SMTP id p46mr2358703ooi.93.1601482680767;
 Wed, 30 Sep 2020 09:18:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200928202650.2530280-1-keescook@chromium.org>
In-Reply-To: <20200928202650.2530280-1-keescook@chromium.org>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Wed, 30 Sep 2020 21:47:49 +0530
Message-ID: <CA+G9fYtAWPuL=SEd3=K0WF3xVu6wwx4ETLadASxKKs0dMYbdWQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Extract run_kselftest.sh and generate stand-alone
 test list
To:     Kees Cook <keescook@chromium.org>
Cc:     Shuah Khan <shuah@kernel.org>, Hangbin Liu <liuhangbin@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Tim.Bird@sony.com, lkft-triage@lists.linaro.org,
        Anders Roxell <anders.roxell@linaro.org>,
        Justin Cook <justin.cook@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 29 Sep 2020 at 01:56, Kees Cook <keescook@chromium.org> wrote:
>
> v2:
> - update documentation
> - include SPDX line in extracted script
> v1: https://lore.kernel.org/linux-kselftest/20200925234527.1885234-1-keescook@chromium.org/
>
>
> Hi!
>
> I really like Hangbin Liu's intent[1] but I think we need to be a little
> more clean about the implementation. This extracts run_kselftest.sh from
> the Makefile so it can actually be changed without embeds, etc. Instead,
> generate the test list into a text file. Everything gets much simpler.
> :)
>
> And in patch 2, I add back Hangbin Liu's new options (with some extra
> added) with knowledge of "collections" (i.e. Makefile TARGETS) and
> subtests. This should work really well with LAVA too, which needs to
> manipulate the lists of tests being run.
>
> Thoughts?

I have tested this patch set on LAVA with full run and it went well.

>
> -Kees
>
> [1] https://lore.kernel.org/lkml/20200914022227.437143-1-liuhangbin@gmail.com/
>
> Kees Cook (3):
>   selftests: Extract run_kselftest.sh and generate stand-alone test list
>   selftests/run_kselftest.sh: Make each test individually selectable
>   doc: dev-tools: kselftest.rst: Update examples and paths
>
>  Documentation/dev-tools/kselftest.rst    | 35 +++++----
>  tools/testing/selftests/Makefile         | 26 ++-----
>  tools/testing/selftests/lib.mk           |  5 +-
>  tools/testing/selftests/run_kselftest.sh | 93 ++++++++++++++++++++++++
>  4 files changed, 124 insertions(+), 35 deletions(-)
>  create mode 100755 tools/testing/selftests/run_kselftest.sh
>
> --
> 2.25.1
>

- Naresh
