Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 983492773AC
	for <lists+linux-next@lfdr.de>; Thu, 24 Sep 2020 16:11:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727859AbgIXOLL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 24 Sep 2020 10:11:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727988AbgIXOLL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 24 Sep 2020 10:11:11 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8B61C0613D3
        for <linux-next@vger.kernel.org>; Thu, 24 Sep 2020 07:11:10 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id gx22so4702988ejb.5
        for <linux-next@vger.kernel.org>; Thu, 24 Sep 2020 07:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mH5/aIS5YG9tOp7sPXvPGy8zU6r6nGJSNmkQ/FEJOWY=;
        b=vkkvgYxdtsCvsj2rzgp77iRI5xBNWFMT+39Fh2AZbQ8/6sD5hqc8CpyWI/Dto5rCNh
         /kq2tHOUXhhMDb2tWfX7ynkCR5SfoyVjLWebipEITs6QqjnwnYIZ+vywydafb11sIcvS
         OjQWSShGtqMI0tX7Zi9TeDMyVudeBSAah8npe/2e4ZzK6faFOqGQB3iLQHlnDUJiNblG
         iTCJEz88Trw7FjTrpIBNYid4UUZcQlikEwC686DEEKxt87laJrC+cTfiUt2PuSNDxejQ
         5RocSmWmdIkI7ehx1qnOd9EfqSsa6HDg1EnbPRpZQcOe6jXybBdr+uzTAW7krRIf5Wsd
         wjnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mH5/aIS5YG9tOp7sPXvPGy8zU6r6nGJSNmkQ/FEJOWY=;
        b=JyiZnJyPNxjLBUBaZI0aixyrObEfzlx8dn2m3DyGH51ulqxT1ZMA1Y7Slf/oKdOIiq
         skzRluu8t6lulmeIf37jQVPYFcmstZYWA6ZQyoWV+gYuNKhG+/jXT4IU2oZ3SEhYudeC
         BB+WTtFSGN17yyPmc5P87Np78mlmp6NejpRYuZkmhyy8/MoaBjergiMi6INxNoP3440t
         EqnFdx3sjutQshuuMwcPRIITH0TRcYSDJqd9BR47u4Kd7ah+xw6/WaAj8TMdszmQWtkm
         LLAdIwcsJ0QlTKRbyVJ7SXXvj1ZZRgMib14qhMJnRWaM3Pu0CvgrWrSQyNYVCEKarpsJ
         h6WQ==
X-Gm-Message-State: AOAM5311jALJYW1kJSQV41YkpR9roVMoA8DaYt2oEqSEl4MHpfLju/bZ
        +bXEJecrqSDTKSm5sxHg2VDdk3u3bhmodwEuGODsgg==
X-Google-Smtp-Source: ABdhPJw0A0g1P9UoaH9Uodm0ZSqEOlzXmZyvpfin9HA5QaoqGIV8Vr74pks2pjZN02Kb2L4x3cF6ZyY1S1shEVFBVLo=
X-Received: by 2002:a17:906:14c9:: with SMTP id y9mr31302ejc.523.1600956669438;
 Thu, 24 Sep 2020 07:11:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200924164529.61ea980f@canb.auug.org.au>
In-Reply-To: <20200924164529.61ea980f@canb.auug.org.au>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Thu, 24 Sep 2020 07:10:58 -0700
Message-ID: <CAPcyv4ifCnbY_b_0J3O4U-N5ZcDUkEycqztDi75W-fyApLq6zw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the nvdimm tree with the vfs tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Al Viro <viro@zeniv.linux.org.uk>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Sep 23, 2020 at 11:45 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the nvdimm tree got a conflict in:
>
>   lib/iov_iter.c
>
> between commit:
>
>   e33ea6e5ba6a ("x86/uaccess: Use pointer masking to limit uaccess speculation")
>
> from the vfs tree and commit:
>
>   0a78de3d4b7b ("x86, powerpc: Rename memcpy_mcsafe() to copy_mc_to_{user, kernel}()")
>
> from the nvdimm tree.
>
> I fixed it up (I just used the latter, but I suspect that more work is
> needed) and can carry the fix as necessary. This is now fixed as far as
> linux-next is concerned, but any non trivial conflicts should be mentioned
> to your upstream maintainer when your tree is submitted for merging.
> You may also want to consider cooperating with the maintainer of the
> conflicting tree to minimise any particularly complex conflicts.

I messed up, this shouldn't be present in -next, yet. Will remove.
