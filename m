Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DA9B7B76B5
	for <lists+linux-next@lfdr.de>; Wed,  4 Oct 2023 04:50:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241198AbjJDCuj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 Oct 2023 22:50:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241070AbjJDCuf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 3 Oct 2023 22:50:35 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BDEFAF
        for <linux-next@vger.kernel.org>; Tue,  3 Oct 2023 19:50:31 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1c364fb8a4cso13892735ad.1
        for <linux-next@vger.kernel.org>; Tue, 03 Oct 2023 19:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696387830; x=1696992630; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BOKVkRIlUClvH6h3CIZ9FG68iZnhspFEEi3dJ7aEfBQ=;
        b=W9+GdKXGbiPLPbfqZZoL6XVKh1yFhaXDa/Md5Nht2t+nYIK1Q+CwkkwooLsXIMp624
         URJCKtT4VRXCphDcdPAaDFIRZK3MDL0ywWyrGIPWbFwA4IcsAKtTNCjLQ9TTh5Xe6Wd+
         GZ3bEMpmf/k4r/8IAU3ZTMwWyRRYNjm1iy9hI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696387830; x=1696992630;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BOKVkRIlUClvH6h3CIZ9FG68iZnhspFEEi3dJ7aEfBQ=;
        b=QXXosKWZPqhbBQPubU7eidkxz/+70U1Lcpzlu+Fyjd9olMUhBlZBe6m4/8Q1hd2kTg
         yOBNZjP24ley+24d2HmN5yuUzx0dPSE+VMvQOBtXYWml1kZPMkuJxlGqyBfhOrV1oPTb
         qTwoiM7J9z4VlR7qlSEDbd16/OKK98p95At7XNrV/kxeaDGoDhcYj92Py2BVU0rPCfFT
         sOBGuM12zwiDVKBrrhxev1M6GtmeKjBuAM7CEvZMP6wLwCaFGlzD4zsfnLyi5OKGoa2X
         IgkNYuF0uTQjpPHQMZnKm+sELptyVxfkODDrZotZBZDM3Zpz4aswPlYtL+JOD/JpYVxb
         G63g==
X-Gm-Message-State: AOJu0Yzvhr5pYN/ZXhtyvm8pDzVtNEkQXJVYt1zKYcAF3kUjUeM3Lu9N
        v3Ft0Q3/F+ADWZ2exL8b8FLjyA==
X-Google-Smtp-Source: AGHT+IFddbMh8XutvwSJLmRf9/pBtZw2ENY3tPF1YiGdt60Sf1BbxQalDpER/veXlhndYyU4KGa9GQ==
X-Received: by 2002:a17:903:4284:b0:1ab:11c8:777a with SMTP id ju4-20020a170903428400b001ab11c8777amr1325242plb.13.1696387830493;
        Tue, 03 Oct 2023 19:50:30 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id c3-20020a170902d90300b001c731b62403sm2349948plz.218.2023.10.03.19.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 19:50:29 -0700 (PDT)
Date:   Tue, 3 Oct 2023 19:50:28 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Sebastian Ott <sebott@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the execve tree
Message-ID: <202310031950.E698038489@keescook>
References: <20231003133522.310bda60@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231003133522.310bda60@canb.auug.org.au>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Oct 03, 2023 at 01:35:22PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the execve tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> fs/binfmt_elf.c: In function 'load_elf_library':
> fs/binfmt_elf.c:1323:37: error: unused variable 'len' [-Werror=unused-variable]
>  1323 |         unsigned long elf_bss, bss, len;
>       |                                     ^~~
> fs/binfmt_elf.c:1323:32: error: unused variable 'bss' [-Werror=unused-variable]
>  1323 |         unsigned long elf_bss, bss, len;
>       |                                ^~~
> fs/binfmt_elf.c:1323:23: error: unused variable 'elf_bss' [-Werror=unused-variable]
>  1323 |         unsigned long elf_bss, bss, len;
>       |                       ^~~~~~~
> cc1: all warnings being treated as errors
> 
> Caused by commit
> 
>   f2a1e5fab9ae ("binfmt_elf: Use elf_load() for library")
> 
> I have used the execve tree from next-20230929 for today.

Whoops! Fixed now. Thanks. :)

-- 
Kees Cook
