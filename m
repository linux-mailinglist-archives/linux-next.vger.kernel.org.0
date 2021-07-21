Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2E1E3D0FAC
	for <lists+linux-next@lfdr.de>; Wed, 21 Jul 2021 15:39:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238344AbhGUM7K (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 21 Jul 2021 08:59:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238324AbhGUM7E (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 21 Jul 2021 08:59:04 -0400
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06D8AC061757
        for <linux-next@vger.kernel.org>; Wed, 21 Jul 2021 06:39:35 -0700 (PDT)
Received: by mail-vs1-xe2d.google.com with SMTP id z7so1433315vsn.7
        for <linux-next@vger.kernel.org>; Wed, 21 Jul 2021 06:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FQWrEGJNf7d0De/tJqK3kQBt/v9xkOGr4BS+4HVg0EM=;
        b=EMMSRpjLlR8z+9dKBS1LOAQ5xvjsVXm5iI/uKPDfiPQplFAdN6hsuW8fNAN9mTsWFh
         EWKrfhq3e2QQZrG8+RaOxX5bhWvGSLvnxsyu6yJvQILSiYCBcz/AcLFuU9d/fsDOtb4Q
         zmddOdVeEak6hqr1ebmjixvSoYW8XJFz84Als=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FQWrEGJNf7d0De/tJqK3kQBt/v9xkOGr4BS+4HVg0EM=;
        b=tTNiNCMJTIdONQY/nnhznSLceXU3s27tPOLUM6O3oz5lr8dTpLyw9k+13xGLSjAnS0
         gNXxTxtbPVUms/aphGlsz4zB4Ns6eRsMtaCr2HULWYKphjp49SnkUjByqgIBcxBWgRmn
         tpIP5zVfZgs7WdlJaPLbdStB5dg82cB8j2a8Lgb5A+YZGa6aTU0NGh/JHp5MLYLi4ilD
         4sYOKARyyTZyJsZ93WLBHHVQ3S0VjDQ596M8ktrMX4CbhYctaBq2l7sNX+fNc+GbcOiH
         ZdCYDXIwfdprILdF2K2TrlFOUIDc8AogjyW3G2c2ok4AW5qld17z+6GpHeGtaq2aArH7
         tZcw==
X-Gm-Message-State: AOAM533HbNeLte1iPU/wtDvNs4gqxMfuEqL7MVG9/pKdWUCBOj+TZ/hm
        lsNZ/n3Lgwb0aSSbj8L9rvmdUvDa1AD6UPHAop5Iag==
X-Google-Smtp-Source: ABdhPJwH4yJ9S25IQ5rPLheaGef2e4VPv9oDKl8stXlTiIfMtNVD6W6giQawxkcYCrZSguYrZde3NJF/M4O9psaGr/w=
X-Received: by 2002:a67:87c6:: with SMTP id j189mr35364915vsd.0.1626874774049;
 Wed, 21 Jul 2021 06:39:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210720163832.544a2baf@canb.auug.org.au>
In-Reply-To: <20210720163832.544a2baf@canb.auug.org.au>
From:   Miklos Szeredi <miklos@szeredi.hu>
Date:   Wed, 21 Jul 2021 15:39:23 +0200
Message-ID: <CAJfpegvVyZXCb-RHBea6wmqOHPTzauXwSny0w666GJnm68ZLmQ@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the overlayfs tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Amir Goldstein <amir73il@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 20 Jul 2021 at 08:38, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the overlayfs tree, today's linux-next build (htmldocs)
> produced this warning:
>
> Documentation/filesystems/api-summary:95: fs/stat.c:67: WARNING: Unknown target name: "statx_attr".
>
> Introduced by commit
>
>   d1e717e0032c ("fs: add generic helper for filling statx attribute flags")

Thanks, fix folded and force pushed.

Miklos
