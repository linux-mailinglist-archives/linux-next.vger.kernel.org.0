Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87C9296E83
	for <lists+linux-next@lfdr.de>; Wed, 21 Aug 2019 02:45:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726864AbfHUAnr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Aug 2019 20:43:47 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:42391 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726408AbfHUAnr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 20 Aug 2019 20:43:47 -0400
Received: by mail-lj1-f196.google.com with SMTP id l14so468667ljj.9
        for <linux-next@vger.kernel.org>; Tue, 20 Aug 2019 17:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FajnE/5GS1R2x5f3KG7EhW3STXyEPWL5jLH+s75xMBQ=;
        b=OgGbnwzdMlBAxLB0nXPGR8lubUdwdOMnk2GEOoXr3ylU9Q4sYetMQAd0uyU6IRIorM
         6UooosusQb98US54SL+QLtui7+wSkw1J+s0FbmhwlQnB3R+SnqoFoBEwQDU+caRSgP7i
         oQM5/7n/2VIdCOuSgZodegRcjr5fApTWthAQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FajnE/5GS1R2x5f3KG7EhW3STXyEPWL5jLH+s75xMBQ=;
        b=Bee7SihQzp9pc6ffkL8wrlqwOBvQPKHtvUbEY+XQroQqaVxp4/3hjvNj/c8hQZCbRs
         QIgOesfVXyIZq467B072YvBSiTzvjxRMqsC+Qjkcga3xJXa9MIIovL3+1Pic10PGIXPk
         eERCgc1aP2sq0jmBgU+14Iss64HUybYTy8u+zvHqlwRiYH4xpmQfzdJADMYWqrCNnbJk
         lZKgrFrDci+lbDG7SjNI5nQ/5aVWANGSpWbvba0FN79GzXVyyQkXWKRO8kjVNkQrZRYj
         ZxCJ+KA8I4zdY7libpeKkX9ydw4CyV56Is43vQPwMPb9jK0Fl57I1xYHPh1TvhLfLhjz
         ryNA==
X-Gm-Message-State: APjAAAWGufKVTxJj9ShnnbzusWVOnDHUk+FxMptHAiAHSgh/SzacHq6f
        gbAg5GtW4sbGy6K2hvK76wGZ484qpGI=
X-Google-Smtp-Source: APXvYqxijDfLF5UHcMgm+rhOw1GD14u4LoP2z+IKUICpdq6DiZEDN7l4E75obDNWx9CNbFLxRjXOgA==
X-Received: by 2002:a2e:8559:: with SMTP id u25mr17075894ljj.224.1566348224981;
        Tue, 20 Aug 2019 17:43:44 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id d22sm3436432lji.99.2019.08.20.17.43.43
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Aug 2019 17:43:44 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id n19so415235lfe.13
        for <linux-next@vger.kernel.org>; Tue, 20 Aug 2019 17:43:43 -0700 (PDT)
X-Received: by 2002:a19:c20b:: with SMTP id l11mr16880592lfc.106.1566348223500;
 Tue, 20 Aug 2019 17:43:43 -0700 (PDT)
MIME-Version: 1.0
References: <c0005a09c89c20093ac699c97e7420331ec46b01.camel@perches.com>
 <9c7a79b4d21aea52464d00c8fa4e4b92638560b6.camel@perches.com>
 <CAHk-=wiL7jqYNfYrNikgBw3byY+Zn37-8D8yR=WUu0x=_2BpZA@mail.gmail.com>
 <6a5f470c1375289908c37632572c4aa60d6486fa.camel@perches.com>
 <4398924f28a58fca296d101dae11e7accce80656.camel@perches.com>
 <ad42da450ccafcb571cca9289dcf52840dbb53d3.camel@perches.com>
 <20190820092451.791c85e5@canb.auug.org.au> <14723fccc2c3362cc045df17fc8554f37c8a8529.camel@perches.com>
 <CAHk-=wgqQKoAnhmhGE-2PBFt7oQs9LLAATKbYa573UO=DPBE0Q@mail.gmail.com> <edd8efd53fadd07992f804cc595c6ae5fdb60e73.camel@perches.com>
In-Reply-To: <edd8efd53fadd07992f804cc595c6ae5fdb60e73.camel@perches.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 20 Aug 2019 17:43:27 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg8vLmmwTGhXM51NpSWJW8RFEAKoXxG0Hu_Q9Uwbjj8kw@mail.gmail.com>
Message-ID: <CAHk-=wg8vLmmwTGhXM51NpSWJW8RFEAKoXxG0Hu_Q9Uwbjj8kw@mail.gmail.com>
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

On Tue, Aug 20, 2019 at 5:20 PM Joe Perches <joe@perches.com> wrote:
>
> Umm, btw: have you actually looked at stracpy?

Yes, Joe, I have.

What part of "there are now so many of them that no human being can
keep track of them" didn't you see as a problem?

How many broken string functions are we going to do, adding yet
another one when you notice that the _last_ one wasn't great?

We never seem to remove the broken ones. We just add yet another one,
and have a never-ending jumble of random letters.

I would seriously suggest doing something like

   copy_string( dst, dstsize, src, srcsize, FLAGS );

where FLAGS migth be "pad" or whatever. Make it return the size of the
resulting string, because while it can be convenient to pass 'dst" on,
it's not useful.

And then maybe just add the helper macro that turns an array into a
"pointer, size" combination, rather than yet another letter jumble.

            Linus
