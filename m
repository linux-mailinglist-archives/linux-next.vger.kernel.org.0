Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 746721EF3DE
	for <lists+linux-next@lfdr.de>; Fri,  5 Jun 2020 11:18:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726188AbgFEJSa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 5 Jun 2020 05:18:30 -0400
Received: from a.mx.secunet.com ([62.96.220.36]:45324 "EHLO a.mx.secunet.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726184AbgFEJSa (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 5 Jun 2020 05:18:30 -0400
Received: from localhost (localhost [127.0.0.1])
        by a.mx.secunet.com (Postfix) with ESMTP id 7DC472051F;
        Fri,  5 Jun 2020 11:18:28 +0200 (CEST)
X-Virus-Scanned: by secunet
Received: from a.mx.secunet.com ([127.0.0.1])
        by localhost (a.mx.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id QbH6BSzxoDwq; Fri,  5 Jun 2020 11:18:28 +0200 (CEST)
Received: from mail-essen-01.secunet.de (mail-essen-01.secunet.de [10.53.40.204])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by a.mx.secunet.com (Postfix) with ESMTPS id 174382052E;
        Fri,  5 Jun 2020 11:18:28 +0200 (CEST)
Received: from mbx-essen-01.secunet.de (10.53.40.197) by
 mail-essen-01.secunet.de (10.53.40.204) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Fri, 5 Jun 2020 11:18:27 +0200
Received: from gauss2.secunet.de (10.182.7.193) by mbx-essen-01.secunet.de
 (10.53.40.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Fri, 5 Jun 2020
 11:18:27 +0200
Received: by gauss2.secunet.de (Postfix, from userid 1000)      id 21A1531801FA;
 Fri,  5 Jun 2020 11:18:27 +0200 (CEST)
Date:   Fri, 5 Jun 2020 11:18:27 +0200
From:   Steffen Klassert <steffen.klassert@secunet.com>
To:     David Ahern <dsahern@gmail.com>
CC:     Stephen Rothwell <sfr@canb.auug.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Florian Westphal <fw@strlen.de>
Subject: Re: linux-next: manual merge of the ipsec-next tree with Linus' tree
Message-ID: <20200605091827.GD19286@gauss3.secunet.de>
References: <20200511130015.37103884@canb.auug.org.au>
 <20200602092040.5ef52300@canb.auug.org.au>
 <6092c5eb-6e50-97bc-90db-4f7a0ca29c6e@gmail.com>
 <20200604112606.25ffde35@canb.auug.org.au>
 <8d943a28-2e9f-9c61-9cff-899e907d6b86@gmail.com>
 <20200604064149.GT19286@gauss3.secunet.de>
 <9b338449-e342-96ab-0ba1-a73058fac037@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <9b338449-e342-96ab-0ba1-a73058fac037@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: cas-essen-01.secunet.de (10.53.40.201) To
 mbx-essen-01.secunet.de (10.53.40.197)
X-EXCLAIMER-MD-CONFIG: 2c86f778-e09b-4440-8b15-867914633a10
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jun 04, 2020 at 06:44:10AM -0600, David Ahern wrote:
> On 6/4/20 12:41 AM, Steffen Klassert wrote:
> > On Wed, Jun 03, 2020 at 08:55:01PM -0600, David Ahern wrote:
> >> On 6/3/20 7:26 PM, Stephen Rothwell wrote:
> >>>
> >>> And now the net-next tree has been merged into Linus' tree without this fix :-(
> >>>
> >>
> >> I took a look earlier and I think it is fine. Some code was moved around
> >> in ipsec-next and I think the merge is good. I'll run the test cases
> >> later this week and double check. Thanks for the reminder
> > 
> > The setting of XFRM_TRANSFORMED moved to xfrm_output() and depends
> > on CONFIG_NETFILTER. So I think the fix is needed. After the merge
> > of the net tree today, I have both conflicting patches patches in
> > the ipsec tree. I'd apply the fix from Stephen unless you say
> > it is not needed.
> > 
> 
> Indeed. I must have been looking at -net. Both -net and -net-next have
> it conditional, so yes a fixup patch is needed.

The fixup patch from Stephen is now applied to the ipsec tree.
