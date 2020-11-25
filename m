Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49B252C3F0E
	for <lists+linux-next@lfdr.de>; Wed, 25 Nov 2020 12:25:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726139AbgKYLZe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 25 Nov 2020 06:25:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725792AbgKYLZe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 25 Nov 2020 06:25:34 -0500
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65F24C0613D4;
        Wed, 25 Nov 2020 03:25:34 -0800 (PST)
Received: by mail-il1-x12e.google.com with SMTP id b8so1756596ila.13;
        Wed, 25 Nov 2020 03:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HSXJBXOn2CprTr1b4CdrQNESxRfY5tGLBjEWHEIp7AA=;
        b=TLwvf1bDpvNY7DEsxrKhBgSD5ogLDEYtiKwZFEbSXz+GmFIXoikYTG6PrB53ugif2y
         itMtFmQLzmM+qT5OEGXitfQTVTLruOlyddypNFnix5WhxHGeN0Bso+DL3+Qf6LzL/sPr
         FMJwscmjsWbZAvbzBxgZXgsz9z6Icl3tQ9j/8RLX2B2Mrx3R3dO8z8ZZ+pwg3MgYDDQN
         3vRrn+3FqSAom2YaglvBeBG0z5poxswZJCc9Hgsp6iAD4rB1ZG4EYPTNln4KxbtMUuLA
         56i5z6oXMyQS5/AORxroZLYapDx4WLD8DtyUaR2mWqJGLCgFNdQeqSjBs03RiQEUGUcZ
         iEUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HSXJBXOn2CprTr1b4CdrQNESxRfY5tGLBjEWHEIp7AA=;
        b=D6V1nbGTb1LHPKtowNuObqpPtgso4AyqpXmB98t2LwN7Ln2iJwLu6iu0Etgad7Ga6p
         VXbLgcVxtm9f12zoX8Qq7KnYrXQBUd9pemW+Vlr4ucYaqQW8tDkYVc0gsdgxyiOjskC5
         NFI/URW67xWATTsWOD/E+Uv+DYuCofRqutFFuftXra2yBG6zi1unM+IPRH62tVCnAb+N
         Kmu1t4K1Ao8cKCBLtjsVBBeBOQLAWcsdpiqrgvVzeTrKciNCikK1YSpQQH8YiFx0UvA9
         EKFXZbLJdgbhVVh2TIpDLR8gjOZa++MtimkxHGTYXVzB0dS8HyuHLGJWzIhkmYJ0ABwW
         8lfQ==
X-Gm-Message-State: AOAM533KFcYXhPEsEb/zyBu4XbgCq6uPXwr5GR+Cyhki643B+MgzdAbQ
        3zczo+rvB3B6hSTJSion04vbpWWHixE7J7RrJMg=
X-Google-Smtp-Source: ABdhPJx6AV9+1feAbOuTnsij/5XCN70Bvf5Lti2lURe5/n/z6RQVALcpfa8e44LKxbcKze4C7mFOGkXxJEC6tkrtlbc=
X-Received: by 2002:a92:155b:: with SMTP id v88mr2415194ilk.303.1606303533838;
 Wed, 25 Nov 2020 03:25:33 -0800 (PST)
MIME-Version: 1.0
References: <00000000000054aea005b4d59e71@google.com> <CAA5enKZ=6=AoknavW4RJ+T+aiPBFSf8uEjJ+ODcc+nMTD2k5kQ@mail.gmail.com>
 <bda71012-f2e2-9a4c-5dcb-7ad14655c2f5@linux.alibaba.com>
In-Reply-To: <bda71012-f2e2-9a4c-5dcb-7ad14655c2f5@linux.alibaba.com>
From:   Lorenzo Stoakes <lstoakes@gmail.com>
Date:   Wed, 25 Nov 2020 11:25:22 +0000
Message-ID: <CAA5enKZyE6mP2fWdooC4Lx7d2V9aSkxmgT-ihx0Z9HPjfq77NQ@mail.gmail.com>
Subject: Re: linux-next boot error: WARNING in prepare_kswapd_sleep
To:     Alex Shi <alex.shi@linux.alibaba.com>
Cc:     syzbot <syzbot+ce635500093181f39c1c@syzkaller.appspotmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Hui Su <sh_def@163.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 25 Nov 2020 at 06:25, Alex Shi <alex.shi@linux.alibaba.com> wrote:
> Acked.

Thanks. I submitted as an actual patch, refactored it slightly to
avoid duplication of page_memcg().

> and further more, could you like try another patch?

I tried that patch against the syzkaller failure case and it worked fine!

Cheers, Lorenzo
