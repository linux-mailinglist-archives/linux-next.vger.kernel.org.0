Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7A5B43BCAB
	for <lists+linux-next@lfdr.de>; Tue, 26 Oct 2021 23:50:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237419AbhJZVwu convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Tue, 26 Oct 2021 17:52:50 -0400
Received: from lithops.sigma-star.at ([195.201.40.130]:60218 "EHLO
        lithops.sigma-star.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237347AbhJZVwu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Oct 2021 17:52:50 -0400
X-Greylist: delayed 465 seconds by postgrey-1.27 at vger.kernel.org; Tue, 26 Oct 2021 17:52:50 EDT
Received: from localhost (localhost [127.0.0.1])
        by lithops.sigma-star.at (Postfix) with ESMTP id 8E09F60A59CC;
        Tue, 26 Oct 2021 23:42:39 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
        by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id yPay7fhyuR19; Tue, 26 Oct 2021 23:42:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by lithops.sigma-star.at (Postfix) with ESMTP id 5FA4560A59EB;
        Tue, 26 Oct 2021 23:42:38 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
        by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id QzmD8z1Rlq0E; Tue, 26 Oct 2021 23:42:38 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
        by lithops.sigma-star.at (Postfix) with ESMTP id 3E75D60A59CC;
        Tue, 26 Oct 2021 23:42:38 +0200 (CEST)
Date:   Tue, 26 Oct 2021 23:42:38 +0200 (CEST)
From:   Richard Weinberger <richard@nod.at>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Petr Cvachoucek <cvachoucek@gmail.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Message-ID: <1956798646.39039.1635284558179.JavaMail.zimbra@nod.at>
In-Reply-To: <20211027080727.7e9df9be@canb.auug.org.au>
References: <20211027080727.7e9df9be@canb.auug.org.au>
Subject: Re: linux-next: Signed-off-by missing for commit in the ubifs tree
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF93 (Linux)/8.8.12_GA_3809)
Thread-Topic: linux-next: Signed-off-by missing for commit in the ubifs tree
Thread-Index: XCC3FGo2I1wf6+aW9Rx+6en2c/S6lw==
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen,

----- Ursprüngliche Mail -----
> Von: "Stephen Rothwell" <sfr@canb.auug.org.au>
> An: "richard" <richard@nod.at>
> CC: "Petr Cvachoucek" <cvachoucek@gmail.com>, "linux-kernel" <linux-kernel@vger.kernel.org>, "Linux Next Mailing List"
> <linux-next@vger.kernel.org>
> Gesendet: Dienstag, 26. Oktober 2021 23:07:27
> Betreff: linux-next: Signed-off-by missing for commit in the ubifs tree

> Hi all,
> 
> Commit
> 
>  e7259f574fca ("ubifs: Error path in ubifs_remount_rw() seems to wrongly free
>  write buffers")
> 
> is missing a Signed-off-by from its author.

Thanks for letting me know.

Petr, if you don't mind I'll add the following line:
Signed-off-by: Petr Cvachoucek <cvachoucek@gmail.com>

Thanks,
//richard
