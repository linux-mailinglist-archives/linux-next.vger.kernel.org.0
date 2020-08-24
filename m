Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9CE624FB25
	for <lists+linux-next@lfdr.de>; Mon, 24 Aug 2020 12:16:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726691AbgHXKQq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 24 Aug 2020 06:16:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725906AbgHXKQp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 24 Aug 2020 06:16:45 -0400
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com [IPv6:2607:f8b0:4864:20::a29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CBD5C061573
        for <linux-next@vger.kernel.org>; Mon, 24 Aug 2020 03:16:45 -0700 (PDT)
Received: by mail-vk1-xa29.google.com with SMTP id i20so1852227vkk.2
        for <linux-next@vger.kernel.org>; Mon, 24 Aug 2020 03:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OiCnBS3GYYoc2kTu6U4ScV/ziyrA981gLnUbVdRpKoY=;
        b=J7Wbx9EmaRP0OLY3dh6kuTXPZs9/tD8i70xzq0R0UJLlPGvI+QuyEXm0317YUV78wI
         77sU+R+hq+azI2/J3yBcN9y9LuvaLS324FEGORsIJh/EYAoQzPM5NSmMFrtrKOoCKHoS
         DTBZaI9c1Iv4jWmPWv1q4GM6oz1jvOPwLVfPZDpkOSK242goI8eNhpuE9qsEducUHHKS
         Qsm/CmGzEqNmI7ykmtkIxxS6iv2obxKOq+t1LMYhf44YZQ9+3r2WokkeTKvha/Z6JcRQ
         qSUpWFpThpFDZGhtXOBxIdJpjbakZLgukJxr6JWI2bI5E3cRp8rI1dr71zWdENcEg0eG
         r6Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OiCnBS3GYYoc2kTu6U4ScV/ziyrA981gLnUbVdRpKoY=;
        b=cFwohX0J4c1WPtdZ6tIlOpPEcmc4QyvBNJVEoL2r2Ty+Y+AnaG02orl3TMCr6zBhZ0
         FM6ViFwEDuIASv4oOITH18gfp++K9AfnedzupChCIy8/QtHX1LyFnGvNuWp3OIkqVqB/
         SRxgC1zcZkPNewDJZvIT51LAtJiNeYBOqndZVq8d14EFBdAG8KhxYV9zd0lRvlXv5j/O
         cg4N4X0JvZYdca3hvixpwJcwGjnNTXtVDgsPJkzN62FTYujHsVuWdeee/eubXHZaIywA
         DCIm35Zsp72b7zEWz4SXhXZOUNv6lKqcCA+VQVtKGdmragk8lSG9gtixImi2E95oX4vw
         E4vw==
X-Gm-Message-State: AOAM53353Tj4nY1CNt9dLCRnZyRDNz25B1gPU/SMJdBJ9WesdAPVY6wS
        rJ2D0+VjG4mVqa3kyOWrLHkskCz3UfiJmVck/Bgb7Q==
X-Google-Smtp-Source: ABdhPJyL/7mPRqeQIbvTo4BErUCy3JkI6gdC46co6kFSio+FPo/F2dgD3SAvRWGLInV9c6P76V1Lf7HyDhKIwGTMGWA=
X-Received: by 2002:a1f:a256:: with SMTP id l83mr1859945vke.78.1598264202330;
 Mon, 24 Aug 2020 03:16:42 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYt=oYWHEG6VNkfEh8+UxbReS6_+9hnz+1bOYZHj5j1F_Q@mail.gmail.com>
In-Reply-To: <CA+G9fYt=oYWHEG6VNkfEh8+UxbReS6_+9hnz+1bOYZHj5j1F_Q@mail.gmail.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Mon, 24 Aug 2020 15:46:30 +0530
Message-ID: <CA+G9fYtVCb6p_eeBayp_bzJGYFBOx+yG+Bgpda3KcFy-Yj1VgA@mail.gmail.com>
Subject: Re: BUG: Bad page state in process true  pfn:a8fed on arm
To:     linux-mm <linux-mm@kvack.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Andrew Morton <akpm@linux-foundation.org>,
        LTP List <ltp@lists.linux.it>
Cc:     Russell King - ARM Linux <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christoph Hellwig <hch@lst.de>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Xu <peterx@redhat.com>, opendmb@gmail.com,
        Linus Walleij <linus.walleij@linaro.org>,
        afzal.mohd.ma@gmail.com, Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 24 Aug 2020 at 15:14, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> Kernel BUG noticed on arm architecture on linux next 20200824 tag kernel
> while running LTP CVE "thp01 -I 120" , LTP mm, LTP hugetlb test cases
> and libhugetlbfs test suite.

BAD: next-20200820
GOOD: next-20200819

We are trying to bisect this problem and get back to you shortly.

- Naresh
