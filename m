Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DFD714906E
	for <lists+linux-next@lfdr.de>; Fri, 24 Jan 2020 22:48:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbgAXVsU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 24 Jan 2020 16:48:20 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:39014 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726080AbgAXVsU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 24 Jan 2020 16:48:20 -0500
Received: by mail-io1-f66.google.com with SMTP id c16so3481111ioh.6
        for <linux-next@vger.kernel.org>; Fri, 24 Jan 2020 13:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ay0Osx6+91G60YFGW9rFqB7uUlKNz/NdTOizLiEzOMk=;
        b=Sr6tuk44RcLyX1X2YNrcNt2R2ODlKVH21uOR1R8z8Hx5n/AwwMiQUcVqOWWBXuAmsq
         6CCiRP0eq6supQv53NAB/m+k+Y/jaLBwgTqaFpCwBTnDwPkNfz0IvpPEL5IW8vR4bZLa
         915irkan6Gfhmbsymmzy290AwLgC7b5i4+A0jdoPHEz2oTtJw6uz3eD1se71jIC4xUxT
         XNuflWVrzoZMaOeU3FvoNZX4qL6qf4gYC6rJHNTI9iJwdOk27Z8MOhJ6YVRPyHmXVe78
         7bJ5D2QAVTRWYhBfMCLChJ6z4gXSFspk3ETkaszF0t7bH43oZIzZA+vCXcy9t+PAd+f8
         tHDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ay0Osx6+91G60YFGW9rFqB7uUlKNz/NdTOizLiEzOMk=;
        b=iHZBHePkd21fLY+JmeBJm8YBcaun2cf9gas8lnOFdgRnE3Sp00GZKbHa8qhZsMzrd8
         JFbYB2KZGzqFA1zPH5SKSedfYE4e37WlylBY6EmcYglKfiKbZRyk7D7ByPGTWX/oT/f8
         BPWZojwOAE8mdVuz4IfJonJALMHQjYYeSXzmDoHdP9LSSv3WbiniZxfsYL3TtKsZHuZk
         LzVsGI1i69qBBQ9qgEqp3diL6ZUC+ydhgZ4ZtzyKZAruNmrxnSWPZxjVcQw7UEAPSC+4
         dwRfRILGDLakMN8P1wMoAZQGqH4Thlon5vSIfLkAmo3m/ewRTQmlrvS2FhMBdVFuZunt
         t3rQ==
X-Gm-Message-State: APjAAAWdPtRndZlmo8lmebofsqsmt0qz3QP7iaYln+2h8MBxJHb/mUmV
        KTbem72zvsN3rwsaLZGJ6gOtjd1Pirk/RzhbM4RRvxyVfgk=
X-Google-Smtp-Source: APXvYqw1Zki/W2qIE4y/PpUXn/gDegm3/BDLChh7bzhZ3C1ywNVOQwtKOuhUuVj8L1quBWm3aFdvzHa2PDndvQ7QEEw=
X-Received: by 2002:a5d:8989:: with SMTP id m9mr3929796iol.118.1579902499106;
 Fri, 24 Jan 2020 13:48:19 -0800 (PST)
MIME-Version: 1.0
References: <20200124173302.2c3228b2@canb.auug.org.au> <38d53302-b700-b162-e766-2e2a461fc569@infradead.org>
 <20200124213027.GP2109@linux.intel.com>
In-Reply-To: <20200124213027.GP2109@linux.intel.com>
From:   Jim Mattson <jmattson@google.com>
Date:   Fri, 24 Jan 2020 13:48:07 -0800
Message-ID: <CALMp9eRvoZZ=7P3uCg3oqXzvV1WZc9mkzTJh8+=vmEh7xs5BTw@mail.gmail.com>
Subject: Re: linux-next: Tree for Jan 24 (kvm)
To:     Sean Christopherson <sean.j.christopherson@intel.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Joerg Roedel <joro@8bytes.org>, KVM <kvm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jan 24, 2020 at 1:30 PM Sean Christopherson
<sean.j.christopherson@intel.com> wrote:
>
> On Fri, Jan 24, 2020 at 12:51:31PM -0800, Randy Dunlap wrote:
> > On 1/23/20 10:33 PM, Stephen Rothwell wrote:
> > > Hi all,
> > >
> > > Changes since 20200123:
> > >
> > > The kvm tree gained a conflict against Linus' tree.
> > >
> >
> > on i386:
> >
> > ../arch/x86/kvm/x86.h:363:16: warning: right shift count >= width of type [-Wshift-count-overflow]
>
> Jim,
>
> This is due to using "unsigned long data" for kvm_dr7_valid() along with
> "return !(data >> 32);" to check for bits being set in 63:32.  Any
> objection to fixing the issue by making @data a u64?  Part of me thinks
> that's the proper behavior anyways, i.e. the helper is purely a reflection
> of the architectural requirements, the caller is responsible for dropping
> bits appropriately based on the current mode.

Why not just change that bad return statement to one of the
alternatives you had suggested previously?

I think "return !(data >> 32)" was the only suggested alternative that
doesn't work. :-)
