Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3A85307D80
	for <lists+linux-next@lfdr.de>; Thu, 28 Jan 2021 19:13:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231824AbhA1SLG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 Jan 2021 13:11:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:36204 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231760AbhA1SJx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 28 Jan 2021 13:09:53 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9A10D64E1C;
        Thu, 28 Jan 2021 18:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611857352;
        bh=I9b2CY9oG+7j/Q9+LnonZv0tg8jELW8RgIxY4SKAgPQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=h6cdOo6dNdavRRc1d40577CbEq9Qqz9G09q2/4hlPc8DLukSHRWlv4Dc2CYTCxJOl
         nfv0op4q3Fe+JORysXvTXKyvEAHLwIW/VgwlkFyT3iPkTW2Gi1rz3mYx3jZU0PTWXj
         iWXCKW1qDk+ivaxS7i2LPmqMipiuMriqVOSSvbjULFZBoA4ROstn0q0wMAN/VY/z1u
         Dgda/l5Z5A2faJ7etE2Z3GbEHJGsud7dU2XAY8XC+ph61sn+BaE044NsVvsjsRaPXM
         ju0yR9cDjUPL2/zkhveVojdpEBV/mbkHWbGphlUVoNXg7+puEx7LqGfaZqK7ZciRhn
         ez5F8XCG5tqgg==
Date:   Thu, 28 Jan 2021 18:09:07 +0000
From:   Will Deacon <will@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        linux-mm <linux-mm@kvack.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Subject: Re: [next] mm/nommu.c:1671:6: error: conflicting types for
 'filemap_map_pages'
Message-ID: <20210128180906.GA2678@willie-the-truck>
References: <CA+G9fYta_uOLktmMnZHUTK9Uqx-rjtmQSSvHFCsvQsVdZDdm8A@mail.gmail.com>
 <CAMuHMdUzCFuuUcgMwh+numoCnr_p0tfTucybytymUceyPV0TBQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUzCFuuUcgMwh+numoCnr_p0tfTucybytymUceyPV0TBQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jan 28, 2021 at 04:26:09PM +0100, Geert Uytterhoeven wrote:
> Hi Naresh,
> 
> On Thu, Jan 28, 2021 at 3:25 PM Naresh Kamboju
> <naresh.kamboju@linaro.org> wrote:
> > arm, sh and riscv architecture build failed on today's Linux next tag 20210128.
> >
> > FYI,
> > # CONFIG_MMU is not set on these failed configs.
> > config file attached to this email.
> >
> > make --silent --keep-going --jobs=8 O=/home/tux  -
> > build/.cache/tuxmake/builds/1/tmp ARCH=arm
> > CROSS_COMPILE=arm-linux-gnueabihf- 'CC=sccache
> > arm-linux-gnueabihf-gcc' 'HOSTCC=sccache gcc'
> > mm/nommu.c:1671:6: error: conflicting types for 'filemap_map_pages'
> >  1671 | void filemap_map_pages(struct vm_fault *vmf,
> >       |      ^~~~~~~~~~~~~~~~~
> > In file included from mm/nommu.c:20:
> > include/linux/mm.h:2578:19: note: previous declaration of
> > 'filemap_map_pages' was here
> >  2578 | extern vm_fault_t filemap_map_pages(struct vm_fault *vmf,
> >       |                   ^~~~~~~~~~~~~~~~~
> 
> Care to give "[PATCH -next] mm/nommu: Fix return type of
> filemap_map_pages()" a try?
> https://lore.kernel.org/lkml/20210128100626.2257638-1-geert@linux-m68k.org/

I'll go queue that now, cheers,

Will
