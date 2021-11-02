Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3867B442780
	for <lists+linux-next@lfdr.de>; Tue,  2 Nov 2021 08:06:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231265AbhKBHJF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Nov 2021 03:09:05 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:55439 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231189AbhKBHJE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 Nov 2021 03:09:04 -0400
Received: from mail-wr1-f44.google.com ([209.85.221.44]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MMoXE-1n0RBm2L00-00Ii0d; Tue, 02 Nov 2021 08:06:26 +0100
Received: by mail-wr1-f44.google.com with SMTP id d13so31655181wrf.11;
        Tue, 02 Nov 2021 00:06:26 -0700 (PDT)
X-Gm-Message-State: AOAM531zlB0EmLR/uxZY3TGZ1ndcSSUAcBkZg8AIOj7m4O65F+UALHQn
        0tsx87eXS1yDGKDr0Cg1H0wcH3zgVMpwuhLZsE8=
X-Google-Smtp-Source: ABdhPJzQ3znFRq+ZQpxRVWHkuDXTcOZcbFjCxXe6hcE5/1xLsILVEWGw7RLhfP3RsG3pwxU47kpK2ABE5NgJOsrnlrM=
X-Received: by 2002:adf:df89:: with SMTP id z9mr7537007wrl.336.1635836786184;
 Tue, 02 Nov 2021 00:06:26 -0700 (PDT)
MIME-Version: 1.0
References: <20211028212651.57beb05b@canb.auug.org.au> <20211028233844.292e1319@canb.auug.org.au>
 <20211102174400.1aaee22c@canb.auug.org.au>
In-Reply-To: <20211102174400.1aaee22c@canb.auug.org.au>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 2 Nov 2021 08:06:10 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3Fx0UmbxP48RnXHcJYf_tU3_NTkMZrFnM42eAb_F4jRQ@mail.gmail.com>
Message-ID: <CAK8P3a3Fx0UmbxP48RnXHcJYf_tU3_NTkMZrFnM42eAb_F4jRQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of almost all the trees
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Anton Altaparmakov <anton@tuxera.com>,
        Joel Stanley <joel@jms.id.au>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:om69LVjW6amBGGfNSqv92SkVmaKXuVCdW0S46lr8YIhpdu3ybSU
 lRV6R8pCV/KajJXTJcwtgdixcjE0JiTo2A1pUFozThhr37NVzdcy1/nJlDolUZP9un51Lfp
 j/I59xY3a8BIZWQlz0cFmw9pXL4HB2fVfvYxyeUonj6YO2h8ZsrFgCahBh80HbOYRVFyztk
 8F5U35iRXFh7rHlbTqjUw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:grWNEfrtS80=:xjYYgLMHH4UAqZZRN0c/mV
 ehPBlwG14shS01tbr06N3zPSbCe7buAjbpTCYNSq5j+wEEpYEixi89WIN0BEeVGjLzw8x5V79
 MQgWZn7sqtZEvlC9UQBVTxV6ZensuslmoTnm+Hq0IXEvZqr//LIg/7g5X3BsO55L0K2LRixrz
 FM6UXdYSa22SSEjpdNh8lCdMYJ5tfzSmSABdK7mBvexlFWyaXDO5FNovQFIwPkx+wgxC7kOcE
 lUdQfl6AoQJBvB7qQdwnJ+faCdJtW0npUJcLT9FAvYAOqOp4OUOggnFpiUKhB0yGNY+mDcYbS
 S7+WXHhAAGVE93scqYOGsIdlh3D9AsOKhYLOtO9Ucm9UgNgLnRZx2iJiHYMA0/dahrmzpT81g
 QU4DRGJLmDseMOoZiZ88r1GvAh7PUiTeo1NfogMxChXa3I6gxBHvNNbUQ0xAc/aOh7OB/zCn6
 uHHmsASN3foMA+aeEWEY4TYlpWK0f87/IMKGJJb3I+BEwf89iX3W/viICmW2Nz2f4PJYWAO4Q
 BCUWORwBKJpojphZxfuUZGoovFn8KV0lrK+gZ3vdmhVruMm8tExDwG/1i3Nala6ceHldzjkUH
 2xQjrX3pChEVrXZj13w6UMYkX5UJKDYkh9REYhzr6plrnUKXIA/WGe4qZXBjBmp3WTENq4AyG
 8Q6PxSX897HYX294y/b5ULLZBShjsGxAG+wIBsWm5hiEMgdZtNczhmNBv5BaeSddpVqLva3M4
 TcKpNhAQ6p42y4rRTkpq4Uw+h8X6d6iCV1i4ETYnHqaqOTFYdxxs+4ihWkFQroL4K8nf2Qz6E
 dgSTPbIXxHT2tRfv9IxTprgPa4407EE9ffQmFw78XDHE5YDS3Q=
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Nov 2, 2021 at 7:44 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> On Thu, 28 Oct 2021 23:38:44 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > On Thu, 28 Oct 2021 21:26:51 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > Today's linux-next build (powerpc allyesconfig) failed like this:
> > >
> > > fs/ntfs/aops.c: In function 'ntfs_write_mst_block':
> > > fs/ntfs/aops.c:1311:1: error: the frame size of 2304 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]
> > >  1311 | }
> > >       | ^
> > > cc1: all warnings being treated as errors
> > >
> > > I have no idea what has caused this.
> >
> > With a nudge from Arnd, it seems the immediate case was commit
> >
> >   f22969a66041 ("powerpc/64s: Default to 64K pages for 64 bit book3s")
> >
> > from the powerpc tree switching the allyesconfig build from 4k pages to
> > 64k pages which expanded a few arrays on the stack in that function.
>
> Can we do something about this, please?

I submitted a workaround a while ago. Anton didn't like it, but has not
come up with a proper fix in ntfs either:

https://lore.kernel.org/lkml/20210927141815.1711736-1-arnd@kernel.org/

It does need to be changed a bit as I realized it depends on a rework of
the Kconfig logic that I had in my randconfig build tree to have a common
page size symbol across architectures. Without my other patch, it also
needs to check for PPC_64K_PAGES.

Should I send an updated version of the patch?

       Arnd
