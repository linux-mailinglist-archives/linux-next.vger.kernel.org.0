Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A79C81982F2
	for <lists+linux-next@lfdr.de>; Mon, 30 Mar 2020 20:05:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728009AbgC3SFm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Mar 2020 14:05:42 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33293 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727148AbgC3SFm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 30 Mar 2020 14:05:42 -0400
Received: by mail-wr1-f65.google.com with SMTP id a25so22885764wrd.0
        for <linux-next@vger.kernel.org>; Mon, 30 Mar 2020 11:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eK8x7gAXMov1inBTyCa9T4MtcTyNUJQUaxWPoEq8WPM=;
        b=WQE+QWOmy+rAqfpi/9XWYmLS7jKwH6IbEwVcxVE/K6tVdNy/4xbN85nlusDSzm757a
         N8Esq9fl5Qh8a89xDGWWUQzzWddG3vupEw//z1mNposwwR3yEPcMIPJRq7YVVtoKQP+p
         SKQfYVxP6q6j+vCw/suwHBGl91DNojYqK1BMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eK8x7gAXMov1inBTyCa9T4MtcTyNUJQUaxWPoEq8WPM=;
        b=GgJFlQhaUmD03QeO6hEcCT34EYYA9K8E+c8cVAdSRufKKCIgdQzNfYtvVz5iPWGzeY
         6EiUs6+96HBWjUKWjcHEF/+n/BMWLQ1ougWpAAGQ2hcLoouY1jbebL26r/s3vNlGu39y
         rDKuvkF6LsgQ+Ei8c2AU1pnfPEX7vsqNGXTydR1/Pp3QHcJhNXaM5IBaKigyPdGy/ROI
         DrRIB1sMbYdTr4upHZzo/m4NCfPGTrE/6IieN3bH6jD48dsAZgtGjkNpPxyjjjKj1Lhj
         NJRwLkbOEn/LmS3br6hcdLzo3Q4mMEtvvqtMUd575uemGE8rfCT5JlFqUT1cnH/Hfjv2
         lLAA==
X-Gm-Message-State: ANhLgQ1gWWBYZqqebCQxJKC2hBHQHcXDg0E0b/KVeS4wbkp+ead9quuY
        10P4lS59AiRSQKL/TxUzOjlcTA==
X-Google-Smtp-Source: ADFU+vsG5+POHNwCtn212r3+bWb5NCSQtxsMW+v/nEnnXabDTUyOReQMMj7YdyJUl9iPEcp/c2B64w==
X-Received: by 2002:adf:e946:: with SMTP id m6mr16493103wrn.187.1585591540289;
        Mon, 30 Mar 2020 11:05:40 -0700 (PDT)
Received: from google.com ([2a00:79e0:42:204:8a21:ba0c:bb42:75ec])
        by smtp.gmail.com with ESMTPSA id l4sm21826103wru.1.2020.03.30.11.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 11:05:39 -0700 (PDT)
From:   KP Singh <kpsingh@chromium.org>
X-Google-Original-From: KP Singh <kpsingh>
Date:   Mon, 30 Mar 2020 20:05:38 +0200
To:     KP Singh <kpsingh@chromium.org>
Cc:     Daniel Borkmann <daniel@iogearbox.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        bpf <bpf@vger.kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Subject: Re: linux-next: Tree for Mar 30 (bpf)
Message-ID: <20200330180538.GA180081@google.com>
References: <20200330204307.669bbb4d@canb.auug.org.au>
 <86f7031a-57c6-5d50-2788-ae0e06a7c138@infradead.org>
 <d5b4bd95-7ef9-58cb-1955-900e6edb2467@iogearbox.net>
 <CACYkzJ72Uy9mnenO04OJaKH=Bk4ZENKJb9yw6i+EhJUa+ygngQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACYkzJ72Uy9mnenO04OJaKH=Bk4ZENKJb9yw6i+EhJUa+ygngQ@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 30-Mar 19:54, KP Singh wrote:

So, it looks like bpf_tracing_func_proto is only defined when
CONFIG_BPF_EVENTS is set:

        obj-$(CONFIG_BPF_EVENTS) += bpf_trace.o

We have a few options:

* Add a __weak symbol for bpf_tracing_func_proto which we have done in
  the past for similar issues. This however, does not make much sense,
  as CONFIG_BPF_LSM cannot really do much without its helpers.
* Make CONFIG_BPF_LSM depend on CONFIG_BPF_EVENTS, this should solve
  it, but not for this particular Kconfig that was generated. Randy,
  I am assuming if we add the dependency, this particular Kconfig
  won't be generated.

I am assuming this patch now needs to be sent for "bpf" and not
"bpf-next" as the merge window has opened?

- KP

> Thanks for adding me Daniel, taking a look.
> 
> - KP
> 
> On Mon, Mar 30, 2020 at 7:25 PM Daniel Borkmann <daniel@iogearbox.net> wrote:
> >
> > [Cc KP, ptal]
> >
> > On 3/30/20 7:15 PM, Randy Dunlap wrote:
> > > On 3/30/20 2:43 AM, Stephen Rothwell wrote:
> > >> Hi all,
> > >>
> > >> The merge window has opened, so please do not add any material for the
> > >> next release into your linux-next included trees/branches until after
> > >> the merge window closes.
> > >>
> > >> Changes since 20200327:
> > >
> > > (note: linux-next is based on linux 5.6-rc7)
> > >
> > >
> > > on i386:
> > >
> > > ld: kernel/bpf/bpf_lsm.o:(.rodata+0x0): undefined reference to `bpf_tracing_func_proto'
> > >
> > >
> > > Full randconfig file is attached.
> > >
> >
