Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2A7442C3E4
	for <lists+linux-next@lfdr.de>; Wed, 13 Oct 2021 16:47:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230474AbhJMOt6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 13 Oct 2021 10:49:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:53326 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230385AbhJMOt6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 13 Oct 2021 10:49:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D57D9610FB;
        Wed, 13 Oct 2021 14:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634136474;
        bh=IiznypSwixykmAgM4NUX9RIXuLzUGnVGCZ+f1lLInaA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=PkJjimCYtfBAkrkCj/Ka7BjBAQskkUBsWdSY48Z+qfgk+QEyOJ4QlXAMAwUtqiivx
         KtwsRlyRGH8dAUaHK0Av7XTl9h4C+ltCZOjcvLnw1tYdgP4kdCSCDjpZH4UERjUy2E
         XbGUsECGQLRmS39upQ3aLN3X3IQXX/UL+3wAeMJOKDVG4fGGPRGIBejiffECe/bEp8
         5SOTW4Ej4SxvWZNTN4onGpO08xeicwW+1DmbTi29mdJhHrgG91X/BOQpZI7sHYfyJq
         EF3hXmd2nSBCaqHz3c3/CzOmdNYqhCuguJYrzHDeh9WdwHk1d/r2sO08iTm9SRSDal
         0e7LjhjaktqDQ==
Received: by mail-ed1-f53.google.com with SMTP id z20so11297342edc.13;
        Wed, 13 Oct 2021 07:47:54 -0700 (PDT)
X-Gm-Message-State: AOAM5320cR0qTwVBeXB0VQBihqV2rBa9T5vxRenHqBIcW/opjj/rCoju
        Z/yf7kzo6Ksn/RShfsdh/Bt4xxVEMJX8zkGs1A==
X-Google-Smtp-Source: ABdhPJwpyYFQ21vK0gDQPPgqybB7xUBbtCREr3zK1DfqnouQJv9OA6Wv8vGBAooXIID/vr6SlcoybZxTTkYbLDT5urU=
X-Received: by 2002:a50:da06:: with SMTP id z6mr10479152edj.355.1634136470709;
 Wed, 13 Oct 2021 07:47:50 -0700 (PDT)
MIME-Version: 1.0
References: <20211013170522.4c6e21a1@canb.auug.org.au> <YWbNVXemcnxO8wsG@robh.at.kernel.org>
 <20211013135023.GI66936@minyard.net>
In-Reply-To: <20211013135023.GI66936@minyard.net>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 13 Oct 2021 09:47:38 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+MWFd+MZjPdsoo4DW_W=RG-w4mnqh54P9hcZL1xpeh5g@mail.gmail.com>
Message-ID: <CAL_Jsq+MWFd+MZjPdsoo4DW_W=RG-w4mnqh54P9hcZL1xpeh5g@mail.gmail.com>
Subject: Re: linux-next: Tree for Oct 13
To:     Corey Minyard <minyard@acm.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Oct 13, 2021 at 8:50 AM Corey Minyard <minyard@acm.org> wrote:
>
> On Wed, Oct 13, 2021 at 07:13:09AM -0500, Rob Herring wrote:
> > On Wed, Oct 13, 2021 at 05:05:22PM +1100, Stephen Rothwell wrote:
> > > Hi all,
> > >
> > > News: there will be no linux-next release tomorrow.
> > >
> > > Changes since 20211012:
> > >
> > > The arm-soc tree lost its build failure.
> > >
> > > The net-next tree gained a conflict against the net tree.
> > >
> > > The drm-misc tree lost its build failure.
> > >
> > > The amdgpu tree lost its build failure.
> > >
> > > Non-merge commits (relative to Linus' tree): 7055
> > >  6867 files changed, 394074 insertions(+), 162696 deletions(-)
> >
> > The commit 9cc6726f68af ("ipmi:ipmb: Add OF support") was added and has
> > warnings for 'make dt_binding_check'. I'm replying here because the
> > commit hasn't been sent to any list in lore.
>
> Thanks, I have fixed all these issues, I think.  Running
>
>   make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/ipmi/ipmi-ipmb.yaml

That's sufficient unless the schema also applies to another example.
Probably unlikely here.

Send this to the DT list and the full check will run.

> doesn't show any errors or warnings for this file, though it shows some
> for other files.

Yeah, working those issues too.

Rob
