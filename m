Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 507F1419310
	for <lists+linux-next@lfdr.de>; Mon, 27 Sep 2021 13:25:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233959AbhI0L1f (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Sep 2021 07:27:35 -0400
Received: from a.mx.secunet.com ([62.96.220.36]:37944 "EHLO a.mx.secunet.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233948AbhI0L1f (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 27 Sep 2021 07:27:35 -0400
X-Greylist: delayed 441 seconds by postgrey-1.27 at vger.kernel.org; Mon, 27 Sep 2021 07:27:34 EDT
Received: from localhost (localhost [127.0.0.1])
        by a.mx.secunet.com (Postfix) with ESMTP id 3D5B0204FD;
        Mon, 27 Sep 2021 13:18:35 +0200 (CEST)
X-Virus-Scanned: by secunet
Received: from a.mx.secunet.com ([127.0.0.1])
        by localhost (a.mx.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id cP7QXzLWCL_C; Mon, 27 Sep 2021 13:18:34 +0200 (CEST)
Received: from mailout2.secunet.com (mailout2.secunet.com [62.96.220.49])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by a.mx.secunet.com (Postfix) with ESMTPS id C18F9201E4;
        Mon, 27 Sep 2021 13:18:34 +0200 (CEST)
Received: from cas-essen-01.secunet.de (unknown [10.53.40.201])
        by mailout2.secunet.com (Postfix) with ESMTP id BC00D80004A;
        Mon, 27 Sep 2021 13:18:34 +0200 (CEST)
Received: from mbx-essen-01.secunet.de (10.53.40.197) by
 cas-essen-01.secunet.de (10.53.40.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 27 Sep 2021 13:18:34 +0200
Received: from gauss2.secunet.de (10.182.7.193) by mbx-essen-01.secunet.de
 (10.53.40.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Mon, 27 Sep
 2021 13:18:34 +0200
Received: by gauss2.secunet.de (Postfix, from userid 1000)
        id C8E233183C2B; Mon, 27 Sep 2021 13:18:33 +0200 (CEST)
Date:   Mon, 27 Sep 2021 13:18:33 +0200
From:   Steffen Klassert <steffen.klassert@secunet.com>
To:     Nicolas Dichtel <nicolas.dichtel@6wind.com>
CC:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the ipsec tree
Message-ID: <20210927111833.GH1407957@gauss3.secunet.de>
References: <20210927064921.06973f44@canb.auug.org.au>
 <a3680eb9-44d0-efe9-7037-9799a66786f7@6wind.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a3680eb9-44d0-efe9-7037-9799a66786f7@6wind.com>
X-ClientProxiedBy: cas-essen-01.secunet.de (10.53.40.201) To
 mbx-essen-01.secunet.de (10.53.40.197)
X-EXCLAIMER-MD-CONFIG: 2c86f778-e09b-4440-8b15-867914633a10
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Sep 27, 2021 at 09:55:07AM +0200, Nicolas Dichtel wrote:
> Hi Stephen,
> 
> Le 26/09/2021 à 22:49, Stephen Rothwell a écrit :
> > Hi all,
> > 
> > In commit
> > 
> >   93ec1320b017 ("xfrm: fix rcu lock in xfrm_notify_userpolicy()")
> > 
> > Fixes tag
> > 
> >   Fixes: 703b94b93c19 ("xfrm: notify default policy on update")
> > 
> > has these problem(s):
> > 
> >   - Target SHA1 does not exist
> > 
> > Maybe you meant
> > 
> > Fixes: 88d0adb5f13b ("xfrm: notify default policy on update")
> > 
> In fact, the sha1 comes from the ipsec tree, which is regularly rebased.

The testing branch of the ipsec tree might be rebased if I have
a bad commit there. The master branch of the ipsec tree will not
be rebased, as this branch is publicly used.

> The original patch is only in this tree for now.
> Steffen, maybe this fix could be squashed with the original commit?

As said, I never rebased the master branch so far and would only do
so in case of emergency.
