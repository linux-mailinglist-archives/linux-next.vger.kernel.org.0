Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56384320E85
	for <lists+linux-next@lfdr.de>; Mon, 22 Feb 2021 00:24:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233583AbhBUXXZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 21 Feb 2021 18:23:25 -0500
Received: from conssluserg-03.nifty.com ([210.131.2.82]:26853 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233564AbhBUXXQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 21 Feb 2021 18:23:16 -0500
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 11LNLvT1018221;
        Mon, 22 Feb 2021 08:21:58 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 11LNLvT1018221
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1613949718;
        bh=Wz6w9jbD0+jY3ddA1WQ0MnvnDOU4v6d+nnyElFXD534=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=h9WONg9xqjA4KLNu3WTd0Qftl3O5spjcMGQQOHZtxGj+EDGuiR556nRrRHJMDvQxM
         Dn2pF979wn6jACBx6PExwx3YBCsQlJKcddmFyuh6RrHlx5JAtlLcNMY0BlqyWqgiS2
         SnGc+rtGauUT5L4V3qX9YJeqEqRA9GL5XiYdoG0k7HHmAbf4k7WKBM1FRmFa3k4pho
         Rw2yK0rttoFJmAsN6JrguGNDM8ANFcBaf/4JkB6qyrH2IPydz5w7qxLVtLbpTJZ066
         8lwxZPcmTkjeMkqDGvc9Djuv+X3rN4PvKU0+ftorGPUYtoy4NHGPw6kkK2JSA1wP+o
         So+d/HmeWS9sQ==
X-Nifty-SrcIP: [209.85.214.175]
Received: by mail-pl1-f175.google.com with SMTP id p5so1729026plo.4;
        Sun, 21 Feb 2021 15:21:58 -0800 (PST)
X-Gm-Message-State: AOAM530YLfofnEnMdAuljmobrnWPdXgX20mRbR40rN6HJu/12HHp5Kb4
        JOika0vVvJNmcmfVnO5u7YLJmgTRlZWlIQvNqwI=
X-Google-Smtp-Source: ABdhPJzGxXkm/cgQK/ytlRkpsDtbDL5q33QwSQ3RAKxGe0Stwf8N6Ht99pS2ufSUhYoub/IwQOxRkILuLxrWjauwFOk=
X-Received: by 2002:a17:90a:609:: with SMTP id j9mr20640090pjj.198.1613949717277;
 Sun, 21 Feb 2021 15:21:57 -0800 (PST)
MIME-Version: 1.0
References: <20210222083315.39fbe380@canb.auug.org.au>
In-Reply-To: <20210222083315.39fbe380@canb.auug.org.au>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 22 Feb 2021 08:21:20 +0900
X-Gmail-Original-Message-ID: <CAK7LNASe5POj98NsaAE=zxZzWN3bpmCsA5cHvSP6gZLY8eTrFw@mail.gmail.com>
Message-ID: <CAK7LNASe5POj98NsaAE=zxZzWN3bpmCsA5cHvSP6gZLY8eTrFw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the kbuild tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Mon, Feb 22, 2021 at 6:33 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the kbuild tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> cc1: fatal error: FORCE: No such file or directory
> compilation terminated.
>
> Presuably caused by commit
>
>   15bb90419621 ("arch: syscalls: add missing FORCE and fix 'targets' to make if_changed work")

Sorry, this happens only when CONFIG_XEN=y,
and I did not cover all cases.

I will fix it for tomorrow's linux-next.


If it is not too late, you can apply the following locally.



diff --git a/arch/x86/entry/syscalls/Makefile b/arch/x86/entry/syscalls/Makefile
index e1c7ddb7546b..ea6ffb51b9a3 100644
--- a/arch/x86/entry/syscalls/Makefile
+++ b/arch/x86/entry/syscalls/Makefile
@@ -21,7 +21,7 @@ quiet_cmd_systbl = SYSTBL  $@
       cmd_systbl = $(CONFIG_SHELL) '$(systbl)' $< $@

 quiet_cmd_hypercalls = HYPERCALLS $@
-      cmd_hypercalls = $(CONFIG_SHELL) '$<' $@ $(filter-out $<,$^)
+      cmd_hypercalls = $(CONFIG_SHELL) '$<' $@ $(filter-out $<,$(real-prereqs))

 syshdr_abi_unistd_32 := i386
 $(uapi)/unistd_32.h: $(syscall32) $(syshdr) FORCE






> I have used the kbuild tree from next-20210219 for today.
>
> --
> Cheers,
> Stephen Rothwell



-- 
Best Regards
Masahiro Yamada
