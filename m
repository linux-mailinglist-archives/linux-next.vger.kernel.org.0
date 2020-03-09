Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3F3317EC6E
	for <lists+linux-next@lfdr.de>; Tue, 10 Mar 2020 00:08:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727391AbgCIXIO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Mar 2020 19:08:14 -0400
Received: from mail-yw1-f65.google.com ([209.85.161.65]:43246 "EHLO
        mail-yw1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726536AbgCIXIO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 9 Mar 2020 19:08:14 -0400
Received: by mail-yw1-f65.google.com with SMTP id p69so11889394ywh.10;
        Mon, 09 Mar 2020 16:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YBrgj95YDWeT6B7iosvroZAr99Kor3UDGVq8CoZfnPk=;
        b=ErJy79KbuvPzPWmVfQGUBPh4YGQxBGv+HXj2NN6SlbrXkPaNqqGLloBZxX6bcp5bF4
         8RRbr3YGFC+WRncP9c0C9CDhuAMxJr+bZY9cjAc6IWTTWMhvR9VVWmrDW4dtV07TWr0A
         YZsN8n+gtCVhem8fQXcE1uX6ks2EuF0d4WX2EkzB4l5iloMj7t4g1uBfxTkPFFf52NZb
         LNsddCPb1F4XMpM9+obTNHSF1GK8INf+D/uwdQZJTReVcLiHpmkPaPEanilm6bkZHiSO
         +Nt8NaX0pGFPEAzkYU8KV62VN+rcupaTFPgZM1cJiiMT1IKyKjy7eiZLO87b22TJNovi
         RZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YBrgj95YDWeT6B7iosvroZAr99Kor3UDGVq8CoZfnPk=;
        b=tIbseVC2JDiZtPsPyUD/xLxqAZJXDAc5pyed5oXOTD67ZKllQl4vaQ5jpo/ZEEV2KT
         gFUiThL+bhdxDcLALVyEPpEsw8TZAvXTMzwqgSiYrWs/cmb4M7f6asx/BjxiLlaCJ57X
         FOZWz38OTZ1D4sx1x786Lf+OGqqbrHNHJVy9ggVR4ImbZ1FGBZicRxnkcHUK8Wwe6SlJ
         tDyw+d3M7f4I+iPWQDZG/L7o34s7OQHe68J5TkqBtUaD40TzB8Izt/WSondzEctj7CkA
         XXYbQFTvb160jAcKjl4ApTXaaywSiJ0B3Zc8dX1NvcuGlNcbJEOnPZIDFa+EeFVQ6YjI
         rEWA==
X-Gm-Message-State: ANhLgQ0qijlj35a+Z625p98MePttChvXJ0Dv8kwU1dGd7RmYTkL3vS/x
        WCWfMeCa0iGAeApBp84Cgus7ypnFZOOB9Y6S0FGbS3GP
X-Google-Smtp-Source: ADFU+vsjOKr6BzWi6LrzbOSSXDkC0x4ZWL/FbgfxVnW15EhwjJKLEZxvrIO+r5LlDMRETQJl0Ryj/5vl8XVT1tT2/6w=
X-Received: by 2002:a25:86c9:: with SMTP id y9mr21568200ybm.376.1583795293391;
 Mon, 09 Mar 2020 16:08:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200310092805.7c37c3c1@canb.auug.org.au>
In-Reply-To: <20200310092805.7c37c3c1@canb.auug.org.au>
From:   Steve French <smfrench@gmail.com>
Date:   Mon, 9 Mar 2020 18:07:25 -0500
Message-ID: <CAH2r5ms6qT7gd7HbZQ3UDYyY8VX+Oqu2xbYw4wixNTDDAtbg5Q@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the cifs tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     CIFS <linux-cifs@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

fixed

On Mon, Mar 9, 2020 at 5:28 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Commit
>
>   91737cf1a418 ("cifs: smb2pdu.h: Replace zero-length array with flexible-array member")
>
> is missing a Signed-off-by from its committer.
>
> --
> Cheers,
> Stephen Rothwell



-- 
Thanks,

Steve
