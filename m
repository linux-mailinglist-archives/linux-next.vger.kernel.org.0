Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 531F8119F46
	for <lists+linux-next@lfdr.de>; Wed, 11 Dec 2019 00:21:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbfLJXVD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Dec 2019 18:21:03 -0500
Received: from mail-io1-f44.google.com ([209.85.166.44]:46947 "EHLO
        mail-io1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725999AbfLJXVC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Dec 2019 18:21:02 -0500
Received: by mail-io1-f44.google.com with SMTP id t26so9255386ioi.13;
        Tue, 10 Dec 2019 15:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=foqkgB/JB6+t9GtkeI0/v69A3WTYRuMmhheGXZPoVyU=;
        b=tQhie18DXLsqr3QaYFZA6shYyGcJ+iRyabhedxNyvH6IjbObZUxUQjzhi2jyk9mYb+
         EL7ajBglWroU3sH0mh6mJittsTSrmOKQqZh7v9h5SWWdgWl8VUy3CIskfnpAgZuswAus
         vLXEB4rvGNKXujmxKUHD4KeCCcZd3n8KlZi4xu4/vcHLIsnEV4e3wu3C1/YZlCLR5U0Q
         +Wc9hGrCgO7KOzUpcy1DlenGfzGC1IJzbgt+vd0w7WT6Y5a10muqF2EogoumfRPzeVEs
         B4qD/LGOw0nIKXKAIcoIF1m87qhvDH8eW5+RWNwob1EaThMCHw/uQcfhOszg+8KXbWyb
         bxTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=foqkgB/JB6+t9GtkeI0/v69A3WTYRuMmhheGXZPoVyU=;
        b=nHWbozfmAYippHIGhKyUS9FM3/lqG6zHUAR5l8fQaKuF2tJRN2wTDLU0ssFD2OO3HA
         /WyK9Aj4WcfB3bxZj5MIU3XJm69+FfJ+vufzOREbnr4PVAmaKNI6V5+0zXwYV6ckiXyB
         GHBHHiSapP6ssLznMvXukU52fSJGTTOnjO1icU4qemrS6IMq4M9h/N/9IwVIEREHrKKW
         JxPj6G+SODxLDkO8fdIheEETiE5r4C3d9AJmJ1rGhI/EiXyJJW/UyLhKsonC8Z30B0AU
         8IloFG5CmYNS4QJ+L4IOw1ckATD5LbKSoDpP9vMAjycSuphmLc+So3CCQ38RYt6J0NIj
         54YA==
X-Gm-Message-State: APjAAAVXpEIFQDGY+01Tcpyo6TReBp+lTNjFMvGTR7sBdl6ZIRrqNY72
        tNcOz67Vjt3FX3YCAlLLH+oJ/VOqMp3whEep8ek=
X-Google-Smtp-Source: APXvYqzYVyLjo70klJZxUmJnME71xKiN5+hJQHOQGSR2h3s+/POcE8veBRuwcVPYyp+N0Wog9Ozwzu4Z6ANoKYeVwYY=
X-Received: by 2002:a05:6602:2346:: with SMTP id r6mr508394iot.133.1576020061746;
 Tue, 10 Dec 2019 15:21:01 -0800 (PST)
MIME-Version: 1.0
References: <20191211101004.35db8a07@canb.auug.org.au>
In-Reply-To: <20191211101004.35db8a07@canb.auug.org.au>
From:   =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Date:   Wed, 11 Dec 2019 00:20:49 +0100
Message-ID: <CAHpGcMKKwtxcaHRuhVWzRNLK=Cpw1sBd9zOKP-zTbgOstM7tzg@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the gfs2 tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Steven Whitehouse <swhiteho@redhat.com>,
        Bob Peterson <rpeterso@redhat.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andreas Gruenbacher <agruenba@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

Am Mi., 11. Dez. 2019 um 00:10 Uhr schrieb Stephen Rothwell
<sfr@canb.auug.org.au>:
> Hi all,
>
> After merging the gfs2 tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>
> fs/gfs2/lops.c: In function 'gfs2_find_jhead':
> fs/gfs2/lops.c:536:13: warning: 'bio_chained' may be used uninitialized in this function [-Wmaybe-uninitialized]
>   536 |    if (!bio || (bio_chained && !off)) {
>       |        ~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
>
> Introduced by commit
>
>   1ee366c67176 ("gfs2: Another gfs2_find_jhead fix")

thanks. It's actually a false positive and I'm not getting this
warning, but I'll make the code more explicit.

Andreas
