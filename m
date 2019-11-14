Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B6E1FD08D
	for <lists+linux-next@lfdr.de>; Thu, 14 Nov 2019 22:48:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726977AbfKNVsX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Nov 2019 16:48:23 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:39087 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726613AbfKNVsW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 14 Nov 2019 16:48:22 -0500
Received: by mail-il1-f195.google.com with SMTP id a7so6752706ild.6;
        Thu, 14 Nov 2019 13:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sexaIzCDI72jsVJxExi8lQFIs/U5W+efqtxY85Cg1hU=;
        b=fMEmD0eYIcrNcE9Iw9yXKgo2gMjc4hItMu5SC0O6dq0Q39XwkU9FyFgD2+ugtqmnGP
         T/wAMY4X02FhRK5lJAxGHr2FmQfPth66TJ54u1YVk+pLBGYeEEev//q7Cm2CSakQSHY3
         LAIhWEy2J9CAO46IdBod5HpAfpHCUuLSaUDuZ5jNzqtkcB+s7lpbenmjaKHca2AAONhk
         s+X9jdFL6ihTe9G41vSKpO6Op2XCwDYhMkbE7pB9qvS1NwXMEayV9WUWs/qgARRTPfO/
         OtGtiWobRSNiC3IuwwsEi3JhG6UbDugE/tBycOyj41E1TU0RAZB2SAjam6GHqiZdo3o+
         /ISQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sexaIzCDI72jsVJxExi8lQFIs/U5W+efqtxY85Cg1hU=;
        b=WrvEN2LazxLj7TT/3xBYQfgkbUde+I4O1uKmjhkXApMxfPoLXWdqGhf9/u1Hzh159a
         +UBNAuWjOkWSKuVA07r6pYKHbyZaEYRpEQk085xFpRPFUk7y3w3B6xnrODt8MF21ULyv
         j49lu9AhjoZP8Wy0uVFlJCIkEnzUUTFxixAO/0p8FMmy2pUjk3+c7+pYiKh3Khz0qmod
         voZni93DsGE6JdD0WIuFc1hKR8fx7zk7DSIkTr8YT6gUgrxHSuW6EMVKMyjnZPvPxBB4
         7dqY82KYbxrUEnP1ePSNwasbw8JcHxrc+5cN6XXf4+UT8ko73ZJzevQKUnOV6Rp/wRX2
         94cQ==
X-Gm-Message-State: APjAAAXCL/PXhVcX7pGiJ5+QbYratQB8KkllRF7sTzG4bDLeeP9Q4CbW
        H1YOeNisG0wrxswlA8j7RsPXcCJJ10GJguUmdomr00Gx
X-Google-Smtp-Source: APXvYqyR7VGoqn2+u27JO5/8UIa+JGjRZmHMjN6LZ+93dsdoVRCpSDsbp0nqbKFjMxh1glOSgB6CbaVvPXM+iqi3zp4=
X-Received: by 2002:a92:8b4e:: with SMTP id i75mr11891991ild.5.1573768101297;
 Thu, 14 Nov 2019 13:48:21 -0800 (PST)
MIME-Version: 1.0
References: <20191115071038.7ac29202@canb.auug.org.au>
In-Reply-To: <20191115071038.7ac29202@canb.auug.org.au>
From:   Steve French <smfrench@gmail.com>
Date:   Thu, 14 Nov 2019 15:48:10 -0600
Message-ID: <CAH2r5mtq0xX7PTSWFoi46hr+Xh6Z6NC2uuxDQp7Rn5bjki3Qeg@mail.gmail.com>
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

Fixed, repushed to cifs-2.6.git for-next

On Thu, Nov 14, 2019 at 2:10 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Commit
>
>   6eb36a327ea3 ("smb3: add debug messages for closing unmatched open")
>
> is missing a Signed-off-by from its committer.
>
> --
> Cheers,
> Stephen Rothwell



-- 
Thanks,

Steve
