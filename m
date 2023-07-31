Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D525E769324
	for <lists+linux-next@lfdr.de>; Mon, 31 Jul 2023 12:30:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230442AbjGaKaA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 31 Jul 2023 06:30:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232112AbjGaK37 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 31 Jul 2023 06:29:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BB18FF
        for <linux-next@vger.kernel.org>; Mon, 31 Jul 2023 03:29:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 00B4D60DBF
        for <linux-next@vger.kernel.org>; Mon, 31 Jul 2023 10:29:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B30E9C433C8;
        Mon, 31 Jul 2023 10:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690799396;
        bh=p2QxoxkZEH2ukYu2JqkR+1eoLWLUIEe9kN76DiKx8Xk=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=EtqyGIvid1IsJ2mGocbmNTByCAzar6BbG3fXzHb8WPcAi5291EuGGINrLv70D6/0k
         77qYoReDNYRxXAdRKzjRmlKV+5RB3SHwDU0IeXVG3Ow6g/Lhofy5KxfDsRWz0+rF2a
         NezOE6Hqkifk/C+vBl+sWEIdTff4y3P4vCCucnCrP1dAt5MXUkyqmW3V2lvPdqpzpB
         ccgCGklo6hZZBcMc2HdxH9n8QeRoyXYdtxJ9n9K8C65BNJqFK9PN8GKIke/33BrPdE
         XqKVhY6hbvlJXPT2mejOMzW+GRgT1yVMmCxRxmKFGHeI/IhOnEicNO8H8tSx+3HbK0
         P81UTj+LPbZZA==
Message-ID: <3a347eac-383b-f43b-afdc-039436427a66@kernel.org>
Date:   Mon, 31 Jul 2023 12:29:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: Request for i2c inclusion in linux-next
Content-Language: en-US
To:     Andi Shyti <andi.shyti@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Wolfram Sang <wsa@kernel.org>,
        linux-next <linux-next@vger.kernel.org>
References: <20230730222921.637gy5xbtfekmite@intel.intel>
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230730222921.637gy5xbtfekmite@intel.intel>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 31/07/2023 00:29, Andi Shyti wrote:
> Hi Stephen,
> 
> could you please include in the linux-next i2c related branches
> from my repository:
> 
> https://kernel.googlesource.com/pub/scm/linux/kernel/git/andi.shyti/linux.git
> 
> the following branches:
> 
> for next:	i2c/andi-for-next
> fixes:		i2c/andi-for-current

Andi, why you do not use kernel.org repo? I think it is preferred.

Best regards,
Krzysztof

