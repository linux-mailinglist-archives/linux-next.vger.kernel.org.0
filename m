Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67624136AB1
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2020 11:11:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727315AbgAJKLy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 10 Jan 2020 05:11:54 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:42986 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727502AbgAJKLy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 10 Jan 2020 05:11:54 -0500
Received: by mail-lj1-f194.google.com with SMTP id y4so1531990ljj.9
        for <linux-next@vger.kernel.org>; Fri, 10 Jan 2020 02:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+kVo9m3T9mXJ+KVWmxD4yvdS2GfEORKMJ7mfZ/mCu7E=;
        b=GI4Ah5R0OE9BSnRu6GAON+I0o+ix+lL7QCUz+48FV4+6I614uptv180dULDjV7dayO
         34S6t/ioNfvOzsfKin88I0EJdOqrrV085cytsJ4ZgRsop+nwCpsOf1b35IJmRCmppt1V
         3PxiIr97jQU/udMvz4CxbkFYC+H86QsrY/JtqYOfC50wF08Lg1OroCaxbUzZeatCwrD1
         bns4xZVKNgM7QHlHGf1LMkHl6JvLnd3IZqf/rkBWysf3HiNDIoPxvM4JJd/yRWNRuHnv
         dPIvH9x+ytwPL6+Wr1suRAJJBLqA6Irh13vLU9lYq+uAx5zDI4dkriqn0PYwf23FQUKz
         zQOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+kVo9m3T9mXJ+KVWmxD4yvdS2GfEORKMJ7mfZ/mCu7E=;
        b=UZiExpFn3J35CTICXp8OLDMjxyX/gqpSKiCkgAWmCqAsghH4Fz5aFjPT+P3EFyll/F
         Y8qKzazzlExEpuq0xnHEwREtR3IVUr1PzlSX3Q6wGh4spII6sLhUPm09evV33oxYN1G6
         nwmhu7kxdSlVTThfjBB/5RPUunCZ9HCxHfDLsAFKK6DoiUpOkLL8tjOH7zIXAPsVi+a7
         Q/zKuu9OPYVD2xXZXbCFcgJFmYKaSp9lewUl8RRMnAjE+hi/hwUFess8PuohzrjTKQzc
         8jfjwCSC49noX73NYU0pOMCgktQeGCJuFBjbwYPIFD5v9h/vZ27nmoVSFOHaMaUAVAEO
         gDpA==
X-Gm-Message-State: APjAAAX0XCqnKrPPyuzSu0P3FNXEZDQbyRwxi1UWj6I/8DKD9CGkRbDM
        HWcoPYZQJ6ia5SSPwRbcdO7gt2iNG+2UVyxSpkS2goKgDQ4=
X-Google-Smtp-Source: APXvYqyb+KFd2lJgB0lcMgagsp0Sp/O1fZ6UyLCUWIFIJSguS0YQvEQcOyABzka9yzuU8WWDOny5+4SVDGwh88k7rkw=
X-Received: by 2002:a2e:8758:: with SMTP id q24mr2137333ljj.157.1578651112476;
 Fri, 10 Jan 2020 02:11:52 -0800 (PST)
MIME-Version: 1.0
References: <20200110190737.65d8881b@canb.auug.org.au>
In-Reply-To: <20200110190737.65d8881b@canb.auug.org.au>
From:   Anders Roxell <anders.roxell@linaro.org>
Date:   Fri, 10 Jan 2020 11:11:41 +0100
Message-ID: <CADYN=9+VoYekNzsdrL+bnb3oB9Y4guE3o2okwiBD4J-c_=kAyg@mail.gmail.com>
Subject: Re: linux-next: Tree for Jan 10
To:     Stephen Rothwell <sfr@canb.auug.org.au>, steven.price@arm.com
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 10 Jan 2020 at 09:07, Stephen Rothwell <sfr@canb.auug.org.au> wrote=
:
>
> Hi all,
>
> Changes since 20200109:

I see the following build error on arm64:

../arch/arm64/mm/dump.c: In function =E2=80=98ptdump_walk=E2=80=99:
../arch/arm64/mm/dump.c:326:2: error: too few arguments to function
=E2=80=98ptdump_walk_pgd=E2=80=99
  ptdump_walk_pgd(&st.ptdump, info->mm);
  ^~~~~~~~~~~~~~~
In file included from ../arch/arm64/mm/dump.c:18:
../include/linux/ptdump.h:20:6: note: declared here
 void ptdump_walk_pgd(struct ptdump_state *st, struct mm_struct *mm,
pgd_t *pgd);
      ^~~~~~~~~~~~~~~
../arch/arm64/mm/dump.c: In function =E2=80=98ptdump_check_wx=E2=80=99:
../arch/arm64/mm/dump.c:364:2: error: too few arguments to function
=E2=80=98ptdump_walk_pgd=E2=80=99
  ptdump_walk_pgd(&st.ptdump, &init_mm);
  ^~~~~~~~~~~~~~~
In file included from ../arch/arm64/mm/dump.c:18:
../include/linux/ptdump.h:20:6: note: declared here
 void ptdump_walk_pgd(struct ptdump_state *st, struct mm_struct *mm,
pgd_t *pgd);
      ^~~~~~~~~~~~~~~
make[3]: *** [../scripts/Makefile.build:266: arch/arm64/mm/dump.o] Error 1
make[3]: Target '__build' not remade because of errors.
make[2]: *** [../scripts/Makefile.build:503: arch/arm64/mm] Error 2
make[2]: Target '__build' not remade because of errors.
make[1]: *** [/srv/jenkins/kernel/randconfig/Makefile:1683: arch/arm64] Err=
or 2

I think something happened when applying patch [1], the changes in
arch/arm64/mm/dump.c
got dropped somehow. What that intended ?


Cheers,
Anders
[1] https://lore.kernel.org/lkml/20200108145710.34314-1-steven.price@arm.co=
m/
