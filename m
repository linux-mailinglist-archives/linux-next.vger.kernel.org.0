Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 616CF7F1E85
	for <lists+linux-next@lfdr.de>; Mon, 20 Nov 2023 22:09:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229759AbjKTVJ4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Nov 2023 16:09:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229689AbjKTVJz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 20 Nov 2023 16:09:55 -0500
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B206CF
        for <linux-next@vger.kernel.org>; Mon, 20 Nov 2023 13:09:52 -0800 (PST)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-d9c66e70ebdso4437075276.2
        for <linux-next@vger.kernel.org>; Mon, 20 Nov 2023 13:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1700514591; x=1701119391; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gg7L/qGzdZwGL2A3TdntZCzfUWUONuhWAXWrI9wU2BQ=;
        b=JjQ/OyT3uTYxY/koqckWrNcXxzC+2dmMgRffQ/4VfF2Yo6nRogw1Ku/UKFrhwUiFnc
         pu1dtSLUDCpX2BNdPo7gFVU8+KREOcdUpXd4AOE5LquokfqrGmjwhkjCefNdg88RxtRz
         fndsajUDsSolz0wynPDPm2S38AwmxAFLn/0eiAyGUcWTTqQrY7t8SMDc3aNNWiOjEyzD
         MiboKzuU9LdZ62prl2XPHkCAu76IPkx6Naf81KAZ2Mr+CeT//Xa0hv+j3B2lMm0BHoRa
         zimNnNNXf/Je+gl6f8lopcsQMEHFTC6WTa8Wjz8x4T36fI7oMMFyQ6qOSIpyooFHai0E
         xJvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700514591; x=1701119391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gg7L/qGzdZwGL2A3TdntZCzfUWUONuhWAXWrI9wU2BQ=;
        b=aTLr3zdDoluQ/PGaTNBmte7tFaYyiOeBR6UO63mPUwpyCzx5nj/lIRvJTTPiyLaORt
         bS58SZ18fb0LgG5+QM9fFKmCC4PLdmwLGvOS11fA5uSGWNZzuqxYDrRYiPHT1mIqs72x
         03hN3KsI62nQWdif4tEKpgvZFcOCXBK3XuZamtJtgAl/bmYVoFH4x8gMEO65gFGgUqWf
         RCWGze0rQdUAdpsgj0NuE+74u2cpCTZSw8Yk8p2nNPOVjaQQqGOOc3gSbtPPs1iBzePt
         qMtZ183zzlouDRLGs4cQ6ya204Nd6Q5oruRNi2AmgeU8NDA6zXmwf+NaySYGSqvNzYVS
         LTnw==
X-Gm-Message-State: AOJu0YyivXaXUySM3J02xRDAbWdZ8t2YcmjZuVcV4xqtBAmS+huhhcJd
        vpz5piuIfnLELe9tJgDWPIIi/ca1pBmy88D5N3zEfQ1C4XmZzpM=
X-Google-Smtp-Source: AGHT+IGJnAtEMcP7FxqU8j8ysQwR7gtvXxUwtBK0RV3lGh/9xuXTU8A+9JyOaNd830MbYTIBxEUzY2LoWkO/Bce701k=
X-Received: by 2002:a25:2fd8:0:b0:d9c:a485:332b with SMTP id
 v207-20020a252fd8000000b00d9ca485332bmr6960328ybv.4.1700514591621; Mon, 20
 Nov 2023 13:09:51 -0800 (PST)
MIME-Version: 1.0
References: <20231120143106.3f8faedd@canb.auug.org.au>
In-Reply-To: <20231120143106.3f8faedd@canb.auug.org.au>
From:   Paul Moore <paul@paul-moore.com>
Date:   Mon, 20 Nov 2023 16:09:40 -0500
Message-ID: <CAHC9VhR4u7tzzBd6ZB=Kcj1vGCcX2VhsyjPQAoLP3C75BehWfg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the security tree with the
 vfs-brauner tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Christian Brauner <brauner@kernel.org>,
        Casey Schaufler <casey@schaufler-ca.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Miklos Szeredi <mszeredi@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sun, Nov 19, 2023 at 10:31=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the security tree got conflicts in:
>
>   arch/alpha/kernel/syscalls/syscall.tbl
>   arch/arm/tools/syscall.tbl
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
> between commit:
>
>   9fa5392c080e ("wire up syscalls for statmount/listmount")
>
> from the vfs-brauner tree and commit:
>
>   5f42375904b0 ("LSM: wireup Linux Security Module syscalls")
>
> from the security tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks Stephen.

--=20
paul-moore.com
