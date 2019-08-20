Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CECF96DC6
	for <lists+linux-next@lfdr.de>; Wed, 21 Aug 2019 01:28:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726183AbfHTX2z (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Aug 2019 19:28:55 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:38580 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726028AbfHTX2z (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 20 Aug 2019 19:28:55 -0400
Received: by mail-lj1-f194.google.com with SMTP id x3so373754lji.5
        for <linux-next@vger.kernel.org>; Tue, 20 Aug 2019 16:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XMlMUEKr5XRMEcS7O2CjglWq7iJta7ZlUj0ydKdkNX0=;
        b=iHh8YbqJQq/qqg3MN7n649EblEqXoT6lv/jNvF13p1Io12yotnNW5VDOJQVPXyJ/w1
         JaSOZsSrO52CAp1T+Wotk0juqAvaieKA809jbwzdvgdw+gNCyA/AE5ttYg9tcWp2I3XA
         9/R87UNQ/J+HKwDYreUrt6rqcLPdnyTqkY9kI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XMlMUEKr5XRMEcS7O2CjglWq7iJta7ZlUj0ydKdkNX0=;
        b=jZd1GAre4e0RlOahlJdOUc5DB8kXZmmt4HGHT14v/7yM9Cl4nUk6cg3nEzYoMZOPVe
         QDIGfe6xsI7T0yCJhgSX2cLQLPGUJ3K2Y3VpbCJfGzimxewDagn9HVvyu1acG3sc84ue
         smiBywGFif95JrhmG0tSD7BMK8DYGTaBohuwGHkmqQtWntyf2Qj3aK9TfClRCxBHmTvw
         kamo7+Wd9HIftsdPn2wNkFHpsSKko5ZAdFD3zuWZCV55a2cIhFPPrq/Om9iUrTP29ofo
         u3w61VlLeaCnFmUXvPACnvtd0pBKe8NprucZpj9eycffWkOg0vB3LccqaMrZEzuSFRjD
         n94Q==
X-Gm-Message-State: APjAAAWbY3LbL2vKqsLhG5K79GxXHg69aPjCl3G9Md/Ux45g23OtiIvA
        fQ27iQ+vhksprPNM4MlJzUnkojWUm4I=
X-Google-Smtp-Source: APXvYqwAiu4Q5LyezTnt2B312KVnihyl2CUdRUgICS2zxKwk4akstCXp7Cf3W5FIyUxecD0j+qQGMw==
X-Received: by 2002:a2e:92c6:: with SMTP id k6mr17596280ljh.148.1566343733035;
        Tue, 20 Aug 2019 16:28:53 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id a13sm3072453lfi.57.2019.08.20.16.28.51
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Aug 2019 16:28:52 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id x3so373719lji.5
        for <linux-next@vger.kernel.org>; Tue, 20 Aug 2019 16:28:51 -0700 (PDT)
X-Received: by 2002:a2e:9a84:: with SMTP id p4mr5487770lji.52.1566343731704;
 Tue, 20 Aug 2019 16:28:51 -0700 (PDT)
MIME-Version: 1.0
References: <c0005a09c89c20093ac699c97e7420331ec46b01.camel@perches.com>
 <9c7a79b4d21aea52464d00c8fa4e4b92638560b6.camel@perches.com>
 <CAHk-=wiL7jqYNfYrNikgBw3byY+Zn37-8D8yR=WUu0x=_2BpZA@mail.gmail.com>
 <6a5f470c1375289908c37632572c4aa60d6486fa.camel@perches.com>
 <4398924f28a58fca296d101dae11e7accce80656.camel@perches.com>
 <ad42da450ccafcb571cca9289dcf52840dbb53d3.camel@perches.com>
 <20190820092451.791c85e5@canb.auug.org.au> <14723fccc2c3362cc045df17fc8554f37c8a8529.camel@perches.com>
In-Reply-To: <14723fccc2c3362cc045df17fc8554f37c8a8529.camel@perches.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 20 Aug 2019 16:28:35 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgqQKoAnhmhGE-2PBFt7oQs9LLAATKbYa573UO=DPBE0Q@mail.gmail.com>
Message-ID: <CAHk-=wgqQKoAnhmhGE-2PBFt7oQs9LLAATKbYa573UO=DPBE0Q@mail.gmail.com>
Subject: Re: rfc: treewide scripted patch mechanism? (was: Re: [PATCH]
 Makefile: Convert -Wimplicit-fallthrough=3 to just -Wimplicit-fallthrough for clang)QUILT
To:     Joe Perches <joe@perches.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Julia Lawall <julia.lawall@lip6.fr>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux@googlegroups.com,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Aug 19, 2019 at 5:08 PM Joe Perches <joe@perches.com> wrote:
>
> 2: would be Julia Lawall's stracpy change done
> with coccinelle: (attached)

I'm not actually convinced about stracpy() and friends.

It seems to be yet another badly thought out string interface, and
there are now so many of them that no human being can keep track of
them.

The "badly thought out" part is that it (like the original strlcpy
garbage from BSD) thinks that there is only one size that matters -
the destination.

Yes, we fixed part of the "source is also limited" with strscpy(). It
didn't fix the problem with different size limits, but at least it
fixed the fundamentally broken assumption that the source has no size
limit at all.

Honestly, I really really REALLY don't want yet another broken string
handling function, when we still have a lot of the old strlcpy() stuff
in the tree from previous broken garbage.

The fact is, when you copy strings, both the destination *AND* the
source may have size limits. They may be the same. Or they may not be.

This is particularly noticeable in the "str*_pad()" versions. It's
simply absolutely and purely wrong. I will note that we currently have
not a single user or strscpy_pad() in the whole kernel outside of the
testing code.

And yes, we actually *do* have real and present cases of "source and
destination have different sizes". They aren't common, but they do
exist.

So I'm putting my foot down on yet another broken string copy
interface from people who do not understand this fundamental issue.

              Linus
