Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40413F7ABE
	for <lists+linux-next@lfdr.de>; Mon, 11 Nov 2019 19:27:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726960AbfKKS1N (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Nov 2019 13:27:13 -0500
Received: from mail-lj1-f169.google.com ([209.85.208.169]:46581 "EHLO
        mail-lj1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726927AbfKKS1N (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 11 Nov 2019 13:27:13 -0500
Received: by mail-lj1-f169.google.com with SMTP id e9so14843788ljp.13
        for <linux-next@vger.kernel.org>; Mon, 11 Nov 2019 10:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MThzuPE5GHK9HkxVsoX5XDICTVaynruuXSaosaKjcs8=;
        b=Fw0twQqHYcZerf7R7Z3mbmARQOIFlH3pXVj4Yjat2DM7woJjV+SUtLUFxaEmeBl+U5
         szMKEvHO9eLWrC8gGlF9I60PdiM4n2eVfToqoV5409n1CtsBTL3vU6t0ClyXdYIp4Xvt
         nWXLT0OSdbsl0Wx6bZ6d8xeGYVa8JX7gNAf+7micSQJLTdtOlEcyFzX48Yb1d5PPyBxL
         DefhaGvaBR5etVxoKduL7AjUCl4udWuhNJWtuhe24rPNevBh9yKJxiS6oY/UpubbNHmA
         SamzTvPY1gSEo+YFXpeKBxJxPZAYb3un85/OrkIjyB8A71lPT+Iigg7yWZpwMiCJ6xq1
         VNXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MThzuPE5GHK9HkxVsoX5XDICTVaynruuXSaosaKjcs8=;
        b=YMhRwhNXUYQBvzTOYPXsQdBt35v6cRx1gD/hHAyJynNZTNTch+NALzTfwAeOX7pGQI
         I0xN4+ZNHe5vBa9FC3IsciiW67EZAK/jaMM5C34RNrTDGZBk4WzjZ9/CCoA6YyVEUa7B
         SnRocNY2Jj/iKKhMtjdjO22Fo5v1xGFLRGHRlgJBybMEdYhMONXE4mBSxtTw+NptVcfj
         0ni4Vzis7PGaXaZKLVX+fvX+OSikktdxoGWi9x6pxS349mqCp4XLlB3PVADtQwwCxU5E
         blGRrQTyBCGWQ71Pnv5NGMBGTuPeOq+dXyOfKVb/SUz9QwabR1P3pTz7NzyoPwKY5RL+
         N+WA==
X-Gm-Message-State: APjAAAVAD7bxcKoP4wYH4vV28J27AoZkJVDci+jIu9w7/z8WRb4WEP1Y
        9m2/o3njI+YJlw2hD6jrPWwl9Fj3uj1cP7Hil58bZQ==
X-Google-Smtp-Source: APXvYqyWMSR5OPToEop6rDei4ILQee/UuxXH+ZjV7ZXKAeitGVZS2Lw9zm51FtgZf6Xt1NfAsveDiRmS7Mfl3wUydIw=
X-Received: by 2002:a2e:a410:: with SMTP id p16mr17228931ljn.46.1573496829912;
 Mon, 11 Nov 2019 10:27:09 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYtmA5F174nTAtyshr03wkSqMS7+7NTDuJMd_DhJF6a4pw@mail.gmail.com>
 <852514139.11036267.1573172443439.JavaMail.zimbra@redhat.com>
 <20191111012614.GC6235@magnolia> <1751469294.11431533.1573460380206.JavaMail.zimbra@redhat.com>
 <20191111083815.GA29540@infradead.org> <1757087132.11450258.1573468734360.JavaMail.zimbra@redhat.com>
In-Reply-To: <1757087132.11450258.1573468734360.JavaMail.zimbra@redhat.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Mon, 11 Nov 2019 23:56:58 +0530
Message-ID: <CA+G9fYtuwT_vkQL-RfAMcmH_HBHUWQ5ZPHdwsGoNTALhwyiZgg@mail.gmail.com>
Subject: Re: LTP: diotest4.c:476: read to read-only space. returns 0: Success
To:     Jan Stancek <jstancek@redhat.com>
Cc:     Christoph Hellwig <hch@infradead.org>,
        "Darrick J. Wong" <darrick.wong@oracle.com>,
        LTP List <ltp@lists.linux.it>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-fsdevel@vger.kernel.org, chrubis <chrubis@suse.cz>,
        open list <linux-kernel@vger.kernel.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        lkft-triage@lists.linaro.org,
        linux-ext4 <linux-ext4@vger.kernel.org>,
        "Theodore Ts'o" <tytso@mit.edu>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 11 Nov 2019 at 16:09, Jan Stancek <jstancek@redhat.com> wrote:
>
>
> ----- Original Message -----
> > Is this a new test?
>
> No, it's not new.
>
> > If not why was this never reported?  Sounds like
> > we should add this test case to xfstests.
>
> I'm guessing not that many users still run 32bit kernels.
> Naresh' setup is using ext4, so I assume he noticed only
> after recent changes in linux-next wrt. directio and ext4.

That's true.
Started noticing recently from Linux next-20191107 kernel on i386 and arm32.

Steps to reproduce:
./runltp -f dio -d /mounted-ext4-drive

- Naresh
