Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B5F022347A
	for <lists+linux-next@lfdr.de>; Fri, 17 Jul 2020 08:27:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727870AbgGQG1l (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 17 Jul 2020 02:27:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726962AbgGQG1j (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 17 Jul 2020 02:27:39 -0400
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 754E3C061755;
        Thu, 16 Jul 2020 23:27:39 -0700 (PDT)
Received: by mail-qv1-xf31.google.com with SMTP id dm12so3821754qvb.9;
        Thu, 16 Jul 2020 23:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A3qqFF9yd3EKW/+nagLOaGgu79oDzMUA/VxmH16ttug=;
        b=ZixpRszNUNTbAzJhX/ocpWCSZ9iF+5uvw17oQTar95O/SvFbUASypBidCkEVY9HMLF
         SwkhIbNuNlOszMxEazsN/bF20wXIYRLh5nkCTA//BjMDxuqAP8oLeiSKFLnfaj4PHWUo
         jnjLHvlOwajtqkaBjc2ET2Vns9Gm/fgMocFZI7DGd/U3sSqo+fmqVDwMWu1GxqQ+NKew
         tRDeYwRvL4co/lxvjH/JBzB/4UMCJPi+DcmJe1vgxnmpNtyOFi6XL9WYPW/a0umAKqlq
         9hSP7eF5XH2TM7zRdeHWoTe+1ASmGZcjkr0HI32/qFbU050sZtA9cxw34YzFDdRDeR/l
         j2fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A3qqFF9yd3EKW/+nagLOaGgu79oDzMUA/VxmH16ttug=;
        b=P4gb6TFYFgJFQiXSBe1VydgUSQ1XQ+VlhZmeXUUXsI/xx43d7QxOmtVWpm81ce0oM4
         ckG77RGv41Zc5Zssuza179KbArAOEprqQw5RULrkj0uRJILAv46uF72imI6hkB8eWhFW
         f3D9XGH15aCLY3Vo3++2OfzLGSPiX/Zv6QLBSVXftfXyI4ATNRelT0GWEAQc1gNR/uDB
         vv286sXOTAvbdt329fUPTq2FoBY+rbVQftWYdA0cKxe5gx19Zq2H1rIK4tjVl6l6nBkv
         eKq+A2+UlwX0JEPR+GBqUV/9g4yC73VP2sdpTDWah7PHKg+uOBLbvgTXCjej/LvCCF1i
         wqvw==
X-Gm-Message-State: AOAM533zatl2Ro2odTZdzAhMfCVh53E27YL0F+uPkxPRYJdUYIB1ZC50
        LeMycu8mFOstm/HD8qlWE3fi3qF34uRVFYOc+EjKGWIX
X-Google-Smtp-Source: ABdhPJwZWWO4WoZvg8RmUJxWGouo5QxAZHQLboX1iGjpX0vnF24PIbk3GO27rwGBsGCQZvrN9AnVJoO4Auo5M6hOVfQ=
X-Received: by 2002:a05:6214:1586:: with SMTP id m6mr7428351qvw.171.1594967258230;
 Thu, 16 Jul 2020 23:27:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200717144656.4bdbf81f@canb.auug.org.au>
In-Reply-To: <20200717144656.4bdbf81f@canb.auug.org.au>
From:   Uros Bizjak <ubizjak@gmail.com>
Date:   Fri, 17 Jul 2020 08:27:27 +0200
Message-ID: <CAFULd4Ye2d-8BY7aY+_2tYwcXsfSCe3O6aJ4LF0KhvWTjVt0rA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the tip tree with the crypto tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Linux Crypto List <linux-crypto@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Chang S. Bae" <chang.seok.bae@intel.com>,
        Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jul 17, 2020 at 6:47 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the tip tree got a conflict in:
>
>   arch/x86/include/asm/inst.h
>
> between commit:
>
>   d7866e503bdc ("crypto: x86 - Remove include/asm/inst.h")
>
> from the crypto tree and commit:
>
>   eaad981291ee ("x86/entry/64: Introduce the FIND_PERCPU_BASE macro")
>
> from the tip tree.
>
> I fixed it up (I brought the file back but removed what the crypto tree
> no longer needed - see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> I think if the crypto tree brought back this file as well (even without
> the RDPID macro, it would make this conflict much more manageable.

I will prepare a v2 that leaves needed part of inst.h.

Uros.

> /* SPDX-License-Identifier: GPL-2.0 */
> /*
>  * Generate .byte code for some instructions not supported by old
>  * binutils.
>  */
> #ifndef X86_ASM_INST_H
> #define X86_ASM_INST_H
>
> #ifdef __ASSEMBLY__
>
> #define REG_NUM_INVALID         100
>
> #define REG_TYPE_R32            0
> #define REG_TYPE_R64            1
> #define REG_TYPE_XMM            2
> #define REG_TYPE_INVALID        100
>
>         .macro R32_NUM opd r32
>         \opd = REG_NUM_INVALID
>         .ifc \r32,%eax
>         \opd = 0
>         .endif
>         .ifc \r32,%ecx
>         \opd = 1
>         .endif
>         .ifc \r32,%edx
>         \opd = 2
>         .endif
>         .ifc \r32,%ebx
>         \opd = 3
>         .endif
>         .ifc \r32,%esp
>         \opd = 4
>         .endif
>         .ifc \r32,%ebp
>         \opd = 5
>         .endif
>         .ifc \r32,%esi
>         \opd = 6
>         .endif
>         .ifc \r32,%edi
>         \opd = 7
>         .endif
> #ifdef CONFIG_X86_64
>         .ifc \r32,%r8d
>         \opd = 8
>         .endif
>         .ifc \r32,%r9d
>         \opd = 9
>         .endif
>         .ifc \r32,%r10d
>         \opd = 10
>         .endif
>         .ifc \r32,%r11d
>         \opd = 11
>         .endif
>         .ifc \r32,%r12d
>         \opd = 12
>         .endif
>         .ifc \r32,%r13d
>         \opd = 13
>         .endif
>         .ifc \r32,%r14d
>         \opd = 14
>         .endif
>         .ifc \r32,%r15d
>         \opd = 15
>         .endif
> #endif
>         .endm
>
>         .macro R64_NUM opd r64
>         \opd = REG_NUM_INVALID
> #ifdef CONFIG_X86_64
>         .ifc \r64,%rax
>         \opd = 0
>         .endif
>         .ifc \r64,%rcx
>         \opd = 1
>         .endif
>         .ifc \r64,%rdx
>         \opd = 2
>         .endif
>         .ifc \r64,%rbx
>         \opd = 3
>         .endif
>         .ifc \r64,%rsp
>         \opd = 4
>         .endif
>         .ifc \r64,%rbp
>         \opd = 5
>         .endif
>         .ifc \r64,%rsi
>         \opd = 6
>         .endif
>         .ifc \r64,%rdi
>         \opd = 7
>         .endif
>         .ifc \r64,%r8
>         \opd = 8
>         .endif
>         .ifc \r64,%r9
>         \opd = 9
>         .endif
>         .ifc \r64,%r10
>         \opd = 10
>         .endif
>         .ifc \r64,%r11
>         \opd = 11
>         .endif
>         .ifc \r64,%r12
>         \opd = 12
>         .endif
>         .ifc \r64,%r13
>         \opd = 13
>         .endif
>         .ifc \r64,%r14
>         \opd = 14
>         .endif
>         .ifc \r64,%r15
>         \opd = 15
>         .endif
> #endif
>         .endm
>
>         .macro XMM_NUM opd xmm
>         \opd = REG_NUM_INVALID
>         .ifc \xmm,%xmm0
>         \opd = 0
>         .endif
>         .ifc \xmm,%xmm1
>         \opd = 1
>         .endif
>         .ifc \xmm,%xmm2
>         \opd = 2
>         .endif
>         .ifc \xmm,%xmm3
>         \opd = 3
>         .endif
>         .ifc \xmm,%xmm4
>         \opd = 4
>         .endif
>         .ifc \xmm,%xmm5
>         \opd = 5
>         .endif
>         .ifc \xmm,%xmm6
>         \opd = 6
>         .endif
>         .ifc \xmm,%xmm7
>         \opd = 7
>         .endif
>         .ifc \xmm,%xmm8
>         \opd = 8
>         .endif
>         .ifc \xmm,%xmm9
>         \opd = 9
>         .endif
>         .ifc \xmm,%xmm10
>         \opd = 10
>         .endif
>         .ifc \xmm,%xmm11
>         \opd = 11
>         .endif
>         .ifc \xmm,%xmm12
>         \opd = 12
>         .endif
>         .ifc \xmm,%xmm13
>         \opd = 13
>         .endif
>         .ifc \xmm,%xmm14
>         \opd = 14
>         .endif
>         .ifc \xmm,%xmm15
>         \opd = 15
>         .endif
>         .endm
>
>         .macro REG_TYPE type reg
>         R32_NUM reg_type_r32 \reg
>         R64_NUM reg_type_r64 \reg
>         XMM_NUM reg_type_xmm \reg
>         .if reg_type_r64 <> REG_NUM_INVALID
>         \type = REG_TYPE_R64
>         .elseif reg_type_r32 <> REG_NUM_INVALID
>         \type = REG_TYPE_R32
>         .elseif reg_type_xmm <> REG_NUM_INVALID
>         \type = REG_TYPE_XMM
>         .else
>         \type = REG_TYPE_INVALID
>         .endif
>         .endm
>
>         .macro PFX_OPD_SIZE
>         .byte 0x66
>         .endm
>
>         .macro PFX_REX opd1 opd2 W=0
>         .if ((\opd1 | \opd2) & 8) || \W
>         .byte 0x40 | ((\opd1 & 8) >> 3) | ((\opd2 & 8) >> 1) | (\W << 3)
>         .endif
>         .endm
>
>         .macro MODRM mod opd1 opd2
>         .byte \mod | (\opd1 & 7) | ((\opd2 & 7) << 3)
>         .endm
>
> .macro RDPID opd
>         REG_TYPE rdpid_opd_type \opd
>         .if rdpid_opd_type == REG_TYPE_R64
>         R64_NUM rdpid_opd \opd
>         .else
>         R32_NUM rdpid_opd \opd
>         .endif
>         .byte 0xf3
>         .if rdpid_opd > 7
>         PFX_REX rdpid_opd 0
>         .endif
>         .byte 0x0f, 0xc7
>         MODRM 0xc0 rdpid_opd 0x7
> .endm
> #endif
>
> #endif
>
> --
> Cheers,
> Stephen Rothwell
