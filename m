Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 030477DA7CB
	for <lists+linux-next@lfdr.de>; Sat, 28 Oct 2023 17:30:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbjJ1PaK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 28 Oct 2023 11:30:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbjJ1PaJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 28 Oct 2023 11:30:09 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34A61C1
        for <linux-next@vger.kernel.org>; Sat, 28 Oct 2023 08:30:06 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-d9a398f411fso2342105276.3
        for <linux-next@vger.kernel.org>; Sat, 28 Oct 2023 08:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1698507005; x=1699111805; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Psx6DPhn5gxaHro7LZdui2z8lsRiXQ6XuCVBNwp93o=;
        b=FQwPt5Ttw9BXvnq99rCJEYLloHy7oNEMaeeiLmj4/WPjlz0j4kRlePwQlU1dG6h5NR
         5xskqJbhLdagtUsx1QIRQUS01gSQnTi8fRJ4k2ewsb+iChYQvr86wdHp3RAbqZHfKdFc
         VQT/uH5YhPr8y6b4N9nZNBO29S9xkFsuRsof+ks+VjF6Jzyl1iEa48ekHUaRsGZFFbHN
         vAOyvNzMUbdCXsza1uJTUj6dNrJ4gUyALF1RLkfA5tikQibSnrUYyLoNGq2LhY2W8tgp
         Lt6YnurGQIGnQ/zZacT2rKtQYXwdrheL9TzD9HNCsNDCNmE5npl7YpDvh5Jw/Cz73wdB
         /hLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698507005; x=1699111805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Psx6DPhn5gxaHro7LZdui2z8lsRiXQ6XuCVBNwp93o=;
        b=h5TV9BUG+8Ko5iu9gtekubmgstTU49gVDFAJYWoPiKnbYkOulkMFYBr+Fv2RxLHuqf
         gDE44lafmp27aqeznQM6/4+0EgInA9hrKem4/95PWXrDo2d6z5QiUSHdVFLhfTD3T4Jn
         bqEMKENu5RQiOtnHtp+XCfqoRj/H6niwZnkDCL5tLW7AMJivAS5t+st/x6yvMLm1PVQI
         9pP0ZS+OpHq1Zc9qNpTn0ZHjme95SjkMm2w7Agj/l+Lz4E0u/trdgA+/V55dnlkE6QRq
         8Vx7DSOl9YshiA9azpUsQyiKQL5aJHrUM1Mz1tvzKdvTxPMt86wLyPy/CV5IVrzrVZNb
         T91w==
X-Gm-Message-State: AOJu0YywRsYxcIJB6HDVZoDpwAifSCb5C6LoJx6GV5AJjklkkncXeZrw
        DfnzjPEK+bvpCZSewJIm+FwpTH1gra4ZafSGk9/w
X-Google-Smtp-Source: AGHT+IEH5S31wyF+i8YcOAao48lWfba1CZpnonABBuK3wxFhHmGlkVHkfd9M3udft7lQXT58hALwDBQtw48cYG5sros=
X-Received: by 2002:a25:f828:0:b0:d78:26a0:ab8b with SMTP id
 u40-20020a25f828000000b00d7826a0ab8bmr5450048ybd.55.1698507005308; Sat, 28
 Oct 2023 08:30:05 -0700 (PDT)
MIME-Version: 1.0
References: <20231027125006.58d5e94f@canb.auug.org.au>
In-Reply-To: <20231027125006.58d5e94f@canb.auug.org.au>
From:   Paul Moore <paul@paul-moore.com>
Date:   Sat, 28 Oct 2023 11:29:54 -0400
Message-ID: <CAHC9VhT1W_fXuJMPmEAVBY7ew_EymH9EE-bJ397yp_H216mp0w@mail.gmail.com>
Subject: Re: linux-next: manual merge of the security tree with the
 asm-generic, block and tip trees
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Arnd Bergmann <arnd@arndb.de>, Jens Axboe <axboe@kernel.dk>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Casey Schaufler <casey@schaufler-ca.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Sohil Mehta <sohil.mehta@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Oct 26, 2023 at 9:50=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the security tree got conflicts in:
>
>   arch/alpha/kernel/syscalls/syscall.tbl
>   arch/arm/tools/syscall.tbl
>   arch/arm64/include/asm/unistd.h
>   arch/arm64/include/asm/unistd32.h
>   arch/m68k/kernel/syscalls/syscall.tbl
>   arch/microblaze/kernel/syscalls/syscall.tbl
>   arch/mips/kernel/syscalls/syscall_n32.tbl
>   arch/mips/kernel/syscalls/syscall_n64.tbl
>   arch/mips/kernel/syscalls/syscall_o32.tbl
>   arch/parisc/kernel/syscalls/syscall.tbl
>   arch/powerpc/kernel/syscalls/syscall.tbl
>   arch/s390/kernel/syscalls/syscall.tbl
>   arch/sh/kernel/syscalls/syscall.tbl
>   arch/sparc/kernel/syscalls/syscall.tbl
>   arch/x86/entry/syscalls/syscall_32.tbl
>   arch/x86/entry/syscalls/syscall_64.tbl
>   arch/xtensa/kernel/syscalls/syscall.tbl
>   include/uapi/asm-generic/unistd.h
>
> between commits:
>
>   2fd0ebad27bc ("arch: Reserve map_shadow_stack() syscall number for all =
architectures")
>   9f6c532f59b2 ("futex: Add sys_futex_wake()")
>   cb8c4312afca ("futex: Add sys_futex_wait()")
>   0f4b5f972216 ("futex: Add sys_futex_requeue()")
>
> from the asm-generic, block and tip trees and commit:
>
>   6d54f25e4605 ("LSM: wireup Linux Security Module syscalls")
>
> from the security tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks Stephen, those changes look correct to me, I'll update the LSM
tree once the asm-generic, block, and tip tree changes make their way
to Linus.

--=20
paul-moore.com
