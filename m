Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B52FF4311BD
	for <lists+linux-next@lfdr.de>; Mon, 18 Oct 2021 10:02:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231143AbhJRIE3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Oct 2021 04:04:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231222AbhJRIEZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 18 Oct 2021 04:04:25 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D027C06161C;
        Mon, 18 Oct 2021 01:01:56 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id ec8so67616041edb.6;
        Mon, 18 Oct 2021 01:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ib1GURrYRt0KmD3mck0TUZJ8oysi6z7ZzWmIcJUfDzo=;
        b=qmMjIirDeuP5bI+PkEaqVafjIRq77p7GJ8hZQ6iHNIbCrFQaW3x1SZnx8GkNGMJcMn
         CcgIX7Xo+FC3O2mrKVGBPR8rItY2TCJTR1NOmrhO8IneTGS6MjMpRTxQmUtJj143GXfN
         KTwNtMtnaZmTPONGUKxWKfWL4eeWLG+3ZyYmtSUnW4UKckMum0uy8fDIO6QvqnCg0U7s
         UT8raNxLjWJB3A6ViVdzz7FDCfbBAD1hc8iGZzsVqObfjJpYrqtoswuETketRT+Sq45v
         vnqqwWeOK/lCbTZuk1l0LrVtGf+CpRa8DFQmTfh3s3ol4goKERemmAX1xcmYr68bv8WI
         FfJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ib1GURrYRt0KmD3mck0TUZJ8oysi6z7ZzWmIcJUfDzo=;
        b=AK5sP2qfrhIvBSTukN8e5hPqV0aFHvZLkGN03R7Aqt5LJEaxEy4d+cBK5vKicL/cFl
         8gE8Sa6ZdC9+1fhpnXRoAo1SlBsZdekQqWu3cWwzItq5WbYUOAXaLDcNvTyN4EvxR1Hj
         dM5YWMLvXMTWInIDIXJpIe5o1FDE+N/rVfXGF2drYsi8BIEO79zqtTDSbHebPHQx5aP4
         QMWUkXdJVGvrAAaw9HES3NEOiL0MrmAyPtcyF/zsjvFXWO1Oz3SCRJddGScLnCffJz9H
         DlnLRDz04JPeyUBy1wRRLFpnT7G3tcaKCIwHOcEQSmi96c3TbYGBiQ9XhduS6mTH6mCD
         7oAQ==
X-Gm-Message-State: AOAM5300R+aLZ+OqTjV0u1iYcdTl5pil33rZFUvD6ZsHEDQDHViibWNZ
        AuEmnqVhXFTlOkR6xQXb/OimiIwKJLe86AeCukU=
X-Google-Smtp-Source: ABdhPJzw2mlJJyF+4ETFc6PjhIldLhEVTWD27wtjv0VWtaRKEjyRiBDp2ryxCMwbkdoAfX+zu/3/3EFUF8/VK7lnPUM=
X-Received: by 2002:a17:906:a158:: with SMTP id bu24mr25997655ejb.356.1634544114335;
 Mon, 18 Oct 2021 01:01:54 -0700 (PDT)
MIME-Version: 1.0
References: <20211015202908.1c417ae2@canb.auug.org.au> <YWl+0PFixaNqgIxb@smile.fi.intel.com>
 <20211018133538.2a0dec43@canb.auug.org.au>
In-Reply-To: <20211018133538.2a0dec43@canb.auug.org.au>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 18 Oct 2021 11:01:18 +0300
Message-ID: <CAHp75VcDwBkwL4+cFmeJt7b-p6V0w283ai9T9K02y0Sej0WLxg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Oct 18, 2021 at 6:49 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> On Fri, 15 Oct 2021 16:14:56 +0300 Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> >
> > Thanks! As a quick fix looks good, but I think we need a separate header for
> > those _*_IP_ macros.
>
> Like this (on top of my previous fix - which I assume Andrew will
> squash out of existence)?

Yep, thanks!
I thought that it makes sense to have STACK_MAGIC also in this header. Thoughts?

One spelling correction below.

> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 18 Oct 2021 13:27:54 +1100
> Subject: [PATCH] kernel.h: split out instrcutions pointer accessors

instructions

> botton_half.h needs _THIS_IP_ to be standalone, so split that and _RET_IP_
> out from kernel.h into the new instruction_pointer.h.  kernel.h directly
> needs them, so include it there and replace the include of kernel.h with
> this new file in bottom_half.h.
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  include/linux/bottom_half.h         | 2 +-
>  include/linux/instruction_pointer.h | 8 ++++++++
>  include/linux/kernel.h              | 4 +---
>  3 files changed, 10 insertions(+), 4 deletions(-)
>  create mode 100644 include/linux/instruction_pointer.h
>
> diff --git a/include/linux/bottom_half.h b/include/linux/bottom_half.h
> index 11d107d88d03..fc53e0ad56d9 100644
> --- a/include/linux/bottom_half.h
> +++ b/include/linux/bottom_half.h
> @@ -2,7 +2,7 @@
>  #ifndef _LINUX_BH_H
>  #define _LINUX_BH_H
>
> -#include <linux/kernel.h>
> +#include <linux/instruction_pointer.h>
>  #include <linux/preempt.h>
>
>  #if defined(CONFIG_PREEMPT_RT) || defined(CONFIG_TRACE_IRQFLAGS)
> diff --git a/include/linux/instruction_pointer.h b/include/linux/instruction_pointer.h
> new file mode 100644
> index 000000000000..19e979425bda
> --- /dev/null
> +++ b/include/linux/instruction_pointer.h
> @@ -0,0 +1,8 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _LINUX_INSTRUCTION_POINTER_H
> +#define _LINUX_INSTRUCTION_POINTER_H
> +
> +#define _RET_IP_               (unsigned long)__builtin_return_address(0)
> +#define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })
> +
> +#enfif /* _LINUX_INSTRUCTION_POINTER_H */
> diff --git a/include/linux/kernel.h b/include/linux/kernel.h
> index 973c61ff2ef9..be84ab369650 100644
> --- a/include/linux/kernel.h
> +++ b/include/linux/kernel.h
> @@ -20,6 +20,7 @@
>  #include <linux/printk.h>
>  #include <linux/build_bug.h>
>  #include <linux/static_call_types.h>
> +#include <linux/instruction_pointer.h>
>  #include <asm/byteorder.h>
>
>  #include <uapi/linux/kernel.h>
> @@ -53,9 +54,6 @@
>  }                                      \
>  )
>
> -#define _RET_IP_               (unsigned long)__builtin_return_address(0)
> -#define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })
> -
>  /**
>   * upper_32_bits - return bits 32-63 of a number
>   * @n: the number we're accessing
> --
> 2.33.0
>
> There are, presumably, other places this new file can be included ...
>
> --
> Cheers,
> Stephen Rothwell



-- 
With Best Regards,
Andy Shevchenko
