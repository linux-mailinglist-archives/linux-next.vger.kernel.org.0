Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DE221FBB98
	for <lists+linux-next@lfdr.de>; Tue, 16 Jun 2020 18:24:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729782AbgFPQXz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 16 Jun 2020 12:23:55 -0400
Received: from a.mx.secunet.com ([62.96.220.36]:49766 "EHLO a.mx.secunet.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729386AbgFPQXz (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 16 Jun 2020 12:23:55 -0400
Received: from localhost (localhost [127.0.0.1])
        by a.mx.secunet.com (Postfix) with ESMTP id E0CDF200A7;
        Tue, 16 Jun 2020 18:23:52 +0200 (CEST)
X-Virus-Scanned: by secunet
Received: from a.mx.secunet.com ([127.0.0.1])
        by localhost (a.mx.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id lv3h3kpKjtfv; Tue, 16 Jun 2020 18:23:52 +0200 (CEST)
Received: from mail-essen-02.secunet.de (mail-essen-02.secunet.de [10.53.40.205])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by a.mx.secunet.com (Postfix) with ESMTPS id 7FCB620080;
        Tue, 16 Jun 2020 18:23:52 +0200 (CEST)
Received: from mbx-dresden-01.secunet.de (10.53.40.199) by
 mail-essen-02.secunet.de (10.53.40.205) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Tue, 16 Jun 2020 18:23:52 +0200
Received: from gauss2.secunet.de (10.182.7.193) by mbx-dresden-01.secunet.de
 (10.53.40.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Tue, 16 Jun
 2020 18:23:51 +0200
Received: by gauss2.secunet.de (Postfix, from userid 1000)      id D236C3180126;
 Tue, 16 Jun 2020 18:23:50 +0200 (CEST)
Date:   Tue, 16 Jun 2020 18:23:50 +0200
From:   Steffen Klassert <steffen.klassert@secunet.com>
To:     David Ahern <dsahern@gmail.com>
CC:     Stephen Rothwell <sfr@canb.auug.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Florian Westphal <fw@strlen.de>
Subject: Re: linux-next: manual merge of the ipsec-next tree with Linus' tree
Message-ID: <20200616162350.GK13121@gauss3.secunet.de>
References: <20200511130015.37103884@canb.auug.org.au>
 <20200602092040.5ef52300@canb.auug.org.au>
 <6092c5eb-6e50-97bc-90db-4f7a0ca29c6e@gmail.com>
 <20200604112606.25ffde35@canb.auug.org.au>
 <8d943a28-2e9f-9c61-9cff-899e907d6b86@gmail.com>
 <20200604064149.GT19286@gauss3.secunet.de>
 <9b338449-e342-96ab-0ba1-a73058fac037@gmail.com>
 <2aab8efc-783d-8502-d268-ab435f566b06@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2aab8efc-783d-8502-d268-ab435f566b06@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: cas-essen-01.secunet.de (10.53.40.201) To
 mbx-dresden-01.secunet.de (10.53.40.199)
X-EXCLAIMER-MD-CONFIG: 2c86f778-e09b-4440-8b15-867914633a10
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jun 16, 2020 at 07:39:30AM -0600, David Ahern wrote:
> > 
> > Indeed. I must have been looking at -net. Both -net and -net-next have
> > it conditional, so yes a fixup patch is needed.
> > 
> 
> I see that both net and net-next still have the conditional in xfrm_output:
> 
> #ifdef CONFIG_NETFILTER
>                 IPCB(skb)->flags |= IPSKB_XFRM_TRANSFORMED;
> #endif
>                 break;
>         case AF_INET6:
>                 memset(IP6CB(skb), 0, sizeof(*IP6CB(skb)));
> 
> #ifdef CONFIG_NETFILTER
>                 IP6CB(skb)->flags |= IP6SKB_XFRM_TRANSFORMED;
> #endif
> 
> Did you submit the merge fix? If not, I can do it today.

I still have it in the ipsec tree, I'll do a pull request
this week. The fixup will go to the net tree then. It should
be already in linux-next.
