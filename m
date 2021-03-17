Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1601D33FABF
	for <lists+linux-next@lfdr.de>; Wed, 17 Mar 2021 23:03:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbhCQWDS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Mar 2021 18:03:18 -0400
Received: from gimli.rothwell.id.au ([103.230.158.156]:52925 "EHLO
        gimli.rothwell.id.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229866AbhCQWDH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 17 Mar 2021 18:03:07 -0400
X-Greylist: delayed 504 seconds by postgrey-1.27 at vger.kernel.org; Wed, 17 Mar 2021 18:03:06 EDT
Received: from authenticated.rothwell.id.au (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.rothwell.id.au (Postfix) with ESMTPSA id 4F13pK75h5zybF;
        Thu, 18 Mar 2021 08:54:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rothwell.id.au;
        s=201702; t=1616018061;
        bh=N1kdYdxPZ3Ng+LZZ5Yo8hKl36tCtypl02m9heHMxtY0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=NmWD36wcZ0F9H93FcR4yGrT1bsoNab1CbwPbtOoURYtOLFLazhFzDmFhUxZbGVCbL
         xVZNZRhCbCx2shQ6KbXzz/5UTPJUu/giRHChJirnP+18+S9csHybjt0eOEiFxpickK
         +Mh3t7rtBEcVKKP4zR6LFFo6eveRCCTwnYVoA/cE4Hlb9tklF+a/ZSqAQDQx1Y9l0O
         SkRw6LPHKs6PddXAQBXkWOddrcVJ2jukO1OYwkl38IUA6rqd8QQwxSo5ZPWd5hLdKh
         vjJ1xtK17p3wPcz/ofXtYHPvJCoHLHNECjOF0ozl+/kmI0zUAkugT0YBjeACCxMXju
         0CVSG6NrvUr7w==
Date:   Thu, 18 Mar 2021 08:54:16 +1100
From:   Stephen Rothwell <sfr@rothwell.id.au>
To:     Ingo Molnar <mingo@kernel.org>
Cc:     Borislav Petkov <bp@suse.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Ian Rogers <irogers@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20210318085416.1a868758@elm.ozlabs.ibm.com>
In-Reply-To: <20210317200408.GA3830960@gmail.com>
References: <20210317150858.02b1bbc8@canb.auug.org.au>
        <20210317105432.GA32135@zn.tnic>
        <CAP-5=fWKCtJq-9zd5A-XALJWNf8tsds44m-G07sc+kCUoXB8zg@mail.gmail.com>
        <20210317180236.GF32135@zn.tnic>
        <20210318054921.64c0fc75@canb.auug.org.au>
        <20210317191847.GG32135@zn.tnic>
        <20210317200408.GA3830960@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Ingo,

On Wed, 17 Mar 2021 21:04:08 +0100 Ingo Molnar <mingo@kernel.org> wrote:
>
> * Borislav Petkov <bp@suse.de> wrote:
> 
> > On Thu, Mar 18, 2021 at 05:49:21AM +1100, Stephen Rothwell wrote:  
> > > That fixes the powerpc build for me, thanks.  
> > 
> > Thx, adding your Tested-by and pushing out.  
> 
> I've pushed this out into tip:auto-latest as well, so that tomorrow's 
> -next should pick this up automatically. (Assuming everything else is 
> fine.)

Excellent, thanks.

-- 
Cheers,
Stephen Rothwell
