Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1A5A35E4A3
	for <lists+linux-next@lfdr.de>; Tue, 13 Apr 2021 19:07:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344348AbhDMRHw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Apr 2021 13:07:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344320AbhDMRHt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 13 Apr 2021 13:07:49 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 992DCC061574
        for <linux-next@vger.kernel.org>; Tue, 13 Apr 2021 10:07:28 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id 7so18571583qka.7
        for <linux-next@vger.kernel.org>; Tue, 13 Apr 2021 10:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8xbFjXfIvD0txVY5tm9g6NqmOIIi1BOsdiGGMQiDDjA=;
        b=JJ4xHG6Ae4Sv5nf7ss2cYn3PUM5vguo9qZx/CBDrGSWVyMLbDcmDfRqL/VQ2UxbMZj
         Alcu9m3KfDgyepq2dmlmYsmlkMllLOhbSy86Negv0QJ4ShFFH1FqndK+yApoFOE1ocVx
         vs961+wLFvfhLzfwNdgDKmRrofcK6SmLmn7t7VnjsYngUs4gShHgEyMiSI28aS8GwDUx
         od19V4tePI2Euj3Ir3fj7AhkdTxrCKnwcWYw9hBkbQcG3TcnEPOO5uZAxo6tjaSBcszu
         KuzmbBoch+xGmI5aWsjXAlKsn+NRDOP9T99pYRiCIgldgNpjl8mKnpaNAdNw0dax5MH8
         DKgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8xbFjXfIvD0txVY5tm9g6NqmOIIi1BOsdiGGMQiDDjA=;
        b=TUCE+xvn2if/KS4k/XSYFMpM00UOQP8uCQeijpU+plQbJUdxsYsWfx0Y5+PtLP+vXa
         t5rfNVmpJJHYFPKgW0j08MpF6H8/bVDFTkyR2AF/xPp+r7CLQ/w66MemcmU17Liu3k6j
         PVENICcXFBz32Lc7m+BI2qHdytEXBK/vBXkW4830L4MOlkU+ebyBU3SUFpw5iXacYIaI
         y74gOvqBV2vAILbDGM30O0j7+jWHvJAoJlkyY+a+e8M1iK3FbV7Rax0Ry0J/xjt9IwF4
         OmJ3f3QVPc+NpOb5XC2olI8vlXBhKrxNbCZ8ZXTKcxUwuw56IkIDDUrgV1TIRSLU88YH
         1UIA==
X-Gm-Message-State: AOAM532rP6Hv06ZbluN56lN6sdexgRTHnO6p6/evhWfNw/dhAXbH0yDN
        Tujtg+TuolTA5nX3TMu4AXrL012bPwq4GqMB589VIw==
X-Google-Smtp-Source: ABdhPJwuOF7qHErGETjffMNXBYKcBSZuFsSh1OZ4GKuuO/rHKk7UPDK0vA0ExTl8e29y8wy9MLDZtc4+2boE8t+0OJo=
X-Received: by 2002:a05:620a:243:: with SMTP id q3mr14114386qkn.501.1618333647620;
 Tue, 13 Apr 2021 10:07:27 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000d662d805beac5df7@google.com>
In-Reply-To: <000000000000d662d805beac5df7@google.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Tue, 13 Apr 2021 19:07:15 +0200
Message-ID: <CACT4Y+b7sRrsyOGnnFb3T-9n9JWp2vRkA4PmP3TNFA=t0Ygf0g@mail.gmail.com>
Subject: Re: [syzbot] linux-next build error (12)
To:     syzbot <syzbot+78983c59ee6ab57e6fcb@syzkaller.appspotmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Mar 29, 2021 at 2:53 PM syzbot
<syzbot+78983c59ee6ab57e6fcb@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    9d49ed9c Add linux-next specific files for 20210329
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=159b39aad00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=b55345a2d39e7782
> dashboard link: https://syzkaller.appspot.com/bug?extid=78983c59ee6ab57e6fcb
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+78983c59ee6ab57e6fcb@syzkaller.appspotmail.com
>
> failed to run ["make" "-j" "64" "ARCH=x86_64" "bzImage"]: exit status 2

#syz fix:
bpf: tcp: Limit calling some tcp cc functions to CONFIG_DYNAMIC_FTRACE
