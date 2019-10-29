Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 345A6E8C8A
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2019 17:17:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728902AbfJ2QRs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 29 Oct 2019 12:17:48 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:39558 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389902AbfJ2QRs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 29 Oct 2019 12:17:48 -0400
Received: by mail-pg1-f193.google.com with SMTP id p12so9922885pgn.6
        for <linux-next@vger.kernel.org>; Tue, 29 Oct 2019 09:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ypAwiKuKsi5Io6NuqvL960KV+GmDoJ6Gn0TIbiqmcYU=;
        b=LGn7WKNpse2FeLQC/MT4ePdMT/qHVlyGo8T/ae3O/DKn8MUdIEK8IpkBh/rNosUcF+
         z2euOhk/biVxYuEWROhbhjPNeW1V5Z674R+KxYR/LsYqtE8pjeAgFsAZZF4MY5QpT/Rz
         hd6KoLTzGCIW5iTDycjM7AvDR/UG/a3cYN59U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ypAwiKuKsi5Io6NuqvL960KV+GmDoJ6Gn0TIbiqmcYU=;
        b=A/xaAVADhyuf5A5uuv5S9TmW3tiSjK4xnYnvp1vBWFy5VreQzkVZC9Gz9Js870n5/b
         euVZufLpGN3A/naZpg5ZOZK+e2wTPdi1kkPhWkCQnaKKFRGoLXP/BoyAbyFD9wBxir9I
         LdukBoxz14QFOiYjeZjJlEo0sCKzQjl/U8VMkHa4Wxh/9AOOP644FbWQ5VZnOKeYN0Aw
         1HLKmfwMQm9S5qM5ETRIUmZcc1/UYDglJGlghEQpPoOdynMYOBiGdYDApsJgs+Bl2vbm
         6/IAdWyoL4CRJZglUjuUOyVXh/Jub0ZLcM4OcrylzBeUV07/lSUuygGKCRD2m1eYzHvd
         0WXw==
X-Gm-Message-State: APjAAAVgC2t2GiGox2tp0fmUcQMuhWWZDnm6fhfF3bp8aaq/UPQxsyqc
        SeKX+sMr2mUgUx+OFEVvjWgEXQ==
X-Google-Smtp-Source: APXvYqyhMMyzfGJQyAHwXHnN0h/ulxU8eXa3gzz9VvU6d6DeL+C5rLK+X65X9LLX9C6RJ01ozBT1gw==
X-Received: by 2002:a63:e145:: with SMTP id h5mr28723563pgk.447.1572365867431;
        Tue, 29 Oct 2019 09:17:47 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id l22sm13451196pgj.4.2019.10.29.09.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 09:17:46 -0700 (PDT)
Date:   Tue, 29 Oct 2019 09:17:45 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Amit Kucheria <amit.kucheria@linaro.org>
Cc:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Colin King <colin.king@canonical.com>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Linux-Next <linux-next@vger.kernel.org>
Subject: Re: Coverity: calibrate_8976(): Memory - illegal accesses
Message-ID: <201910290916.087AA12F@keescook>
References: <201910281603.E90E9627A@keescook>
 <0451f7e8-ff96-f411-ed26-1310999be3c5@embeddedor.com>
 <CAGXu5jJ+BQEOPnhCtEFARBrMW=0z-+-xHEv1kv-JztG_dt2mwg@mail.gmail.com>
 <CAP245DWT+5xhqHY2w-WPH+-Q0Tujw57UaezqqrT3JRwSVq5iSQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP245DWT+5xhqHY2w-WPH+-Q0Tujw57UaezqqrT3JRwSVq5iSQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Oct 29, 2019 at 09:37:57PM +0530, Amit Kucheria wrote:
> On Tue, Oct 29, 2019 at 9:30 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > On Mon, Oct 28, 2019 at 5:08 PM Gustavo A. R. Silva
> > <gustavo@embeddedor.com> wrote:
> > >
> > > Hi,
> > >
> > > This one has been addressed already:
> > >
> > > https://lore.kernel.org/lkml/CAK7fi1a8CiX=HVqhZSmQJdcjF1X_kdHFDwJhEpYJUcdPTcbMQA@mail.gmail.com/
> > >
> >
> > Ah-ha, excellent. Colin, do you want me to CC you on these automatic
> > reports too?
> >
> 
> Hi Kees,
> 
> Is coverity being run just on linux-next or on mainline too? I've
> noticed it found at least one error that has existed for a long-time
> only when that code was moved around.

There is another public Coverity scan that runs the -rcX releases. Dave
Jones tends to operate that one, and I haven't attached any tooling to
that one. I wanted to see how noisy running against linux-next was
first...

-- 
Kees Cook
