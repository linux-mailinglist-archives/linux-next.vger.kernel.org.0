Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CA8F30DE75
	for <lists+linux-next@lfdr.de>; Wed,  3 Feb 2021 16:43:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234625AbhBCPmr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Feb 2021 10:42:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234616AbhBCPmE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 Feb 2021 10:42:04 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 016DBC0617AA;
        Wed,  3 Feb 2021 07:41:24 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id h7so33997951lfc.6;
        Wed, 03 Feb 2021 07:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QqNu7tu9q98+eW4cgFx0XeZD2zNqgdF7F2PhhhDVRNM=;
        b=PsjgQ0dqCXzF8g1pPvYxrQ4pO1dhfMwxVM4LNCbPnimmIlpqXgpoqDT393eyaUCjMV
         k2G8KLp8T82RoXq7H2oZsSx5KInLgyya/mbYkcRYr2cP5kxZMfUcL3GevygKLTmN5GjY
         miBOGborOYSyej5PM9Ib3SQZS+XwrPNjFmYo/Ol1xano64TuVKMdUnpKd5qtOWPEZhz9
         nodeQ3lXGoWLL3OfSEQoxHmxB8X00dEdpz+Ah77HR2Fux8cicLaNxlzvhWlWVlqy0QfT
         fxio8dlrXulOJN2ZdZOSnsBWm9fhdyyBdJQ8rGH22Pf36J0a/7Zort8DKXfFGCbkUCQO
         H5fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QqNu7tu9q98+eW4cgFx0XeZD2zNqgdF7F2PhhhDVRNM=;
        b=hDKtl6Q4hCfLKT6Z/zP9nc1oA0LhQTnhgGfhXLHWttQOZaMZBbV3ElUNa2dhN1f2Lx
         s4VHMcLqwN1+ynNbMRe4qOYY6slWupH7I2sEiTFhzfPgvflHlDDsCc8/75IIB5qFVAJT
         +LcqnWvs4btWw+WN0kjNNWYAjZ06aMftMDN3n9qK4k2RWYMbcp7d1NpHh3Vp63NA+51k
         0FKHxD6083tBDBDUYcJxmFCqIS+jnIqu3IQgB06btI1zvpSXTQ70NPr5BWqb3PS90L7Z
         Zuey2ovsn0HkJNrjsY2i8Ao1nzcTqxFfuapvZ6RTtutFNA47xnJS22qpDI9OQZ89HAqA
         CXKg==
X-Gm-Message-State: AOAM532qFngjwvk0V8PeFmhAPU/ICR447Y3hc76TAzcGASvFB7GJ3VzM
        jqSmM11mzbTkKJIoVGqhzKTBO5fFtoSED8Y1KKRFJGfikWo=
X-Google-Smtp-Source: ABdhPJyjW0ZVX8hT6UZ5ZwQHdggrCvyqvNveR5bpwWTsBe45uvOt1JIlKJMo2+qF1jDZN5RCjZzmsjlw/30mJyTSokg=
X-Received: by 2002:a05:6512:3254:: with SMTP id c20mr2165771lfr.282.1612366882458;
 Wed, 03 Feb 2021 07:41:22 -0800 (PST)
MIME-Version: 1.0
References: <20210203215909.5713dbe6@canb.auug.org.au>
In-Reply-To: <20210203215909.5713dbe6@canb.auug.org.au>
From:   Steve French <smfrench@gmail.com>
Date:   Wed, 3 Feb 2021 09:41:11 -0600
Message-ID: <CAH2r5mtx2E=UtPdeVyyS0XFtVHh0WVRAGQGJgcz3j5UHgmYJZw@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the cifs tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     CIFS <linux-cifs@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

fixed

On Wed, Feb 3, 2021 at 4:59 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Commit
>
>   37595a5c8a51 ("smb3: fix crediting for compounding when only one request in flight")
>
> is missing a Signed-off-by from its committer.
>
> --
> Cheers,
> Stephen Rothwell



-- 
Thanks,

Steve
