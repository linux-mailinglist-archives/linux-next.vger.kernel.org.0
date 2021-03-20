Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB06C342BEF
	for <lists+linux-next@lfdr.de>; Sat, 20 Mar 2021 12:17:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbhCTLQo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 20 Mar 2021 07:16:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230022AbhCTLQM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 20 Mar 2021 07:16:12 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95427C06178A;
        Sat, 20 Mar 2021 04:16:12 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id a143so1066279ybg.7;
        Sat, 20 Mar 2021 04:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nbCYfgiOtpWpaHW3UiZCAz94mqRPq79OLUJJtrbRI7I=;
        b=saJooZ4QrInaIbgLt/0TQ3KfUuHi93CFnRBZGfCVMa169EMUxKgXQEsup67xw7zWVm
         RGn7HXCP1/e9rX6n64NQE9GC9WpxKcp1MUjjSpZI/jUTlTsavzKi4WTwDwuuWI/90ZUk
         IBsgecR4tixEFWVm+XoBpKDnrP3BBvCBU2IBqM+Ce6WKzN7PSp09e1JSks8tTMsQtbXe
         HrBzJyBsiGnvEJf0BM1ARZS+zEXTmiUAAvQ9fW0A6MUIHA2nvddHnzZLPtO1vlp6qiS2
         +HusYyo48lAx7b34v70zwVsInwcnDMOn3J6mpHtXq2KiCXXPDUup0TWz97tM0E6O+vTh
         WVOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nbCYfgiOtpWpaHW3UiZCAz94mqRPq79OLUJJtrbRI7I=;
        b=q11rnOvQiYV6fKGo8DecoBZvKSr9M+nVfF1xH7M65NOciZIO6J5KiQ550Ak5UEwfOx
         me1R2O1fELdgUKiKZOSXZMR1GpL9RZDWAub1AcRm5jhmT6JeUlm+3+OUix3nDvLK4UOJ
         mOoQjG+P8+lqZyfAeDmyc5TsofYtN2V1FkhwMs9vNFcC63KnULVJFQpcBRdxmsGNLTlS
         dxBX2AshUFXKS7noV/I4I9pACkaGXsCY/EQtKvp9RO1wbRj1Wxp8+qMuRkuwvC5bOymA
         apRRcVKmcLqAOqHqwwWGb44+a+54cBifsSk50k4EcDRxMMkH5FXKuUN/k4mEUDq81j1/
         K3FQ==
X-Gm-Message-State: AOAM530mGMNhEerMqwr9Albqiu7MYnF98k6j+FWCW90kp3j+zgs5iWoc
        iWDlMtHnPWBnRannXZRFSsngrp0GZ8hASOubS7R+sH4t1Z4q5Q==
X-Google-Smtp-Source: ABdhPJwpVYQmBzRJ8WziWDH454+t7Zpo8F7a5QFtiwS8atfzbqFD0ejdoeiqA29DPIqFSKL5k22epEdp7XU49U3ZH2Y=
X-Received: by 2002:a5b:449:: with SMTP id s9mr11448764ybp.115.1616222982003;
 Fri, 19 Mar 2021 23:49:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210319175950.509fcbd0@canb.auug.org.au> <YFS1h6h+71sRlwFR@osiris>
 <20210320162734.1630cc55@elm.ozlabs.ibm.com> <CANiq72nKJBVsuvqr17qa0xnkQTUz9aaAGRi8SfXZAn-G=RYQXw@mail.gmail.com>
In-Reply-To: <CANiq72nKJBVsuvqr17qa0xnkQTUz9aaAGRi8SfXZAn-G=RYQXw@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sat, 20 Mar 2021 07:49:31 +0100
Message-ID: <CANiq72n+-9vtpvvHTD=QzpskCbZEvTWhDXUaHrkwsJn4M3fjXg@mail.gmail.com>
Subject: Re: linux-next: Tree for Mar 19
To:     Stephen Rothwell <sfr@rothwell.id.au>
Cc:     Heiko Carstens <hca@linux.ibm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Daniel Axtens <dja@axtens.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sat, Mar 20, 2021 at 7:07 AM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Sorry for that, and thanks a lot for taking a look. For the Rust
> support I had to increase a few limits, mainly the symbol length. Let
> me check and I'll report back.

Reproduced on s390. However, under defconfig, one also needs to revert
kernel/livepatch/core.c to avoid triggering the assert, i.e.:

diff --git a/include/linux/moduleparam.h b/include/linux/moduleparam.h
index a33f3dcde593..eed280fae433 100644
--- a/include/linux/moduleparam.h
+++ b/include/linux/moduleparam.h
@@ -18,7 +18,7 @@
 #endif

 /* Chosen so that structs with an unsigned long line up. */
-#define MAX_PARAM_PREFIX_LEN (256 - sizeof(unsigned long))
+#define MAX_PARAM_PREFIX_LEN (64 - sizeof(unsigned long))

 #define __MODULE_INFO(tag, name, info)                                   \
        static const char __UNIQUE_ID(name)[]                             \
diff --git a/kernel/livepatch/core.c b/kernel/livepatch/core.c
index 080ebb94d012..1e1699cc3fd6 100644
--- a/kernel/livepatch/core.c
+++ b/kernel/livepatch/core.c
@@ -213,7 +213,7 @@ static int klp_resolve_symbols(Elf64_Shdr
*sechdrs, const char *strtab,
         * we use the smallest/strictest upper bound possible (248, based on
         * the current definition of MODULE_NAME_LEN) to prevent overflows.
         */
-       BUILD_BUG_ON(MODULE_NAME_LEN < 248 || KSYM_NAME_LEN != 512);
+       BUILD_BUG_ON(MODULE_NAME_LEN < 56 || KSYM_NAME_LEN != 512);

        relas = (Elf_Rela *) relasec->sh_addr;
        /* For each rela in this klp relocation section */
@@ -227,7 +227,7 @@ static int klp_resolve_symbols(Elf64_Shdr
*sechdrs, const char *strtab,

                /* Format: .klp.sym.sym_objname.sym_name,sympos */
                cnt = sscanf(strtab + sym->st_name,
-                            ".klp.sym.%247[^.].%511[^,],%lu",
+                            ".klp.sym.%55[^.].%511[^,],%lu",
                             sym_objname, sym_name, &sympos);
                if (cnt != 3) {
                        pr_err("symbol %s has an incorrectly formatted name\n",

Cheers,
Miguel
