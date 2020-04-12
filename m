Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 437021A5CEF
	for <lists+linux-next@lfdr.de>; Sun, 12 Apr 2020 07:37:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725815AbgDLFhB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 12 Apr 2020 01:37:01 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:44027 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725832AbgDLFhB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 12 Apr 2020 01:37:01 -0400
Received: by mail-lf1-f68.google.com with SMTP id k28so4170168lfe.10
        for <linux-next@vger.kernel.org>; Sat, 11 Apr 2020 22:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vvlpjcamHI+sCRPT64OJBF1nLanNoQNuKy4qrc0A8Ho=;
        b=XaNBDFvb3+awYcw1mwatbhAG6DCTxggAi00jDqO3PHi100YJh+gb12/DtiDFlJFzNi
         ziPCn5qFxZqIbSNcjFfjXKiIdeMX3Q+VgfyOcs1yi6Lm874+VXCS6uYuburIy2b1hJ6s
         fLtc/sg+4wwXILtlpfzMzY8RLvAAlPJiW8FQV5BRFP7oIPPV9XLsPYCNJjLOZozLseeA
         I9CLaRsOGyabLbYoxtG17nRYELogY52KhMGBy9yZ5RgDQnetmuYZvxKlCg/T7TFG7AH1
         3FN5nc1vU5cPFyZrZNkHXnsmSATGDAJ6qj5xIK04aOrRDdbAu3UmwrQ9ggcbwV7SStbA
         VeXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vvlpjcamHI+sCRPT64OJBF1nLanNoQNuKy4qrc0A8Ho=;
        b=Y5ak7AZT1g+swgDWCsZBeeJZ2RoevmtyoRWXRNbtTO10rXGAANdC+swwXnnapBOfai
         7HLUh6riTmURjNvN11qEwSPri6Si4OrQk2qd7K118QyPDFb2N5vT1QQPSGmYAtA9O0xs
         SP9Nx/x8m81EplEx/lFvvGc+bBLKbdWlZ5sXX0fhPuB9eBH42srzaqRk2l82QUMht/U2
         jeQcJBKXZaF71HfAuU8+Se4d8ABzpCurk5AC+JZ4lSorQNQPldqdFXJLs2NIqLvDyka3
         Y9Y1hZDp6Y9IQLCbTDrqx1lpBaX0Ikhn7dIhLDqvBAysXws1hlpu0EZkt6bzIh41htAf
         Kv5w==
X-Gm-Message-State: AGi0PubxsStH07Aa98H5hjZpjf7rGUqu0KlF/gXMIAfCdUoXmISj2zgW
        o4P0FCzO1ogIJwEAi9naxVNqS0n6MC3J4PCc8bLbQA==
X-Google-Smtp-Source: APiQypJO0rLSq2wqjOcqnPFw+foByEEkhPjwfZIfx3KIjJS4qePu4Y3CTsxfyo0GmPcVOkZrWiHbT87CuBWEhFREOUs=
X-Received: by 2002:a19:c64b:: with SMTP id w72mr6922572lff.82.1586669817377;
 Sat, 11 Apr 2020 22:36:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200410132706.170811b7@canb.auug.org.au> <27c212c4-b522-561d-411c-e74dc0ff0b74@infradead.org>
 <CAHk-=wjhsM-n_NzSh=cSdpThX+62-x3EmyKjhMqGHFYEyG0nPg@mail.gmail.com>
 <2b0f5d2e-3fe5-10c9-2a9a-9a0b341a52d5@infradead.org> <CAHk-=wjXZSPPWzPs=KBDsLZWuq8qO=9qWfiKHw=yV10fFrDv9Q@mail.gmail.com>
 <bfbcaa67-9656-3a80-fc66-c937297c8be0@infradead.org> <CAHk-=whpvCqcCYvy=_v_F6NTtBSeQbXZ0iLr_smV2NJLT+XACw@mail.gmail.com>
In-Reply-To: <CAHk-=whpvCqcCYvy=_v_F6NTtBSeQbXZ0iLr_smV2NJLT+XACw@mail.gmail.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Sun, 12 Apr 2020 11:06:46 +0530
Message-ID: <CA+G9fYu47hpXjYtAr32p9yJ97KZqTry+ioAY1S2TqtiKztCYRg@mail.gmail.com>
Subject: Re: linux-next: Tree for Apr 10 (lib/test_printf.ko)
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Brendan Higgins <brendanhiggins@google.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

FYI,

Is this problem related to,

Regression reported on Linux next 5.6.0-rc4-next-20200305 on x86_64,
i386, arm and arm64. The steps to reproduce is running kselftests lib
printf.sh test case.
Which is doing modprobe operations.

BUG: kernel NULL pointer dereference, address: 00 - ida_free+0x76/0x140

https://lore.kernel.org/linux-kselftest/CAFd5g46Bwd8HS9-xjHLh_rB59Nfw8iAnM6aFe0QPcveewDUT6g@mail.gmail.com/T/

-- 
Linaro LKFT
https://lkft.linaro.org
