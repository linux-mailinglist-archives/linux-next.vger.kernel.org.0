Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EF09A5260
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2019 11:00:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730753AbfIBJAM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Sep 2019 05:00:12 -0400
Received: from mail-io1-f43.google.com ([209.85.166.43]:45545 "EHLO
        mail-io1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730445AbfIBJAM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 2 Sep 2019 05:00:12 -0400
Received: by mail-io1-f43.google.com with SMTP id f12so10231978iog.12
        for <linux-next@vger.kernel.org>; Mon, 02 Sep 2019 02:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Fd3FeCU7/lkSs+4hKTB7nxoikEcFVQTD+3XfAy5XBzU=;
        b=D+72l/NfpI56VPuqkndfTavFIl1l8xpVpWYNpMJq26fl5Rb9dZYzWjMFlz8/OBez41
         uZ3SohOL2xCQd1IRtsnU3Z4kGkO4u63E32khQETJH7ZkTZ1VFRdPBGlFHLqXU3IPnku2
         78mLg0FUgKTjRlWtQhJBluDOL1fI6hQCpB1vY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Fd3FeCU7/lkSs+4hKTB7nxoikEcFVQTD+3XfAy5XBzU=;
        b=ZayxALDcqFxEt9nhhUDfd12jvmSt8H4mPG4bVhu3WfZEJKpFr9RGMCn14YOTHeH5D3
         AtTbICkNRWSag8ZSUBr3RnadJLiXQdnVuqjqJx3fpmn/qBX2VB+0ZFkpdqTftwD+nSRp
         TnwZ/55qrwbeAPEvRv3uIvNafVSy/GfbRTRhP0j59Jf0qqs49DE+u5xd99ous+GgocNl
         JuzathUiXEK6eI+4Hl8Hw1UfZLx2wsuYHT7sHRZkBBMg6RB12Tem1LfesrO+3c9jf3du
         EfZIkFgGU5/GcB3YX0m2SSxKZhI+voYhnIxyki4ZVLMbmKO5bmqHEw4qx5b6dp+HD6A2
         UULw==
X-Gm-Message-State: APjAAAW6LQgWulx6V7lRmUzkPkmMEIFh2m9VdLgnN87tgABlj4Ijg2PU
        GY8gd1iwRAyRhuo5of5eITJ0gCQ2RezcwGomCyTupw==
X-Google-Smtp-Source: APXvYqxjmqayGM06FSCz0PH9m53ZWSr3HdWaxZGzrO4SUE8d24XHfTaq3fBlJDHoJgoSTjZM4jPv1Tjb1qVJQjm0lwE=
X-Received: by 2002:a02:cb9b:: with SMTP id u27mr3054872jap.26.1567414811516;
 Mon, 02 Sep 2019 02:00:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190830130119.446e7389@canb.auug.org.au>
In-Reply-To: <20190830130119.446e7389@canb.auug.org.au>
From:   Miklos Szeredi <miklos@szeredi.hu>
Date:   Mon, 2 Sep 2019 11:00:00 +0200
Message-ID: <CAJfpeguxmJvCV+PXr=wz5HXONKv4RDmZ1LpYNEqAtvw_smP5Ag@mail.gmail.com>
Subject: Re: linux-next: manual merge of the vfs tree with the fuse tree
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        David Howells <dhowells@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Aug 30, 2019 at 5:01 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the vfs tree got a conflict in:
>
>   fs/fuse/inode.c
>
> between commit:
>
>   1458e5e9f99a ("fuse: extract fuse_fill_super_common()")
>
> from the fuse tree and commit:
>
>   2ad9ab0f7429 ("vfs: Convert fuse to use the new mount API")
>   48ceb15f98c8 ("vfs: Move the subtype parameter into fuse")

And the latter is b0rked anyway.

Al, please drop these patches from the VFS queue, I'll take (and fix)
them through the fuse queue.

Thanks,
Miklos
