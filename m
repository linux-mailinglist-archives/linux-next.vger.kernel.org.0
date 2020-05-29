Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 937EE1E880A
	for <lists+linux-next@lfdr.de>; Fri, 29 May 2020 21:42:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726829AbgE2TmM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 May 2020 15:42:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726077AbgE2TmM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 29 May 2020 15:42:12 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBD51C03E969;
        Fri, 29 May 2020 12:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=jrsLMz1MCw2EgP5qmO9LAH6Zd76ir0z+ao1Kd1AFi+A=; b=Gc9rO6J8Y5rcLnVpDxlQjLKTb1
        2rOrYGsQvJQ7+x2Wolo5A6ZJtHQuYINDGXrjwkCFOUxPv5/7AMHAHa8OZg7etT4u2dSFHfJq+Z53l
        XJwvPW5ZBzd8xCsfXiXUbMAVbBBKdqZPA736a2qC6UA7ezr3mQ/1cqsjr7uQC+SspINHXo1cqd+br
        HKfliddI6m/8/mcRDepN0J2SwAi/7qWc2Cy7LHj0sfFoJJSUwveMPdJeHeSdw9qjo9foTZWXj/R6J
        fRs+W7j4a41D8EHzTLSZLz7tmraGm8NnnGza3HXxBMGf/KQQmQSbL403qPOYaaPG/UsWiiY1z1p1Q
        KytHOB7A==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jektI-0004ay-H0; Fri, 29 May 2020 19:42:04 +0000
Subject: Re: linux-next: Tree for May 29 (ocfs2)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mark Fasheh <mark@fasheh.com>,
        Joel Becker <jlbec@evilplan.org>,
        Joseph Qi <joseph.qi@linux.alibaba.com>,
        ocfs2-devel@oss.oracle.com
References: <20200529215624.5e52c341@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <fec54c99-d4c6-c05d-3aa9-ab07fd80ed51@infradead.org>
Date:   Fri, 29 May 2020 12:42:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200529215624.5e52c341@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 5/29/20 4:56 AM, Stephen Rothwell wrote:
> Hi all,
> 
> News: there will be no linux-next release on Monday.
> 
> Changes since 20200528:
> 


on x86_64:
when CONFIG_INET is not set/enabled:

ld: fs/ocfs2/cluster/tcp.o: in function `o2net_accept_many':
tcp.c:(.text+0x2e06): undefined reference to `tcp_sock_set_nodelay'
ld: tcp.c:(.text+0x2e18): undefined reference to `tcp_sock_set_user_timeout'
ld: fs/ocfs2/cluster/tcp.o: in function `o2net_start_connect':
tcp.c:(.text+0x3391): undefined reference to `tcp_sock_set_nodelay'
ld: tcp.c:(.text+0x33a3): undefined reference to `tcp_sock_set_user_timeout'


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
