Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8470769421
	for <lists+linux-next@lfdr.de>; Mon, 31 Jul 2023 13:04:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231240AbjGaLEJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 31 Jul 2023 07:04:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231187AbjGaLEI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 31 Jul 2023 07:04:08 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DB6E1B8
        for <linux-next@vger.kernel.org>; Mon, 31 Jul 2023 04:04:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 03A526103B
        for <linux-next@vger.kernel.org>; Mon, 31 Jul 2023 11:04:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC4B1C433C8;
        Mon, 31 Jul 2023 11:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690801446;
        bh=bq/9bxp9g83neuBrTpckpWopN8v9/8L27zi4sKnBAjQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kXPbakGgW3jFFQdvszvhoBIDd6EN36qABMDfoHdMINdquMhDsXBJ+6thPtjQwIVpT
         QUDEDE+sQVXFm8desc+KA/F4Y5eHD41G0fL5V5zE02fCPGKIgNaI9FNCPfva91N4Y2
         u/g6VhIaAB65ZdZ4QmYfuhRwC8k8wKYenFWNf7hEwxunC1fKZthzPZG+aJrxtNUnE/
         MuP4BLuP8Z2oslY4gD6GWLrWOyeXS8M/vQvjHYhKMoehUUtUqQqLK+2QKfzsFxcykx
         KeweFil/P+hzxBVf0v3KDA1y3M45PplwKxtnZXb1nmKsKWoCv1UFe6wZ4q2aTnmczA
         oxlhXcmroD/lw==
Date:   Mon, 31 Jul 2023 13:04:03 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Wolfram Sang <wsa@kernel.org>,
        linux-next <linux-next@vger.kernel.org>
Subject: Re: Request for i2c inclusion in linux-next
Message-ID: <20230731110403.pxo34g6kodur4ble@intel.intel>
References: <20230730222921.637gy5xbtfekmite@intel.intel>
 <3a347eac-383b-f43b-afdc-039436427a66@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a347eac-383b-f43b-afdc-039436427a66@kernel.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jul 31, 2023 at 12:29:51PM +0200, Krzysztof Kozlowski wrote:
> On 31/07/2023 00:29, Andi Shyti wrote:
> > Hi Stephen,
> > 
> > could you please include in the linux-next i2c related branches
> > from my repository:
> > 
> > https://kernel.googlesource.com/pub/scm/linux/kernel/git/andi.shyti/linux.git
> > 
> > the following branches:
> > 
> > for next:	i2c/andi-for-next
> > fixes:		i2c/andi-for-current
> 
> Andi, why you do not use kernel.org repo? I think it is preferred.

uuhh... yes... I did a blind copy/paste of the link and did not
realise that this was from googlesource... Stephen, can you
please take it from:

https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Thanks a lot, Krzysztof for checking on this!

Thank you and sorry for the confusion!
Andi
