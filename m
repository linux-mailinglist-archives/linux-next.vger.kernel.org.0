Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2136D3509E1
	for <lists+linux-next@lfdr.de>; Thu,  1 Apr 2021 00:00:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232406AbhCaV7y (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 31 Mar 2021 17:59:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229968AbhCaV7Z (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 31 Mar 2021 17:59:25 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9217EC061574
        for <linux-next@vger.kernel.org>; Wed, 31 Mar 2021 14:59:16 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id kr3-20020a17090b4903b02900c096fc01deso1996339pjb.4
        for <linux-next@vger.kernel.org>; Wed, 31 Mar 2021 14:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=hPDVqO9jhT1E0nArrlGckXeQM+tkHjymdZg5zK09hK4=;
        b=Hlv/sqJ0AI2X14MfAlqWl8fb/roPE0ykMGEYBZ91oOzcNll4Ls8OIztzs79toVtl1k
         EMG7MUfuTnbQf5eLb0ZPnC1TzmMiBhfuEH1kZFFCITl0RQfaveHyDy2PuMKw/nlTYsL0
         o1PL8d/UJA+/ZdSzVQA1JgjDJSSEDBuG0qBEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=hPDVqO9jhT1E0nArrlGckXeQM+tkHjymdZg5zK09hK4=;
        b=p5iw4y7iCeCGir6XUB0SbPpWRK03ODOWpqTZpc3KacINYOFB4ptQXpFd2Um+KiDjX+
         BYe9TQNq25/7KBBcKv/yRDu3MMhjsnJd3KavLBDH050vU4ubknZuqJfzwBpdl0yNyb9F
         S2jG+jOzd4BbN3ICcgJspEB0O+rZywrQk9mcXmxzkYz8DqC4OOrCrLzV6iQQzhOwLzSI
         he7R0zGvyRZaXuMYRpq46VunglCyziJfpwcifoLJmxRe7KQzt8Yjxv3xghRz9L05IfPX
         zLsIaXYjHRvDpb5NFSdoVxohw7DeCRRwQBfCQ9Ggiw/8w2XLBwSxkemF9SNxcEuOEI2/
         rhVA==
X-Gm-Message-State: AOAM532yb1RYEBUY5CE4B7A9VtG6mkYonGkttyzdvuoNZlNqO+a5SYYu
        k3PCeG/qxge+fn694hE+07EzvQ==
X-Google-Smtp-Source: ABdhPJy5g4ciUYLbK9rveBjK8Sl7N4JLu8lxXPOokzW9YSghJbnZLMQ6yz5xr7oP6xEA+eANlv29tA==
X-Received: by 2002:a17:90b:291:: with SMTP id az17mr5316766pjb.206.1617227956130;
        Wed, 31 Mar 2021 14:59:16 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id w67sm3564296pgb.87.2021.03.31.14.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 14:59:15 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Wed, 31 Mar 2021 14:59:15 -0700
To:     Florian Westphal <fw@strlen.de>
Cc:     Pablo Neira Ayuso <pablo@netfilter.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: nf_log_syslog_init(): Control flow issues
Message-ID: <202103311459.1514349C@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20210331 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  None
    8d02e7da87a0 ("netfilter: nf_log_bridge: merge with nf_log_syslog")

Coverity reported the following:

*** CID 1503586:  Control flow issues  (DEADCODE)
/net/netfilter/nf_log_syslog.c: 1047 in nf_log_syslog_init()
1041     	ret = nf_log_register(NFPROTO_NETDEV, &nf_netdev_logger);
1042     	if (ret < 0)
1043     		goto err4;
1044
1045     	nf_log_register(NFPROTO_BRIDGE, &nf_bridge_logger);
1046     	if (ret < 0)
vvv     CID 1503586:  Control flow issues  (DEADCODE)
vvv     Execution cannot reach this statement: "goto err5;".
1047     		goto err5;
1048
1049     	return 0;
1050     err5:
1051     	nf_log_unregister(&nf_netdev_logger);
1052     err4:

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1503586 ("Control flow issues")
Fixes: 8d02e7da87a0 ("netfilter: nf_log_bridge: merge with nf_log_syslog")

Thanks for your attention!

-- 
Coverity-bot
