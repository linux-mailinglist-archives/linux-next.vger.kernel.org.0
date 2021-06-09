Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 149583A0876
	for <lists+linux-next@lfdr.de>; Wed,  9 Jun 2021 02:38:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232598AbhFIAkQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Jun 2021 20:40:16 -0400
Received: from mail-pg1-f176.google.com ([209.85.215.176]:37598 "EHLO
        mail-pg1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232202AbhFIAkP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Jun 2021 20:40:15 -0400
Received: by mail-pg1-f176.google.com with SMTP id t9so17962892pgn.4
        for <linux-next@vger.kernel.org>; Tue, 08 Jun 2021 17:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=UCR8T6dvOadUB7ygYan14MhvChrSqba7/u0loWi+kQ8=;
        b=iRVfqSkcbG2fNiVmqvD+pJ9CeAa1l3oBB/cL/IYxFJ8VWaIQJXzMqNUWWVqgibrK0W
         dxSLFHvScGabXvEMaGhkf050sQrRrR0B4kEfYw8i9baZUspCSx5n7YWNAAxnbCEZgjgM
         T3ZnR0/UTHe/htRqvmgPJfVKDuarbTZe5Sc/3y/nEdES8xK0r0munby4t0O+iMRxB5TB
         t1nlc4FOsBfRuWcDZsVPkAKnixjw8SYC/hzAVHfSrQzntpjlgOHA5BnkccWh3r9e1fuv
         0GAZtZw3kV9b2IDrlLWbe+Hcdep0I3bWTswLEGUhKTFpTZUj9JumDod21nSlo4/rd2Bw
         QZAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=UCR8T6dvOadUB7ygYan14MhvChrSqba7/u0loWi+kQ8=;
        b=dqhzBfSUAtCrXQEjv51H6Qp9AdUi+dsMCewaLSJDwwWqvYpDYgiaQnMsYFSl+J+Wk+
         2rHRFM6c/BWrgFdRfgSYwrqhdzgtPq9grFSKaBqNAD/V33ocgfeZW/QVLJlqHe48KrG0
         LKkLSIivTrYuBLhYB/8krbjdUfqq4n/WrBi1oCGIb80V22tHyIETQEt4Nqp0iZSiS87d
         omhksfCSjOcZY2XYb+orY+qepZQM5UzsTMz+gE1EA/GfIzAeg95KWMoEKbu5ovs+wHld
         bDv55Doqn5T9/V3G2WymrUVMNw/lg7I+jkrhnHmqC9BTUt9GLciQip+avMxpzU7xNcTD
         c55g==
X-Gm-Message-State: AOAM5335qL14ZnyzbipCtkZKi727C0DaWaoqLWUL0eH8lFjDmhsmgx6A
        K4f3+xY2mqH3xWS3WtXC54ImtA==
X-Google-Smtp-Source: ABdhPJxBzOZlknCG5sbF9Ce6xSEVRnAoFk6kdQF2DaGcBQkch5HRb86Gj6rvB/SZtiDLqon1/U8+Ug==
X-Received: by 2002:a62:79cb:0:b029:2e9:9951:eac8 with SMTP id u194-20020a6279cb0000b02902e99951eac8mr2457298pfc.59.1623199026692;
        Tue, 08 Jun 2021 17:37:06 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id o16sm11790252pfu.75.2021.06.08.17.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 17:37:06 -0700 (PDT)
Date:   Tue, 08 Jun 2021 17:37:06 -0700 (PDT)
X-Google-Original-Date: Tue, 08 Jun 2021 17:37:04 PDT (-0700)
Subject:     Re: linux-next: manual merge of the risc-v tree with the risc-v-fixes tree
In-Reply-To: <20210609102608.5582071b@canb.auug.org.au>
CC:     Paul Walmsley <paul@pwsan.com>, jszhang@kernel.org,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        vitaly.wool@konsulko.com
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Message-ID: <mhng-d47c3450-5364-43a2-a02a-965e7a9aa886@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 08 Jun 2021 17:26:08 PDT (-0700), Stephen Rothwell wrote:
> Hi all,
>
> Today's linux-next merge of the risc-v tree got a conflict in:
>
>   arch/riscv/mm/init.c
>
> between commit:
>
>   8700a6b6fee2 ("riscv: fix typo in init.c")
>
> from the risc-v-fixes tree and commit:
>
>   010623568222 ("riscv: mm: init: Consolidate vars, functions")
>
> from the risc-v tree.
>
> Note that 8700a6b6fee2 supposedly fixes 010623568222, but 010623568222
> is not an ancestor of 8700a6b6fee2.
>
> I fixed it up (I just used the version from 8700a6b6fee2) and can
> carry the fix as necessary. This is now fixed as far as linux-next is
> concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.

Sorry about that, this one was supposed to go on for-next not fixes.  It 
was causing my mail client to crash so I was kind of focused on that 
instead of the actual code...

It's on for-nex now.
