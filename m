Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98A7E2DCE92
	for <lists+linux-next@lfdr.de>; Thu, 17 Dec 2020 10:43:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726533AbgLQJlt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Dec 2020 04:41:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726155AbgLQJlt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Dec 2020 04:41:49 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA92BC061794;
        Thu, 17 Dec 2020 01:41:08 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id t8so18680757pfg.8;
        Thu, 17 Dec 2020 01:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iFIRRL46yMjVkC1gmF6EIJVF8bdmR6e+Xohx1umIKtU=;
        b=cVx5hcZQ0QQkO2zfTYYIeFYkAlOi4SKJhzUSVLaMLacOyyqsSiCzrS76VjMyePFTJr
         CZZZ1lVHys2peN8ePfkBfuZ+HlPE7neCjXCgDFh+X+e1GrYn0kG1atBs9J9FpsMAYVCH
         F3eKEbUzKl/Vk5UxuFtD6Va3QCcCdGoFiyhEHTvV3LEteZeEla2TM1IwRYk1GrmeQq5e
         cTguOkG9P1TQExGURAJH7Uc+HCmIhiyztB4p1O5Xynv8qYIhC5o70kgHpPn/iBSO2cvX
         MKuy2/56CRfUVEglXjlkn10kcz90DCBZZ8jWtuZaD9XNVWtlyQBuhyGAIPyFJ5ZBHY7W
         7N0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iFIRRL46yMjVkC1gmF6EIJVF8bdmR6e+Xohx1umIKtU=;
        b=mTb8CuGA6E/pSDcaXZHP33fyL1oXUf0mtmUAuHNQRSKyYmXtSKVVYz5+5vxLBtqcoU
         0FL+PnqzfGE71TXq2UrbuU8AdwsvF/bpHMpECwdDW19d4JdGL/9/0/BIgyyBidYEdZ67
         t+hScJQWGk890p/jPX2z8jnT6JNO8TUI7agklJF9WZ1bYGKnBXiKWIiN2kApkKyj2MeA
         xGZY66xoO4PmqOyPKo5OzesDCdTae8Rci+CL9OjYQDlsm3JuFFy00W4T9gzKCdI4iVmd
         vFAPlpbdbNga9t1MOGHEmXBNA8eWmIGy9GYtiKVd0ASMgKYGWpEMrMCe4dKY6r0CBtSc
         6hUw==
X-Gm-Message-State: AOAM532md34UqJ4ejbgW2IbjqRg+cF0CRX0lv9VCDpQYfzKABOFGuvD6
        N6p+zwX99nxx6kOugB5k4tvXyiglJW4VN37jorI=
X-Google-Smtp-Source: ABdhPJxa+q//yTZLf48T94QCeeMNCprd46S5GZMSF4opWnei4hBmfM0ItsiHlbMhbs07/RVAvakwLW8xrhiECJbZNz8=
X-Received: by 2002:a62:445:0:b029:19c:162b:bbef with SMTP id
 66-20020a6204450000b029019c162bbbefmr36549849pfe.40.1608198068185; Thu, 17
 Dec 2020 01:41:08 -0800 (PST)
MIME-Version: 1.0
References: <20201214202107.66932c18@canb.auug.org.au> <20201217122521.23a6d7f2@canb.auug.org.au>
In-Reply-To: <20201217122521.23a6d7f2@canb.auug.org.au>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 17 Dec 2020 11:40:51 +0200
Message-ID: <CAHp75VdVDZx_YzD5mwUqs=ezuy=Mt1s8UmWB3mg+MgMj5yqEkQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the risc-v tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Brendan Higgins <brendanhiggins@google.com>,
        Shuah Khan <skhan@linuxfoundation.org>
Cc:     Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul@pwsan.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Dec 17, 2020 at 3:28 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> On Mon, 14 Dec 2020 20:21:07 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next merge of the akpm-current tree got a conflict in:
> >
> >   lib/Makefile
> >
> > between commit:
> >
> >   527701eda5f1 ("lib: Add a generic version of devmem_is_allowed()")
> >
> > from the risc-v tree and commits:
> >
> >   8250e121c672 ("lib/list_kunit: follow new file name convention for KUnit tests")
> >   17bf776cf09a ("lib/linear_ranges_kunit: follow new file name convention for KUnit tests")
> >   23fa4e39ee62 ("lib/bits_kunit: follow new file name convention for KUnit tests")
> >   1987f84faec6 ("lib/cmdline_kunit: add a new test suite for cmdline API")

AFAIU Linus rejected the above patches. I hope kselftest/kunit tree
can pick them up.

> > diff --cc lib/Makefile
> > index bcedd691ef63,dc623561ef9d..000000000000
> > --- a/lib/Makefile
> > +++ b/lib/Makefile
> > @@@ -350,8 -350,7 +350,9 @@@ obj-$(CONFIG_PLDMFW) += pldmfw
> >
> >   # KUnit tests
> >   obj-$(CONFIG_BITFIELD_KUNIT) += bitfield_kunit.o
> > - obj-$(CONFIG_LIST_KUNIT_TEST) += list-test.o
> > - obj-$(CONFIG_LINEAR_RANGES_TEST) += test_linear_ranges.o
> > - obj-$(CONFIG_BITS_TEST) += test_bits.o
> > + obj-$(CONFIG_BITS_TEST) += bits_kunit.o
> > + obj-$(CONFIG_CMDLINE_KUNIT_TEST) += cmdline_kunit.o
> > + obj-$(CONFIG_LINEAR_RANGES_TEST) += linear_ranges_kunit.o
> > + obj-$(CONFIG_LIST_KUNIT_TEST) += list_kunit.o
> >  +
> >  +obj-$(CONFIG_GENERIC_LIB_DEVMEM_IS_ALLOWED) += devmem_is_allowed.o
>
> This is now a conflict between the risc-v tree and Linus' tree.

Yeah, and it's slightly different. Perhaps RISC-V tree can handle this
by moving Makefile entry somewhere else in the file.

-- 
With Best Regards,
Andy Shevchenko
