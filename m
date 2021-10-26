Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3F8143B42A
	for <lists+linux-next@lfdr.de>; Tue, 26 Oct 2021 16:30:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235602AbhJZOc2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Oct 2021 10:32:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236637AbhJZOcX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Oct 2021 10:32:23 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 981E5C061224
        for <linux-next@vger.kernel.org>; Tue, 26 Oct 2021 07:29:59 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 5so14417167edw.7
        for <linux-next@vger.kernel.org>; Tue, 26 Oct 2021 07:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wJSGFytkkdPheB+wlk955znZt0m/KBc4qQJPUDxpyPw=;
        b=sANo+1Tne2i5Hv2mCCMeAhl0VxMgfF0YX0e60QWrmhXe7LzpBaTDBClGhYRoPML4ny
         8/JThRqJbNcFapRZxTpVFWFr1v1j5kG/XahTeep8+Z8b5dzqWGXzy/e0NlbjQsaK8G3N
         +t+Rkzg7Yec+g1gcMvi050G26Vy4x71gampIaLNpfrrzjNhSl3vjGAvCpP59o6CL7O8d
         CTxMaMYSwl/rLKRCRf7jPCpT/78zTXYeiRQ4G3AJfQ5CZJd/hGBHzTubFtHOCQHaIr2h
         548O9lotYZRkdLgU+SQsYZHEGA89qKQ/ontY01cGfo5wFOY+MSMI7bU5naRy5xvB609Z
         609w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wJSGFytkkdPheB+wlk955znZt0m/KBc4qQJPUDxpyPw=;
        b=p1pkZfbUFh3DN7YncNdDYDtOajF4r32wOORtfb4uxStRgI3S5ou6QwbcYdXUJ/zAAj
         T5MWqBbLbz7kUbFFGaQIcLCElk1uVf4486WJq3MlUQmDLhZI1FnNKV7dAwZPSn9VdSiX
         WRwbjluHq+iORwkQbP6Wcu74SWlivFEnYC3+TxFnpnOovC+loY9ecbloYpi5sXmDDrvJ
         6WbJTH5txa91WReTuGqR05Q+k+4GDmAmC+kvkAY4p2ZlyptkzsaKWdYx/HYo9dTeKFYU
         qsuPDh3L27E50BwTpa4vGg7bc2Rtmiwd75WPD80QCBPrxWabVIvMYyf/Ri/AuFc9yEgg
         o1Xg==
X-Gm-Message-State: AOAM530iKn1GvtN32g+nFtwiVJMywx5kew6vxTWvNMJHjYu3w5j9xXnD
        8HErR/7h//eUWw/AMoPqnlkqTsFWj4oN1dasD8Cl
X-Google-Smtp-Source: ABdhPJzAsQP0OAB+yYut6tHR+uRO8G4JL5eHkcZxmzYtC/7OerWPHYb1y9xLveuncd1s4fZzTrey1LV3hCwICiSozeI=
X-Received: by 2002:a17:907:7601:: with SMTP id jx1mr31210516ejc.69.1635258482206;
 Tue, 26 Oct 2021 07:28:02 -0700 (PDT)
MIME-Version: 1.0
References: <20211026133147.35d19e00@canb.auug.org.au> <87k0i0awdl.fsf@mpe.ellerman.id.au>
In-Reply-To: <87k0i0awdl.fsf@mpe.ellerman.id.au>
From:   Paul Moore <paul@paul-moore.com>
Date:   Tue, 26 Oct 2021 10:27:51 -0400
Message-ID: <CAHC9VhTj7gn3iAOYctVRKvv_Bk1iQMrmkA8FVJtYzdvBjqFmvg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the audit tree with the powerpc tree
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Richard Guy Briggs <rgb@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Oct 26, 2021 at 6:55 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Stephen Rothwell <sfr@canb.auug.org.au> writes:
> > Hi all,
> >
> > Today's linux-next merge of the audit tree got conflicts in:
> >
> >   arch/powerpc/kernel/audit.c
> >   arch/powerpc/kernel/compat_audit.c
> >
> > between commit:
> >
> >   566af8cda399 ("powerpc/audit: Convert powerpc to AUDIT_ARCH_COMPAT_GENERIC")
> >
> > from the powerpc tree and commits:
> >
> >   42f355ef59a2 ("audit: replace magic audit syscall class numbers with macros")
> >   1c30e3af8a79 ("audit: add support for the openat2 syscall")
> >
> > from the audit tree.
>
> Thanks.
>
> I guess this is OK, unless the audit folks disagree. I could revert the
> powerpc commit and try it again later.
>
> If I don't hear anything I'll leave it as-is.

Hi Michael,

Last I recall from the powerpc/audit thread there were still some
issues with audit working properly in your testing, has that been
resolved?  If nothing else, -rc7 seems a bit late for this to hit
-next for me to feel comfortable about this.

-- 
paul moore
www.paul-moore.com
