Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1582382B70
	for <lists+linux-next@lfdr.de>; Mon, 17 May 2021 13:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229889AbhEQLsB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 17 May 2021 07:48:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbhEQLsB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 17 May 2021 07:48:01 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E819FC06174A
        for <linux-next@vger.kernel.org>; Mon, 17 May 2021 04:46:44 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id 1so4612083qtb.0
        for <linux-next@vger.kernel.org>; Mon, 17 May 2021 04:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=26/l/0FD/kSwSVPmMbR0uwDbJE0XXhCY8B8R+7GK6CI=;
        b=F1iSrtT56EOerjVGbasVPonOqjKUe7agF3pq3YJWH57WMfTbvW6ZRDHNpguGP/NOVw
         5DY+3IXUi/r9VjQZabkjYAf1EG5aAW9/Kg+127flBY4JbGSn/H3QksFP4bsB3rh8fTC5
         eDLGJ8YGFcLPTxvtSq6y6AzTyASfSo3tbGEIiRmaugQzWQxaRjjjZG4plmYCd+F0/flE
         Tsl5AAR5kzLuxSnx2dOpnQyTlRItIAn2VACNn1MNLu5y1kOGa4VXt22m+5+TOLKKfmfy
         B0xR6UN11bdYFScLr+sv0wSd9srMsaNcoQGiVHHDBfokDbPegJM5zr2QWiCNDYsdxA5/
         xHOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=26/l/0FD/kSwSVPmMbR0uwDbJE0XXhCY8B8R+7GK6CI=;
        b=TMjvwHmuRFkIMJNRWNDXCnP6dbHdvpjehZ/XkRtJqy4x406lu9bVaAqpgmj5ZNEXNv
         TfMCVxTmShpxOQ7dJpGqHySgP3D1f9+m/rLp6Y6QDu/BEgtTwkEPcfz7g39fq4JPqf/d
         MHwRhbdFXrbvtN59vHypU9Aw4S0G2JfWLqS4VAzX9nCH0LHx1SU3v4zKXIl+RkJfh2Vy
         LzJrOecJWVzGu8hcUUATkd5BNcBbe72lPg3olLwaKQ3/Xz1jPEUFd7Z5AZKlD2EYtYfS
         4+1oB5arBjKpnjMWV38cNKTxhXP1xcguahyuPeRWKU8FEbqI812QGSK0pFPnfbpzWJPp
         ADKg==
X-Gm-Message-State: AOAM531Nqp5mi9c5cxsA3oOk8ZwOc04kHyIrj54l2XMluDUgdOs8z1Mo
        2Pm1HJNwjEjNPwDDKWMbkpLm0nrkgTbyb3kHg1TpzQ==
X-Google-Smtp-Source: ABdhPJyMdr0SvuuHJEMQZrfjYKhvP/mPQNwfZQKF7QbW0Ha2974eWJZM+ZDovb7iyxnBzNzD8BFYQFDlI/dSY9sTxDY=
X-Received: by 2002:ac8:5b8a:: with SMTP id a10mr15311324qta.43.1621252003962;
 Mon, 17 May 2021 04:46:43 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000712bf205c28512b3@google.com>
In-Reply-To: <000000000000712bf205c28512b3@google.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Mon, 17 May 2021 13:46:32 +0200
Message-ID: <CACT4Y+ZGWOXBd7O9i4nxgkZMPD74MKnpsws8QsqKsjGwxv_9DA@mail.gmail.com>
Subject: Re: [syzbot] linux-next boot error: can't ssh into the instance (4)
To:     syzbot <syzbot+9bc9321e24cb69b1d70b@syzkaller.appspotmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, May 17, 2021 at 1:41 PM syzbot
<syzbot+9bc9321e24cb69b1d70b@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    18250b53 Add linux-next specific files for 20210416
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=15f554c5d00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=1a0849068413e97e
> dashboard link: https://syzkaller.appspot.com/bug?extid=9bc9321e24cb69b1d70b
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+9bc9321e24cb69b1d70b@syzkaller.appspotmail.com

There was some issue with ttyS0 console:

[  109.503836][    T1] systemd[1]: Timed out waiting for device
dev-ttyS0.device.
 [K[ [0;1;31m TIME  [0m] Timed out waiting for device dev-ttyS0.device.
[  109.547660][    T1] systemd[1]: Dependency failed for Serial Getty on ttyS0.
[ [0;1;33mDEPEND [0m] Dependency failed for Serial Getty on ttyS0.

but it seems to be resolved by now:

#syz invalid
