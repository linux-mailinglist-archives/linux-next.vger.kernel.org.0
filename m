Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F06A3970F2
	for <lists+linux-next@lfdr.de>; Wed, 21 Aug 2019 06:16:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727650AbfHUEQw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 21 Aug 2019 00:16:52 -0400
Received: from wtarreau.pck.nerim.net ([62.212.114.60]:28811 "EHLO 1wt.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727457AbfHUEQw (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 21 Aug 2019 00:16:52 -0400
X-Greylist: delayed 899 seconds by postgrey-1.27 at vger.kernel.org; Wed, 21 Aug 2019 00:16:51 EDT
Received: (from willy@localhost)
        by pcw.home.local (8.15.2/8.15.2/Submit) id x7L41OHU009738;
        Wed, 21 Aug 2019 06:01:24 +0200
Date:   Wed, 21 Aug 2019 06:01:24 +0200
From:   Willy Tarreau <w@1wt.eu>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Joe Perches <joe@perches.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Julia Lawall <julia.lawall@lip6.fr>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux@googlegroups.com,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: rfc: treewide scripted patch mechanism? (was: Re: [PATCH]
 Makefile: Convert -Wimplicit-fallthrough=3 to just -Wimplicit-fallthrough
 for clang)QUILT
Message-ID: <20190821040124.GA9608@1wt.eu>
References: <9c7a79b4d21aea52464d00c8fa4e4b92638560b6.camel@perches.com>
 <CAHk-=wiL7jqYNfYrNikgBw3byY+Zn37-8D8yR=WUu0x=_2BpZA@mail.gmail.com>
 <6a5f470c1375289908c37632572c4aa60d6486fa.camel@perches.com>
 <4398924f28a58fca296d101dae11e7accce80656.camel@perches.com>
 <ad42da450ccafcb571cca9289dcf52840dbb53d3.camel@perches.com>
 <20190820092451.791c85e5@canb.auug.org.au>
 <14723fccc2c3362cc045df17fc8554f37c8a8529.camel@perches.com>
 <CAHk-=wgqQKoAnhmhGE-2PBFt7oQs9LLAATKbYa573UO=DPBE0Q@mail.gmail.com>
 <edd8efd53fadd07992f804cc595c6ae5fdb60e73.camel@perches.com>
 <CAHk-=wg8vLmmwTGhXM51NpSWJW8RFEAKoXxG0Hu_Q9Uwbjj8kw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wg8vLmmwTGhXM51NpSWJW8RFEAKoXxG0Hu_Q9Uwbjj8kw@mail.gmail.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Aug 20, 2019 at 05:43:27PM -0700, Linus Torvalds wrote:
> I would seriously suggest doing something like
> 
>    copy_string( dst, dstsize, src, srcsize, FLAGS );
> 
> where FLAGS migth be "pad" or whatever. Make it return the size of the
> resulting string, because while it can be convenient to pass 'dst" on,
> it's not useful.

I actually like this a lot. FLAGS could also indicate whether or not a
zero before srcsize ends the copy or not, allowing to copy substrings
of known length or known valid strings of unknown length by passing ~0
in srcsize. And it could also indicate whether the returned value should
indicate how much was copied or how much would have been needed for the
copy to work (so that testing (result <= dstsize) indicates truncation).

> And then maybe just add the helper macro that turns an array into a
> "pointer, size" combination, rather than yet another letter jumble.

I did exactly this in some of my projects including haproxy, I called
the lib "ist" for "indirect string", and found it extremely convenient
to use because many functions now return an ist or take an ist as an
argument. Passing a structure of only two elements results in passing
only two registers, and that's the same for the return value. Moreover,
the compiler is smart enough to eliminate a *lot* of manipulations, and
to replace pointer dereferences with direct register manipulations. I
do have a lot of ist("foo") spread everywhere in the code, which makes
a struct ist from the string and its length, and when you look at the
code, the compiler used immediate values for both the string and its
length. It's also extremely convenient for string comparisons and
lookups because you start by checking the length and can eliminate
lookups and dereferences, making keyword parsers very efficient. It
also allows us to have an istcat() function doing like strncat() but
with the output size always known so that there's no risk of appending
past the end when the starting point doesn't match the beginning of a
string.

I must confess that I became quite addict to using this because it's
so much convenient not to have to care about string length nor zero
termination anymore, without the overhead of calling strlen() on
resulting values!

For illustration of the simplicity the code is here :
    http://git.haproxy.org/?p=haproxy.git;a=blob_plain;f=include/common/ist.h

And here are a few examples of usage:
  - declaration in arrays:
    http://git.haproxy.org/?p=haproxy.git;a=blob;f=contrib/prometheus-exporter/service-prometheus.c;h=9b9ef2ea8e2e8ee0cc63364500d39fc08009fb8d;hb=HEAD#l644
  - appending to a string:
    http://git.haproxy.org/?p=haproxy.git;a=blob;f=contrib/prometheus-exporter/service-prometheus.c;h=9b9ef2ea8e2e8ee0cc63364500d39fc08009fb8d;hb=HEAD#l1112
  - passing as function arguments:
    http://git.haproxy.org/?p=haproxy.git;a=blob;f=src/http_ana.c;h=b2069e3ead59e7bcde45ac76a1c6b0b6b5fb3882;hb=HEAD#l2468
    http://git.haproxy.org/?p=haproxy.git;a=blob;f=src/http_ana.c;h=b2069e3ead59e7bcde45ac76a1c6b0b6b5fb3882;hb=HEAD#l2602
  - checking for known values:
    http://git.haproxy.org/?p=haproxy.git;a=blob;f=src/h2.c;h=c41da8e5ee116e75e4719709527511c299a3657c;hb=HEAD#l295

I'm personally totally convinced by this approach and am slowly improving
this interface to progressively use it everywhere, and quite frankly I
can only strongly recommend going into the same direction for ease of
use, safety, and efficiency.

Willy
