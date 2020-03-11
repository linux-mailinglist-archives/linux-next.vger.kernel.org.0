Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98D3F180EE8
	for <lists+linux-next@lfdr.de>; Wed, 11 Mar 2020 05:27:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725813AbgCKE1W (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Mar 2020 00:27:22 -0400
Received: from condef-10.nifty.com ([202.248.20.75]:51779 "EHLO
        condef-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725379AbgCKE1V (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 11 Mar 2020 00:27:21 -0400
Received: from conssluserg-06.nifty.com ([10.126.8.85])by condef-10.nifty.com with ESMTP id 02B4NP4F004610
        for <linux-next@vger.kernel.org>; Wed, 11 Mar 2020 13:23:25 +0900
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 02B4NDEw031353;
        Wed, 11 Mar 2020 13:23:14 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 02B4NDEw031353
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1583900594;
        bh=D34pHK0RFulSRoIYPAPeyEM8GpXVGs0kK0sAr2243Jk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=d4pYut8wCPq5aa/7Zw7vMLJK0pyiaCpDnIXiKq82adJ7+tJsCg7jg//5aiZtc848F
         rOm7abD9cemq+3EJxgAJaHMArtRhXWF6F4/w9R6idF3HAIU/TEGjAOkD/VFuogwKDr
         5PXmnCjfkV6Zyx6fRNQVfOIu3nDD49IQp99K6Nn3K2YLu+kX3wZO6azFSEWb1U8n69
         n4EXdIpeYlDh96CqDu4QAPuoATUdiR9r+vyc/Wzi+HGvsIs/tTCeyXu78l9MPCe2Lt
         NliwAk2qNyv4K1ZYATnItFA6RP8iwPPbThkmClZlhOCYkertBxVEmsNVMqlExGwEY7
         FWBrTlQgsCE8Q==
X-Nifty-SrcIP: [209.85.222.52]
Received: by mail-ua1-f52.google.com with SMTP id g21so247918uaj.1;
        Tue, 10 Mar 2020 21:23:14 -0700 (PDT)
X-Gm-Message-State: ANhLgQ1AA3EwkRUpQo6Og7zymBGvCWhmdGzqd6KIrdR67clacs8bU0D7
        3L/Bi4K4sZx+1hlqsETd/2bVjeGBYMsSVoHAbJk=
X-Google-Smtp-Source: ADFU+vuGf8cuwxCb/5JsZbCbmJEl0UWpBpVQYM9pwDP7QyQHNOGRyKBKssHZk11vU3CPs1PX27P2wukXXPVR3KS+XAY=
X-Received: by 2002:ab0:3485:: with SMTP id c5mr558341uar.109.1583900593235;
 Tue, 10 Mar 2020 21:23:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200311095319.30e14ac0@canb.auug.org.au>
In-Reply-To: <20200311095319.30e14ac0@canb.auug.org.au>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 11 Mar 2020 13:22:37 +0900
X-Gmail-Original-Message-ID: <CAK7LNARmD5AaHmgpSk4Z8+NPd0kwSrVQnnx27vPci19KJ0+DPA@mail.gmail.com>
Message-ID: <CAK7LNARmD5AaHmgpSk4Z8+NPd0kwSrVQnnx27vPci19KJ0+DPA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the kbuild tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nicolas Pitre <nico@fluxnic.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen,

On Wed, Mar 11, 2020 at 7:53 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the kbuild tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> x86_64-linux-gnu-ld: net/core/devlink.o: in function `devlink_trap_report':
> (.text+0x4e7e): undefined reference to `net_dm_hw_report'
>
> Caused by commit
>
>   af20db858358 ("kconfig: allow symbols implied by y to become m")
>
> At least, reverting that commit (and commit
>
>   d590d0a6e6fe ("kconfig: make 'imply' obey the direct dependency"))
>
> allows the build to work.
>
> Advice, please.  Does someone need to audit all the uses of "imply"?


The following patch should fix the build error.


index 2ab668461463..f68bc373544a 100644
--- a/include/net/drop_monitor.h
+++ b/include/net/drop_monitor.h
@@ -19,7 +19,7 @@ struct net_dm_hw_metadata {
        struct net_device *input_dev;
 };

-#if IS_ENABLED(CONFIG_NET_DROP_MONITOR)
+#if IS_REACHABLE(CONFIG_NET_DROP_MONITOR)
 void net_dm_hw_report(struct sk_buff *skb,
                      const struct net_dm_hw_metadata *hw_metadata);
 #else




I will propose this fix-up in the net ML.



-- 
Best Regards
Masahiro Yamada
