Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 630BC2AF905
	for <lists+linux-next@lfdr.de>; Wed, 11 Nov 2020 20:27:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726664AbgKKT1A (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Nov 2020 14:27:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbgKKT1A (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 11 Nov 2020 14:27:00 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F068FC0613D1;
        Wed, 11 Nov 2020 11:26:59 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id l5so3490387edq.11;
        Wed, 11 Nov 2020 11:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bMLjI/601C9OPQNA+LqIrQMDDAlDxJCIUFBAsIL0uwg=;
        b=h4IYp7gble1Q0vh1fdFK2sJupdlvWR5d0OIhAe6P5UgZJy1fZvGi94CO54o5vE13t/
         r77GkOUsUtPP7qmQU+ZVPii+N188Lr97JOAz2L06eFxv5YO3bkrlZH0zZwhVKtbaDoly
         GDpwZ72xniQ9c4hqmscXHQ3XMD1sA2rE0KqrGNEIMhMA8WS9pTHabamdU/43SqZ4gS0W
         vcZzR8O6+5nR5DCuN6PMtYFjdI+IRul12llL3HYSlxq9j6n1/W25a5jrKDWQW2s4F/Yb
         8Uj2ANCjF9fFpjwS0T2gF5O4bDXVxbXUSHTzQugsr1zhdqb+NGdU5UBXfWqkSLpxcQ89
         nz2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bMLjI/601C9OPQNA+LqIrQMDDAlDxJCIUFBAsIL0uwg=;
        b=qohmdC+AK71qKnbKyeXCs3v/8ALedXSwki6BGKPl9ny6W+MaWqOrXjccN517OtmB+v
         YOVpOqQfW0fF/NyZFo/YKEc0JuA5DWrNXlO528t50npU0lKGUXK8qxU8jT0P1t/qRvnA
         9fw0dE4HCXdCcXOZ0sEojL1j0ArSXt1aSHQhZEjtylkHOJnelF1DqIRsc7mpAjq3aQvq
         JxoQhXjY7XP7u6kINdN3jaNOn7edEDFkP1qqBQTXqLagIZNkap5s0Tex9hDMHjINjjRM
         mSVVaCbpIM0btKos8YgIRqmWsr9OWXbi+MQxFaUGbKmAQ8vcUjt71GB2nS2F8fsKMLsd
         PqOA==
X-Gm-Message-State: AOAM532gleKHk1cc4hEJ1Yici7aoOldXdEHtnTX2t3nXy7Rk8W1a2OLc
        noaVnc6+/0B2h4brJGSSTt//yvEcr9eaa8GawLGt6tVJ2f8=
X-Google-Smtp-Source: ABdhPJxwX1ejaYw2R2D2HuKudT6+qpe+Dp+KKAb0PZFN9O7AJvhP8s8QpEfz4dxZf82tDXK/9t8ojLT7bvfOi4z15kE=
X-Received: by 2002:a50:eb0a:: with SMTP id y10mr1199265edp.342.1605122818353;
 Wed, 11 Nov 2020 11:26:58 -0800 (PST)
MIME-Version: 1.0
References: <000000000000fe575905b3cff92c@google.com> <bf31020f4e50b303fd0dd3dfda0e50de79ed25db.camel@redhat.com>
 <CAAeHK+yLgDYOS35sWT8=4_d-gZKU_B10D9ZEBPZDC1P6MO2D6Q@mail.gmail.com>
In-Reply-To: <CAAeHK+yLgDYOS35sWT8=4_d-gZKU_B10D9ZEBPZDC1P6MO2D6Q@mail.gmail.com>
From:   Lorenzo Stoakes <lstoakes@gmail.com>
Date:   Wed, 11 Nov 2020 19:26:47 +0000
Message-ID: <CAA5enKY8mBicpc7kZKKLG5LeVFhVJtRQ73MYVFM0Az2bbiGv8g@mail.gmail.com>
Subject: Re: linux-next boot error: BUG: unable to handle kernel NULL pointer
 dereference in mempool_init_node
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     Qian Cai <cai@redhat.com>,
        syzbot <syzbot+2d6f3dad1a42d86a5801@syzkaller.appspotmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Alexander Potapenko <glider@google.com>,
        Marco Elver <elver@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 11 Nov 2020 at 17:44, Andrey Konovalov <andreyknvl@google.com> wrote:
> I'll try to reproduce this and figure out the issue. Thanks for letting us know!

I hope you don't mind me diving in here, I was taking a look just now
and managed to reproduce this locally - I bisected the issue to
105397399 ("kasan: simplify kasan_poison_kfree").

If I stick a simple check in as below it fixes the issue, so I'm
guessing something is violating the assumptions in 105397399?


diff --git a/mm/kasan/common.c b/mm/kasan/common.c
index 7a94cebc0324..16163159a017 100644
--- a/mm/kasan/common.c
+++ b/mm/kasan/common.c
@@ -387,6 +387,11 @@ void __kasan_slab_free_mempool(void *ptr, unsigned long ip)
        struct page *page;

        page = virt_to_head_page(ptr);
+
+       if (!PageSlab(page)) {
+               return;
+       }
+
        ____kasan_slab_free(page->slab_cache, ptr, ip, false);
 }


--
Lorenzo Stoakes
https://ljs.io
