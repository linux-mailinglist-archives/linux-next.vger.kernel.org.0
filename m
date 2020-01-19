Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0563A141FC2
	for <lists+linux-next@lfdr.de>; Sun, 19 Jan 2020 20:18:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727138AbgASTSU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 19 Jan 2020 14:18:20 -0500
Received: from mail-wm1-f47.google.com ([209.85.128.47]:37114 "EHLO
        mail-wm1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727123AbgASTST (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 19 Jan 2020 14:18:19 -0500
Received: by mail-wm1-f47.google.com with SMTP id f129so12564440wmf.2;
        Sun, 19 Jan 2020 11:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NkyTFtjBm6OewHAUdwSq2dim7yPdFtVdtKDABMiuDQ0=;
        b=LkYbzRQEd9TaSBuh+/cxODHWR1QdIkItUSQUG8UQ4Tl3Qf3wimImCs0wTbocmn1u0D
         nRNgQLQumFUlj0FZ6jH1xo9poyChvjN2CPd/CRh5DHRUcohGdrbGscxESX7TkGIbWvTv
         61if16ypE/jTtxdnheffYYDgi5MvJ1jHkJ2HorvRnf9IE6NAZ8iM8/lffq9G0qcRQO4b
         c1/ie1hOY5G428jZP180LKJ+7nJQ9ZGAFzYDBn2xIV43u2CJmUpfDXhX46y1rBhbxCeD
         Ya/S5nIx4MA08/STV7Cv2fytHHPn3TCITidGk5nfvzXBh1HWgaaebCvnq9/8jAJoW88H
         dJvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NkyTFtjBm6OewHAUdwSq2dim7yPdFtVdtKDABMiuDQ0=;
        b=YpSdY/rtp0fw0twPuVXfHCJqcIxjsUSMpM3wJagR65444hMWG9XX5RnW5EIi09nKAJ
         L6kzu5E18yDZ6o2dGxdj+MN+w1FYUHfD5MLvvq5U3ma94Dy7wkmH5ZipZAMMb6sMZGUg
         KG5lluCugcdhRFiK7WyoLkONvYoH5+omTFPktbb7z0mbua06Zmcn5tjTJo8flAm9dzNY
         jtW7QI5j/ZKtPQb3uzHqvqceMUpOEqC2CeSuJ4mAA7IUE+UgNCRY/laBe4He38Se/xnC
         80+DV+puKuwwPnAKDw0/i0ABGj3wDthrIpHZGL1XW1K4Z5vGiMO3aUjOw19/jL4Cztg3
         bk2w==
X-Gm-Message-State: APjAAAXShydlbJWhIBRz0CKDyQKLw5N5mL0jSX+kQT94GIhjZbYOodJo
        dXapkvmY+bV1Ox3mOSioB5aVoPq8RreUrSHKI7I=
X-Google-Smtp-Source: APXvYqyjDHqpbBEiNBtQpByeJohY1rb4uHJPPdc5rU/KCXosEiH8bVqqD5koR+2VaO0Q/kpaIed6bHLDicRAukG/rig=
X-Received: by 2002:a1c:6404:: with SMTP id y4mr14594924wmb.143.1579461497684;
 Sun, 19 Jan 2020 11:18:17 -0800 (PST)
MIME-Version: 1.0
References: <20200117180907.2e5cfb88@canb.auug.org.au>
In-Reply-To: <20200117180907.2e5cfb88@canb.auug.org.au>
From:   Richard Weinberger <richard.weinberger@gmail.com>
Date:   Sun, 19 Jan 2020 20:18:06 +0100
Message-ID: <CAFLxGvxTiTtraVJPXXofwLmsCAYK44CCjNjtKWBg_-gSawYxNg@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the ubifs tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Artem Bityutskiy <dedekind1@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Zhihao Cheng <chengzhihao1@huawei.com>,
        Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jan 17, 2020 at 8:09 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> In commit
>
>   f5de5b83303e ("ubifs: Fix deadlock in concurrent bulk-read and writepage")
>
> Fixes tag
>
>   Fixes: 4793e7c5e1c ("UBIFS: add bulk-read facility")
>
> has these problem(s):
>
>   - SHA1 should be at least 12 digits long
>     Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
>     or later) just making sure it is not set (or set to "auto").

Fixed. Thanks for reporting!

-- 
Thanks,
//richard
