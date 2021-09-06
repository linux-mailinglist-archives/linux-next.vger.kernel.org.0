Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E0E4401ED7
	for <lists+linux-next@lfdr.de>; Mon,  6 Sep 2021 18:59:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242526AbhIFRAt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Sep 2021 13:00:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242464AbhIFRAt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 6 Sep 2021 13:00:49 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C4B1C061575
        for <linux-next@vger.kernel.org>; Mon,  6 Sep 2021 09:59:44 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id 107-20020a9d0bf4000000b0051b8be1192fso9456927oth.7
        for <linux-next@vger.kernel.org>; Mon, 06 Sep 2021 09:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qrLm5oiqWxtTolUGRrcV++cwGJOtI1kBWO0Y+h4a8lQ=;
        b=bFjpeuCAK/idr93IKqOzbMhnC0tD4Ww48HBjomkc4V0BwLGor9/aI2NwbQGaGadJz/
         FX/h7wWUUrm2gK6h0utkr6cvoinC3mEOk8MFxawJU7CwcLkAJeAvGc+IDed6pR/GA40y
         5MoP6fVCNQFcOnXsxzrkexrFfLYr/3/H1zQcIHAYodGjwOTo0qFxZ7t3QcnRgDxLiykQ
         CAonMw8KoGC0Dne/TeIBJ3msrrLguaTJGBuggaYU8T/ypbkTfA6BTRzN8JKorQNUG4vQ
         xXP+lVsC2LfY5PQOBf+31IGzXXmFWpf0J8Bn5yAtvBfsVw12vLtxNPnZidgTKB93TzRP
         IMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qrLm5oiqWxtTolUGRrcV++cwGJOtI1kBWO0Y+h4a8lQ=;
        b=SJM701NAgD7U79TEnsl2u9FmYPXuDGpd4nmO9SAzSNZdRUg/QuV4z2voU3udk5xuzG
         rviHeg6St+tMQ0LuZ4gWDjAbOXa3ozMjE5E+pvGaMGGjOPg3V/HCYzPcoEh2NGd8zieY
         FR50S2fGN30KQuv//rpXlpKjqilo/my1NexzxSMCr1gTjcWxBu4uUzfPxU/kX+2f+QvW
         MvBRKqedoRJre/c5jgBmD+fIFK5Y96YxgP7S7vmpbjJ8FvnPnZVVkSgBvT47wAJX8ELX
         zqG1PMW9EiQUMxpozX8RF4LZznzW8piJ/qmsRL9b81DvsVkOrbsnuJyRQeZlGduGbf6p
         1+mw==
X-Gm-Message-State: AOAM533xszpnFC/UlBL3+SDskF4nmZzWLhDMrWRKni3EaM6mYxxHR4q0
        daUZ6gGy4Y4YLS4rmCWkPZXzHFWzPke7L2oGkLuIiA==
X-Google-Smtp-Source: ABdhPJxMvAmEjY2nhcR5beo/FeOh/yMmQMyUSuywR7WxGcYSbdKqdRxrQRHaeNsJo0DsPvxas+voZPXERwIlWR5cLq4=
X-Received: by 2002:a05:6830:444:: with SMTP id d4mr11753774otc.108.1630947583309;
 Mon, 06 Sep 2021 09:59:43 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000bc92ac05cb4ead3e@google.com> <CAJfpeguqH3ukKeC9Rg66pUp_jWArn3rSBxkZozTVPmTnCf+d6g@mail.gmail.com>
In-Reply-To: <CAJfpeguqH3ukKeC9Rg66pUp_jWArn3rSBxkZozTVPmTnCf+d6g@mail.gmail.com>
From:   Marco Elver <elver@google.com>
Date:   Mon, 6 Sep 2021 18:59:32 +0200
Message-ID: <CANpmjNM4pxRk0=B+RZzpbtvViV8zSJiamQeN_7mPn-NMxnYX=g@mail.gmail.com>
Subject: Re: [syzbot] linux-next test error: KASAN: null-ptr-deref Read in fuse_conn_put
To:     Miklos Szeredi <miklos@szeredi.hu>
Cc:     syzbot <syzbot+b304e8cb713be5f9d4e1@syzkaller.appspotmail.com>,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 6 Sept 2021 at 13:56, Miklos Szeredi <miklos@szeredi.hu> wrote:
> Thanks,
>
> Force pushed fixed commit 660585b56e63 ("fuse: wait for writepages in
> syncfs") to fuse.git#for-next.
>
> This is fixed as far as I'm concerned, not sure how to tell that to syzbot.

Thanks -- we can let syzbot know:

#syz fix: fuse: wait for writepages in syncfs

(The syntax is just "#syz fix: <commit title>".)
