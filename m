Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF76F2D90BE
	for <lists+linux-next@lfdr.de>; Sun, 13 Dec 2020 22:25:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406477AbgLMVY1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 13 Dec 2020 16:24:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726338AbgLMVY0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 13 Dec 2020 16:24:26 -0500
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DAEEC0613CF;
        Sun, 13 Dec 2020 13:23:46 -0800 (PST)
Received: by mail-qt1-x830.google.com with SMTP id h19so10578714qtq.13;
        Sun, 13 Dec 2020 13:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=woMldeubPcQwCfH2AJMtOonlX7uVm8NNaedvirK0pjg=;
        b=LEirWKJ+ZGea1Hus9l8dkEMZgdojL42v8dTTBWQf1GAxYRV75w5Y/1Mc0UjJBhZBHJ
         n6zNZ/j09SUdg5ALk+dVZoVkUeGOKnDFrEAXgfpfLdL5y77Xn7EsbOZwq3Hi2fc+wCGc
         cCzHQ0QQwJJFSIVJ/OxeH8jT8GUKxSaGsnYlhypD0hM0srfUc+D2NqkcN7VEI/dPSht8
         dwNv1ohqkZHc5mbi1ARrBn3iEK0e/oXO0vmw6CRHJzs0yJVaNaq/w75YOtvHXNJDxgFd
         m1K7tUi7RHBgOkm3HE+iR42XRs/EdA0zBhuLt5tKJmM+XlxIHLDWu033DHYHQ/YJvqsZ
         784Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=woMldeubPcQwCfH2AJMtOonlX7uVm8NNaedvirK0pjg=;
        b=YoPeT4e5WTSyXbb+GzgiAOV7ZVM44rCBmNqHO3ehwpOtiR8+pztOhgizvtmqfyMX2H
         SSfSzAwHy6IoSXbm7i4EsW+/5lXV00fvZUz91uytzg0OYvDviAlFJxF1aN2JwzrnEkwT
         vnKH7hXp8hpDjvX6Zz+DEYReQRc6qiozt3MSCErUk/hgYREwwPPtIViRMZW6DjdSynjK
         6kKuM0N1llFYrAmfovLGxzDqUSgFg1kki8p6PeEnJ5/IZSo4hPKeHtCh4CwF4r3gv2oW
         2xlIFhzSKj3of3rX/PYBW6Vf/wb275rFKchJ9XHThCp4f19UIIK5rJRbFtMkFq0Fg5JR
         Rapw==
X-Gm-Message-State: AOAM533E8bDdqGx89LjtLhqVAQwLFUUFV5or+DhRefyRKDHsarWa16Zg
        8dSlNZbsEjOEliNIVHbNLdVHkqY/x03p2Ufk3NnkDwP6
X-Google-Smtp-Source: ABdhPJzejEk948s8msR5jnxB7KkyxX3oQ8pI3eoYwVMYt3kWMlTzHO1ICgIVUXu2pPl63ss8sPmNeWcgcauRBtzo6Zo=
X-Received: by 2002:a05:622a:24b:: with SMTP id c11mr26673522qtx.166.1607894625813;
 Sun, 13 Dec 2020 13:23:45 -0800 (PST)
MIME-Version: 1.0
References: <20201211103544.190e1bd5@canb.auug.org.au>
In-Reply-To: <20201211103544.190e1bd5@canb.auug.org.au>
From:   Richard Weinberger <richard.weinberger@gmail.com>
Date:   Sun, 13 Dec 2020 22:23:34 +0100
Message-ID: <CAFLxGvwO2fP4v=oYcj3j-vaqJOGg6AwPLk+szLJWZFToA5ydiQ@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the uml tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen,

On Fri, Dec 11, 2020 at 11:21 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> In commit
>
>   1aa1cfc19405 ("um: Remove use of asprinf in umid.c")
>
> Fixes tag
>
>   Fixes: 492edce1306f (um: remove uses of variable length arrays)
>
> has these problem(s):
>
>   - Target SHA1 does not exist
>
> Maybe you meant:
>
> Fixes: 0d4e5ac7e780 ("um: remove uses of variable length arrays")

Thanks for letting me know!

-- 
Thanks,
//richard
