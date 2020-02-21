Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3791168959
	for <lists+linux-next@lfdr.de>; Fri, 21 Feb 2020 22:30:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726683AbgBUVaB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 21 Feb 2020 16:30:01 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39324 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726787AbgBUVaB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 21 Feb 2020 16:30:01 -0500
Received: by mail-wr1-f67.google.com with SMTP id y11so3588445wrt.6
        for <linux-next@vger.kernel.org>; Fri, 21 Feb 2020 13:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mFjrO26n/cvJETtY9WmVBwrxrMD8Cxit/x2V8CBB2BQ=;
        b=On7BfHn+DhdRcr43UtvL6NMFXApq9ckSc830tT9C/jtdKF+KHaoei4lvMiwJaNOUkf
         FPT9vSM9iHgFgvfqsIduljpyOpIh4g5mkMfPAn6f5qYGD9kXlOisuZOGYlA2/EFultZx
         5X0kqvCBc7b+fKUEvUPDxsE8kEd1zAHQMTiWPFc2fdvWf6c8coXDuemVUCrYUVqItwOZ
         oZRdxIKeC5VSGOjC7UoFCa5OyNCjcq2QK8MZBAD5JlqW3kt75dDyPaM7vpKZqsp/UCGV
         90m/pSZ+uIHWSuBpv/sp4Iqx5Kfi+Id/pf3NhsbI9jvYEj3EnbjxUn5wuP4vf6GV1NR1
         WLjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mFjrO26n/cvJETtY9WmVBwrxrMD8Cxit/x2V8CBB2BQ=;
        b=asBzUGx+cURhXS24xG3j/Zfy4kLo4z1Xn2fsdbGewIJB0MK+S3fpX4IV4lUPe1Bk9+
         iz1oZ8/aC8zZsWCllzE4P054w9NEZxqCAIlSGhj7BOGr2JgTCVPjOUC9g++DHcpyFOww
         ujlZ317jeaW1/N4JWg+5hnyishrxrpcw4lRhcxUyuOT4pDsP0qBRDOocsWn8PK4f6z9y
         FdzLOCD3KlIBe7lax0Shcr/vnYZmjlCBCW7L/8bkaDtPA/fq/v9EKouZWKP5ZiXSdpBB
         Voo/m5akUTboN29Pl/5iIQ3vWsvwlEKl3SlO/cxnlI4aot1D7V+mgyouGKnn91DZXJNy
         XMeA==
X-Gm-Message-State: APjAAAV/R8FX3NFneB2R9UMfMJSR0LJ1QCLXoSXGpf8q0Mq3g0bBVF6+
        SzgjuifIzHNVLVWwkvGkqwNG9+eWxJOSbsceiRun7PuaVf4=
X-Google-Smtp-Source: APXvYqz35TQM+cRwGwJq577FN8l1+GdEavSH5iNz8YgTuiKnLQLrAFTHb1Ze2RQhoA46Jz7n4DzWFJWrA5PaWiZ4bBI=
X-Received: by 2002:adf:fd8d:: with SMTP id d13mr51133368wrr.208.1582320598710;
 Fri, 21 Feb 2020 13:29:58 -0800 (PST)
MIME-Version: 1.0
References: <20200217145711.4af495a3@canb.auug.org.au> <CAOFY-A1nfPjf3EcQB6KiEifbFR+aUtdSgK=CHGt_k3ziSG6T_Q@mail.gmail.com>
 <CAOFY-A3q_pmtHKAoOJdbB09wy=dxs9SdpXjCsU1wBxU5EDHVmw@mail.gmail.com>
 <20200221101845.21c0c8c5@canb.auug.org.au> <CAOFY-A2ndGCSEDstOmXs-u1XjNsaj8wkLezYsMbzeZeVTJGC5g@mail.gmail.com>
 <20200221104328.0f897efd@canb.auug.org.au> <CAOFY-A2tK5=eFt2AQx+FOjyHXQ85XE-N8gdbb49wJphjAAgFUQ@mail.gmail.com>
 <20200221105940.44fd67f1@canb.auug.org.au>
In-Reply-To: <20200221105940.44fd67f1@canb.auug.org.au>
From:   Arjun Roy <arjunroy@google.com>
Date:   Fri, 21 Feb 2020 13:29:46 -0800
Message-ID: <CAOFY-A0daj5ZVkAH3NN38o_tNeT0mhtWNSQSguAPdnOGRV7o_w@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the akpm tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        David Miller <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Feb 20, 2020 at 3:59 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Arjun,
>
> On Thu, 20 Feb 2020 15:44:28 -0800 Arjun Roy <arjunroy@google.com> wrote:
> >
> > On Thu, Feb 20, 2020 at 3:43 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > On Thu, 20 Feb 2020 15:22:04 -0800 Arjun Roy <arjunroy@google.com> wrote:
> > > >
> > > > I have a possible solution in mind, but it would involve a slight
> > > > change in the SPARC macro (to be more inline with the semantics of the
> > > > other platforms).
> > > > If you're open to such a change, I can send it out.
> > >
> > > Its not up to me :-)
> > >
> > > If it is not too much work, I would say, do the patch, test it as you
> > > can, then send it out cc'ing the Sparc maintainer (DaveM cc'd) and see
> > > what happens.
> >
> > Certainly, I will do so.
>
> Just one thing: its worth while making it clear to DaveM that you just
> want his Ack (rather than for him to take the patch into the Sparc
> tree) so that the patch can go into Andrew's tree along with the rest
> of the series.
>

For now since the earlier patches remain in the mm tree (as far as I
can tell here https://github.com/hnaz/linux-mm/tree/master) I have
just sent a fixup patch for the sparc compilation issue to mm-next. I
also indicated the ack request to DaveM.

Thanks,
-Arjun

> --
> Cheers,
> Stephen Rothwell
