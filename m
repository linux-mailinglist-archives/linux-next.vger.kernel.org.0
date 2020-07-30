Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B9E8232A25
	for <lists+linux-next@lfdr.de>; Thu, 30 Jul 2020 04:41:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726724AbgG3Cln (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Jul 2020 22:41:43 -0400
Received: from wtarreau.pck.nerim.net ([62.212.114.60]:39154 "EHLO 1wt.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726319AbgG3Cln (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 29 Jul 2020 22:41:43 -0400
X-Greylist: delayed 647 seconds by postgrey-1.27 at vger.kernel.org; Wed, 29 Jul 2020 22:41:42 EDT
Received: (from willy@localhost)
        by pcw.home.local (8.15.2/8.15.2/Submit) id 06U2Ui4w007702;
        Thu, 30 Jul 2020 04:30:44 +0200
Date:   Thu, 30 Jul 2020 04:30:44 +0200
From:   Willy Tarreau <w@1wt.eu>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Emese Revfy <re.emese@gmail.com>,
        Kees Cook <keescook@chromium.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the origin tree
Message-ID: <20200730023044.GA7518@1wt.eu>
References: <20200730090828.2349e159@canb.auug.org.au>
 <CAHk-=wjK8+12i8iDC41LXfZBcMjGsF+WyW_+ncPFmrexRT0yxw@mail.gmail.com>
 <CAHk-=whA7d4ug8-=TQWq_uR04+MqbfZemz+meFhfu_bCyGzvpw@mail.gmail.com>
 <CAHk-=wiFLA=TeG903JHPvRHSoMd=mE=7EC0OMajs+bo014A4Lw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wiFLA=TeG903JHPvRHSoMd=mE=7EC0OMajs+bo014A4Lw@mail.gmail.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jul 29, 2020 at 07:12:58PM -0700, Linus Torvalds wrote:
> On Wed, Jul 29, 2020 at 5:09 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > Removing the __latent_entropy marker obviously fixes things.
> 
> Ok, I did that for now. I spent a few minutes looking at the gcc
> plugin in case I'd be hit by some sudden stroke of genius, but that
> didn't happen, so let's avoid the issue until somebody who knows the
> gcc plugins better can come up with what the right solution is.

I've looked if we couldn't we work around this by declaring another
static variable with __latent_entropy and use it to initialize
net_rand_state early, for example in prandom_init(), but there we
already fill net_rand_state with randoms so I'm wondering if that
__latent_entropy is used before prandom_init() or if its sole purpose
is to provide extra initial entropy to be combined with the one
prandom_init() will add.

Willy
