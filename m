Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E21EB624C61
	for <lists+linux-next@lfdr.de>; Thu, 10 Nov 2022 22:04:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231639AbiKJVEK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Nov 2022 16:04:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231342AbiKJVEI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 10 Nov 2022 16:04:08 -0500
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE8DC4AF22
        for <linux-next@vger.kernel.org>; Thu, 10 Nov 2022 13:04:07 -0800 (PST)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-13b23e29e36so3501917fac.8
        for <linux-next@vger.kernel.org>; Thu, 10 Nov 2022 13:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K2FSyx/7hf/Wl53aKBYclj6BZx3v4YrSE/GL1nVyZ+M=;
        b=me6Oqd3J14Kjh53kFqMRs4MQFuNZ/MTfo+A2c7eVS1UU6VtwxGhDUHJLpLHnr3+UlL
         XKuHrixc6HYsZJJIz0WZP5r7KiSP9DXC9AdZ3ndEgfy4VJSCpPbKgSPFgc5AKGO0X42d
         TLCwHz0tbczFYtTaUJugKc97aNjhxhSZo7qvK3ZLwoofQ1bu7kQzUxAwG+TtEBha1r9v
         MTrx8sgYeoMTyk2uZdT70RpHOO5Xu1Eu3zZNFAKJXR72dUI5VIyI1pvFtyD0rsLiJYS8
         h6qMf2YMv5yaecUzm9M8N7GheOQ0og4L3M8pro70otwIwVnAEkhx+9YxVEpoQ56tKHmn
         qL4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K2FSyx/7hf/Wl53aKBYclj6BZx3v4YrSE/GL1nVyZ+M=;
        b=IPPivF4YShOpjpRDLf/TLcMlIl1TKnxyYJy4L4hodCRUY3x8jYpnInfs+YBNt3Womi
         jGsWllPJ6hJCyTTAVKjssOXm0jGZV8AQn3Zbs0FZD19EUdKNDV0eOjNC+m3NXQLvPicB
         uRArmVOljNBXsGqufMwlESNOKZXqK1dY+yKs05xUQehEv1hHo1+aG7d5tMTil6YpfjMA
         udRImGXuALyE961lMu8wO534kzVdm34/oqzn+TALc368wlAPlkTHcih9DX28Elz6N2j0
         /ilqsMcQTxh/PnnzQZt/pB1cYGilPZ7usGpIXCCD5iL47PTO0up9iOPCy7rZtI8pvnTD
         OMig==
X-Gm-Message-State: ACrzQf0wvc/SXep7gl3jg9NZwXrq++ypAV07eDIWoZOmAPxTTZTJ8yaz
        AHl/fPxJdLELZjvEtUQk97VsqpFkXKDiLZo+hWTJBw==
X-Google-Smtp-Source: AMsMyM5FqivOusKyXCfu9CKG+fGkgjpfhMbFK+Zp84zmhABRLSR9WPRL3GWdUBKamriIvuAmpzwCer5gRb40d8y8Ilo=
X-Received: by 2002:a05:6870:9727:b0:13d:a22b:3503 with SMTP id
 n39-20020a056870972700b0013da22b3503mr2092455oaq.233.1668114246723; Thu, 10
 Nov 2022 13:04:06 -0800 (PST)
MIME-Version: 1.0
References: <000000000000e915eb05ecf9dc4d@google.com> <Y2qjerZigLiO8YVw@zx2c4.com>
 <CACT4Y+a3bJmMf8JNm=SZYOKtgSVnOpY4+bgdT4ugLLhVV-NCEA@mail.gmail.com> <Y2rrZ8lIIMrKkb2Z@zx2c4.com>
In-Reply-To: <Y2rrZ8lIIMrKkb2Z@zx2c4.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Thu, 10 Nov 2022 13:03:55 -0800
Message-ID: <CACT4Y+Y+h_tNN0XT9fb0jYH7V4HvWR=D1R8qsduor9jDSSi80g@mail.gmail.com>
Subject: Re: [syzbot] linux-next boot error: WARNING in kthread_should_stop
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     syzbot <syzbot+25aae26fb74bd5909706@syzkaller.appspotmail.com>,
        herbert@gondor.apana.org.au, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        linux@dominikbrodowski.net, olivia@selenic.com,
        sfr@canb.auug.org.au, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 8 Nov 2022 at 15:51, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> > <syzkaller-bugs@googlegroups.com> wrote:
> > >
> > > Already fixed in the tree.
> >
> > Hi Jason,
> >
> > The latest commit touching this code in linux-next is this one. Is it
> > the fixing commit?
> >
> > commit e0a37003ff0beed62e85a00e313b21764c5f1d4f
> > Author:     Jason A. Donenfeld <Jason@zx2c4.com>
> > CommitDate: Mon Nov 7 12:47:57 2022 +0100
> >     hw_random: use add_hwgenerator_randomness() for early entropy
>
> It's this one: https://git.kernel.org/pub/scm/linux/kernel/git/crng/random.git/commit/?id=9807175c5515cea94f8ac6c157f20cc48c40465b
>
> Couple hours more and there'll be a new linux-next with the fix.
>
> Jason

Let's tell syzbot about the fix so that it reports similar bugs in future:

#syz fix: hw_random: use add_hwgenerator_randomness() for early entropy
