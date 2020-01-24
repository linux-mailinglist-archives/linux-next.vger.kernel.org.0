Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B717E14910B
	for <lists+linux-next@lfdr.de>; Fri, 24 Jan 2020 23:35:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729436AbgAXWdh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 24 Jan 2020 17:33:37 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:33053 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729429AbgAXWdh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 24 Jan 2020 17:33:37 -0500
Received: by mail-io1-f65.google.com with SMTP id z8so3607643ioh.0
        for <linux-next@vger.kernel.org>; Fri, 24 Jan 2020 14:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=prcxRoDQSiJ1dmyWPb/m5GROH0EOKmS3TXDCdnIxKtI=;
        b=AZ/IJLzYDQlqIn3TtQElDZjGrFBk58eYh6p55E3HlUML2G3oQRLaKelDcUvaFG/zvz
         gJ9ybTkdVwgImzuG/HzNGHPrF0WPtTzDfVWY87y5p16J0Z6VqmdZb2wKpLGKrfVbuuBF
         FrztrmsEmzPLamfTLjxscOuIjXTX9nR5cfD6/jQyI6NBCS5sp3A6Nqz0IRYwN8O5iOqM
         3U49OHOwhGAyWPJMlu09hoxFv5n9FZbjnPOqHlUKrJdpSVvJmej6IFEYZ3glkHAbHp+N
         iKFUCvTitoEWq6QhNg6u4hBGJ1CAmYMJt38IHTo+gR1i2Plfqqx0iSSW/qCdk8Lkhmv9
         RlpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=prcxRoDQSiJ1dmyWPb/m5GROH0EOKmS3TXDCdnIxKtI=;
        b=H403iWn3Y6nJWo3ON3PSgxHBXJCR9b0+S5Aq09qKojJU+ajHAGv0rqERt10TQWDNVE
         +clAJVN2e6PvIq7uKOeS34ph7yS2R5APkc1w96Lq5aZNfjF2WKHVsAzMPtRrNtpm4SDh
         Vivgw/6bjU0BXhwAj3RxDzfLrGctChdVQaSxZQI6zm2RR+f+o9AHzhBr6AtGJlQoEQxC
         GrGqPW0rSsyvBPbTzLTWGf+YM5ZqGP5qeqBetZere2Sf8axju7rentm8wU262NSFuee0
         LHYuW0KTq8jyqT9L+57WASKzFie+q1wIAPu6qiSDc7w8fNOBDmhImUpOihVwgpRmYzgH
         UepQ==
X-Gm-Message-State: APjAAAWFq4rhfgK2ZMSxLkbjaaSTt9StADmGEEki+baVV9dLUVhCn9V1
        45Je1LgBu/K2qdiG7F2oZeUJYKK25CZQAg10pceNXl+b
X-Google-Smtp-Source: APXvYqwZecOD0SdVqTg8n3qfyMomUuODKNgTtZL92kmt9Fhkf8UtPwbI1hE0XpGB8405L2CL2j7UFAaMtovh+rzPiJg=
X-Received: by 2002:a02:c906:: with SMTP id t6mr4386007jao.75.1579905216104;
 Fri, 24 Jan 2020 14:33:36 -0800 (PST)
MIME-Version: 1.0
References: <20200124173302.2c3228b2@canb.auug.org.au> <38d53302-b700-b162-e766-2e2a461fc569@infradead.org>
 <20200124213027.GP2109@linux.intel.com> <CALMp9eRvoZZ=7P3uCg3oqXzvV1WZc9mkzTJh8+=vmEh7xs5BTw@mail.gmail.com>
 <20200124222212.GS2109@linux.intel.com>
In-Reply-To: <20200124222212.GS2109@linux.intel.com>
From:   Jim Mattson <jmattson@google.com>
Date:   Fri, 24 Jan 2020 14:33:25 -0800
Message-ID: <CALMp9eRjy=-PGy7SOW6TinfZOUfuSDev4ymhf5SmA=QA-u_vVg@mail.gmail.com>
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

On Fri, Jan 24, 2020 at 2:22 PM Sean Christopherson
<sean.j.christopherson@intel.com> wrote:
>
> On Fri, Jan 24, 2020 at 01:48:07PM -0800, Jim Mattson wrote:
> > On Fri, Jan 24, 2020 at 1:30 PM Sean Christopherson
> > <sean.j.christopherson@intel.com> wrote:
> > >
> > > On Fri, Jan 24, 2020 at 12:51:31PM -0800, Randy Dunlap wrote:
> > > > On 1/23/20 10:33 PM, Stephen Rothwell wrote:
> > > > > Hi all,
> > > > >
> > > > > Changes since 20200123:
> > > > >
> > > > > The kvm tree gained a conflict against Linus' tree.
> > > > >
> > > >
> > > > on i386:
> > > >
> > > > ../arch/x86/kvm/x86.h:363:16: warning: right shift count >= width of type [-Wshift-count-overflow]
> > >
> > > Jim,
> > >
> > > This is due to using "unsigned long data" for kvm_dr7_valid() along with
> > > "return !(data >> 32);" to check for bits being set in 63:32.  Any
> > > objection to fixing the issue by making @data a u64?  Part of me thinks
> > > that's the proper behavior anyways, i.e. the helper is purely a reflection
> > > of the architectural requirements, the caller is responsible for dropping
> > > bits appropriately based on the current mode.
> >
> > Why not just change that bad return statement to one of the
> > alternatives you had suggested previously?
>
> Because it's not consistent with e.g. is_noncanonical_address() and I don't
> like dropping bits 63:32 of vmcs12->guest_dr7 when kvm_dr7_valid() is called
> from nested_vmx_check_guest_state().  KVM will eventually drop the bits
> anyways when propagating vmcs12->guest_dr7 to vmcs02, but I'd prefer the
> consistency check to not rely on that behavior.

That makes sense. I keep forgetting that "natural_width" in kvm is duplicitous.
