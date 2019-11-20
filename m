Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70FC2103D0B
	for <lists+linux-next@lfdr.de>; Wed, 20 Nov 2019 15:14:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731245AbfKTOOu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 Nov 2019 09:14:50 -0500
Received: from mail-yb1-f180.google.com ([209.85.219.180]:46580 "EHLO
        mail-yb1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731161AbfKTOOr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 20 Nov 2019 09:14:47 -0500
Received: by mail-yb1-f180.google.com with SMTP id v15so10363258ybp.13
        for <linux-next@vger.kernel.org>; Wed, 20 Nov 2019 06:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z2UDmGEazRzqVtYbIxqCFln3SsijfpyFXVxgcc1E0qU=;
        b=D+L7D9D1RSu8VCBXuc5ZgSzBSEZQyB3qHGmvN2f/NYWFHzQjM+He4nX5410BItlAvR
         n5xCLGLS+YOHuphnpo1Mq8MCVh1JF5dRAiMlQ8C7xXSITB6vuVIdion4Y/1MuJ46n1fc
         rhKVFB48YSyNHB3Wkbh8UBeqoTzwZEZgZ8JvkAfc/LXRzmHEbk3BUxCqD9ATBuKcY+G1
         0AAtcnXHMf7YiXDuCMbKUCNhfWFjsebL+L4eGzzhe1kF6/Pcs47h8BBxJDhSsuK1zpXX
         Cxx47Op/tVUo7eMYJ6Ddu9Frws5T+yoKlbmxB5LjPKjTuWbzMtv42nQFNTYWyvHLa4pw
         zVAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z2UDmGEazRzqVtYbIxqCFln3SsijfpyFXVxgcc1E0qU=;
        b=At+JE294twZMq93VIF3G7Oh3E+L8XKo22rpKwafqHVvr8NhTKKfmZh+bxXRI8JJp5v
         731B5uja3SAcZ7t8I9ddXIw1GUOGZBoP4TW5xRNA99cAZntrdYWygEMAiAj/YEnofYRe
         +XrVMS2WOmuUHEBrYi7JP/lbogCL+hOxot97xh1J871FOUXcV32IDFOMEqrWFqWY8syR
         bH+bmM1uAYlzyxTy++27+2V+aRFmNCsoD0DeuqscvNztOQ7RdEsxov+qh9Z08kvDAm4J
         qSVgIkL7NYi0mctAJizCrkzr69DfakcFpHujy4YTfoK9g2iswUb84Rm6P8lJG2sI5KC/
         oqYQ==
X-Gm-Message-State: APjAAAWiS5VTz3T5aEiKsiJ41JoZPGsIyGq51JNUZNvPx659yI3GX56l
        HLfhwoEXkUb7lbMItza7EYKaBSy/
X-Google-Smtp-Source: APXvYqzfeTkpQ77rfJhhYnWZ42wZaPeDzl5yBUJ/WH6esj7XjBYixhkrqcPpb1bx0WhmqUH/R5nD7Q==
X-Received: by 2002:a25:c945:: with SMTP id z66mr1983102ybf.393.1574259284716;
        Wed, 20 Nov 2019 06:14:44 -0800 (PST)
Received: from mail-yw1-f52.google.com (mail-yw1-f52.google.com. [209.85.161.52])
        by smtp.gmail.com with ESMTPSA id g6sm10966573ywk.14.2019.11.20.06.14.42
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2019 06:14:43 -0800 (PST)
Received: by mail-yw1-f52.google.com with SMTP id j190so8672738ywf.8
        for <linux-next@vger.kernel.org>; Wed, 20 Nov 2019 06:14:42 -0800 (PST)
X-Received: by 2002:a81:53d5:: with SMTP id h204mr1633399ywb.411.1574259281698;
 Wed, 20 Nov 2019 06:14:41 -0800 (PST)
MIME-Version: 1.0
References: <20191120205009.188c2394@canb.auug.org.au>
In-Reply-To: <20191120205009.188c2394@canb.auug.org.au>
From:   Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date:   Wed, 20 Nov 2019 09:14:04 -0500
X-Gmail-Original-Message-ID: <CA+FuTScVjG_jWH-O-57Q+gTcx0v+Qm5TR4WxsWrQUTEajS_wkQ@mail.gmail.com>
Message-ID: <CA+FuTScVjG_jWH-O-57Q+gTcx0v+Qm5TR4WxsWrQUTEajS_wkQ@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the net tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     David Miller <davem@davemloft.net>,
        Networking <netdev@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Nov 20, 2019 at 4:50 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> n commit
>
>   d4ffb02dee2f ("net/tls: enable sk_msg redirect to tls socket egress")
>
> Fixes tag
>
>   Fixes: f3de19af0f5b ("Revert \"net/tls: remove unused function tls_sw_sendpage_locked\"")
>
> has these problem(s):
>
>   - Subject does not match target commit subject
>     Just use
>         git log -1 --format='Fixes: %h ("%s")'
>
> Did you mean:
>
> Fixes: f3de19af0f5b ("net/tls: remove unused function tls_sw_sendpage_locked")

Indeed. I messed up the subject line, sorry. That is what it should
have looked line.
