Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3973140A304
	for <lists+linux-next@lfdr.de>; Tue, 14 Sep 2021 04:03:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230340AbhINCFJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Sep 2021 22:05:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231248AbhINCFH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 13 Sep 2021 22:05:07 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42C18C061762
        for <linux-next@vger.kernel.org>; Mon, 13 Sep 2021 19:03:51 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id g1so13755747lfj.12
        for <linux-next@vger.kernel.org>; Mon, 13 Sep 2021 19:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tobHcPJqhSNN4ZgtQaxMXpHgpTB6zZsMk6e9QdMIJao=;
        b=COw8J9SZUs4LkLiixQE+bnMy4NhxzCRXjrXYewVuOym1vN7v5KNNtqhQIlVcrbvboC
         UjjjEk1x1NdooPYMhBvKaSWvMvmm+9qbRiHG23qPOwLueInAFV1LTxwOeLxyCpMeQrus
         dKVrFrAyLVCKJ4IB9zqk3uoXaWuxBLuq4iGm4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tobHcPJqhSNN4ZgtQaxMXpHgpTB6zZsMk6e9QdMIJao=;
        b=sjL2bKsmioNOnXFXFf777O92G8SRGIIie+KdEG9XPLuk672yCQ7xNWQzrQxbZr9wtv
         Q8rWUSkdqIHvfeVJktui3IBzVg8TZ57//e80gQH1rOR3vtKFmWUBDgsJWBp+EcjuWErB
         po3f0UPh+2iohGtV4h3NWGkMonb0O7jV0z27jqRF/sLqLfyxS0/J6Xz1UTR/NzgZBzcd
         JrnSkUcX/ExW2LIWxdeunq8eBqE45+Ifsby5bShW9sJ1bNw4gRXoDx8aeECCqo7rVPzj
         rDXLbAYtv99ryPtxz6xgWvc4UiSJiu73pALaYxzlltv7HSdZJqneAMmoF61fiYZiYoot
         iZKA==
X-Gm-Message-State: AOAM530FWTzUzCwvH7pPTIAe6RYndaTFh1vHi1P2MjmaS4RVFm/wwfEW
        +PGYaubMXjj2wOzfSMKYSbvjSWOgpnK1Yt76G30=
X-Google-Smtp-Source: ABdhPJxCFbJmM+jvA1iwGiZl7KOtNWtT+e54q2EC+kW6WvtovDtCUqpqPVNCF8KtBGqpZa1z5DjBDQ==
X-Received: by 2002:a05:6512:1325:: with SMTP id x37mr11174685lfu.101.1631585029427;
        Mon, 13 Sep 2021 19:03:49 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id a16sm1153015ljq.22.2021.09.13.19.03.47
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Sep 2021 19:03:47 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id y6so20804378lje.2
        for <linux-next@vger.kernel.org>; Mon, 13 Sep 2021 19:03:47 -0700 (PDT)
X-Received: by 2002:a2e:1542:: with SMTP id 2mr13338597ljv.249.1631585027415;
 Mon, 13 Sep 2021 19:03:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210914100853.3f502bc9@canb.auug.org.au> <CAHk-=whOv-LZKxBqQr8yzmhi7sN4zoFG7t8ALNx+2XFhXjGTpA@mail.gmail.com>
 <CAHk-=whGuEkYmQcJx8WfZ7MFhbKGJDcA6NUZWtrnM6Y6xFqATw@mail.gmail.com>
 <20210914105359.5c651d55@canb.auug.org.au> <CAHk-=whyWUdJDeOBN1hRWYSkQkvzYiQ5RbSW5rJjExgnbSNX9Q@mail.gmail.com>
 <CAHk-=wj4-=NbwH7-bZQayZa4waw=G8r6inxzBK9NFRQsvUceCg@mail.gmail.com>
In-Reply-To: <CAHk-=wj4-=NbwH7-bZQayZa4waw=G8r6inxzBK9NFRQsvUceCg@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 13 Sep 2021 19:03:31 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg6ADF7EkeZVT=R0=-hRxZeT0Ffcc5HSB0hSbK9AMX10w@mail.gmail.com>
Message-ID: <CAHk-=wg6ADF7EkeZVT=R0=-hRxZeT0Ffcc5HSB0hSbK9AMX10w@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the origin tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Sep 13, 2021 at 6:37 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Anyway, that just makes me think that something like that patch in my
> previous email is the way to go, but I would like to stress (again)
> how little testing it had: exactly none.
>
> So please consider that nothing more than a hand-wavy "something like this".

The alternative would be to just add a

  #ifndef __ASSEMBLY__
  ...
  #endif

around the whole thing. I could do that without asking for help from
the powerpc people.

But it really does seem kind of wrong to include a "compiler
attributes" header file to compile a *.S file. It's not like any of
those attributes are valid in asm anyway.

I did just verify that the patch I sent out seems to cross-compile ok.
At least for the power64 defconfig.

So that's _some_ testing, and implies that the patch isn't complete garbage.

          Linus
