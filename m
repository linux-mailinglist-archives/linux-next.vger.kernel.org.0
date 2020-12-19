Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D21782DEDAA
	for <lists+linux-next@lfdr.de>; Sat, 19 Dec 2020 08:16:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726334AbgLSHQL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 19 Dec 2020 02:16:11 -0500
Received: from a.mx.secunet.com ([62.96.220.36]:59206 "EHLO a.mx.secunet.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726326AbgLSHQK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 19 Dec 2020 02:16:10 -0500
Received: from localhost (localhost [127.0.0.1])
        by a.mx.secunet.com (Postfix) with ESMTP id 6592E20561;
        Sat, 19 Dec 2020 08:15:28 +0100 (CET)
X-Virus-Scanned: by secunet
Received: from a.mx.secunet.com ([127.0.0.1])
        by localhost (a.mx.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 1cbD2ze1FyFm; Sat, 19 Dec 2020 08:15:28 +0100 (CET)
Received: from mail-essen-01.secunet.de (unknown [10.53.40.204])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by a.mx.secunet.com (Postfix) with ESMTPS id 076272027C;
        Sat, 19 Dec 2020 08:15:28 +0100 (CET)
Received: from mbx-dresden-01.secunet.de (10.53.40.199) by
 mail-essen-01.secunet.de (10.53.40.204) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Sat, 19 Dec 2020 08:15:27 +0100
Received: from gauss2.secunet.de (10.182.7.193) by mbx-dresden-01.secunet.de
 (10.53.40.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Sat, 19 Dec
 2020 08:15:26 +0100
Received: by gauss2.secunet.de (Postfix, from userid 1000)      id 4E44F3182CE2;
 Sat, 19 Dec 2020 08:15:26 +0100 (CET)
Date:   Sat, 19 Dec 2020 08:15:26 +0100
From:   Steffen Klassert <steffen.klassert@secunet.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Linux Next Mailing List" <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the ipsec tree
Message-ID: <20201219071526.GD3576117@gauss3.secunet.de>
References: <20201219142609.091b5eb1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201219142609.091b5eb1@canb.auug.org.au>
X-ClientProxiedBy: cas-essen-01.secunet.de (10.53.40.201) To
 mbx-dresden-01.secunet.de (10.53.40.199)
X-EXCLAIMER-MD-CONFIG: 2c86f778-e09b-4440-8b15-867914633a10
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sat, Dec 19, 2020 at 02:26:09PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   06148d3b3f2e ("xfrm: Fix oops in xfrm_replay_advance_bmp")
> 
> is missing a Signed-off-by from its committer.

My bad. I did a forced push to fix it.
