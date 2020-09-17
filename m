Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE4DF26E6E2
	for <lists+linux-next@lfdr.de>; Thu, 17 Sep 2020 22:46:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726412AbgIQUqA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Sep 2020 16:46:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726180AbgIQUqA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Sep 2020 16:46:00 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33DC3C06174A;
        Thu, 17 Sep 2020 13:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=c1lsbc6FhnfAVC3lDDgO0Z2ss8deQHdSkB0npF+L6xM=; b=VJ/nPwNq75TVlW4a0cj1JDQtRh
        +v7LKagZQ6SRSIc7RTdJJ+MEFik0wYOachu4uq0V8dn0K1rxLWuloheSLatnEXKoAtaxEpXTzlJe3
        UjHimWtmrJBvBwN0Bu2kPh6J744PVpT2mmdsNjpfJ3vUeWW4DbbePESasA5Kgx5t4S9jgTsOAOniD
        rZvN4OyvYEFA/Ds6WYFrcgJAbtTq3Q+c+25zaPYQBTdvacwVkezQGbebJ/PoGdSOqrIOq51L4Q4kw
        h0B8/WYfTkubPq/h/XdNld0jiLV6t22igTJxVgWm6+fKZdyE3GJTZzNP8WuEB10YCs4aqwgYCHQEP
        JGiBInMA==;
Received: from [2601:1c0:6280:3f0::19c2]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kJ0mx-0007um-LM; Thu, 17 Sep 2020 20:45:55 +0000
Subject: Re: linux-next: Tree for Sep 17 (net/ipv4/devinet.c)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nicolas Dichtel <nicolas.dichtel@6wind.com>,
        David Miller <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>
References: <20200917202313.143f66f3@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <0b592973-55d6-b318-ed38-1d5fbd706e7a@infradead.org>
Date:   Thu, 17 Sep 2020 13:45:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200917202313.143f66f3@canb.auug.org.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 9/17/20 3:23 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20200916:
> 


Maybe some older versions of gcc just can't handle IS_ENABLED() inside an
if (expression) very well.

> gcc --version
gcc (SUSE Linux) 7.5.0

This patch:

commit 9efd6a3cecdde984d67e63d17fe6af53c7c50968
Author: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Date:   Wed May 13 15:58:43 2020 +0200

    netns: enable to inherit devconf from current netns

causes a build error:

../net/ipv4/devinet.c: In function ‘devinet_init_net’:
../net/ipv4/devinet.c:2672:7: error: ‘sysctl_devconf_inherit_init_net’ undeclared (first use in this function); did you mean ‘devinet_init_net’?
       sysctl_devconf_inherit_init_net == 3) {
       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       devinet_init_net
../net/ipv4/devinet.c:2672:7: note: each undeclared identifier is reported only


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
