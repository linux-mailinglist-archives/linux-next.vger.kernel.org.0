Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2C261D7F1B
	for <lists+linux-next@lfdr.de>; Mon, 18 May 2020 18:49:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727782AbgERQtu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 May 2020 12:49:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726958AbgERQtu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 18 May 2020 12:49:50 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37D20C061A0C
        for <linux-next@vger.kernel.org>; Mon, 18 May 2020 09:49:50 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id u6so10610746ljl.6
        for <linux-next@vger.kernel.org>; Mon, 18 May 2020 09:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KygdLUcTs6knBX0F3T/JLZYcVgSrVEzt6jZyrJ+boZQ=;
        b=S9bunU4mXjCTchqmsktCwiUzwrjCVNgd8YdFx6fqrfQbJSITfJ3Gfe0UZSPKy1COMq
         XgtV3MuVzYZ10FDt3fKxp2DI4i0KU99M1qsxjthk3kmKU65B8LYjZ+6gpdV3oGSJtrEX
         CvNN34lX+RlxUFi8ZDs+UvDfbUaWrrsJnAN1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KygdLUcTs6knBX0F3T/JLZYcVgSrVEzt6jZyrJ+boZQ=;
        b=As45Yfm51pqmWON3s3+LB8uGRwZwLjqzMBwikC66QI4g3zsUWZWi6gHj1i+2JFVh83
         OjWKMBZCnWeYaGkSA+FlTRGDZOCm6p0MrdUjHuL0nYmJDaP2rbAM6HxQiQFqbL/Mbzwl
         o3blGOu451Z8IMBn5CPrXAcUafSPoob2qJb/dWNuU/F6k9yuhkf6RPST5aKun2VJQwgJ
         7Ondym7PGno4D2s7P9wFTlpwmVu0Ux7EEyRc4M8HitM9W/cWgulT2usmEJ2LBOr9oVbN
         z110i6EB0AlhnXRZ/j/Wj4bRCc6OWoGivPc13x7pTXLHT/3gb5c+7+QO9fWqOC6vNW/O
         +6qw==
X-Gm-Message-State: AOAM532Q1ryhywivEFhclCYzwO98m8ff+1aNvQcXw6Oi9Pxeyirl2j3k
        CTcHp+/YtF/dWEaOl4YwW8cPFl7QRt0=
X-Google-Smtp-Source: ABdhPJytGRTBjHqhxKj6VIQwRTMavcBaGnQV5ojhXL1AeokdCF79O7jZ9FzD5vRJP4YYc0OCAAWbMA==
X-Received: by 2002:a2e:b5d1:: with SMTP id g17mr5117218ljn.59.1589820588237;
        Mon, 18 May 2020 09:49:48 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id 4sm5890275ljc.65.2020.05.18.09.49.47
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2020 09:49:47 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id w15so1320727lfe.11
        for <linux-next@vger.kernel.org>; Mon, 18 May 2020 09:49:47 -0700 (PDT)
X-Received: by 2002:a05:6512:62:: with SMTP id i2mr3329357lfo.152.1589820586909;
 Mon, 18 May 2020 09:49:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200518145723.65b89375@canb.auug.org.au> <968394.1589817650@warthog.procyon.org.uk>
In-Reply-To: <968394.1589817650@warthog.procyon.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 18 May 2020 09:49:29 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj6J-iqrCr_7oLDCbS8qXQ69EF=nPLWmvBiDmgdNWZ6KA@mail.gmail.com>
Message-ID: <CAHk-=wj6J-iqrCr_7oLDCbS8qXQ69EF=nPLWmvBiDmgdNWZ6KA@mail.gmail.com>
Subject: Re: How should we handle a bool depending on a tristate?
To:     David Howells <dhowells@redhat.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, May 18, 2020 at 9:01 AM David Howells <dhowells@redhat.com> wrote:
>
>
> Blech.  Yeah.  "depends on" doesn't work either.  The problem actually lies
> within the Kconfig framework.  It doesn't know how to handle a bool depending
> on a tristate.

No problem with Kconfig. It knows exactly how to let a bool depend on
a tristate.

It's just that there are two different kinds of dependencies.

For example, the dependency can be a hard and absolute dependency
(linking doesn't work, or whatever), and then obviously built-in code
cannot be enabled if the thing it depends on is a loadable module.

But the dependency can also be a conceptual one: "This option doesn't
make sense unless that option is set". Then a bool can make sense even
if the other config is a modular one.

And Kconfig can deal with either situation just fine.

Do

    depends on XYZ = y

or

    depends on XYZ != n

to clarify the choice. One requires a hard dependency, the other
requires that the  option just be enabled.

Now, if you just do "depends on XYZ", it allows a bool to be enabled
even for just a module (ie that second case). That makes sense for a
lot of "allow this feature in the module" kind of options, where it
would be pointless to even ask about a boolean feature if the parent
module isn't even enabled.

But that "depends on XYZ=y" is not uncommon. It basically says "this
option makes sense only when built in". Either because it requires it
for linking, or just because it doesn't work or make sense without it.

                     Linus
