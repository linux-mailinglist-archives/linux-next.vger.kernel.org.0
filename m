Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 021F0A5A37
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2019 17:10:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731391AbfIBPKj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Sep 2019 11:10:39 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:37949 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbfIBPKj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 2 Sep 2019 11:10:39 -0400
Received: by mail-io1-f67.google.com with SMTP id p12so29746701iog.5
        for <linux-next@vger.kernel.org>; Mon, 02 Sep 2019 08:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eNoZVt93wCM2AD/WJsdKgmkl7QJYjyE8sIFzYDYEiq4=;
        b=JXqy7J5YOfHw70u2KMsOY+LVESQvc9tJmhEt/mn5NcgBhZXYx/JSUnUdBx236ujBr0
         k+LwyWG21gdvtU+kztx1imluhfGzI31fGEn2WgROzQeYSmNxsNksz6SG0LyBCebyUhRM
         C6TwF5G1VeF0mfS61qmlxog6FDqv1I06Bkvrg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eNoZVt93wCM2AD/WJsdKgmkl7QJYjyE8sIFzYDYEiq4=;
        b=uZVIuFy2n8k0BH8rhP3AbjPALvPDKzCRrUAljteaHxfnObvRAWj+vkE4Aw7t+ZscD8
         bukvjB3/tYLUsWZTXFH40CsN+IL14NWDrosjC1fVrX+tWYN9lZtjlOzOH71a7BVqKg3F
         yIjgKe8GyGmsF5r8k1L4youK8Ea9UEgxfmPM+l6vxQBGADJIhumy6+g9ollp0Xsf+BJE
         3TcIWv1SJ8Gn24+C5u1G21IVNCDI6ZP0Es5ZKzRLXX5Hwd2pTv4r6P8z+pjFKEy7LYhz
         dgpQJB7GHcTV9XtIQ+ybG14nO67aumk7n4Jy4L4jCJdTbo9xjJUBbSIqSCBGi+3uT479
         wetw==
X-Gm-Message-State: APjAAAUrB8gVwvknKrmEysduzDUmXM3COBjUa0dsv+k/1hZM4EawtPQP
        PyY5LalYc7JHNDgGAbHXit3SQGWzwsPywsE3XwSzQQ==
X-Google-Smtp-Source: APXvYqwZRkt8fPWRtDpiKFOKXTy8fw0RHOy/5a1qDh7rttm4qMCirS6V7hOTFzeJsTNvgEwYZnkeRnwFnPJXwIhBKN0=
X-Received: by 2002:a6b:f80f:: with SMTP id o15mr1741553ioh.174.1567437038133;
 Mon, 02 Sep 2019 08:10:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190830130119.446e7389@canb.auug.org.au> <CAJfpeguxmJvCV+PXr=wz5HXONKv4RDmZ1LpYNEqAtvw_smP5Ag@mail.gmail.com>
In-Reply-To: <CAJfpeguxmJvCV+PXr=wz5HXONKv4RDmZ1LpYNEqAtvw_smP5Ag@mail.gmail.com>
From:   Miklos Szeredi <miklos@szeredi.hu>
Date:   Mon, 2 Sep 2019 17:10:27 +0200
Message-ID: <CAJfpegsijOi6TdRcObGSAJ+tS0JiZky=v6Wqh5u8RZTzi6tkjA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the vfs tree with the fuse tree
To:     Al Viro <viro@zeniv.linux.org.uk>,
        David Howells <dhowells@redhat.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Sep 2, 2019 at 11:00 AM Miklos Szeredi <miklos@szeredi.hu> wrote:
>
> On Fri, Aug 30, 2019 at 5:01 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > Today's linux-next merge of the vfs tree got a conflict in:
> >
> >   fs/fuse/inode.c
> >
> > between commit:
> >
> >   1458e5e9f99a ("fuse: extract fuse_fill_super_common()")
> >
> > from the fuse tree and commit:
> >
> >   2ad9ab0f7429 ("vfs: Convert fuse to use the new mount API")
> >   48ceb15f98c8 ("vfs: Move the subtype parameter into fuse")
>
> And the latter is b0rked anyway.

Both, actually.

Pushed fixed ones to fuse.git#for-next.

Thanks,
Miklos
