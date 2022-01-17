Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0623A4900B6
	for <lists+linux-next@lfdr.de>; Mon, 17 Jan 2022 05:14:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237044AbiAQEON (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 16 Jan 2022 23:14:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234170AbiAQEON (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 16 Jan 2022 23:14:13 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9A1BC061574
        for <linux-next@vger.kernel.org>; Sun, 16 Jan 2022 20:14:12 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id r82-20020a1c4455000000b0034cd1acd9b5so207764wma.1
        for <linux-next@vger.kernel.org>; Sun, 16 Jan 2022 20:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uC9QK9tDrDJ8bYUEkaLZMfhd29it01RtK3UNjGu6F+0=;
        b=ciayjtT67GxQzlTSXm/xVUEcDMmOUTYKy1dGlkK0RlBk8DAWiHlAzcIKbvbDYe/5NB
         eEMT+ivFn9XuyEiceNYjrBlFxJsKpmT1yBe+LEQM6wCmvJgGaDLNnz2IQvJldm9p9LN8
         sjZMLhJvUa+jlS971DBqTx2JiV8MYE7VyRVbDQmkSCN2nZ/trP8TheKpE3SYVP8o7GRl
         mKBVTHRYjfCaidRz00H1J+UyTio36Vc/fOt5C3nAm3iwUg/j/x/e/GqRm8HQD+XzItiI
         gB934+DIUJ5Orh198FNLc5fF0SsjA5a2mJAfGzvcrEsMXUae/kwTZsnK3s4MYhi9duCa
         QxtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uC9QK9tDrDJ8bYUEkaLZMfhd29it01RtK3UNjGu6F+0=;
        b=3NwvLk8WDNydqeQZToIUrCvoGOtfZmY8LSkV8FIYFnYHmp8Rpg8S2oiGtKtjLZa79A
         5kRNWoLx4sNK59+BPaRwY84rLI4su/q1kchFgfG0OiKagaQAIwbApG8ZAxS0eAupXiox
         50xKlOM5IJq44oCwf+U12FGZKAI/MwwHmAsDLPeQEEYJJK7Lk2IbPMybRjBGWi2d55Wx
         VUvZTEMpFtd0b1YS4iD9X34S8TzgGeeq4gxdBOwvNtwUL7Uaz2bvr+XCoMIqd9CnpKb7
         pJ1uCFoH1YL2RQIhhdacMWCflp4eXv8u1YUkenz2iYTKcjZMNaWW+Gk/qLO+ei/Pp5OY
         kYig==
X-Gm-Message-State: AOAM533a2zRvxFyIgHl/U79p3aPZPEpsUn+bf1V+yD4CtNdO/Kb5ouLb
        BRx8R0TRUywZNigAey0DKW5Qw8Z1u0wF5r3q9LXqbQ==
X-Google-Smtp-Source: ABdhPJx4fa4h5AQb2MyTrvdM9qwAZU72bUbMnBBf3yoS2z9C11Wfyu6Dxyi24T7agTe5QbcUb33joJwV51zePD0brdE=
X-Received: by 2002:a7b:cb05:: with SMTP id u5mr19465099wmj.59.1642392851103;
 Sun, 16 Jan 2022 20:14:11 -0800 (PST)
MIME-Version: 1.0
References: <20220112114024.7be8aac6@canb.auug.org.au> <20220117085431.7bef9ebc@canb.auug.org.au>
In-Reply-To: <20220117085431.7bef9ebc@canb.auug.org.au>
From:   Anup Patel <anup@brainfault.org>
Date:   Mon, 17 Jan 2022 09:43:58 +0530
Message-ID: <CAAhSdy3gEW+SC1GCH0V4iVA9h1sxeVV-V=x4kG7w_9tcVTtamw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the kvm tree with the risc-v tree
To:     Palmer Dabbelt <palmer@dabbelt.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Paul Walmsley <paul@pwsan.com>,
        Paolo Bonzini <pbonzini@redhat.com>, KVM <kvm@vger.kernel.org>,
        Atish Patra <atishp@atishpatra.org>,
        Atish Patra <atishp@rivosinc.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Palmer Dabbelt <palmer@rivosinc.com>,
        linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Palmer,

On Mon, Jan 17, 2022 at 3:24 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> On Wed, 12 Jan 2022 11:40:24 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next merge of the kvm tree got a conflict in:
> >
> >   arch/riscv/include/asm/sbi.h
> >
> > between commit:
> >
> >   b579dfe71a6a ("RISC-V: Use SBI SRST extension when available")
> >
> > from the risc-v tree and commit:
> >
> >   c62a76859723 ("RISC-V: KVM: Add SBI v0.2 base extension")
> >
> > from the kvm tree.
> >
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> >
> >
> > diff --cc arch/riscv/include/asm/sbi.h
> > index 289621da4a2a,9c46dd3ff4a2..000000000000
> > --- a/arch/riscv/include/asm/sbi.h
> > +++ b/arch/riscv/include/asm/sbi.h
> > @@@ -27,7 -27,14 +27,15 @@@ enum sbi_ext_id
> >       SBI_EXT_IPI = 0x735049,
> >       SBI_EXT_RFENCE = 0x52464E43,
> >       SBI_EXT_HSM = 0x48534D,
> >  +    SBI_EXT_SRST = 0x53525354,
> > +
> > +     /* Experimentals extensions must lie within this range */
> > +     SBI_EXT_EXPERIMENTAL_START = 0x08000000,
> > +     SBI_EXT_EXPERIMENTAL_END = 0x08FFFFFF,
> > +
> > +     /* Vendor extensions must lie within this range */
> > +     SBI_EXT_VENDOR_START = 0x09000000,
> > +     SBI_EXT_VENDOR_END = 0x09FFFFFF,
> >   };
> >
> >   enum sbi_ext_base_fid {
>
> This is now a conflict between the risc-v tree and Linus' tree.

The commit c62a76859723 ("RISC-V: KVM: Add SBI v0.2 base extension")
is already merged in Linus' tree.

Since you are yet to send PR for 5.17, we have two options:
1) Rebase your for-next branch upon latest Linus' tree master branch
2) Send "RISC-V: Use SBI SRST extension when available" in the
next batch of changes for 5.17 after 5.17-rc1

Let me know if you want me to rebase and send v8 patch of
"RISC-V: Use SBI SRST extension when available"

In future, we should coordinate and use a shared tag for such
conflicting changes.

Regards,
Anup



>
> --
> Cheers,
> Stephen Rothwell
