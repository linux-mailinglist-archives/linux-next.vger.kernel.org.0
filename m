Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 212D235C700
	for <lists+linux-next@lfdr.de>; Mon, 12 Apr 2021 15:08:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239552AbhDLNI2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Apr 2021 09:08:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30003 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239409AbhDLNI2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 12 Apr 2021 09:08:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618232889;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=otGT/idIYaxyQ7GR4T+PhiVlu9+JXsCYqF5tB9i4mYo=;
        b=QN2TIViOrobzNnK5DxUB3RecER6DvO+5XKvqqpeV8Vhi5lAUiU5ud/2HsKKno56C5/46tV
        3EmFr3Rn+TBXTg3rHDP28iykTRpTWs+qQJxDo59wVaPo+XkkJXSqEIeEwTvYvZ86pY2OxP
        CmN9hwRvFRa/xzUlUKnLTecyQrLKSwc=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-U1vcsme3Osuf2HszZBSsZA-1; Mon, 12 Apr 2021 09:08:08 -0400
X-MC-Unique: U1vcsme3Osuf2HszZBSsZA-1
Received: by mail-qk1-f200.google.com with SMTP id x10so562693qkm.8
        for <linux-next@vger.kernel.org>; Mon, 12 Apr 2021 06:08:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=otGT/idIYaxyQ7GR4T+PhiVlu9+JXsCYqF5tB9i4mYo=;
        b=nvHSxeg5xI8pdxHoYwp8aC70seE6GpRUDLhmtaKuyjxmIMPkfPQwGeMtrPgkz2t2qP
         PXl8NoJucCeJ1bXBqbVmwevMF8oqFX8FL/crSP/uMdQNG0VhMpfpQ/ya+srOt0URK1Px
         NqCZoB5QX/hKZkCS/G3S/+1OcISpFLFschhnITuB1kZnKjB5OkpaIJmAxmjj2pkc5Ct5
         E/eTYVurc6hkSbrlcWNy604xyNckZ23zNas/RTHPN1qyPM8XEULGtGzx6xnz4pDG0SRR
         lX94wzSsmFuKqtgFsA7E8RkwkW/rsS9u9NegB9p4peNeHLsY9DDCg/Iw0IvVh56HrN6d
         dQkA==
X-Gm-Message-State: AOAM530iWado/yMXarBDy5R0oW7nMrIaxZZaw+BmneJqi8c2mrJOxARh
        eoTCDLhlyu+tZJ5KpZfqOrD1tvtYCSw+1y4fLspRZqNyaC3gIhKzVrB2fZ9YJVrQ7pn0ckRxpyp
        RQ5J8PmcZ1HESUdBCGNBeUvI4I5H7uO7P+BDP8w==
X-Received: by 2002:a05:622a:18a:: with SMTP id s10mr25054262qtw.237.1618232887800;
        Mon, 12 Apr 2021 06:08:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzpDbXPx+FlN6dvGLpYb9ZDLeRek2ScHceimDqA8UHWpGvuZxuyVO1rvL/0EfsADt564xwPyEGhhUOwcZ1L+j4=
X-Received: by 2002:a05:622a:18a:: with SMTP id s10mr25054238qtw.237.1618232887553;
 Mon, 12 Apr 2021 06:08:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210412214730.2dbbcdff@canb.auug.org.au>
In-Reply-To: <20210412214730.2dbbcdff@canb.auug.org.au>
From:   Miklos Szeredi <mszeredi@redhat.com>
Date:   Mon, 12 Apr 2021 15:07:56 +0200
Message-ID: <CAOssrKdAmeVK_uwLCDo_ZT52vOzxSU9X=orgzU6RB088L6OdKA@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the vfs tree
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Al,

Fixed fileattr branch pushed to:

  git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/vfs.git fileattr_v6

Thanks,
Miklos

On Mon, Apr 12, 2021 at 1:47 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the vfs tree, today's linux-next build (htmldocs) produced
> this warning:
>
> Documentation/filesystems/locking.rst:113: WARNING: Malformed table.
> Text in column margin in table line 24.
>
> ============    =============================================
> ops             i_rwsem(inode)
> ============    =============================================
> lookup:         shared
> create:         exclusive
> link:           exclusive (both)
> mknod:          exclusive
> symlink:        exclusive
> mkdir:          exclusive
> unlink:         exclusive (both)
> rmdir:          exclusive (both)(see below)
> rename:         exclusive (all) (see below)
> readlink:       no
> get_link:       no
> setattr:        exclusive
> permission:     no (may not block if called in rcu-walk mode)
> get_acl:        no
> getattr:        no
> listxattr:      no
> fiemap:         no
> update_time:    no
> atomic_open:    shared (exclusive if O_CREAT is set in open flags)
> tmpfile:        no
> fileattr_get:   no or exclusive
> fileattr_set:   exclusive
> ============    =============================================
>
> Introduced by commit
>
>   10a489bbff3e ("vfs: add fileattr ops")
>
> --
> Cheers,
> Stephen Rothwell

