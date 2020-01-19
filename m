Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33BD9142066
	for <lists+linux-next@lfdr.de>; Sun, 19 Jan 2020 23:18:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728733AbgASWSA convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Sun, 19 Jan 2020 17:18:00 -0500
Received: from lithops.sigma-star.at ([195.201.40.130]:50886 "EHLO
        lithops.sigma-star.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728655AbgASWSA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 19 Jan 2020 17:18:00 -0500
Received: from localhost (localhost [127.0.0.1])
        by lithops.sigma-star.at (Postfix) with ESMTP id 041196126B6B;
        Sun, 19 Jan 2020 23:17:57 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
        by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id dHHVnbZu2TlN; Sun, 19 Jan 2020 23:17:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by lithops.sigma-star.at (Postfix) with ESMTP id 2F7676126B6D;
        Sun, 19 Jan 2020 23:17:57 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
        by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id xEFcN25sBoTC; Sun, 19 Jan 2020 23:17:57 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
        by lithops.sigma-star.at (Postfix) with ESMTP id 012CD6126B6B;
        Sun, 19 Jan 2020 23:17:56 +0100 (CET)
Date:   Sun, 19 Jan 2020 23:17:56 +0100 (CET)
From:   Richard Weinberger <richard@nod.at>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Artem Bityutskiy <dedekind1@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Quanyang Wang <quanyang.wang@windriver.com>
Message-ID: <1034266714.24281.1579472276843.JavaMail.zimbra@nod.at>
In-Reply-To: <20200120091239.045c7c65@canb.auug.org.au>
References: <20200120091239.045c7c65@canb.auug.org.au>
Subject: Re: linux-next: Fixes tag needs some work in the ubifs tree
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF68 (Linux)/8.8.12_GA_3809)
Thread-Topic: linux-next: Fixes tag needs some work in the ubifs tree
Thread-Index: 84Oxln8FkE4i7v7dLDH+QS6dCIbfCw==
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

----- Ursprüngliche Mail -----
> Von: "Stephen Rothwell" <sfr@canb.auug.org.au>
> An: "Artem Bityutskiy" <dedekind1@gmail.com>
> CC: "Linux Next Mailing List" <linux-next@vger.kernel.org>, "linux-kernel" <linux-kernel@vger.kernel.org>, "Quanyang
> Wang" <quanyang.wang@windriver.com>, "richard" <richard@nod.at>
> Gesendet: Sonntag, 19. Januar 2020 23:12:39
> Betreff: linux-next: Fixes tag needs some work in the ubifs tree

> Hi all,
> 
> In commit
> 
>  31f36312d2ca ("ubifs: fix memory leak from c->sup_node")
> 
> Fixes tag
> 
>  Fixes: 4793e7c5e1c8 ("ubifs: Store read superblock node")
> 
> has these problem(s):
> 
>  - Subject does not match target commit subject
>    Just use
>	git log -1 --format='Fixes: %h ("%s")'
> 
> Did you meean
> 
> Fixes: 4793e7c5e1c8 ("UBIFS: add bulk-read facility")
> 
> or
> 
> Fixes: fd6150051bec ("ubifs: Store read superblock node")

That should be fd6150051bec ("ubifs: Store read superblock node").

/me fixes. No idea how that happened.

Thanks,
//richard
