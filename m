Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 478D91AEAA5
	for <lists+linux-next@lfdr.de>; Sat, 18 Apr 2020 10:02:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725856AbgDRICv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 18 Apr 2020 04:02:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725903AbgDRICv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 18 Apr 2020 04:02:51 -0400
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com [IPv6:2607:f8b0:4864:20::f44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDC84C061A0F
        for <linux-next@vger.kernel.org>; Sat, 18 Apr 2020 01:02:50 -0700 (PDT)
Received: by mail-qv1-xf44.google.com with SMTP id t8so152985qvw.5
        for <linux-next@vger.kernel.org>; Sat, 18 Apr 2020 01:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LQCRNse3Q1COxyowNmHl2L08zf9GEfcCeavOcP7hQ3U=;
        b=wLQrHFWKMSKKB+kmcoqBvo3ThjIFUir4tlJLYw8wj+A7CMXksnWn39kqE/n5n7OPju
         Ti2Tk6B6oeIVnafWPMLGYnlIm3HTfnIcIDCNpBn1LDe/EBSJb5EikNg0mvuAD1QQ+ZjM
         6s7J9Xt4wurEyapmm6V5HFhWPp/MK06n8vr7aC/1RUKn3mFU2+KmHmwIA6MkSD0odliB
         K1VSO+sRT9GUoioVyBMOjTwn66Fl/+jfCxqGZVf89ZNC29FWOBjdq9cXFXtR7nL7a00Z
         3QReBKn4doiv8iv3QJ1Xmrue5Z57OYEUxkQzhmWh6P7pr2syPrQ27w3OQhAEDhtsBTu1
         uIrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LQCRNse3Q1COxyowNmHl2L08zf9GEfcCeavOcP7hQ3U=;
        b=hvkjZBO1ZAKTzNxBjbh2z/1j/kY7TYIjXcyqI+vVsg56ttUKeQYLsaBeplqZRvH4/c
         W5M984et67DqoiYP8wrWwOaOMCXYiMBuADNDPl+4LpASWL1kWbElFWE2lZqDmCfoYvky
         EzKE0zMQ/QvE8nkhyZ2k+Wqplw+cSRpkG1vCm+QA2EuuY0LQf8uyFMJXN2UBJ/qyHmKR
         ouxGSGqcaRlbMChCb9VgS4X/efRsCDUy8ABac2P3DQkw9kvDK+idIamYN0S8e2eEU+/t
         QgNe+VQPySF7ehh3+XWQuyLAFrsY/2t3riFgDsneqWgHt9GkzN6D3+pUbK9iVNh9TvYS
         gGtg==
X-Gm-Message-State: AGi0PuazyY5mfMqXWq7k3BLfhxHpSOu1TiRfWXJ9DIYsQ7fEWRJ80hU8
        MG9hGDB23VjUNoTmwZ2puyhTl57o8gmYjGPkexL/cg==
X-Google-Smtp-Source: APiQypL7UUYmMpEpdMiZ4ex0w5u9FU2JzKo6Jqkt4/5oxF/5yx/3Lj/rqyIBDnTKn0zcLyZBvWo5w5QsfOWoWdJ0FJM=
X-Received: by 2002:ad4:58ce:: with SMTP id dh14mr6431867qvb.80.1587196969615;
 Sat, 18 Apr 2020 01:02:49 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000022640205a04a20d8@google.com> <20200309092423.2ww3aw6yfyce7yty@box>
 <5b1196be-09ce-51f7-f5e7-63f2e597f91e@linux.alibaba.com> <d3fb0593-e483-3b69-bf2c-99ad6cd03567@linux.alibaba.com>
 <CACT4Y+Zfcs2MxD9-zR748UbkEpsV4BYjFgw1XgSqX4X8z=92CA@mail.gmail.com>
 <20200418174353.02295792@canb.auug.org.au> <20200418175059.7100ed7b@canb.auug.org.au>
In-Reply-To: <20200418175059.7100ed7b@canb.auug.org.au>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Sat, 18 Apr 2020 10:02:36 +0200
Message-ID: <CACT4Y+ZsAgq0M=xUzrXTOYaaJfr_BrD8_5R5bhzr9k29jDSC+w@mail.gmail.com>
Subject: Re: linux-next test error: BUG: using __this_cpu_read() in
 preemptible code in __mod_memcg_state
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Alex Shi <alex.shi@linux.alibaba.com>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        "Kirill A. Shutemov" <kirill@shutemov.name>,
        syzbot <syzbot+826543256ed3b8c37f62@syzkaller.appspotmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Cgroups <cgroups@vger.kernel.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>, Michal Hocko <mhocko@kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Vladimir Davydov <vdavydov.dev@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sat, Apr 18, 2020 at 9:51 AM Stephen Rothwell <sfr@canb.auug.org.au> wro=
te:
>
> Hi Stephen,
>
> On Sat, 18 Apr 2020 17:43:53 +1000 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > Hi Dmitry,
> >
> > On Sat, 18 Apr 2020 09:04:38 +0200 Dmitry Vyukov <dvyukov@google.com> w=
rote:
> > >
> > > On Mon, Mar 9, 2020 at 2:27 PM Alex Shi <alex.shi@linux.alibaba.com> =
wrote:
> > > > =E5=9C=A8 2020/3/9 =E4=B8=8B=E5=8D=885:56, Alex Shi =E5=86=99=E9=81=
=93:
> > > > >
> > > > >
> > > > > =E5=9C=A8 2020/3/9 =E4=B8=8B=E5=8D=885:24, Kirill A. Shutemov =E5=
=86=99=E9=81=93:
> > > > >>> check_preemption_disabled: 3 callbacks suppressed
> > > > >>> BUG: using __this_cpu_read() in preemptible [00000000] code: sy=
z-fuzzer/9432
> > > > >>> caller is __mod_memcg_state+0x27/0x1a0 mm/memcontrol.c:689
> > > > >>> CPU: 1 PID: 9432 Comm: syz-fuzzer Not tainted 5.6.0-rc4-next-20=
200306-syzkaller #0
> > > > >>> Hardware name: Google Google Compute Engine/Google Compute Engi=
ne, BIOS Google 01/01/2011
> > > > >>> Call Trace:
> > > > >>>  __dump_stack lib/dump_stack.c:77 [inline]
> > > > >>>  dump_stack+0x188/0x20d lib/dump_stack.c:118
> > > > >>>  check_preemption_disabled lib/smp_processor_id.c:47 [inline]
> > > > >>>  __this_cpu_preempt_check.cold+0x84/0x90 lib/smp_processor_id.c=
:64
> > > > >>>  __mod_memcg_state+0x27/0x1a0 mm/memcontrol.c:689
> > > > >>>  __split_huge_page mm/huge_memory.c:2575 [inline]
> > > > >>>  split_huge_page_to_list+0x124b/0x3380 mm/huge_memory.c:2862
> > > > >>>  split_huge_page include/linux/huge_mm.h:167 [inline]
> > > > >> It looks like a regression due to c8cba0cc2a80 ("mm/thp: narrow =
lru
> > > > >> locking").
> > > > >
> > > > > yes, I guess so.
> > > >
> > > > Yes, it is a stupid mistake to pull out lock for __mod_memcg_state =
which
> > > > should be in a lock.
> > > >
> > > > revert this patch should be all fine, since ClearPageCompound and p=
age_ref_inc
> > > > later may related with lru_list valid issue in release_pges.
> > > >
> > > >
> > > > Sorry for the disaster!
> > > >
> > > > Alex
> > >
> > > +linux-next, Stephen for currently open linux-next build/boot failure
> > >
> > > Hi Alex,
> > >
> > > What's the status of this? Was the guilty patch reverted? If so,
> > > please mark it as invalid for syzbot, otherwise it still shows up as
> > > open bug.
> >
> > The patch was removed from Andrew's tree in March and never made it to
> > Linus' tree.  I can't find how to tell syzbot that the patch went away =
...
>
> Lets try:
>
> #syz invalid

This is correct, thanks!

You may now see "Status: closed as invalid on 2020/04/18 07:51" at:
https://syzkaller.appspot.com/bug?extid=3D826543256ed3b8c37f62

It does not show up as "open" and if this will happen again syzbot
will report it (rather than assume it's still the old bug happening).
