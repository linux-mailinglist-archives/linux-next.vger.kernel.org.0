Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B8D4139A37
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2020 20:33:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728665AbgAMTdr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Jan 2020 14:33:47 -0500
Received: from frisell.zx2c4.com ([192.95.5.64]:49483 "EHLO frisell.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726435AbgAMTdr (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 13 Jan 2020 14:33:47 -0500
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1638cae6;
        Mon, 13 Jan 2020 18:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
        :references:in-reply-to:from:date:message-id:subject:to:cc
        :content-type; s=mail; bh=VDVRjB5LV7chvfgHMXdzGYgBG20=; b=XyvRzE
        iOjCWMHLX4M5FeCQt7cMh0EGsbtVbFHgXSewNUDEIIQ8Cp7ej2z9nxBVnPOKpoTB
        1TZCan7165i/pPMZcMFK4hcbRTjc3k47RE1kaORb9Fhz5oz2qE9u7rE/QejeHYSN
        d86rlQfYWrRY5FarYwcUZ7XayxFlEpwB2s6Qzluet2Z8Jz2dJAGWpHzYwRsDOLZ+
        H8qjWU5wNu9n6LNwhNUTzoEmR24BxHivHLzOAHcbQoh2Kd+XrmrpXYkJCixR1T1A
        tAwKgbCBvHaz22vE/4pzZFKN90YqC4cnCG3xWa2Dv9SaMhz4LQBO8sZuAL5teQdI
        EIG5z4/qtcriK5Dw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 55bdc462 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO);
        Mon, 13 Jan 2020 18:33:47 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id n16so9403067oie.12;
        Mon, 13 Jan 2020 11:33:44 -0800 (PST)
X-Gm-Message-State: APjAAAUyvmSFJ8Khn2K6xsYAl2B1cOwNEIFNCvogXjOIoWsPWJDI9HRp
        nB/MtmEkP9pUlPUl9gCVNhnJQZ9mA5+MGYDnUKk=
X-Google-Smtp-Source: APXvYqwN0eerIq6INODqrWIFiY958962HnwSzW8nLNr9hqfFjHENRWHx9WJKDNaPK9girDBLmvnFO8nLA+H8ZHuyhcY=
X-Received: by 2002:a05:6808:a8a:: with SMTP id q10mr13158649oij.66.1578944023263;
 Mon, 13 Jan 2020 11:33:43 -0800 (PST)
MIME-Version: 1.0
References: <20200113181457.209ab4a5@canb.auug.org.au> <14674349-1864-2d10-1f09-55b1fb834475@zx2c4.com>
 <20200113192315.GS8904@ZenIV.linux.org.uk>
In-Reply-To: <20200113192315.GS8904@ZenIV.linux.org.uk>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Mon, 13 Jan 2020 14:33:31 -0500
X-Gmail-Original-Message-ID: <CAHmME9rBb5Otr-96W38kNjXkfok9NwFJ6V263qoPTJHqNEsgoA@mail.gmail.com>
Message-ID: <CAHmME9rBb5Otr-96W38kNjXkfok9NwFJ6V263qoPTJHqNEsgoA@mail.gmail.com>
Subject: Re: BUG_ON hit in "reimplement path_mountpoint() with less magic"
 [Was: Re: linux-next: Tree for Jan 13]
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hey Al,

On Mon, Jan 13, 2020 at 2:23 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Mon, Jan 13, 2020 at 01:27:34PM -0500, Jason A. Donenfeld wrote:
> > Hi Al,
> >
> > Your "reimplement path_mountpoint() with less magic" commit is causing
> > oopses on the linux-next tests running on https://build.wireguard.com/ .
> > Here's one such crash with debug symbols:
>
> Check if that persists with the version currently in #fixes (commit
> 7a955b7363b8).  It ought to be fixed there; quick check is to look
> at fs/namei.c:path_mountpoint() in your tree - it should read
>         if (!err && (nd->flags & LOOKUP_RCU))
>                 err = unlazy_walk(nd);
> not
>         if (!err)
>                 err = unlazy_walk(nd);
> as in the broken variant.

That does the trick. Glad that's sorted. Thanks.

Jason
