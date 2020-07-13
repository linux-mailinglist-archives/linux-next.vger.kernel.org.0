Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F4DD21CD2F
	for <lists+linux-next@lfdr.de>; Mon, 13 Jul 2020 04:28:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727890AbgGMC2G (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 12 Jul 2020 22:28:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726261AbgGMC2F (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 12 Jul 2020 22:28:05 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E191C061794
        for <linux-next@vger.kernel.org>; Sun, 12 Jul 2020 19:28:05 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id r19so14403770ljn.12
        for <linux-next@vger.kernel.org>; Sun, 12 Jul 2020 19:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7Kd3bokmakAC9QLj74KST8J4C2nrYiNiziDMMNq1eaw=;
        b=ac0NG0+2PZyjgTW6CDWM53lyaoZXyWfgHkVgnJiQK8FkT5VJ+sXdLYnUA/mPQ7bTXD
         ESopsgeKDLLL62c+WlIcVr+Ou42Ld9893HGuRO+eR3hxx0WcDGBCJEZSM6TSRM9qYBRY
         yggXg6JJs9fRMnCRHkQ3z3mITIoGFcVa0OVcY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7Kd3bokmakAC9QLj74KST8J4C2nrYiNiziDMMNq1eaw=;
        b=m2+GheO6iddUsGdQFzPHPp3/huPjRJXJsvMMERkkXg8IVRZDVJD9CMPC4Nc7RruK8p
         e1LETnrtfC3gRASF6cAVYIFuKeuEu2h/VY7mfNiztE+xADNJwnHjz5ytguyJBR7EC91g
         HnAe2qB9kngwz+wsXg+fZwfw2wPNOVhAw6nOuK/IxwMq/SoCSwIAfQJ/XB9IKkJGQIv4
         Be6IKbakRi02wuEaEpR8KNgGhVJRTz3HMNNAJK5ybvJDWi42L4wRv7MkgnLXJrGKigjh
         9TppLoCKcftNAOe9MFLQ3y9dXKhmyl3ZtULPI0q0KcjeQX1hE3qE2Luyh6rdHw5GMp5i
         aSPw==
X-Gm-Message-State: AOAM530hno+DlpVsOHweio/Zpx2x0xrEERBRqdolt/bXzYGrVol+Es5M
        YvCiT45kaCSEzjUanLUwwU8NhLBNauo=
X-Google-Smtp-Source: ABdhPJyXA9TB/6Q5XraLb1kRhENWrTBvE488j6CTLSSkFZB1OPg9LGVIO5NP64WJOnd+0UM9szJBIw==
X-Received: by 2002:a2e:a58a:: with SMTP id m10mr24359606ljp.16.1594607283357;
        Sun, 12 Jul 2020 19:28:03 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id m14sm6058139lfp.18.2020.07.12.19.28.02
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jul 2020 19:28:02 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id o4so7331858lfi.7
        for <linux-next@vger.kernel.org>; Sun, 12 Jul 2020 19:28:02 -0700 (PDT)
X-Received: by 2002:a05:6512:3f1:: with SMTP id n17mr51767523lfq.125.1594607281826;
 Sun, 12 Jul 2020 19:28:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200710183318.7b808092@canb.auug.org.au> <20200712155604.GA342822@smile.fi.intel.com>
 <20200713080152.63ee1246@canb.auug.org.au> <e519f1c2-9761-4866-4878-09cc3da23d1f@infradead.org>
In-Reply-To: <e519f1c2-9761-4866-4878-09cc3da23d1f@infradead.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 12 Jul 2020 19:27:46 -0700
X-Gmail-Original-Message-ID: <CAHk-=wib+gfHwo0zADm-rMXuBaHMdosudtBXeUk0qfQEna9Hjw@mail.gmail.com>
Message-ID: <CAHk-=wib+gfHwo0zADm-rMXuBaHMdosudtBXeUk0qfQEna9Hjw@mail.gmail.com>
Subject: Re: linux-next: Tree for Jul 10
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sun, Jul 12, 2020 at 7:20 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> >
> > Not that I am aware of at the moment.  Does next-20200709 work?  Does
> > Linus' tree work?  The only obvious thing I can think of is commit
>
> I'm hitting this same thing on 5.8-rc5. (x86_64)
>
> > 6ec4476ac825 ("Raise gcc version requirement to 4.9")
> >
> > The commmit message says:
> >
> >     Using _Generic also means that you will need to have a very recent
> >     version of 'sparse', but thats easy to build yourself, and much less of
> >     a hassle than some old gcc version can be.

Yes, you need a very recent version of sparse.

I was oging to hold off that sparse upgrade requirement for 5.9, but
we had independent reasons to just say "gcc 4.9", and at that point
the code that allowed old versions of sparse to work was entirely dead
outside of sparse.

Sparse is really easy to build and install as a regular user. Just do

    mkdir -p ~/src ; cd ~/src
    git clone git://git.kernel.org/pub/scm/devel/sparse/sparse.git
    cd sparse
    make && make install

and it will install the sparse binaries in your ~/bin directory. No
need to be root, it just works.

              Linus
