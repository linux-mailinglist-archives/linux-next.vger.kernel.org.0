Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87CA6623CA9
	for <lists+linux-next@lfdr.de>; Thu, 10 Nov 2022 08:31:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232767AbiKJHbl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Nov 2022 02:31:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232837AbiKJHbf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 10 Nov 2022 02:31:35 -0500
X-Greylist: delayed 180 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 09 Nov 2022 23:31:34 PST
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.220])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B019932061
        for <linux-next@vger.kernel.org>; Wed,  9 Nov 2022 23:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1668065306;
    s=strato-dkim-0002; d=hartkopp.net;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=53kn45NV5vY6ZWYmWvYdin3V1VeMulhMote1E7SCfzQ=;
    b=iYJBnHw3MqkXuXr9h0MSplYpRIgCGr4n5rWv9Ch51ZyomIlsjdOyYH2yh8T/wnkeYO
    MGCqD9U4OzkPzLCLq93N1JpqBT45IaIlbupHok7jQgEF6mpoyPNE6eP7d5dsLcBa2QCj
    ls/kl0xpn2gdyjx/EDULD/fV26G8+LI/vTXpEqoxLYrHveTfWlB33XAiuGgttAdKm7ps
    6Vmak3WE+1jD7cuc6kJQcfGz+NI+XZbdnmnkU65+kwaxqqBpCtPA+gp9vOML01lL10Nl
    YkT/r2x6hReudom+NvJP25lwbRgmxDsT5IlGqXosoJAUGxOwXjbbz6vRv5gytdc2ey/2
    MvFg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2MHfkW8eP4Mre39l357AZT/I7AY/7nT2yrDxb8mjG14FZxedJy6qgO1qCHSa1GLptZHusx3hdIrpKytJSr6hfz3Vg=="
X-RZG-CLASS-ID: mo00
Received: from [IPV6:2a00:6020:1cfd:d100::923]
    by smtp.strato.de (RZmta 48.2.1 AUTH)
    with ESMTPSA id Dde783yAA7SQeDY
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Thu, 10 Nov 2022 08:28:26 +0100 (CET)
Message-ID: <54c92bbe-33fa-35ba-dd7f-14a28dcf758a@hartkopp.net>
Date:   Thu, 10 Nov 2022 08:28:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: linux-next: manual merge of the net-next tree with the net tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        David Miller <davem@davemloft.net>,
        Networking <netdev@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Marc Kleine-Budde <mkl@pengutronix.de>
References: <20221110102509.1f7d63cc@canb.auug.org.au>
Content-Language: en-US
From:   Oliver Hartkopp <socketcan@hartkopp.net>
In-Reply-To: <20221110102509.1f7d63cc@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello Stephen,

On 10.11.22 00:25, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the net-next tree got a conflict in:
> 
>    drivers/net/can/pch_can.c
> 
> between commit:
> 
>    ae64438be192 ("can: dev: fix skb drop check")
> 
> from the net tree and commit:
> 
>    1dd1b521be85 ("can: remove obsolete PCH CAN driver")
> 
> from the net-next tree.
> 
> I fixed it up (I just removed the file) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.
> 

Yes, this is known.

The removal of the PCH CAN driver missed the last net-next phase for 
Linux 6.1 by some hours and therefore showed up relatively early in the 
net-next for 6.2.

Maybe we should generally try to commit "complete removals" of drivers 
preferably at the end of a -next phase which would have omitted this 
conflict.

Thanks for your work!

Best regards,
Oliver
