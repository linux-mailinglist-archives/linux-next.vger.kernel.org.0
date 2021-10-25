Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15E05438F43
	for <lists+linux-next@lfdr.de>; Mon, 25 Oct 2021 08:17:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230111AbhJYGTb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Oct 2021 02:19:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230106AbhJYGTb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 25 Oct 2021 02:19:31 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D131C061745;
        Sun, 24 Oct 2021 23:17:09 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id g20so10895041qka.1;
        Sun, 24 Oct 2021 23:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GPoDgik1UiWQBssAGNA2GV0mEfcDQ5chmLH4PvoXO3c=;
        b=c5WQkxd1JsEO+v+0JDW2pjqbjhfsP3Phyndl/d3yoeV4sLQ/RhLOCzxg/1nzpjKNXN
         3/fqoY5/tOMLeX7Yzfs0MAA/l3s18f1fD4fBTqbJaPrge0mlJ+MRfh2wOdiw2Bsq57VL
         2DkYs2yeR83vF4eVSrRMG6dwCjdEn54pxLf+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GPoDgik1UiWQBssAGNA2GV0mEfcDQ5chmLH4PvoXO3c=;
        b=ReBDuwzlP6xL4qS8gjPqgJB7O97nS0XZkFcuLx5nbYNhyraAFYkz9aganSaKuu98wG
         /KMIwCVTPO0m4Gv0ksiVqpHV4z6NGBlUDyR3caKKIV/JcwmbRhi/hriJI2NVLyVSPi3N
         Plql8vHGzDq/KQvVt65iuJZ0Kbb7Gz8eSpdxGww36JB3j+h9nZ2MWuMcp04/Kw2OTefh
         X9/tvb7PJI5Ie4n/S/TAIPyXvChKWwYOGTdyaGIm03ZrEHLYUg9MGtcSXFBLLDpyeJk4
         eYRizG0OOdSxDX7ZHZ9riUcVQFmg3/JB8+ba0Q5at5Tf40MjjuvvGghy770V/csVxZui
         cBgQ==
X-Gm-Message-State: AOAM530eLkF72i5e9A8KQFHLadIfKJ3Xo/B6MVqBs1ZZPiVmC8f13r//
        PXyrgjy0hA2LbhWuDCbJCWHf/if0DwcqYbEr+3QfCkKB
X-Google-Smtp-Source: ABdhPJxjEX0xUK/d9UEEvS2J857EtIGyVDBgU/LBD/CeB1nRTgq5Wp266O2imCHr4aYsMdT+MmrAsCNhqIw8Y+KZEkA=
X-Received: by 2002:a05:620a:46aa:: with SMTP id bq42mr11912821qkb.291.1635142628512;
 Sun, 24 Oct 2021 23:17:08 -0700 (PDT)
MIME-Version: 1.0
References: <20211022193853.296c4ee9@canb.auug.org.au> <CACPK8XcWyJYj94q+Jp+KgTnM_f4vyY_gSyjUXN8ZPOtnbpJjfg@mail.gmail.com>
 <20211025170941.7eb30042@canb.auug.org.au>
In-Reply-To: <20211025170941.7eb30042@canb.auug.org.au>
From:   Joel Stanley <joel@jms.id.au>
Date:   Mon, 25 Oct 2021 06:16:56 +0000
Message-ID: <CACPK8XfVEn11ps5AuwcoUgPWE+hw-O+_rjAUARd=rkLCQNW8kA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Eddie James <eajames@linux.ibm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 25 Oct 2021 at 06:09, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Joel,
>
> On Mon, 25 Oct 2021 05:58:37 +0000 Joel Stanley <joel@jms.id.au> wrote:
> >
> > If I apply this patch then the build fails in a tree that doesn't have
> > Willy's patch.
> >
> > Unless someone has a better suggestion I'll send a patch that includes
> > both headers for now, and make a note to remove the mm.h include down
> > the track.
>
> Don't apply anything.  Just remember to tell Linus (or whoever you
> merge this tree via) about this conflict and the resolution when you
> send the pull request.

Okay. It's not a conflict though, rather an ordering issue.

Greg has already merged this patch into his char-misc driver tree.
